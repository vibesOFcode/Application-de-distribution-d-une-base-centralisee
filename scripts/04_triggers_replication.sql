-- 1. Trigger d'intégrité référentielle répartie 
CREATE OR REPLACE TRIGGER trig_fk_compte2_agence
BEFORE INSERT OR UPDATE OF agence_no ON Compte_2
FOR EACH ROW
DECLARE
    X number := 0;
BEGIN
    SELECT COUNT(*) INTO X FROM Agence@lien_ensias2_ensias1 
    WHERE no = :NEW.agence_no;
    
    IF X = 0 THEN 
        RAISE_APPLICATION_ERROR(-20001, 'Erreur: agence inconnue sur le site distant');
    END IF;
END;
/

-- 2. Trigger de réplication synchrone (Table Appareil)
CREATE OR REPLACE TRIGGER Trig_MAJ
AFTER INSERT OR UPDATE OR DELETE ON Appareil
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO Appareil_2@lien_ensias1_ensias2 
        VALUES (:NEW.no_appareil, :NEW.designation, :NEW.prix, :NEW.caracteristiques_techniques);
    ELSIF UPDATING THEN
        UPDATE Appareil_2@lien_ensias1_ensias2 
        SET designation = :NEW.designation, prix = :NEW.prix, caracteristiques_techniques = :NEW.caracteristiques_techniques
        WHERE no_appareil = :OLD.no_appareil;
    ELSIF DELETING THEN
        DELETE FROM Appareil_2@lien_ensias1_ensias2 WHERE no_appareil = :OLD.no_appareil;
    END IF;
END;
/