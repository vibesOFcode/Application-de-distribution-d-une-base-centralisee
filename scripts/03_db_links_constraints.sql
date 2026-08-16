-- Database Links 
CREATE DATABASE LINK lien_ensias1_ensias2 
CONNECT TO c##util2 IDENTIFIED BY util2 USING 'ensias2';

CREATE DATABASE LINK lien_ensias2_ensias1 
CONNECT TO c##util1 IDENTIFIED BY util1 USING 'ensias1';

ALTER TABLE Client_2 ADD CONSTRAINT pk_client2_id PRIMARY KEY (no);
ALTER TABLE Compte_2 ADD CONSTRAINT pk_compte2_id PRIMARY KEY (no);
ALTER TABLE Type_Compte_2 ADD CONSTRAINT pk_typecompte2_id PRIMARY KEY (no);