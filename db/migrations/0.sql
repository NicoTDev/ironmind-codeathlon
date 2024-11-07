-- Ceci est un test de migration SQL
-- Les migrations sont exécutées en ordre alphabétique sur les fichiers du répertoire db/migrations


--Creer une table de sexe
CREATE OR REPLACE TABLE sexes(
    sexId PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL DEFAULT ''
);


--creer la table des programmes avec une valeur d'id serial
CREATE OR REPLACE TABLE programmes(
    programId SERIAL PRIMARY KEY AUTO_INCREMENT,
    name varchar(10) NOT NULL DEFAULT ''
);

--Creer la table centrale person pour stocker chaque utilisateur
CREATE OR REPLACE TABLE utilisateurs (
    personId SERIAL PRIMARY KEY AUTO_INCREMENT,
    lastName VARCHAR(255) NOT NULL,
    sexId VARCHAR(255) NOT NULL,
    progId VARCHAR(10) NOT NULL
    
 
) ENGINE = InnoDB;
--creer la tables des sieges avec une valeur d'id serial
CREATE OR REPLACE TABLE sieges(
    siegeId SERIAL PRIMARY KEY AUTO_INCREMENT,
    numero INT CHECK (numero >= 0),
    section char NOT NULL,
    prix numeric(10, 2) CHECK (numero >= 0)
);

--Creer la table des evenements a venir
CREATE OR REPLACE TABLE evenements(
    evenementId SERIAL PRIMARY KEY AUTO_INCREMENT,
    evenementNom VARCHAR(255) NOT NULL,
    evenementDescription TEXT NOT NULL
);

--crer la tables des reservations des sieges
CREATE OR REPLACE TABLE reservations(
    reservationsId SERIAL PRIMARY KEY AUTO_INCREMENT,
    siegeID int,
    evenementId int
);

--Populer la base de données des sexes (mettre un loop si on a le temps)
INSERT INTO sexes(sexId) VALUES
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('FEMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME'),
('HOMME');


--Populer la base de données des programmes (mettre un loop si on a le temps)
INSERT INTO programmes(programId)
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('GLO'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IFT'),
('IIG'),
('IIG'),
('IIG');

--Populer la base de donnees des sieges (mettre une loop si on a le temps pour en mettre plus)
INSERT INTO sieges(numero, section, prix) VALUES
((1, 'A', 25.00),
(2, 'A', 25.00),
(3, 'A', 25.00),
(4, 'A', 25.00),
(5, 'A', 25.00),
(6, 'A', 25.00),
(7, 'A', 25.00),
(1, 'B', 35.00),
(2, 'B', 35.00),
(3, 'B', 35.00),
(4, 'B', 35.00),
(5, 'B', 35.00),
(6, 'B', 35.00),
(7, 'B', 35.00),
(1, 'C', 55.00),
(2, 'C', 55.00),
(3, 'C', 55.00),
(4, 'C', 55.00),
(5, 'C', 55.00),
(6, 'C', 55.00),
(7, 'C', 55.00),
(1, 'D', 12.00),
(2, 'D', 12.00),
(3, 'D', 12.00),
(4, 'D', 12.00),
(5, 'D', 12.00),
(6, 'D', 12.00),
(7, 'D', 12.00);
(8, 'D', 12.00),
(9, 'D', 12.00),
(10, 'D', 12.00),
(11, 'D', 12.00),
(12, 'D', 12.00));



/*Creer le trigger qui va appliquer un rabais lorsque 20 billets sont achetes (a reverifier) (En gros je regarde chaque nouvelle entree de reservations
 et si jamais c'est un nombre divisible par 20, j'applique le rabais.

CREATE TRIGGER appliquerRabaisApres20Sieges
AFTER
INSERT ON reservations
FOR EACH ROW 
UPDATE sieges SET (CASE WHEN COUNT(SELECT * FROM reservations) % 20 = 0 THEN sieges.prix = sieges.prix*(1-(RAND()*(0.1)-0.05) ELSE sieges.prix = sieges.prix));
END;

--crer la procedure pour creer des sieges (je suis pas sur que je l'ai créé de la bonne manière)
CREATE PROCEDURE creerSiege(numero INT, section char, prix numeric)
BEGIN
    INSERT INTO sieges (numero, section, prix)
    (numero, section, prix);
END;


*/