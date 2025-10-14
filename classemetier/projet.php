<?php
declare(strict_types=1);

class Projet extends Table
{
    public function __construct()
    {
        parent::__construct('projet');

        // nom
        $input = new inputText();
        $input->Require = true;
        $input->Casse = '';
        $input->SupprimerAccent = false;
        $input->SupprimerEspaceSuperflu = true;
        $input->MinLength = 3;
        $input->MaxLength = 150;
        $this->columns['nom'] = $input;

        // Liste des colonnes modifiables en mode colonne
        $this->listOfColumns->Values = ['nom'];
    }

    /**
     * retourne les projets du portfolio de l'utilisateur
     * @return array
     */
    public static function getAll(): array
    {
        $sql = <<<SQL
            select id, nom
            from projet
            order by nom;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * retourne les compétences du projet
     * @param int $idProjet
     * @return array
     */
    public static function getLesCompetences(int $idProjet): array
    {
        $sql = <<<SQL
            select competence.id, concat('C.', idBloc, '.', idDomaine, '.', competence.idCompetence) as code, libelle
            from competenceprojet 
                 join competence on competence.id = competenceprojet.idCompetence  
            where idProjet = :idProjet
            order by libelle;
SQL;
        $select = new Select();
        return $select->getRows($sql, ['idProjet' => $idProjet]);
    }

    /**
     * retourne les id des compétences du projet
     * @param int $idProjet
     * @return array
     */
    public static function getLesIdCompetences(int $idProjet): array
    {
        $sql = <<<SQL
            select idCompetence
            from competenceprojet 
            where idProjet = :idProjet
            order by idCompetence;
SQL;
        $select = new Select();
        return $select->getRows($sql, ['idProjet' => $idProjet]);
    }

    /**
     * retourne un projet par son id
     * @param int $id
     * @return mixed
     */
    public static function getById(int $id): mixed
    {
        $sql = <<<SQL
            select id, nom
            from projet
            where id = :id;
SQL;
        $select = new Select();
        return $select->getRow($sql, ['id' => $id]);
    }

    /**
     * Ajoute une compétence au projet
     * @param int $idProjet
     * @param int $idCompetence
     * @return void
     */
    public static function ajouterCompetence(int $idProjet, int $idCompetence): void
    {
        $sql = <<<SQL
        insert into competenceprojet(idProjet, idCompetence)
                    values(:idProjet, :idCompetence);
SQL;
        $db = Database::getInstance();
        $curseur = $db->prepare($sql);
        $curseur->bindValue('idProjet', $idProjet);
        $curseur->bindValue('idCompetence', $idCompetence);
        $curseur->execute();
    }

    /**
     * Supprime une compétence du projet
     * @param int $idProjet
     * @param int $idCompetence
     * @return void
     */
    public static function supprimerCompetence(int $idProjet, int $idCompetence): void
    {
        $sql = <<<SQL
        delete from competenceprojet
        where idProjet = :idProjet
        and idCompetence = :idCompetence;   
SQL;
        $db = Database::getInstance();
        $curseur = $db->prepare($sql);
        $curseur->bindValue('idProjet', $idProjet);
        $curseur->bindValue('idCompetence', $idCompetence);
        $curseur->execute();
    }

    /**
     * Supprime toutes les compétences d'un projet
     * @param int $idProjet
     * @return void
     */
    public static function supprimerToutesLesCompetences(int $idProjet): void
    {
        try {
            $db = Database::getInstance();
            $sql = "delete from competenceprojet where idProjet = :idProjet;";
            $curseur = $db->prepare($sql);
            $curseur->bindParam('idProjet', $idProjet);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::traiterErreur($e->getMessage());
        }
    }

    /**
     * Ajoute toutes les compétences à un projet
     * @param int $idProjet
     * @return void
     */
    public static function ajouterToutesLesCompetences(int $idProjet): void
    {
        try {
            $db = Database::getInstance();
            // on supprime préalablement toutes les compétences
            $sql = <<<SQL
	        delete from competenceprojet where idProjet = :idProjet;
SQL;
            $curseur = $db->prepare($sql);
            $curseur->bindParam('idProjet', $idProjet);
            $curseur->execute();
            // on ajoute ensuite tous les droits
            $sql = <<<SQL
	        insert into competenceprojet(idProjet, idCompetence) select :idProjet, id from competence where idBloc = 1;
SQL;
            $curseur = $db->prepare($sql);
            $curseur->bindParam('idProjet', $idProjet);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::traiterErreur($e->getMessage());
        }
    }

    /**
     * Enregistre un projet et ses compétences en utilisant une transaction
     * @param string $nom
     * @param array $lesCompetences
     * @return string
     */
    public static function enregistrer(string $nom, array $lesCompetences): string
    {
        $db = Database::getInstance();

        // Démarrage d'une transaction
        $db->beginTransaction();
        // ajout du projet
        $sql = <<<SQL
            insert into projet(nom) values(:nom);
SQL;
        $curseur = $db->prepare($sql);
        $curseur->bindValue('nom', $nom);
        try {
            $curseur->execute();
        } catch (Exception $e) {
            $db->rollBack();
            return $e->getMessage();
        }
        // récupération de l'id attribué au projet
        $idProjet = $db->lastInsertId();

        // ajout des compétences du projet
        foreach ($lesCompetences as $idCompetence) {
            // on vérifie que l'id de la compétence est un entier
            $idCompetence = filter_var($idCompetence, FILTER_VALIDATE_INT);
            if ($idCompetence === false) {
                $db->rollBack();
                return "L'identifiant de la compétence n'est pas valide";
            }
            // on vérifie que l'id de la compétence existe en utilisant la méthode getById de la classe Competence
            $ligne = Competence::getById($idCompetence);
            // on ajoute la compétence au projet : les autres contrôles sont faits par la base de données
            $sql = <<<SQL
                insert into competenceprojet(idProjet, idCompetence) values(:idProjet, :idCompetence);
SQL;
            $curseur = $db->prepare($sql);
            $curseur->bindValue('idProjet', $idProjet);
            $curseur->bindValue('idCompetence', $idCompetence);
            try {
                $curseur->execute();
            } catch (Exception $e) {
                $db->rollBack();
                return $e->getMessage();
            }
        }
        $db->commit();
        return "Opération réalisée avec succès";
    }
}