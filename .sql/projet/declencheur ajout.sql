USE gestion;
SET NAMES utf8mb4 COLLATE utf8mb4_0900_ai_ci;

drop trigger if exists avantAjoutProjet;
drop trigger if exists avantAjoutCompetenceProjet;

-- Déclencheur avant insertion dans la table Projet
-- Vérifie la validité du nom du projet : mise en forme, longueur et unicité
create trigger avantAjoutProjet
    before insert
    on Projet
    for each row
begin

    -- Mise en forme : suppression des espaces multiples et trim autour du nom
    set new.nom = TRIM(REGEXP_REPLACE(new.nom, '\\s+', ' '));

    -- Validation de la longueur du nom du projet (entre 10 et 150 caractères)
    if length(new.nom) not between 10 and 150 then
        signal sqlstate '45000' set message_text = "~Le nom du projet doit comporter entre 10 et 150 caractères";
    end if;

    -- Vérification que le nom du projet est unique
    if exists(select 1 from projet where nom = new.nom) then
        signal sqlstate '45000' set message_text = "~Ce projet existe déjà";
    end if;
end;

-- Déclencheur avant insertion dans la table competenceprojet
-- Vérifie que le projet et la compétence liés existent et que la compétence appartient au bloc 1
create trigger avantAjoutCompetenceprojet
    before insert on competenceprojet
    for each row
begin
    declare existeCompetence int default 0;
    declare bloc int default 0;
    declare message text;

    -- Vérifie que le projet référencé par idProjet existe dans la table projet
    if not exists (select 1 from projet where id = new.idProjet) then
        signal sqlstate '45000'
            set message_text = "~Ce projet n''existe pas";
    end if;

    -- vérifie que la compétence existe et récupère son idbloc
    select count(*), ifnull(idbloc, 0)
    into existeCompetence, bloc
    from competence
    where id = new.idCompetence;

    -- Si la compétence n'existe pas, on signale une erreur
    if existeCompetence = 0 then
        set message = concat('~La compétence ', new.idCompetence, ' n''existe pas');
        signal sqlstate '45000' set message_text = message;
    end if;

    -- Vérifie que la compétence appartient bien au bloc 1 (sinon erreur)
    if bloc != 1 then
        set message = concat('~La compétence ', new.idCompetence, ' ne fait pas partie du bloc 1.');
        signal sqlstate '45000' set message_text = message;
    end if;
end


