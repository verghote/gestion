use gestion;
SET NAMES utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- suppression des déclencheurs existants

drop trigger if exists avantAjoutCoureur;
drop trigger if exists avantAjoutCategorie;
drop trigger if exists avantAjoutClub;

-- version : une seule erreur renvoyée

-- lors d'un ajout
-- le numéro de licence doit être unique
-- le triplet nom, prénom, date de naissance doit être unique
-- l'email doit être unique s'il est renseigné
-- la catégorie est calculée à partir de la date de naissance

create trigger avantAjoutCoureur
    before insert
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
    if new.licence not regexp '^[0-9]{6,7}$' then
        signal sqlstate '45000' set message_text = '~Le numéro de licence ne respecte pas le format attendu.';
    end if;

    if exists(select 1 from coureur where licence = new.licence) then
        signal sqlstate '45000' set message_text = '~Ce numéro de licence est déjà attribué.';
    end if;

    -- Mise en forme et vérification sur le nom
    set new.nom = ucase(new.nom);

    if char_length(new.nom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '~Le nom doit comporter entre 3 et 30 caractères';
    end if;

    if new.nom not regexp '^[A-Z]( ?[A-Z])*$' then
        signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
    end if;

    -- mise en forme et vérification sur le prénom
    set new.prenom = ucase(new.prenom);

    if char_length(new.prenom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '~Le prénom doit comporter entre 3 et 30 caractères';
    end if;

    if new.prenom not regexp '^[A-Z]( ?[A-Z])*$' then
        signal sqlstate '45000' set message_text = '~Le format du prénom est invalide.';
    end if;

    -- Vérification de la date de naissance et détermination de la catégorie correspondante
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

    -- vérification de l'unicité sur le triplet nom, prenom, dateNaissance
    if exists(select 1
              from coureur
              where nom = new.nom
                and prenom = new.prenom
                and dateNaissance = new.dateNaissance) then
        signal sqlstate '45000' set message_text = '~Un homonyme est déjà présent dans la table';
    end if;

    -- vérification de l'existence de l'identifiant du club
    if not exists(select 1 from club where id = new.idClub) then
        signal sqlstate '45000' set message_text = '~Ce club n''existe pas.';
    end if;

    -- vérification de la validité et de l'unicité de l'email si le champ est renseigné
    if new.email is not null then
        if new.email not regexp '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*[\.][a-zA-Z]{2,4}$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
        end if;

        if exists(select 1 from coureur where email = new.email) then
            signal sqlstate '45000' set message_text = '~Cette adresse mail est déjà associée à un autre coureur';
        end if;
    end if;

    -- vérification de la validité du téléphone si le champ est renseigné
    if new.telephone is not null then
        if new.telephone not regexp '^0(6|7)[0-9]{8}$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
        end if;
   end if;
end;

-- trigger sur la table catégorie
-- Pour l'ajout : réalisons de tous les contrôles et mise en forme
-- AgeMin <= AgeMax
-- Pas de chevauchement entre deux catégories : il n'existe pas une ligne avec ageMin <= new.ageMax et ageMAx >= new.ageMin

create trigger avantAjoutCategorie
    before insert
    on categorie
    for each row
begin
    -- Mise en forme et vérification sur le code
    set new.id = ucase(new.id);

    if new.id not regexp '^[A-Za-z][A-Za-z0-9]{1,2}$' then
        signal sqlstate '45000' set message_text = '~Le code ne respecte pas le format attendu.';
    end if;

    if exists(select 1 from categorie where id = new.id) then
        signal sqlstate '45000' set message_text = '~Ce code est déjà attribué à une autre catégorie';
    end if;

    -- Mise en forme et vérification sur le nom
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

    -- Vérification de l'intervalle des âges

    if new.ageMin not regexp '^([1-9]|[1-9][0-9])$' then
        signal sqlstate '45000' set message_text = '~Le format de l\'âge minimale est invalide.';
    end if;

    if new.ageMax not regexp '^([1-9]|[1-9][0-9])$' then
        signal sqlstate '45000' set message_text = '~Le format de l\'âge maximale est invalide.';
    end if;

    if new.ageMin > new.ageMax then
        signal sqlstate '45000' set message_text = '~L''intervalle des âges est invalide';
    end if;
    -- chevauchement de la tranche d'âge avec une catégorie existante
    -- pas de chevauchement si : new.ageMax < ageMin ou new.ageMin > ageMax
    -- donc chevauchement si : new.ageMax >= ageMin et new.ageMin <= ageMax
    if exists(select 1 from categorie where new.ageMax >= ageMin and new.ageMin <= ageMax) then
        signal sqlstate '45000' set message_text =
                '~L''intervalle de cette catégorie est en conflit avec une autre catégorie';
    end if;
end;

-- trigger sur la table club
-- le champ id doit se composer de 6 chiffres en commençant par 080
-- le champ id doit être unique
-- le nom se compose uniquement de lettre en majuscule avec possibilité d'un espace, d'un point ou d'un tiret entre chaque mot
-- le nom comporte entre 3 et 60 caractères    
-- le nom doit être unique    
-- unicité sur le champ nom

create trigger avantAjoutClub
    before insert
    on club
    for each row
begin
    -- Vérification sur l'id
    IF new.id REGEXP '^[0-8]{3}[0-9]{3}$' = 0 then
        signal sqlstate '45000' set message_text =
                'Le numéro du club doit être un nombre de 6 chiffres commençant par 080';
    end if;

    if exists(select 1 from club where id = new.id) then
        signal sqlstate '45000' set message_text = '~Ce numéro est déjà attribué';
    end if;

    -- Mise en forme et vérification sur le nom
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
end;




