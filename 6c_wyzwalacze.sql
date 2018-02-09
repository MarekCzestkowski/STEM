-- sprawdza czy uzytkownik nie chce jednoczesnie kupic gry i filmu oraz czy nie chce kupic niczego

CREATE OR REPLACE TRIGGER sprawdza
BEFORE INSERT OR UPDATE ON dostep_do_materialu
FOR EACH ROW
BEGIN
  IF :new.gra_id IS NULL AND :new.film_id IS NULL THEN   
    RAISE_APPLICATION_ERROR(-20101 ,'zakupiona moze byc tylko gra lub film');
  END IF;
  IF :new.gra_id IS NOT NULL AND :new.film_id IS NOT NULL THEN   
    RAISE_APPLICATION_ERROR(-20101 ,'jednorazowo mozesz zakupic tylko jeden element');
  END IF; 
END;

INSERT INTO dostep_do_materialu VALUES ('','1','1',NULL,NULL);
INSERT INTO dostep_do_materialu VALUES ('','1','1',1,2);


--sprawdza czy uzytkownik nie chce dodac gry do wishlist jesli zostala juz przez niego kupiona
CREATE OR REPLACE TRIGGER nie_mozna_dodac
  BEFORE INSERT OR UPDATE ON wishlist
  FOR EACH ROW
  DECLARE 
    ile INTEGER;
  BEGIN
    SELECT COUNT (*) INTO ile FROM Dostep_do_materialu WHERE Gra_ID = :NEW.Gra_ID AND Uzytkownik_ID = :NEW.Uzytkownik_ID;
    IF ile != 0 THEN
      RAISE_APPLICATION_ERROR(-20101 ,'Ten material zostal juz przez ciebie zakupiony!');
    END IF;
  END;
  
/

SELECT * FROM Dostep_do_materialu 
SELECT * FROM  wishlist
INSERT INTO Wishlist (Uzytkownik_ID, Gra_ID) VALUES (1, 1)