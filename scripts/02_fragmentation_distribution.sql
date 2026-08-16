
-- Fragment local pour Casablanca
CREATE TABLE Client_1 AS SELECT * FROM Client WHERE Ville='Casablanca';


COPY FROM c##util1/util1@ensias1 TO c##util2/util2@ensias2 -
REPLACE Client_2 -
USING SELECT * FROM Client WHERE Ville='Rabat';


CREATE TABLE Compte_1 AS 
SELECT * FROM Compte WHERE CLIENT_NO IN (SELECT NO FROM Client WHERE Ville='Casablanca');

COPY FROM c##util1/util1@ensias1 TO c##util2/util2@ensias2 -
REPLACE Compte_2 -
USING SELECT * FROM Compte WHERE CLIENT_NO IN (SELECT NO FROM Client WHERE Ville='Rabat');

-- Migration totale des tables de référence vers Serveur 2
COPY FROM c##util1/util1@ensias1 TO c##util2/util2@ensias2 -
REPLACE Type_Compte_2 USING SELECT * FROM Type_Compte;

COPY FROM c##util1/util1@ensias1 TO c##util2/util2@ensias2 -
REPLACE Type_Operation_2 USING SELECT * FROM Type_Operation;