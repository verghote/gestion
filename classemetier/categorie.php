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
        // une lettre suivie d'un ou 1 2 caractères alphanumériques
        $input->Pattern = "^[A-Za-z][A-Za-z0-9]{1,2}$";
        $input->MinLength = 2;
        $input->MaxLength = 3;
        $input->Casse = 'U'; // la valeur sera mise en majuscule
        $this->columns['id'] = $input;

        // colonne nom
        $input = new InputText();
        $input->Require = true;
        // des lettres suivies éventuellement d'un espace obligatoirement suivi d'un ou 2 chiffres
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


    // méthode privée
    private static function getAnneeReference(): int
    {
        $annee = (int)date('Y');
        return (int)date('m') >= 9 ? $annee + 1 : $annee;
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
        $annee = self::getAnneeReference();
        $sql = <<<SQL
            select id, nom, ageMin, ageMax, concat(ageMin, '-', ageMax) as age, concat($annee - ageMax, '-' ,$annee - ageMin) as annee,
                   (select count(*) from coureur where coureur.idCategorie = categorie.id) as nb
            from categorie
            order by ageMin;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * Retourne la date de naissance la plus ancienne (maximum des ageMax)
     * @return string
     */
    public static function getDateNaissanceMin(): string
    {
        $annee = self::getAnneeReference();

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
        $annee = self::getAnneeReference();

        $sql = <<<SQL
        SELECT concat($annee - min(ageMin), '-12-31') as dateMax
        FROM categorie
SQL;
        $select = new Select();
        $row = $select->getRow($sql);
        return $row['dateMax'];
    }
}