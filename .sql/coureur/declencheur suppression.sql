use gestion;
SET NAMES utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- suppression des déclencheurs existants

drop trigger if exists avantSuppressionCategorie;
drop trigger if exists avantSuppressionClub;

-- Déclencheur avant suppression d'une catégorie
-- Empêche la suppression si des coureurs sont rattachés à cette catégorie

create trigger avantSuppressionCategorie
    before delete
    on categorie
    for each row
begin
    if exists(select 1 from coureur where idCategorie = old.id) then
        signal sqlstate '45000' set message_text =
                '~Cette catégorie ne peut être supprimée car elle est attachée à au moins un coureur';
    end if;
end;

-- Déclencheur avant suppression d'un club
-- Empêche la suppression si des coureurs appartiennent à ce club
create trigger avantSuppressionClub
    before delete
    on club
    for each row
begin
    -- il ne doit pas exister de coureur dans le club
    if exists(select 1 from coureur where idClub = old.id) then
        signal sqlstate '45000' set message_text =
                '~La suppression de ce club est impossible car il comprend des coureurs';
    end if;
end;

