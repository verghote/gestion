SET default_storage_engine = InnoDb;

Set foreign_key_checks = 0;

use gestion;

create table categorie
(
    id     char(3) primary key,
    nom    varchar(20) NOT NULL unique,
    ageMin tinyint     NOT NULL,
    ageMax tinyint     NOT NULL,
    check (ageMin < ageMax)
);

create table club
(
    id  char(6) primary key,
    nom varchar(70) NOT NULL unique,
    fichier varchar(100) null
);

create table coureur
(
    licence       char(7)      NOT NULL primary key,
    nom           varchar(30)  NOT NULL,
    prenom        varchar(30)  NOT NULL,
    sexe          char(1)      NOT NULL DEFAULT 'M',
    dateNaissance date         NOT NULL,
    idCategorie   char(3)      NOT NULL,
    idClub        varchar(6)   NOT NULL,
    ffa           BOOLEAN      NOT NULL DEFAULT FALSE,
    email         varchar(100) null unique,
    telephone     char(10)     null,
    unique (nom, prenom, dateNaissance),
    foreign KEY (idCategorie) references categorie (id) on update cascade,
    foreign KEY (idClub) references club (id)
);


Set foreign_key_checks = 1;
