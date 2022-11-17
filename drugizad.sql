drop database if exists progr;
create database progr;
use progr;

create table programer(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    datumpocetka datetime,
    placa decimal(18,2)
);

create table projekt(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2)
);

create table sudjeluje(
    projekt int,
    programer int,
    datumpocetka datetime,
    datumkraja datetime
);

alter table sudjeluje add foreign key (programer) references programer(sifra);
alter table sudjeluje add foreign key (projekt) references projekt(sifra);