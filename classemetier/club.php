<?php
declare(strict_types=1);

// table club : id, nom, fichier

class Club
{

    // répertoire où sont stockés les logos des clubs
    public const DIR = RACINE . '/data/club/';

    /**
     * Retourner l'ensemble des clubs
     * Champs à retourner : id, nom, fichier, nb (nombre de licenciés dans le club)
     * @return array
     */
    public static function getAll(): array
    {
        $sql = <<<SQL
           select id, nom, fichier, (select count(*) from coureur where coureur.idClub = club.id) as nb
           from club
           order by nom;
SQL;
        $select = new Select();
        $lesLignes = $select->getRows($sql);

        // ajout d'une colonne permettant de vérifier l'existence du logo
        foreach ($lesLignes as &$ligne) {
            $ligne['present'] = isset($ligne['fichier']) && is_file(self::DIR . $ligne['fichier']);
        }
        return $lesLignes;
    }

    /**
     * Retourner l'ensemble des clubs pour une liste déroulante (triée par nom) AYANT au moins un licencié
     * Champs à retourner : id, nom
     * @return array
     */
    public static function getListe(): array
    {
        $sql = <<<SQL
           select id, nom, (select count(*) from coureur where coureur.idClub = club.id) as nb
           from club
           order by nom;
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
             select id, nom, fichier,  (select count(*) from coureur where coureur.idClub = club.id) as nb
             from club
             where id = :id;
SQL;
        $select = new Select();
        return $select->getRow($sql, ['id' => $id]);
    }

}
