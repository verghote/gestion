<?php
declare(strict_types=1);

// définition de la table catégorie : id, nom, ageMin, ageMax

class Categorie extends Table
{
    public function __construct()
    {
        parent::__construct('categorie');

        // définition de la clé primaire si ce n'est pas un auto-increment
        //colonne id
        $input = new InputText();
        $input->Require = true;
        // une lettre suvie d'un ou 1 2 caractères alphanumériques
        $input->Pattern = "^[A-za-z][A-za-z0-9]{1,2}$";
        $input->MinLength = 2;
        $input->MaxLength = 3;
        $input->Casse = 'U'; // la valeur sera mise en majuscule
        $this->columns['id'] = $input;

        // colonne nom
        $input = new InputText();
        $input->Require = true;
        // des lettres suvies éventuellement d'un espace obligatoirement suivi d'un ou 2 chiffres
        $input->Pattern = "^[A-Za-z][A-Za-z]*(?: \d{1,2})?$";
        $input->MinLength = 5;
        $input->MaxLength = 20;
        $input->Casse = 'F'; // la valeur sera mise en majuscule au niveau de la première lettre
        $this->columns['nom'] = $input;

        // colonne ageMin
        $input = new inputInt();
        $input->Require = true;
        $input->Min = 4;
        $input->Max = 99;
        $this->columns['ageMin'] = $input;

        // colonne ageMax
        $input = new inputInt();
        $input->Require = true;
        $input->Min = 4;
        $input->Max = 99;
        $this->columns['ageMax'] = $input;
    }

    // ------------------------------------------------------------------------------------------------
    // Méthodes concernant les opérations de consultation
    // ------------------------------------------------------------------------------------------------


    /**
     * retourne les catégories en y ajoutant l'intervalle des dates de naissance pour les catégories
     * @return array
     */
    public static function getAll(): array
    {
        $annee = date('Y');
        $mois = intval(Date('m'));
        if ($mois >= 9) {
            $annee++;
        }
        $sql = <<<SQL
            select id, nom, concat(ageMin, '-', ageMax) as age, concat($annee - ageMax, '-' ,$annee - ageMin) as annee
            from categorie
            order by ageMin;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }



    /**
     * Retourner l'ensemble des catégories ayant des coureurs
     * Champs à retourner : id, nom
     * @return array
     */
    public static function getListe() {
        $sql = <<<SQL
             select id, nom, ageMin, ageMax, 
                    (select count(*) from coureur where coureur.idCategorie = categorie.id) as nb
             from categorie
             order by ageMin;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * Retourner les informations sur un club
     * @param string $id
     * @return array | false
     */
    public static function getById(string $id): array | false
    {
        $sql = <<<SQL
             select id, nom, ageMin, ageMax, (select count(*) from coureur where coureur.idCategorie = categorie.id) as nb
             from categorie
             where id = :id;
SQL;
        $select = new Select();
        return $select->getRow($sql, ['id' => $id]);
    }


    /**
     * Retourner l'intervalle des dates de naissance pour les catégories
     * Champs à retourner : dateMin, dateMax
     * @return array
     */
    public static function getIntervalle(): array
    {
        $annee = date('Y');
        $mois = intval(Date('m'));
        if ($mois >= 9) {
            $annee++;
        }
        $sql = <<<SQL
            select concat($annee - min(ageMin), '-12-31') as dateMax,  concat($annee - max(ageMax), '-01-01') as dateMin
            from categorie      
SQL;
        $select = new Select();
        return $select->getRow($sql);
    }

    /**
     * Retourne la date de naissance la plus ancienne (maximum des ageMax)
     * @return string
     */
    public static function getDateNaissanceMin(): string
    {
        $annee = date('Y');
        if (intval(date('m')) >= 9) {
            $annee++;
        }

        $sql = <<<SQL
        SELECT concat($annee - max(ageMax), '-01-01') as dateMin
        FROM categorie
SQL;
        $select = new Select();
        $row = $select->getRow($sql);
        return $row['dateMin'];
    }

    /**
     * Retourne la date de naissance la plus récente (minimum des ageMin)
     * @return string
     */
    public static function getDateNaissanceMax(): string
    {
        $annee = date('Y');
        if (intval(date('m')) >= 9) {
            $annee++;
        }

        $sql = <<<SQL
        SELECT concat($annee - min(ageMin), '-12-31') as dateMax
        FROM categorie
SQL;
        $select = new Select();
        $row = $select->getRow($sql);
        return $row['dateMax'];
    }


}