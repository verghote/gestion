<?php
declare(strict_types=1);

// définition de la table coureur : licence, nom, prenom, sexe, idClub, dateNaissance, idCategorie, ffa, email, telephone
// clé primaire : licence
// clés étrangères : idClub et idCategorie
// Colonnes optionnelles : email et telephone
// Aucune colonne modifiable en mode colonne

class Coureur extends Table
{
    public function __construct()
    {
        parent::__construct('coureur');

        // définition de la clé primaire si différente de id
        $this->idName = 'licence';

        // licence
        $input = new InputText();
        $input->Require = true;
        $input->Pattern = "^[0-9]{6,7}$";
        $input->MinLength = 6;
        $input->MaxLength = 7;
        $this->columns['licence'] = $input;

        // nom
        $input = new inputText();
        $input->Require = true;
        $input->Casse = 'U';
        $input->SupprimerAccent = true;
        $input->SupprimerEspaceSuperflu = true;
        $input->Pattern = "^[A-Z]( ?[A-Z]+)*$";
        $input->MaxLength = 30;
        $this->columns['nom'] = $input;

        // prenom
        $input = new inputText();
        $input->Require = true;
        $input->Casse = 'U';
        $input->SupprimerAccent = true;
        $input->SupprimerEspaceSuperflu = true;
        $input->Pattern = "^[A-Z]( ?[A-Z]+)*$";
        $input->MaxLength = 30;
        $this->columns['prenom'] = $input;

        // sexe
        $input = new InputList();
        $input->Values = ['M', 'F'];
        $input->Casse = 'U';
        $this->columns['sexe'] = $input;

        // dateNaissance
        $input = new InputDate();
        $input->Require = true;

        $input->Max = Categorie::getDateNaissanceMax();
        $input->Min = Categorie::getDateNaissanceMin();
        $this->columns['dateNaissance'] = $input;

        // idClub
        $input = new InputList();
        $this->columns['idClub'] = $input;
        // il faut récupérer chaque idClub
        $curseur = new Select();
        $sql = 'select id from club order by nom;';
        $lesLignes = $curseur->getRows($sql);
        // stockage des id dans un tableau
        foreach ($lesLignes as $ligne) {
            $input->Values[] = $ligne['id'];
        }

        // ffa (licence validée par le web service de la FFA)
        $input = new InputList();
        $input->Values = [0, 1];
        $this->columns['ffa'] = $input;

        //  email
        $input = new inputEmail();
        $input->Require = false;
        $input->MaxLength = 100;
        $this->columns['email'] = $input;

        //  telephone
        $input = new inputText();
        $input->Require = false;
        $input->Pattern = "^0(6|7)[0-9]{8}$";
        $input->MaxLength = 10;
        $this->columns['telephone'] = $input;

        // définition des colonnes modifiables en mode colonne
        $this->listOfColumns->Values = ['nom', 'prenom', 'sexe', 'dateNaissance', 'idClub', 'ffa', 'email', 'telephone'];

    }

    /**
     * retourne l'ensemble des informations sur les coureurs
     * @return array
     */
    public static function getAll(): array
    {
        $sql = <<<SQL
    Select licence, coureur.nom, prenom ,  concat(coureur.nom, ' ', prenom) as nomPrenom, sexe, date_format(dateNaissance, '%d/%m/%Y') as dateNaissanceFr, 
           idCategorie , club.nom AS nomClub, idClub, email, telephone, ffa
    from coureur
    join club on coureur.idClub = club.id 
    order by nom, prenom;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * Retourne l'annonce dont l'id est passé en paramètre
     *
     * @param int $id L'id doit être contrôlé en amont
     * @return mixed
     */
    public static function getByLicence(string $licence): mixed
    {
        $sql = <<<SQL
              Select licence, coureur.nom, prenom , sexe, date_format(dateNaissance, '%d/%m/%Y') as dateNaissanceFr, dateNaissance,
                     idCategorie , club.nom AS nomClub, ffa, telephone, email, idClub
             from coureur
                join club on coureur.idClub = club.id 
             where licence = :licence
SQL;
        $select = new Select();
        return $select->getRow($sql, ['licence' => $licence]);
    }

    /**
     * Retourne l'ensemble des coureurs d'une catégorie
     * @param string $idCategorie
     * @return array
     */
    public static function getByCategorie(string $idCategorie): array
    {
        $sql = <<<SQL
            Select licence, coureur.nom, prenom , concat(coureur.nom, ' ', prenom) as nomPrenom,  sexe, 
                       date_format(dateNaissance, '%d/%m/%Y') as dateNaissanceFr, 
                       club.nom AS nomClub, idCategorie
            from coureur
                join club on coureur.idClub = club.id
            where idCategorie = :idCategorie
            order by coureur.nom, prenom;   
SQL;
        $select = new Select();
        return $select->getRows($sql, ['idCategorie' => $idCategorie]);
    }

    public static function getBySexeClubCategorie($sexe = '*', $idClub = '*', $idCategorie = '*'): array
    {
        $lesParametres = [];
        $sql = <<<SQL
            Select licence, coureur.nom, prenom , concat(coureur.nom, ' ', prenom) as nomPrenom, sexe, 
                       date_format(dateNaissance, '%d/%m/%Y') as dateNaissanceFr, 
                       club.nom AS nomClub, idCategorie
            from coureur , club
            where coureur.idClub = club.id
SQL;
        if ($sexe !== '*') {
            $sql .= " and sexe = :sexe";
            $lesParametres['sexe'] = $sexe;
        }
        if ($idClub !== '*') {
            $sql .= " and idClub = :idClub";
            $lesParametres['idClub'] = $idClub;
        }
        if ($idCategorie !== '*') {
            $sql .= " and idCategorie = :idCategorie";
            $lesParametres['idCategorie'] = $idCategorie;
        }
        $sql .= " order by coureur.nom, prenom;";

        $select = new Select();
        return $select->getRows($sql, $lesParametres);
    }


    public static function getByNomPrenom(string $nomPrenom): array
    {
        // récupération des informations sur l'étudiant
        $sql = <<<SQL
              Select licence, coureur.nom, prenom,  concat(coureur.nom, ' ', prenom) AS nomPrenom, sexe, date_format(dateNaissance, '%d/%m/%Y') as dateNaissanceFr, dateNaissance,
                     idCategorie , club.nom AS nomClub, ffa, telephone, email, idClub
             from coureur
                join club on coureur.idClub = club.id 
            where concat(coureur.nom, ' ', prenom) like :terme 
            order by coureur.nom, prenom
            limit 10
SQL;
        $select = new Select();
        // on ajoute % pour la recherche
        $terme = "%$nomPrenom%";
        return $select->getRows($sql,['terme' => $terme]);
    }

    // ------------------------------------------------------------------------------------------------
    // Méthodes relatives aux opérations de mise à jour
    // ------------------------------------------------------------------------------------------------

    public static function clearColonne(string $colonne, int $licence): void
    {
        $sql = <<<SQL
            update coureur 
            set $colonne = null
            where licence = :licence
SQL;
        $db = Database::getInstance();

        try {
            $curseur = $db->prepare($sql);
            $curseur->bindValue('licence', $licence);
            $curseur->execute();
        } catch (PDOException $e) {
            Erreur::traiterReponse($e->getMessage(), 'global');
        }
    }

}