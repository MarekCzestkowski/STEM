--funkcja losuje gre jako gre dnia

CREATE OR REPLACE FUNCTION gra_dnia
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

/
SELECT gra_dnia FROM DUAL;

/
-- funkcja sprawdza ilu uzytkownikow kupilo dany tytul
CREATE OR REPLACE FUNCTION ilu_kupilo(dany_tytul VARCHAR)
  RETURN INTEGER
  IS ile INTEGER;r
  BEGIN
    SELECT COUNT (*) INTO ile FROM gra WHERE tytul=dany_tytul;
      RETURN ile;
  END;

SELECT ilu_kupilo('ELEX') FROM DUAL;

/

-- funkcja zwraca najlepsza gre z danego gatunku
CREATE OR REPLACE FUNCTION best_of (dany_typ VARCHAR)
  RETURN gra.tytul%TYPE
  IS max gra.ocena%TYPE;
  tytul_gry gra.tytul%TYPE;
  BEGIN
    SELECT max(ocena) INTO max FROM gra INNER JOIN typ_gry ON typ_gry.id = gra.typ_gry_id WHERE typ_gry.nazwa = dany_typ;
    SELECT tytul INTO tytul_gry FROM gra INNER JOIN typ_gry ON typ_gry.id = gra.typ_gry_id WHERE ocena= max AND typ_gry.nazwa = dany_typ;
      RETURN tytul_gry;
  END;
/
SELECT best_of('Akcji') FROM DUAL;


--funkcja wyswietla najpopularniejsza karte 

CREATE OR REPLACE FUNCTION najpopularniejsza_karta
  RETURN karta_graficzna.nazwa%TYPE
  IS 
  najpopularniejsza karta_graficzna.nazwa%TYPE;
  ile INTEGER;
  BEGIN
      SELECT MAX(COUNT (*)) INTO ile FROM sprzet INNER JOIN karta_graficzna ON sprzet.karta_graficzna_id = karta_graficzna.id GROUP BY karta_graficzna.nazwa;
      SELECT nazwa INTO najpopularniejsza FROM sprzet INNER JOIN karta_graficzna ON sprzet.karta_graficzna_id = karta_graficzna.id GROUP BY karta_graficzna.nazwa HAVING COUNT(*) = ile;
      RETURN najpopularniejsza;
  END;
/
SELECT najpopularniejsza_karta FROM DUAL;