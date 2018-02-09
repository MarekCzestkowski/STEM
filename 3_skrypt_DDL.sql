--Marek Czestkowski

CREATE TABLE wydawca (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE producent (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE tryb (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE typ_gry (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE rezyser (
id NUMBER(11) PRIMARY KEY,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(20) NOT NULL);

CREATE TABLE jezyk (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE procesor (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE karta_graficzna (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE pamiec (
id NUMBER(11) PRIMARY KEY,
wielkosc NUMBER(2) UNIQUE NOT NULL);

CREATE TABLE posrednik_platnosci (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE gatunek (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE adres (
id NUMBER(11) PRIMARY KEY,
ulica VARCHAR(20) DEFAULT NULL,
nr_domu NUMBER(4) CHECK(nr_domu>0) NOT NULL,
kod_pocztowy CHAR(6) NOT NULL CHECK(LENGTH(kod_pocztowy)=6),
miejscowosc VARCHAR(20) NOT NULL);

CREATE TABLE sprzet (
id NUMBER(11) PRIMARY KEY,
procesor_id NUMBER(11) REFERENCES procesor(id) NOT NULL,
pamiec_id NUMBER(11)  REFERENCES pamiec(id) NOT NULL,
karta_graficzna_id NUMBER(11) REFERENCES karta_graficzna(id) NOT NULL);

CREATE TABLE gra (
id NUMBER(11) PRIMARY KEY,
tytul VARCHAR(20) NOT NULL,
cena VARCHAR(20) NOT NULL,
data_wydania DATE NOT NULL,
ocena INTEGER NOT NULL,
opis VARCHAR(255) NOT NULL,
jezyk_id NUMBER(11) REFERENCES jezyk(id) NOT NULL,
producent_id NUMBER(11) REFERENCES producent(id) NOT NULL,
wydawca_id NUMBER(11) REFERENCES wydawca (id) NOT NULL,
typ_gry_id NUMBER(11) REFERENCES typ_gry(id) NOT NULL,
tryb_id NUMBER(11) REFERENCES Tryb(id) NOT NULL,
sprzet_id NUMBER(11) REFERENCES sprzet(id) NOT NULL);

CREATE TABLE film (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) NOT NULL,
cena NUMBER(8,2) NOT NULL,
data_premiery DATE NOT NULL,
opis VARCHAR(255) NOT NULL,
jezyk_id NUMBER(11) REFERENCES jezyk(id) NOT NULL,
gatunek_id NUMBER(11) REFERENCES gatunek(id) NOT NULL,
rezyser_id NUMBER(11) REFERENCES rezyser(id) NOT NULL);

CREATE TABLE uzytkownik (
id NUMBER(11) PRIMARY KEY,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(20) NOT NULL,
data_rejestracji DATE NOT NULL,
sprzet_id NUMBER(11) REFERENCES sprzet(id) NOT NULL,
adres_id NUMBER(11) REFERENCES adres(id) NOT NULL);

CREATE TABLE rodzaj_platnosci (
id NUMBER(11) PRIMARY KEY,
nazwa VARCHAR(20) NOT NULL,
posrednik_platnosci_id NUMBER(11) REFERENCES posrednik_platnosci(id) NOT NULL);

CREATE TABLE rachunek (
id NUMBER(11) PRIMARY KEY,
nr_rachunku NUMBER(11) NOT NULL,
data_zakupu DATE NOT NULL,
kwota NUMBER(11) NOT NULL,
rodzaj_platnosci_id NUMBER(11) REFERENCES rodzaj_platnosci(id) NOT NULL);

CREATE TABLE wishlist (
id NUMBER(11) PRIMARY KEY,
uzytkownik_id NUMBER(11) REFERENCES uzytkownik(id) NOT NULL,
gra_id NUMBER(11) REFERENCES gra(id) NOT NULL);

CREATE TABLE dostep_do_materialu (
id NUMBER(11) PRIMARY KEY,
uzytkownik_id NUMBER(11) REFERENCES rodzaj_platnosci(id) NOT NULL,
rachunek_id NUMBER(11) REFERENCES rodzaj_platnosci(id) NOT NULL,
gra_id NUMBER(11) REFERENCES rodzaj_platnosci(id),
film_id NUMBER(11) REFERENCES rodzaj_platnosci(id));


/
CREATE SEQUENCE sek_wydawca START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_wydawca 
    BEFORE INSERT ON wydawca
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_wydawca.nextval;
END;

/
CREATE SEQUENCE sek_producent START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_producent
    BEFORE INSERT ON producent
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_producent.nextval;
END;

/
CREATE SEQUENCE sek_tryb START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_tryb
    BEFORE INSERT ON tryb
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_tryb.nextval;
END;

/
CREATE SEQUENCE sek_typ_gry START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_typ_gry
    BEFORE INSERT ON typ_gry
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_typ_gry.nextval;
END;

/
CREATE SEQUENCE sek_rezyser START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_rezyser
    BEFORE INSERT ON rezyser
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_rezyser.nextval;
END;

/
CREATE SEQUENCE sek_jezyk START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_jezyk
    BEFORE INSERT ON jezyk
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_jezyk.nextval;
END;

/
CREATE SEQUENCE sek_procesor START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_procesor
    BEFORE INSERT ON procesor
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_procesor.nextval;
END;

/
CREATE SEQUENCE sek_karta_graficzna START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_karta_graficzna
    BEFORE INSERT ON karta_graficzna
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_karta_graficzna.nextval;
END;

/
CREATE SEQUENCE sek_pamiec START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_pamiec
    BEFORE INSERT ON pamiec
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_pamiec.nextval;
END;

/
CREATE SEQUENCE sek_posrednik_platnosci START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_posrednik_platnosci
    BEFORE INSERT ON posrednik_platnosci
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_posrednik_platnosci.nextval;
END;

/
CREATE SEQUENCE sek_gatunek START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_gatunek
    BEFORE INSERT ON gatunek
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_gatunek.nextval;
END;

/
CREATE SEQUENCE sek_adres START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_adres
    BEFORE INSERT ON adres
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_adres.nextval;
END;

/
CREATE SEQUENCE sek_sprzet START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_sprzet
    BEFORE INSERT ON sprzet
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_sprzet.nextval;
END;

/
CREATE SEQUENCE sek_gra START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_gra
    BEFORE INSERT ON gra
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_gra.nextval;
END;

/
CREATE SEQUENCE sek_film START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_film
    BEFORE INSERT ON film
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_film.nextval;
END;

/
CREATE SEQUENCE sek_uzytkownik START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_uzytkownik
    BEFORE INSERT ON uzytkownik
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_uzytkownik.nextval;
END;

/
CREATE SEQUENCE sek_rodzaj_platnosci START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_rodzaj_platnosci
    BEFORE INSERT ON rodzaj_platnosci
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_rodzaj_platnosci.nextval;
END;

/
CREATE SEQUENCE sek_rachunek START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_rachunek
    BEFORE INSERT ON rachunek
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_rachunek.nextval;
END;

/
CREATE SEQUENCE sek_wishlist START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_wishlist
    BEFORE INSERT ON wishlist
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_wishlist.nextval;
END;

/
CREATE SEQUENCE sek_dostep_do_materialu START WITH 1 NOCACHE ORDER;
/
CREATE OR REPLACE TRIGGER tr_dostep_do_materialu
    BEFORE INSERT ON dostep_do_materialu
    FOR EACH ROW
    WHEN (new.id IS NULL)
BEGIN
    :new.id := sek_dostep_do_materialu.nextval;
END;

/
