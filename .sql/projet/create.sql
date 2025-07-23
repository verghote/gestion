USE gestion;

SET default_storage_engine = InnoDb;

drop table if exists competenceprojet;
drop table if exists competence;
drop table if exists domaine;
drop table if exists bloc;
drop table if exists projet;

CREATE TABLE bloc
(
    id      int primary key,
    libelle varchar(100) NOT NULL
);

CREATE TABLE domaine
(
    idBloc    int,
    idDomaine int,
    libelle   varchar(150) NOT NULL,
    PRIMARY KEY (idBloc, idDomaine),
    FOREIGN KEY (idBloc) REFERENCES bloc (id)
);

CREATE TABLE competence
(
    id           int auto_increment primary key,
    idBloc       int          NOT NULL,
    idDomaine    int          NOT NULL,
    idCompetence int          NOT NULL,
    libelle      varchar(150) NOT NULL,
    unique (idbloc, idDomaine, idCompetence),
    FOREIGN KEY (idbloc, idDomaine) REFERENCES domaine (idBloc, idDomaine)
);

# Gestion des compétences associées à un projet

CREATE TABLE projet
(
    id  int AUTO_INCREMENT primary key,
    nom varchar(150) NOT null unique
);

CREATE TABLE competenceprojet
(
    idProjet     int,
    idCompetence int,
    PRIMARY KEY (idProjet, idCompetence),
    foreign key (idProjet) references projet (id) on delete cascade,
    foreign key (idCompetence) references competence (id)
);
