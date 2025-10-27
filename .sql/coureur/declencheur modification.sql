use gestion;
SET NAMES utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- suppression des déclencheurs existants

drop trigger if exists avantMajCoureur;
drop trigger if exists avantMajCategorie;
drop trigger if exists avantMajClub;

-- avant la mise à jour d'un coureur
-- le numéro de licence doit être unique
-- le triplet nom, prénom, date de naissance doit être unique
-- l'email doit être unique s'il est renseigné
-- la catégorie est calculée à partir de la date de naissance

create trigger avantMajCoureur
    before update
    on coureur
    for each row
begin
    -- Initialiser l'année de la saison en cours qui commence en septembre de l'année précédente
    declare annee int;
    set annee = year(curdate());
    if month(curdate()) >= 9 then
        set annee = annee + 1;
    end if;

    -- Vérification sur le numéro de licence

    if new.licence != old.licence then
        if exists(select 1 from coureur where licence = new.licence) then
            signal sqlstate '45000' set message_text = '~Ce numéro de licence est déjà attribué';
        end if;
    end if;

    -- Mise en forme et vérification sur le nom

    if new.nom != old.nom then

        set new.nom = ucase(new.nom);

        if char_length(new.nom) not between 3 and 30 then
            signal sqlstate '45000' set message_text = '~Le nom doit comporter entre 3 et 30 caractères';
        end if;

        if new.nom not regexp '^[A-Z]( ?[A-Z])*$' then
            signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
        end if;

    end if;

    -- mise en forme et vérification sur le prénom

    if new.prenom != old.prenom then
        set new.prenom = ucase(new.prenom);


        if char_length(new.prenom) not between 3 and 30 then
            signal sqlstate '45000' set message_text = '~Le prénom doit comporter entre 3 et 30 caractères';
        end if;

        if new.prenom not regexp '^[A-Z]( ?[A-Z])*$' then
            signal sqlstate '45000' set message_text = '~Le format du prénom est invalide.';
        end if;

    end if;

    -- Vérification de la date de naissance et détermination de la catégorie correspondante

    if new.dateNaissance != old.dateNaissance then

        if new.dateNaissance not regexp '^(19|20)[0-9]{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$' then
            signal sqlstate '45000' set message_text = '~Le format de la date de naissance est invalide.';
        end if;

        select id
        into @idCategorie
        from categorie
        where annee - year(new.dateNaissance) between ageMin and AgeMax;
        if @idCategorie is not null then
            set new.idCategorie = @idCategorie;
        else
            signal sqlstate '45000' set message_text =
                    '~Aucune catégorie ne correspond à ce coureur, veuillez vérifier sa date de naissance';
        end if;

    end if;

    -- vérification de l'unicité sur le triplet nom, prenom, dateNaissance
    if new.nom != old.nom or new.prenom != old.prenom or new.dateNaissance != old.dateNaissance then

        if exists(select 1
                  from coureur
                  where nom = new.nom
                    and prenom = new.prenom
                    and dateNaissance = new.dateNaissance) then
            signal sqlstate '45000' set message_text = '~Un homonyme est déjà présent dans la table';
        end if;
    end if;

    -- vérification de l'existence de l'identifant du club
    if new.idClub != old.idClub then
        if not exists(select 1 from club where id = new.idClub) then
            signal sqlstate '45000' set message_text = '~Ce club n''existe pas.';
        end if;
    end if;

    -- vérification de l'unicité de l'email si le champ est renseigné
    if new.email != old.email then
        if new.email is not null then
            if new.email not regexp '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*[\.][a-zA-Z]{2,4}$' then
                signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
            end if;

            if exists(select 1 from coureur where email = new.email) then
                signal sqlstate '45000' set message_text = '~Cette adresse mail est déjà associée à un autre coureur';
            end if;
        end if;
    end if;

    -- vérification du format du téléphone si le champ est renseigné
    if new.telephone != old.telephone then
        if new.telephone is not null then
            if new.telephone not regexp '^0(6|7)[0-9]{8}$' then
                signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
            end if;
        end if;
    end if;
end;


-- Déclencheur avant mise à jour sur la table categorie
-- Vérifie et valide les modifications sur les colonnes id, nom et les intervalles d'âge
create trigger avantMajCategorie
    before update
    on categorie
    for each row
begin
    -- Vérification et mise en majuscule du nouvel identifiant s'il est modifié
    -- Validation du format du code (lettre suivie de 1 ou 2 chiffres/alphanumériques)
    -- Vérification de l'unicité du code
    if new.id <> old.id then
        set new.id = ucase(new.id);

        if new.id not regexp '^[A-Za-z][A-Za-z0-9]{1,2}$' then
            signal sqlstate '45000' set message_text = '~Le code ne respecte pas le format attendu.';
        end if;

        if exists(select 1 from categorie where id = new.id) then
            signal sqlstate '45000' set message_text = '~Ce code est déjà attribué à une autre catégorie';
        end if;
    end if;

    -- Validation et mise en forme du nom s'il est modifié
    -- Le nom doit commencer par une majuscule suivie de minuscules
    -- Le nom doit avoir une longueur entre 5 et 20 caractères
    -- Le format du nom doit respecter l'expression régulière définie
    -- Vérification que le nom est unique dans la table
    if new.nom <> old.nom then
        Set new.nom = CONCAT(UPPER(LEFT(new.nom, 1)), LOWER(SUBSTRING(new.nom, 2)));

        if char_length(new.nom) not between 5 and 20 then
            signal sqlstate '45000' set message_text = '~Le nom doit comporter entre 5 et 20 caractères';
        end if;

        if new.nom not regexp '^[A-Za-z][A-Za-z]*( [0-9]{1,2})*$' then
            signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
        end if;

        if exists(select 1 from categorie where nom = new.nom) then
            signal sqlstate '45000' set message_text = '~Ce nom est déjà utilisé par une autre catégorie';
        end if;
    end if;

    -- Validation des intervalles d'âge s'ils sont modifiés
    -- Vérifie que les âges minimum et maximum sont bien des nombres entre 1 et 99
    -- Vérifie que l'âge minimum est inférieur ou égal à l'âge maximum
    -- Empêche tout chevauchement d'intervalle entre catégories différentes
    if new.ageMin <> old.ageMin or new.ageMax <> old.ageMax then
        if new.ageMin not regexp '^([1-9]|[1-9][0-9])$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'âge minimale est invalide.';
        end if;

        if new.ageMax not regexp '^([1-9]|[1-9][0-9])$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'âge maximale est invalide.';
        end if;

        if new.ageMin > new.ageMax then
            signal sqlstate '45000' set message_text = '~L''intervalle des âges est invalide';
        end if;
        -- chevaucchement
        -- pas de chevauchement si :  new.ageMax < ageMin ou new.ageMin > ageMax
        -- donc chevauchement si  : new.ageMax >= ageMin et new.ageMin <= ageMax
        if exists(select 1 from categorie where new.ageMax >= ageMin and new.ageMin <= ageMax and new.id != id) then
            signal sqlstate '45000' set message_text =
                    '~L''intervalle de cette catégorie est en conflit avec une autre catégorie';
        end if;
    end if;
end;

-- Déclencheur avant mise à jour sur la table club
-- Vérifie et valide les modifications sur l'identifiant et le nom du club
create trigger avantMajClub
    before update
    on club
    for each row
begin
    -- Vérification sur l'id
    -- Doit être un numéro à 6 chiffres commençant par '080'
    -- Vérifie l'unicité du nouvel identifiant
    if new.id != old.id then
        IF new.id REGEXP '^[0-8]{3}[0-9]{3}$' = 0 then
            signal sqlstate '45000' set message_text =
                    'Le numéro du club doit être un nombre de 6 chiffres commençant par 080';
        end if;

        if exists(select 1 from club where id = new.id) then
            signal sqlstate '45000' set message_text = '~Ce numéro est déjà attribué';
        end if;

    end if;

    -- Mise en forme et vérification sur le nom
    -- Mise en forme (majuscule) et validation du nom s'il est modifié
    -- Le nom doit contenir entre 3 et 60 caractères
    -- Le nom doit respecter le format regex autorisant certains caractères
    -- Vérification que le nom est unique dans la table
    if new.nom != old.nom then
        set new.nom = ucase(new.nom);

        if char_length(new.nom) not between 3 and 60 then
            signal sqlstate '45000' set message_text = '~Le nom doit comprendre entre 3 et 60 caractères';
        end if;

        if new.nom not regexp '^[A-Za-z]+([ ''\-.]?[A-Za-z])*$' then
            signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
        end if;

        if exists(select 1 from club where nom = new.nom) then
            signal sqlstate '45000' set message_text = '~Ce nom est déjà utilisé';
        end if;

    end if;
end;

