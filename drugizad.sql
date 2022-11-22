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

insert into programer(sifra,ime,prezime,datumpocetka,placa)
values(null,'Davor','Horvat','2022-01-11 19:00:00',7500.00);

insert into projekt(sifra,naziv,cijena)
values(null,'Nije mi to sad bitno',2233.33);

insert into sudjeluje(projekt,programer,datumpocetka,datumkraja)
values(1,1,'2022-01-11 19:00:00','2023-04-20');