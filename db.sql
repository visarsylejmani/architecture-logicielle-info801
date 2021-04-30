DROP TABLE IF EXISTS history CASCADE;
DROP TABLE IF EXISTS personne_batiment CASCADE;
DROP TABLE IF EXISTS personne CASCADE;
DROP TABLE IF EXISTS batiment CASCADE;
DROP TABLE IF EXISTS tuples CASCADE;


CREATE TABLE personne (
    id INT NOT NULL AUTO_INCREMENT,
	numero_badge VARCHAR(10) NOT NULL,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	statut VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE batiment (
    id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE personne_batiment (
    id INT NOT NULL AUTO_INCREMENT,
	personne_id INT NOT NULL,
	batiment_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (personne_id) REFERENCES personne (id)
    ON DELETE CASCADE,
    FOREIGN KEY (batiment_id) REFERENCES batiment (id)
    ON DELETE CASCADE
);


CREATE TABLE history(
    id INT NOT NULL AUTO_INCREMENT,
    personne_id INT NOT NULL,
    batiment_id INT NOT NULL,
    date_de_passage timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (personne_id) REFERENCES personne (id)
    ON DELETE CASCADE,
    FOREIGN KEY (batiment_id) REFERENCES batiment (id)
    ON DELETE CASCADE
);

INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5000', 'Jacobson', 'Dayne', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5001', 'Friesen', 'Blaise', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5002', 'Okuneva', 'Dustin', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5003', 'Lowe', 'Quinten', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5004', 'Walker', 'Rudolph', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5005', 'Emmerich', 'Devin', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5006', 'Feest', 'Jaydon', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5007', 'Pouros', 'Price', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5008', 'McLaughlin', 'Cedrick', 'prof');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('5009', 'Bechtelar', 'Sage', 'prof');


INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6000', 'Homenick', 'Stephon', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6001', 'Lind', 'Braulio', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6002', 'Okon', 'Montana', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6003', 'Bartoletti', 'Marc', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6004', 'Beier', 'Stuart', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6005', 'Zieme', 'Bertha', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6006', 'Schuster', 'Heber', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6007', 'Schiller', 'Kayleigh', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6008', 'Ferry', 'Brycen', 'eleve');
INSERT INTO `personne` (`numero_badge`, `nom`, `prenom`, `statut`) VALUES ('6009', 'Bosco', 'Benny', 'eleve');


INSERT INTO `batiment` (`nom` ) VALUES ('amphis');
INSERT INTO `batiment` (`nom` ) VALUES ('bibliotheque');
INSERT INTO `batiment` (`nom` ) VALUES ('labo');
INSERT INTO `batiment` (`nom` ) VALUES ('polymontagne');
INSERT INTO `batiment` (`nom` ) VALUES ('polytech');


INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (1,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (2,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (3,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (4,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (5,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (6,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (7,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (8,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (9,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (10,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (11,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (12,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (13,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (14,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (15,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (16,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (17,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (18,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (19,1);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (20,1);


INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (1,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (2,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (3,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (4,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (5,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (6,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (7,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (8,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (9,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (10,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (11,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (12,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (13,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (14,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (15,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (16,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (17,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (18,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (19,2);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (20,2);


INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (1,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (2,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (3,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (4,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (5,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (6,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (7,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (8,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (9,3);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (10,3);


INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (1,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (2,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (3,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (4,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (5,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (6,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (7,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (8,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES  (9,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (10,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (11,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (12,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (13,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (14,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (15,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (16,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (17,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (18,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (19,4);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (20,4);


INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (11,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (12,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (13,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (14,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (15,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (16,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (17,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (18,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (19,5);
INSERT INTO `personne_batiment` (`personne_id`, `batiment_id` ) VALUES (20,5);
