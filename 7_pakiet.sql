--Marek Czestkowski



CREATE OR REPLACE PACKAGE pakiet
IS
  PROCEDURE ile_czasu_zarejestrowany(param uzytkownik.id%TYPE);
  PROCEDURE wszystkie_gry_singleplayer (param tryb.nazwa%TYPE);
  PROCEDURE wszystkie_gry_singleplayer; 
  PROCEDURE podwyzka_ceny (param gra.tytul%TYPE);
  PROCEDURE ostatnie_zakupy;
  
  FUNCTION gra_dnia RETURN gra.tytul%TYPE;
  FUNCTION ilu_kupilo(dany_tytul VARCHAR) RETURN INTEGER;
  FUNCTION best_of (dany_typ VARCHAR) RETURN gra.tytul%TYPE;
   FUNCTION best_of RETURN gra.tytul%TYPE;

  FUNCTION najpopularniejsza_karta RETURN karta_graficzna.nazwa%TYPE;
END pakiet;
/


CREATE OR REPLACE PACKAGE BODY pakiet
IS

--procedura oblicza  ile lat i miesiecy uzytkownik jest juz zarejestrowany w serwisie

PROCEDURE ile_czasu_zarejestrowany(param uzytkownik.id%TYPE)
  IS data UZYTKOWNIK.DATA_REJESTRACJI%TYPE;
  rok INTEGER;
  miesiac INTEGER;
  BEGIN
    SELECT data_rejestracji INTO data FROM uzytkownik WHERE id=param;
    rok := ROUND(MONTHS_BETWEEN(SYSDATE, data)/12,0);
    miesiac := ROUND(MONTHS_BETWEEN(SYSDATE, data), 0) - 12* rok; 
    DBMS_OUTPUT.PUT_LINE(rok || ' lat i ' ||miesiac|| ' miesiecy, ' );
  END;  


--procedura wyswietla wszystkie gry obslugujace tryb singleplayer

PROCEDURE wszystkie_gry_singleplayer (param tryb.nazwa%TYPE)
  IS 
  BEGIN
    FOR i IN (SELECT tytul FROM  gra INNER JOIN tryb ON tryb.id = gra.tryb_id WHERE tryb.nazwa = param)
    LOOP
      DBMS_OUTPUT.PUT_LINE(i.tytul);
    END LOOP;
  END;  


-- wyswietla wszystkie gry bez podawania trybu
PROCEDURE wszystkie_gry_singleplayer
  IS 
  BEGIN
    FOR i IN (SELECT tytul FROM  gra)
    LOOP
      DBMS_OUTPUT.PUT_LINE(i.tytul);
    END LOOP;
  END;  

--procedura zwieksza cene danej gry o 10 procent

PROCEDURE podwyzka_ceny (param gra.tytul%TYPE)
  IS 
  BEGIN
    UPDATE gra SET cena = cena+cena*0.1 WHERE tytul = param;
  END;  


--procedura wyswietla wszystkie zakupy z ostatnich 30 dni

PROCEDURE ostatnie_zakupy
  IS 
  BEGIN
    FOR i IN (SELECT * FROM  Rachunek WHERE  SYSDATE - Rachunek.data_zakupu <= 30)
    LOOP
      DBMS_OUTPUT.PUT_LINE('numer rach: ' ||i.nr_rachunku || ' data: ' || i.data_zakupu || ' kwota: ' || i.kwota);
    END LOOP;
  END;  


--funkcja losuje gre jako gre dnia

FUNCTION gra_dnia
  RETURN gra.tytul%TYPE
  IS ile INTEGER;
  losuj INTEGER;
  BEGIN
    SELECT COUNT (*) INTO ile FROM gra;
    losuj := ROUND(DBMS_RANDOM.VALUE(1,ile));
    ILE := 1;
    FOR i IN (SELECT tytul FROM  gra)
    LOOP
      IF ile = losuj THEN 
        RETURN i.tytul;
      END IF;
      ile := ile +1;
    END LOOP;
  END;

-- funkcja sprawdza ilu uzytkownikow kupilo dany tytul
FUNCTION ilu_kupilo(dany_tytul VARCHAR)
  RETURN INTEGER
  IS ile INTEGER;
  BEGIN
    SELECT COUNT (*) INTO ile FROM gra WHERE tytul=dany_tytul;
      RETURN ile;
  END;



-- funkcja zwraca najlepsza gre z danego gatunku
FUNCTION best_of (dany_typ VARCHAR)
  RETURN gra.tytul%TYPE
  IS max gra.ocena%TYPE;
  tytul_gry gra.tytul%TYPE;
  BEGIN
    SELECT max(ocena) INTO max FROM gra INNER JOIN typ_gry ON typ_gry.id = gra.typ_gry_id WHERE typ_gry.nazwa = dany_typ;
    SELECT tytul INTO tytul_gry FROM gra INNER JOIN typ_gry ON typ_gry.id = gra.typ_gry_id WHERE ocena= max AND typ_gry.nazwa = dany_typ;
      RETURN tytul_gry;
  END;
  
  -- PRZECIAZENIE - Wybiera njalepsza gre ze wszystkich
  FUNCTION best_of
  RETURN gra.tytul%TYPE
  IS max gra.ocena%TYPE;
  tytul_gry gra.tytul%TYPE;
  BEGIN
    SELECT max(ocena) INTO max FROM gra INNER JOIN typ_gry ON typ_gry.id = gra.typ_gry_id;
    SELECT tytul INTO tytul_gry FROM gra INNER JOIN typ_gry ON typ_gry.id = gra.typ_gry_id WHERE ocena= max;
      RETURN tytul_gry;
  END;


--funkcja wyswietla najpopularniejsza karte 

FUNCTION najpopularniejsza_karta
  RETURN karta_graficzna.nazwa%TYPE
  IS 
  najpopularniejsza karta_graficzna.nazwa%TYPE;
  ile INTEGER;
  BEGIN
      SELECT MAX(COUNT (*)) INTO ile FROM sprzet INNER JOIN karta_graficzna ON sprzet.karta_graficzna_id = karta_graficzna.id GROUP BY karta_graficzna.nazwa;
      SELECT nazwa INTO najpopularniejsza FROM sprzet INNER JOIN karta_graficzna ON sprzet.karta_graficzna_id = karta_graficzna.id GROUP BY karta_graficzna.nazwa HAVING COUNT(*) = ile;
      RETURN najpopularniejsza;
  END;

END pakiet;



EXECUTE pakiet.ile_czasu_zarejestrowany(2);
EXECUTE pakiet.wszystkie_gry_singleplayer ('singleplayer');
EXECUTE pakiet.wszystkie_gry_singleplayer; --przeciazenie zwraca wszystkie gry bez wzgledu na tryb
EXECUTE pakiet.podwyzka_ceny ('ELEX');
SELECT * FROM gra;
EXECUTE pakiet.ostatnie_zakupy;
  
SELECT pakiet.gra_dnia FROM DUAL ;
SELECT pakiet.ilu_kupilo('ELEX') FROM DUAL;
SELECT pakiet.best_of ('Akcji')  FROM DUAL;
SELECT pakiet.best_of  FROM DUAL; -- przeciazenie - zwraca najlepsza gre w ogole

