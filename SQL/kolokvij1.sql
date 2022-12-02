drop database if exists kolokvij1;
create database kolokvij1 default charset utf8;
use kolokvij1;

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    marka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno bit,
    ekstroventno bit not null,
    dukserica varchar(48) not null,
    muskarac int
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);

alter table cura add foreign key (punac) references punac(sifra);

insert into sestra (sifra,introvertno,haljina,maraka,hlace,narukvica)
values 
(null,0,'Anebaluda','20.22','KaksaBahlace','1'),
(null,1,'Prejakahlajina','20.22','Kubajanica','2'),
(null,0,'KuliaPet','20.22','Najbace','3');

insert into zena (sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values
(null,'2022-11-12 17:00:00','AarmerkeKul','Najkraca','12121212121','Aelena','Prekratka',1),
(null,'2022-03-03 21:30:00','Plaanaske','Dugihrukava','54678933572','Plava','Prekratka',2),
(null,'2022-04-10 19:00:00','ZeleneNeke','Banana','25874698365','Amedja','Prekratka',3);


insert into muskarac (sifra,bojaociju,hlace,modelnaocala,marka,zena)
values
(null,'Plava','Leivs221','ReyBB','ReyBan',1),
(null,'Crvena','PulB','Otkdz','Aer',2),
(null,'Siva','Bers','Ada','Guv',3);

insert into svekar (sifra,bojaociju,prstena,dukserica,lipa,eura,majica)
values
(null,'Plava','2','Lebron','189.22','2232.33','Nistaposebno'),
(null,'Smedja','1','Kuli','132.11','32221.43','Reps'),
(null,'Siva','1','Dada','50','13312.23','Spre');

insert into sestra_svekar (sifra,sestra,svekar)
values
(null,'3','1'),
(null,'1','3'),
(null,'2','2');

insert into punac (sifra,ogrlica,gustoca,hlace)
values
(null,'1','132.33','Apor'),
(null,'1','531.33','eRaw'),
(null,'2','212.33','Vaasd');

insert into cura (sifra,novcica,gustoca,lipa,ogrlica,bojakose,suknja,punac)
values
(null,'50','112.99','12','11','Plava','Nikakva','1'),
(null,'12','445','100','40','Crna','Onak','2'),
(null,'300','211.33','23','13','Crvena','Top','3');



update cura set gustoca='100,457';

# 4. zadatak
select kratkamajica from zena 
where hlace like '%ana%'

#5. zadatak vjv ne valja jer ne dobijem nikakve podatke u tablici
select f.dukserica, b.hlace
from zena a
inner join muskarac b on a.sifra=b.zena
inner join mladic c on b.sifra=c.muskarac 
inner join sestra d on a.sestra=d.sifra 
inner join sestra_svekar e on d.sifra=e.sestra
inner join svekar f on e.svekar=f.sifra 
where a.hlace like 'A%' and d.haljina like '%ba%'
order by b.hlace desc

#6











