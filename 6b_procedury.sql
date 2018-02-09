--procedura oblicza  ile lat i miesiecy uzytkownik jest juz zarejestrowany w serwisie

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ile_czasu_zarejestrowany(param uzytkownik.id%TYPE)
  IS data UZYTKOWNIK.DATA_REJESTRACJI%TYPE;
  rok INTEGER;
  miesiac INTEGER;
  BEGIN
    SELECT data_rejestracji INTO data FROM uzytkownik WHERE id=param;
    rok := ROUND(MONTHS_BETWEEN(SYSDATE, data)/12,0);
    miesiac := ROUND(MONTHS_BETWEEN(SYSDATE, data), 0) - 12* rok; 
    DBMS_OUTPUT.PUT_LINE(rok || ' lat i ' ||miesiac|| ' miesiecy, ' );
  END;  
/
EXECUTE ile_czasu_zarejestrowany(1);


--procedura wyswietla wszystkie gry obslugujace tryb singleplayer

CREATE OR REPLACE PROCEDURE wszystkie_gry_singleplayer (param tryb.nazwa%TYPE)
  IS 
  BEGIN
    FOR i IN (SELECT tytul FROM  gra INNER JOIN tryb ON tryb.id = gra.tryb_id WHERE tryb.nazwa = param)
    LOOP
      DBMS_OUTPUT.PUT_LINE(i.tytul);
    END LOOP;
  END;  
/
EXECUTE wszystkie_gry_singleplayer('singleplayer');


--procedura zwieksza cene danej gry o 10 procent

CREATE OR REPLACE PROCEDURE podwyzka_ceny (param gra.tytul%TYPE)
  IS 
  BEGIN
    UPDATE gra SET cena = cena+cena*0.1 WHERE tytul = param;
  END;  
/
EXECUTE podwyzka_ceny('ELEX');
select * from gra;


--procedura wyswietla wszystkie zakupy z ostatnich 30 dni

CREATE OR REPLACE PROCEDURE ostatnie_zakupy
  IS 
  BEGIN
    FOR i IN (SELECT * FROM  Rachunek WHERE  SYSDATE - Rachunek.data_zakupu <= 30)
    LOOP
      DBMS_OUTPUT.PUT_LINE('numer rach: ' ||i.nr_rachunku || ' data: ' || i.data_zakupu || ' kwota: ' || i.kwota);
    END LOOP;
  END;  
/

EXECUTE ostatnie_zakupy;

