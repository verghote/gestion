<?php
declare(strict_types=1);

class Competence extends Table
{

    /**
     * retourne les projets du portfolio de l'utilisateur
     * @return array
     */
    public static function getAll(): array
    {
        $sql = <<<SQL
            select concat('C.', idBloc, '.', idDomaine, '.', idCompetence) as code, libelle
            from competence
            order by code;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * retourne les compétences
     * @param string $idBloc
     * @param string $idDomaine
     * @return array
     */
    public static function getLesCompetences(string $idBloc, string $idDomaine = '*'): array
    {
        $lesParametres['idBloc'] = $idBloc;
        $sql = <<<SQL
            select id, concat('C.', idBloc, '.', idDomaine, '.', idCompetence) as code, libelle
            from competence
            where idBloc = :idBloc
SQL;
        // prise en compte du domaine si l'idDomaine n'a pas la valeur par défaut
        if ($idDomaine !== '*') {
            $sql .= " and  idDomaine = :idDomaine";
            $lesParametres['idDomaine'] = $idDomaine;
        }

        $select = new Select();
        return $select->getRows($sql, $lesParametres);
    }

    /**
     * retourne les blocs
     * @return array
     */
    public static function getLesBlocs(): array
    {
        $sql = <<<SQL
            select id, libelle
            from bloc
            order by libelle;
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * retourne les domaines du bloc
     * @param int $idBloc
     * @return array
     */
    public static function getLesDomaines(int $idBloc): array
    {
        $sql = <<<SQL
            select idDomaine, libelle
            from domaine
            where idBloc = :idBloc
            order by libelle;   
SQL;
        $select = new Select();
        return $select->getRows($sql, ['idBloc' => $idBloc]);
    }


    public static function getById(int $id): mixed
    {
        $sql = <<<SQL
            select id, libelle, idBloc, idDomaine, idCompetence
            from competence
            where id = :id;
SQL;
        $select = new Select();
        return $select->getRow($sql, ['id' => $id]);
    }
}
