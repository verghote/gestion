USE gestion;
SET NAMES utf8mb4 COLLATE utf8mb4_0900_ai_ci;

drop trigger if exists avantAjoutProjet;
drop trigger if exists avantMajProjet;
drop trigger if exists avantAjoutCompetenceProjet;
drop trigger if exists avantMajCompetenceProjet;

create trigger avantAjoutProjet
    before insert
    on Projet
    for each row
begin

    # mise en forme et vérification du nom
    set new.nom = TRIM(REGEXP_REPLACE(new.nom, '\\s+', ' '));

    if length(new.nom) not between 10 and 150 then
        signal sqlstate '45000' set message_text = "#Le nom du projet doit comporter entre 10 et 150 caractères";
    end if;

    if exists(select 1 from projet where nom = new.nom) then
        signal sqlstate '45000' set message_text = "#Ce projet existe déjà";
    end if;
end;

create trigger avantAjoutCompetenceprojet
    before insert on competenceprojet
    for each row
begin
    declare existeCompetence int default 0;
    declare bloc int default 0;
    declare message text;

    -- vérifie que le projet cible existe
    if not exists (select 1 from projet where id = new.idProjet) then
        signal sqlstate '45000'
            set message_text = "#Ce projet n''existe pas";
    end if;

    -- vérifie que la compétence existe et récupère son idbloc
    select count(*), ifnull(idbloc, 0)
    into existeCompetence, bloc
    from competence
    where id = new.idCompetence;

    if existeCompetence = 0 then
        set message = concat('~La compétence ', new.idCompetence, ' n''existe pas');
        signal sqlstate '45000' set message_text = message;
    end if;

    -- vérifie que la compétence appartient au bloc 1
    if bloc != 1 then
        set message = concat('~La compétence ', new.idCompetence, ' ne fait pas partie du bloc 1.');
        signal sqlstate '45000' set message_text = message;
    end if;


end


