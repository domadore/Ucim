drop database if exists repub;
create database repub;
use repub;

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    zupan int
);

create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int,
    naziv varchar(50)
);

create table mjesto(
    sifra int not null primary key auto_increment,
    opcina int,
    naziv varchar(50)
);

alter table zupanija add foreign key (zupan) references zupan(sifra);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);

insert into zupan(sifra,ime,prezime)
values(null,'Luka','Lukic'),(null,'Marko','Markic');

insert into zupanija(sifra,naziv,zupan)
values(null,'Vukovarsko Srijemska',1),(null,'Splitsko Dalmatinska',2);

insert into opcina(sifra,zupanija,naziv)
values(null,1,'Jarmina'),(null,2,'Split');

insert into mjesto(sifra,opcina,naziv)
values(null,1,'Jarmina City'),(null,2,'Trogir');

