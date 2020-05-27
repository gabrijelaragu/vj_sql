# c:\xampp2\mysql\bin\mysql -uedunova -pedunova < d:\pp21\kolokvij_vjezba02.sql
drop database if exists kolokvij_vj_02;
create database kolokvij_vj_02;
use kolokvij_vj_02;

create table punica (
sifra int not null primary key auto_increment,
bojaociju varchar(36),
bojakose varchar(42) not null,
majica varchar(30),
prviput datetime,
hlace varchar(31),
asocijalno bit
);
create table zarucnik_punica (
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    punica int not null
);
create table zarucnik (
    sifra int not null primary key auto_increment,
    indiferentno bit,
    carape varchar(38),
    kratkamajica varchar(39),
    ekstroventno bit not null,
    narukvica int,
    kuna decimal(14,6)
);
create table prijateljica (
    sifra int not null primary key auto_increment,
    dukserica varchar(39),
    eura decimal(14,7),
    treciput datetime,
    klace varchar(44),
    zarucnik int
);
create table neprijateljica (
    sifra int not null primary key auto_increment,
    interventno bit,
    vesta varchar(50) not null,
    gustoca decimal(16,8),
    carape varchar(38) not null,
    lipa decimal(18,5) not null,
    prijateljica int not null
);
create table svekar (
    sifra int not null primary key auto_increment,
    prstena int not null,
    jmbag char(11),
    lipa decimal(17,7) not null,
    eura decimal(17,9) not null,
    neprijateljica int not null
);
create table brat (
    sifra int not null primary key auto_increment,
    gustoca decimal(13,7),
    bojaociju varchar(47),
    modelnaocala varchar(47) not null,
    suknja varchar(44),
    maraka decimal(12,10) not null,
    hlace varchar(48) not null

);

create table punac (
    sifra int not null primary key auto_increment,
    suknja varchar(40),
    vesta varchar(49) not null,
    prviput datetime,
    brat int 
);
alter table zarucnik_punica add foreign key (punica) references punica(sifra);
alter table zarucnik_punica add foreign key(zarucnik) references zarucnik(sifra);
alter table prijateljica add foreign key(zarucnik) references zarucnik(sifra);
alter table neprijateljica add foreign key(prijateljica) references prijateljica(sifra);
alter table svekar add foreign key(neprijateljica) references neprijateljica(sifra);
alter table punac add foreign key(brat) references brat(sifra);