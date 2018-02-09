--Marek Czestkowski

INSERT INTO wydawca VALUES ('','Activision');
INSERT INTO wydawca VALUES ('','Bethesda');
INSERT INTO wydawca VALUES ('','THQ');
INSERT INTO wydawca VALUES ('','Ubisoft');
INSERT INTO wydawca VALUES ('','2K');
INSERT INTO wydawca VALUES ('','Grupa CD Projekt');
INSERT INTO wydawca VALUES ('','Konami');
INSERT INTO wydawca VALUES ('','Cenega');
INSERT INTO wydawca VALUES ('','Capcom');
INSERT INTO wydawca VALUES ('','Red Barrels');
SELECT * FROM wydawca;

INSERT INTO producent VALUES ('','Sledgehammer Games');
INSERT INTO producent VALUES ('','MachineGames');
INSERT INTO producent VALUES ('','Piranha Bytes');
INSERT INTO producent VALUES ('','Ubisoft Montreal');
INSERT INTO producent VALUES ('','2K CZECH');
INSERT INTO producent VALUES ('','CD Projekt Red');
INSERT INTO producent VALUES ('','Konami');
INSERT INTO producent VALUES ('','Rockstar Games');
INSERT INTO producent VALUES ('','Capcom');
INSERT INTO producent VALUES ('','Red Barrels');
SELECT * FROM producent;

INSERT INTO typ_gry VALUES ('','Akcji');
INSERT INTO typ_gry VALUES ('','RPG');
INSERT INTO typ_gry VALUES ('','Horror');
SELECT * FROM typ_gry;

INSERT INTO tryb VALUES ('','singleplayer');
INSERT INTO tryb VALUES ('','multiplayer');
SELECT * FROM tryb;

INSERT INTO jezyk VALUES ('','PL');
INSERT INTO jezyk VALUES ('','ENG');
INSERT INTO jezyk VALUES ('','GER');
SELECT * FROM jezyk;

INSERT INTO rezyser VALUES ('','Quentin','Tarantino');
INSERT INTO rezyser VALUES ('','James','Cameron');
INSERT INTO rezyser VALUES ('','Stanley','Kubrick');
SELECT * FROM rezyser;

INSERT INTO gatunek VALUES ('','akcji');
INSERT INTO gatunek VALUES ('','dramat wojenny');
INSERT INTO gatunek VALUES ('','horror');
SELECT * FROM gatunek;

INSERT INTO karta_graficzna VALUES ('','GTX 770');
INSERT INTO karta_graficzna VALUES ('','GTX 970');
INSERT INTO karta_graficzna VALUES ('','GTX 1070');
SELECT * FROM karta_graficzna;

INSERT INTO procesor VALUES ('','i3');
INSERT INTO procesor VALUES ('','i5');
INSERT INTO procesor VALUES ('','i7');
SELECT * FROM procesor;

INSERT INTO pamiec VALUES ('','2');
INSERT INTO pamiec VALUES ('','4');
INSERT INTO pamiec VALUES ('','8');
SELECT * FROM pamiec;

INSERT INTO adres VALUES ('','Alabastrowa','11','11-111','Augustów');
INSERT INTO adres VALUES ('','Biwakowa','22','22-222','Braniewo');
INSERT INTO adres VALUES ('','Ceglana','33','33-333','Czestochowa');
INSERT INTO adres VALUES ('','Dluga','44','44-444','Dobre Miasto');
INSERT INTO adres VALUES ('','Elegancka','55','55-555','Elblag');
INSERT INTO adres VALUES ('','Fioletowa','66','66-666','Frombork');
SELECT * FROM adres;

--CHECK nie pozwala na dodanie - zly kod pocztowy
--INSERT INTO adres VALUES ('','Elegancka','55','55-55555','Elblag');


--proc
--pamiec
--karta
INSERT INTO sprzet VALUES ('','1','1','1');
INSERT INTO sprzet VALUES ('','2','2','2');
INSERT INTO sprzet VALUES ('','3','3','3');
INSERT INTO sprzet VALUES ('','3','2','2');
INSERT INTO sprzet VALUES ('','2','3','3');
INSERT INTO sprzet VALUES ('','3','2','3');
SELECT * FROM sprzet;


INSERT INTO posrednik_platnosci VALUES ('','mbank');
INSERT INTO posrednik_platnosci VALUES ('','pko');
INSERT INTO posrednik_platnosci VALUES ('','orange');
INSERT INTO posrednik_platnosci VALUES ('','play');
INSERT INTO posrednik_platnosci VALUES ('','milenium');
INSERT INTO posrednik_platnosci VALUES ('','t-mobile');
SELECT * FROM POSREDNIK_PLATNOSCI;

INSERT INTO rodzaj_platnosci VALUES ('','przelew','1');
INSERT INTO rodzaj_platnosci VALUES ('','przelew','2');
INSERT INTO rodzaj_platnosci VALUES ('','telefon','3');
INSERT INTO rodzaj_platnosci VALUES ('','telefon','4');
INSERT INTO rodzaj_platnosci VALUES ('','przelew','5');
INSERT INTO rodzaj_platnosci VALUES ('','telefon','6');
SELECT * FROM RODZAJ_PLATNOSCI;

INSERT INTO rachunek VALUES ('','111111',TO_DATE('2017-12-24', 'YYYY-MM-DD'),'100','1');
INSERT INTO rachunek VALUES ('','222222',TO_DATE('2017-11-12', 'YYYY-MM-DD'),'110','2');
INSERT INTO rachunek VALUES ('','333333',TO_DATE('2017-10-03', 'YYYY-MM-DD'),'120','3');
INSERT INTO rachunek VALUES ('','444444',TO_DATE('2017-09-18', 'YYYY-MM-DD'),'130','4');
INSERT INTO rachunek VALUES ('','555555',TO_DATE('2017-08-18', 'YYYY-MM-DD'),'140','5');
INSERT INTO rachunek VALUES ('','666666',TO_DATE('2017-07-19', 'YYYY-MM-DD'),'150','6');
SELECT * FROM rachunek;

INSERT INTO film VALUES ('','Pulp Fiction','100',TO_DATE('1994', 'YYYY'),'W po³owie film noir, w po³owie czarna komedia, ca³oœæ przeplataj¹ca siê z gangsterami Los Angeles, ciemnymi typami, drobnymi z³odziejaszkami i tajemniczymi wydarzeniami. ', '2','1','1');
INSERT INTO film VALUES ('','Bekarty Wojny','110',TO_DATE('2009', 'YYYY'),'W czasie II wojny œwiatowej powo³ana zostaje przez amerykañski wywiad grupa ¿o³nierzy zwanych „Bêkartami”, sk³adaj¹ca siê g³ównie z amerykañskich ¯ydów ', '1','2','1');
INSERT INTO film VALUES ('','Terminator 2','120',TO_DATE('1992', 'YYYY'),'amerykañski film z gatunku science fiction wyre¿yserowany w 1991 roku przez Jamesa Camerona, bêd¹cy kontynuacj¹ fabu³y filmu Terminator. ', '3','1','2');
INSERT INTO film VALUES ('','Titanic','130',TO_DATE('1997', 'YYYY'),'film fabularny produkcji amerykañskiej z 1997 roku, oparty na historycznym wydarzeniu – zatoniêciu „Titanica” w 1912 roku. ', '1','3','2');
INSERT INTO film VALUES ('','Full Metal Jacket','140',TO_DATE('1987', 'YYYY'),'dramat wojenny produkcji USA z 1987 roku w re¿yserii Stanleya Kubricka, na podstawie pó³-autobiograficznej powieœci Gustava Hasforda The Short-Timers ', '2','2','3');
INSERT INTO film VALUES ('','Lsnienie','150',TO_DATE('1980', 'YYYY'),'film z 1980 roku, wyre¿yserowany przez Stanleya Kubricka, bêd¹cy filmow¹ adaptacj¹ powieœci Stephena Kinga pod tytu³em Jasnoœæ. ', '1','3','3');
SELECT * FROM film;

INSERT INTO uzytkownik VALUES ('','Alicja','Antosiak',TO_DATE('2017-09-10', 'YYYY-MM-DD'),'1','1');
INSERT INTO uzytkownik VALUES ('','Beata','Borkowska',TO_DATE('2017-08-01', 'YYYY-MM-DD'),'2','2');
INSERT INTO uzytkownik VALUES ('','Celina','Cabaj',TO_DATE('2017-07-15', 'YYYY-MM-DD'),'3','3');
INSERT INTO uzytkownik VALUES ('','Dariusz','Durszlak',TO_DATE('2017-09-22', 'YYYY-MM-DD'),'4','4');
INSERT INTO uzytkownik VALUES ('','Eugeniusz','Epicki',TO_DATE('2017-08-17', 'YYYY-MM-DD'),'5','5');
INSERT INTO uzytkownik VALUES ('','Filip','Filipowski',TO_DATE('2017-09-11', 'YYYY-MM-DD'),'6','6');
SELECT * FROM uzytkownik;

INSERT INTO gra VALUES ('','Call of Duty WWII','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'1','Wyl¹dujcie w Normandii i walczcie w ca³ej Europie na s³ynnych polach bitew najwiêkszej wojny w historii.','1','1','1','1','1','1');
INSERT INTO gra VALUES ('','Wolfenstein 2','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'2','Tym razem B.J. Blazkowicz rozprawia siê z nazistami na terenie okupowanych Stanów Zjednoczonych.','3','2','2','1','2','2');
INSERT INTO gra VALUES ('','ELEX','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'3','Elex jest RPG-iem osadzonym w du¿ym postapokaliptycznym œwiecie','2','3','3','2','1','3');
INSERT INTO gra VALUES ('','Assassins creed','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'4','Kolejna pe³noprawna ods³ona bestsellerowej serii Assassins Creed, ','1','4','4','1','2','1');
INSERT INTO gra VALUES ('','Mafia 3','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'5','Trzecia ods³ona kultowego cyklu gangsterskich gier akcji','3','6','5','1','1','2');
INSERT INTO gra VALUES ('','Wiedzmin 3','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'6','abularna gra akcji stworzona i wydana przez polskie studio CD Projekt RED','2','6','6','2','2','3');
INSERT INTO gra VALUES ('','Metal gear Solid V','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'7','komputerowa gra z gatunku skradanek, wyprodukowana przez japoñskie studio Konami.','1','7','7','1','1','1');
INSERT INTO gra VALUES ('','GTA V','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'8','gra komputerowa, bêd¹ca jedenast¹ i najnowsz¹ czêœci¹ serii Grand Theft Auto','3','8','8','1','2','2');
INSERT INTO gra VALUES ('','Resident Evil 7','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'9','japoñska gra komputerowa z gatunku survival horror','2','9','9','3','1','3');
INSERT INTO gra VALUES ('','Outlast','100',TO_DATE('2017-01-01', 'YYYY-MM-DD'),'10','gra komputerowa z gatunku survival horror przedstawiona w perspektywie pierwszoosobowej','1','10','10','3','2','1');
SELECT * FROM gra;

INSERT INTO dostep_do_materialu VALUES ('','1','1','1',NULL);
INSERT INTO dostep_do_materialu VALUES ('','2','2','2',NULL);
INSERT INTO dostep_do_materialu VALUES ('','3','3','3',NULL);
INSERT INTO dostep_do_materialu VALUES ('','4','4',NULL,'4');
INSERT INTO dostep_do_materialu VALUES ('','5','5',NULL,'5');
INSERT INTO dostep_do_materialu VALUES ('','6','6',NULL,'6');
SELECT * FROM DOSTEP_DO_MATERIALU;

INSERT INTO wishlist VALUES ('','1','4');
INSERT INTO wishlist VALUES ('','2','5');
INSERT INTO wishlist VALUES ('','3','6');
INSERT INTO wishlist VALUES ('','4','7');
INSERT INTO wishlist VALUES ('','5','8');
INSERT INTO wishlist VALUES ('','6','9');
SELECT * FROM wishlist;







