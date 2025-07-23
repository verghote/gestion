<?php
declare(strict_types=1);

// Classe gérant les données de la table annonce : id, nom, description, date, actif

class Annonce extends Table
{
    public function __construct()
    {
        parent::__construct('annonce');

        // nom de l'épreuve annoncée
        $input = new inputText();
        $input->Require = true;
        $input->Pattern = "^[A-Za-zÀÇÈÉÊàáâçèéêëî]([ ']?[A-Za-zÀÇÈÉÊàáâçèéêëî]+)*$";
        $input->MinLength = 8;
        $input->MaxLength = 100;
        $this->columns['nom'] = $input;

        // la date ne doit pas être inférieure à la date du jour ni dépassé d'un an la date du jour
        $input = new InputDate();
        $input->Min = date('Y-m-d');
        $input->Max = date("Y-m-d", strtotime("+1 year"));
        $this->columns['date'] = $input;

        // description de l'épreuve annoncée
        $input = new InputTextarea();
        $input->Require = true;
        $input->EncoderHtml = false;
        $input->AcceptHtml = true;
        $this->columns['description'] = $input;

        // actif  en ajout il prend sa valeur par défaut,
        $input = new InputInt();
        $input->Require = false;
        $input->Min = 0;
        $input->Max = 1;
        $this->columns['actif'] = $input;

        // Liste des colonnes modifiables en mode colonne
        $this->listOfColumns->Values = ['actif'];
    }

    // ------------------------------------------------------------------------------------------------
    // Méthodes statiques relatives aux opérations de consultation
    // ------------------------------------------------------------------------------------------------


    /**
     * retourne les annonces
     * @return array
     */
    public static function getAll() {
        $sql = <<<SQL
          Select id, nom, description, date, actif, date_format(date, '%d/%m/%Y') as dateFr
          from annonce 
          order by date;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * retourne les annonces actives et dont la date n'est pas dépassée
     * @return array
     */
    public static function getLesAnnoncesActives() {
        $sql = <<<SQL
          Select id, nom, description, date, actif, date_format(date, '%d/%m/%Y') as dateFr
          from annonce 
          where actif = 1
          and date >= curdate()
          order by date;
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
    public static function getById(int $id): mixed
    {
        $sql = <<<SQL
            select id, nom, description, date
            from  annonce
            where id = :id;
SQL;
        $select = new Select();
        return $select->getRow($sql, ['id' => $id]);
    }

    /**
     * Suppression des ancinnes annonces : date dépassée
     * @return array tableau contenant les id des annonces supprimées
     */
    public static function deleteOld() : array {
        $sql = <<<SQL
            select id
            from annonce 
            where date <= curdate();
SQL;
        $select = new Select();
        $lesAnnoncesSupprimees = $select->getRows($sql);


        $sql = <<<SQL
	        delete from annonce 
	        where date <= curdate() 
SQL;
        $db = Database::getInstance();
        $db->exec($sql);
        return $lesAnnoncesSupprimees;
    }
}

