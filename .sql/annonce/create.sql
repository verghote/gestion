SET default_storage_engine = InnoDb;

create table  annonce
(
    id          smallint unsigned not null auto_increment primary key ,
    nom         varchar(100)      not null,
    description text              not null,
    date        date              not null,
    actif       tinyint           not null default '0'
);

