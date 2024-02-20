CREATE DATABASE Little_Booking;
USE Little_Booking;

CREATE TABLE Regles_habitation(
    REGLE_id integer PRIMARY KEY NOT NULL,
    REGLE_fumeur boolean,
    REGLE_animaux boolean,
    REGLE_enfants boolean,
    REGLE_fete boolean
);

CREATE TABLE Langue_habitation(
    LANGUE_id integer PRIMARY KEY NOT NULL,
    LANGUE_francais boolean,
    LANGUE_anglais boolean,
    LANGUE_allemand boolean,
    LANGUE_espagnole boolean,
    LANGUE_russe boolean,
    LANGUE_coreen boolean,
    LANGUE_chinois boolean,
    LANGUE_japonais boolean
);

CREATE TABLE Caracteristique_habitation(
    CARA_HAB_id integer PRIMARY KEY NOT NULL,
    CARA_HAB_climatisation boolean,
    CARA_HAB_chauffage boolean,
    CARA_HAB_coWifi_gratuit boolean,
    CARA_HAB_reception24sur24 boolean,
    CARA_HAB_bar boolean,
    CARA_HAB_piscine boolean,
    CARA_HAB_sauna boolean,
    CARA_HAB_jacuzzi boolean,
    CARA_HAB_balcon boolean,
    CARA_HAB_tele boolean,
    CARA_HAB_lave_linge boolean,
    CARA_HAB_parking_gratuit boolean
);

CREATE TABLE Habitation(
    HAB_id integer PRIMARY KEY NOT NULL,
    HAB_Superficie integer,
    HAB_Petit_dejeuner boolean,
    HAB_Horaire_ouverture varchar(10),
    HAB_Horaire_fermeture varchar(10),
    HAB_Regle integer,
    HAB_Caractéristique integer,
    HAB_Langue integer,
    HAB_Piece integer,
    HAB_Proprio integer,
    HAB_InfoSuppURL varchar(200)
);

CREATE TABLE Piece(
    PIECE_id integer PRIMARY KEY NOT NULL,
    PIECE_Chambre integer,
    PIECE_Salle_de_bain integer,
    PIECE_Cuisine integer
);

CREATE TABLE Salle_de_bain(
    SDB_id integer PRIMARY KEY NOT NULL,
    SDB_nombre integer,
    SDB_beignoir boolean,
    SDB_douche boolean
);

CREATE TABLE Cuisine(
    CUISINE_id integer PRIMARY KEY NOT NULL,
    CUISINE_nombre integer,
    CUISINE_ustensiles_de_cuisine boolean,
    CUISINE_grille_pain boolean,
    CUISINE_lave_vaiselle boolean,
    CUISINE_micro_ondes boolean,
    CUISINE_frigo boolean,
    CUISINE_bouilloir boolean,
    CUISINE_plaque_de_cuisson boolean,
    CUISINE_gaziniere boolean,
    CUISINE_four_electrique boolean,
    CUISINE_four_a_gaz boolean
);

CREATE TABLE Couchage(
    COUCHAGE_id integer PRIMARY KEY NOT NULL,
    COUCHAGE_salon boolean,
    COUCHAGE_lit_nb integer,
    COUCHAGE_taille_lit integer
);

CREATE TABLE Hotel(
    HOTEL_id integer PRIMARY KEY NOT NULL,
    HOTEL_Nom varchar(50),
    HOTEL_Localisation integer,
    HOTEL_NoteSur10 integer,
    HOTEL_Habitation integer
);

CREATE TABLE Appartement_Maison(
    AM_id integer PRIMARY KEY NOT NULL,
    AM_nom varchar(50),
    AM_Localisation integer,
    AM_NoteSur10 integer,
    AM_Habitation integer
);

CREATE TABLE Appartement_Hotel(
    AH_id integer PRIMARY KEY NOT NULL,
    AH_nom varchar(50),
    AH_Localisation integer,
    AM_NoteSur10 integer,
    AH_Habitation integer
);

CREATE TABLE Localisation(
    LOC_id integer PRIMARY KEY NOT NULL,
    LOC_Pays varchar(50),
    LOC_CodePostal  varchar(50),
    LOC_Ville varchar(50),
    LOC_Rue varchar(50),
    LOC_Numéro integer,
    LOC_AutrePrecision varchar(100) 
);

CREATE TABLE Compte(
    COMPTE_id integer PRIMARY KEY NOT NULL,
    COMPTE_Nom varchar(50),
    COMPTE_Prenom varchar(50),
    COMPTE_sexe varchar(50),
    COMPTE_DateDeNaissance date,
    COMPTE_LangueNatal varchar(50),
    COMPTE_NumTel integer,
    COMPTE_AdresseMail varchar(100),
    COMPTE_MotDePasse varchar(50)
);

CREATE TABLE Hebergeur(
    HEB_id integer PRIMARY KEY NOT NULL,
    HEB_Compte integer 
);

CREATE TABLE Client(
    CLIENT_id integer PRIMARY KEY NOT NULL,
    CLIENT_compte integer,
    CLIENT_paiement integer
);

CREATE TABLE Paiement(
    PAIEMENT_id integer PRIMARY KEY NOT NULL,
    PAIEMENT_Detenteur integer,
    PAIEMENT_NumCarte integer,
    PAIEMENT_DateExpiration date,
    PAIEMENT_cryptograme integer
);

CREATE TABLE Avion(
    AVION_id integer PRIMARY KEY NOT NULL,
    AVION_Modele varchar(50),
    AVION_NbSiegeEconomique integer,
    AVION_NbSiegeEconomiquePremium integer,
    AVION_NbSiegeAffaire integer,
    AVION_NbSiegePremiereClasse integer,
    AVION_Longueur integer,
    AVION_Envergure integer,
    AVION_Hauteur integer,
    AVION_VitesseDeCroisiereEnKmH integer,
    AVION_Societe varchar(50)
);

CREATE TABLE Vol(
    VOL_id integer PRIMARY KEY NOT NULL,
    VOL_Avion integer,
    VOL_NbEscale integer,
    VOL_HeureDepart date,
    VOL_HeureAriver date,
    VOL_AeroportDepart varchar(50),
    VOL_AeroportArriver varchar(50),
    VOL_PrixBagageSoute integer,
    VOL_PrixBagageMain integer,
    VOL_PrixEconomique integer,
    VOL_PrixEconomiquePremium integer,
    VOL_PrixAffaire integer,
    VOL_PrixPremiereClasse integer
);

CREATE TABLE ReservationVol(
    RESERVVLO_id integer PRIMARY KEY NOT NULL,
    RESERVVLO_Client integer,
    RESERVVLO_Vol integer,
    RESERVVLO_VolRetour integer,
    RESERVVLO_Classe varchar(50),
    RESERVVLO_NbEnfant integer,
    RESERVVLO_NbAdulte integer,
    RESERVVLO_NbAnimaux integer,
    RESERVVLO_TypeVol varchar(50),
    RESERVVLO_DateArriver date,
    RESERVVLO_DateDepart date,
    RESERVVLO_PrixTotal integer
);

CREATE TABLE ReservationHabitation(
    RESERVHAB_id integer PRIMARY KEY NOT NULL,
    RESERVHAB_Client integer,
    RESERVHAB_DateArriver date,
    RESERVHAB_DateDepart date,
    RESERVHAB_NbAdulte integer,
    RESERVHAB_NbEnfant integer,
    RESERVHAB_NbAnimaux integer,
    RESERVHAB_Habitation integer,
    RESERVHAB_Prix integer
);

CREATE TABLE Prix(
    PRIX_id integer PRIMARY KEY NOT NULL,
    PRIX_PrixDeQuoi varchar(100),
    PRIX_Prix integer
);


ALTER TABLE Habitation ADD(
    CONSTRAINT RegleInHab FOREIGN KEY(HAB_Regle) REFERENCES Regles_habitation(REGLE_id),
    CONSTRAINT CarcInHab FOREIGN KEY(HAB_Caractéristique) REFERENCES Caracteristique_habitation(CARA_HAB_id),
    CONSTRAINT LangueInHab FOREIGN KEY(HAB_Langue) REFERENCES Langue_habitation(LANGUE_id),
    CONSTRAINT PieceInHab FOREIGN KEY(HAB_Piece) REFERENCES Piece(PIECE_id),
    CONSTRAINT ProprioInHab FOREIGN KEY(HAB_Proprio) REFERENCES Hebergeur(HEB_id)
);

ALTER TABLE Piece ADD(
    CONSTRAINT ChambreInPiece FOREIGN KEY(PIECE_Chambre) REFERENCES Couchage(COUCHAGE_id),
    CONSTRAINT SDBInPiece FOREIGN KEY(PIECE_Salle_de_bain) REFERENCES Salle_de_bain(SDB_id),
    CONSTRAINT CuisineInPiece FOREIGN KEY(PIECE_Cuisine) REFERENCES Cuisine(CUISINE_id)
);

ALTER TABLE Hotel ADD(
    CONSTRAINT LocInHotel FOREIGN KEY(HOTEL_Localisation) REFERENCES Localisation(LOC_id),
    CONSTRAINT HabInHotel FOREIGN KEY(HOTEL_Habitation) REFERENCES Habitation(HAB_id)
);

ALTER TABLE Appartement_Maison ADD(
    CONSTRAINT LocInAM FOREIGN KEY(AM_Localisation) REFERENCES Localisation(LOC_id),
    CONSTRAINT HabInAM FOREIGN KEY(AM_Habitation) REFERENCES Habitation(HAB_id)
);

ALTER TABLE Appartement_Hotel ADD(
    CONSTRAINT LocInAH FOREIGN KEY(AH_Localisation) REFERENCES Localisation(LOC_id),
    CONSTRAINT HabInAH FOREIGN KEY(AH_Habitation) REFERENCES Habitation(HAB_id)
);

ALTER TABLE Hebergeur ADD(
    CONSTRAINT CompteInHEB FOREIGN KEY(HEB_Compte) REFERENCES Compte(COMPTE_id)
);

ALTER TABLE Client ADD(
    CONSTRAINT CompteInClient FOREIGN KEY(CLIENT_compte) REFERENCES Compte(COMPTE_id),
    CONSTRAINT PaiementInClient FOREIGN KEY(CLIENT_paiement) REFERENCES Paiement(PAIMENT_id)   
);

ALTER TABLE Paiement ADD(
    CONSTRAINT DetenteurInPaiement FOREIGN KEY(PAIEMENT_Detenteur) REFERENCES Compte(COMPTE_id)
);

ALTER TABLE Vol ADD(
    CONSTRAINT AvionInVol FOREIGN KEY(VOL_Avion) REFERENCES Avion(AVION_id)
);

ALTER TABLE ReservationVol ADD(
    CONSTRAINT ClientInResrvVol FOREIGN KEY(RESERVVLO_Client) REFERENCES Client(CLIENT_id),
    CONSTRAINT VolInResrvVol FOREIGN KEY(RESERVVLO_Vol) REFERENCES Vol(VOL_id),
    CONSTRAINT VolRetourInResrvVol FOREIGN KEY(RESERVVLO_VolRetour) REFERENCES Vol(VOL_id),
    CONSTRAINT PrixInResrvVol FOREIGN KEY(RESERVVLO_PrixTotal) REFERENCES Prix(PRIX_id)
);

ALTER TABLE ReservationHabitation ADD(
    CONSTRAINT HabInResrvHab FOREIGN KEY(RESERVHAB_Habitation) REFERENCES Habitation(HAB_id),
    CONSTRAINT PrixInResrvHab FOREIGN KEY(RESERVHAB_Prix) REFERENCES Prix(PRIX_id)
);








INSERT INTO Avion (AVION_id, AVION_Modelle, AVION_NbSiegeEconomique, AVION_NbSiegeEconomiquePremium, AVION_NbSiegeAffaire, AVION_NbSiegePremiereClasse, AVION_Longueur, AVION_Envergure, AVION_Heuteur, AVION_VitesseDeCroisiereEnKmH, AVION_Societe) VALUES
(1, "Airbus A220-300", 140, 0, 15, 0, 38, 35, 11, 836,  "AirFrance"),
(2, "Airbus A220-300", 140, 0, 15, 0, 38, 35, 11, 836,  "AirFrance");




-- Ajout des 9 pays
INSERT INTO Localisation (LOC_id, LOC_Pays, LOC_CodePostal, LOC_Ville, LOC_Rue, LOC_Numéro, LOC_AutrePrecision)
VALUES
-- France (7 localisations)
(1, 'France', '75001', 'Paris', 'Rue de la Paix', 123, 'Près de la Tour Eiffel'),
(2, 'France', '13001', 'Marseille', 'Cours Julien', 456, 'Proche du Vieux-Port'),
(3, 'France', '69001', 'Lyon', 'Rue Mercière', 789, 'Au cœur de la Presqu île'),
(4, 'France', '31000', 'Toulouse', 'Place du Capitole', 101, 'En plein centre-ville'),
(5, 'France', '44000', 'Nantes', 'Île de Nantes', 221, 'Vue sur la Loire'),
(6, 'France', '59000', 'Lille', 'Grand Place', 3, 'Au centre du Vieux Lille'),
(7, 'France', '33000', 'Bordeaux', 'Place de la Bourse', 505, 'Près du miroir d eau'),

-- Italie (7 localisations)
(8, 'Italie', '00100', 'Rome', 'Via del Corso', 123, 'Près du Colisée'),
(9, 'Italie', '20121', 'Milan', 'Corso Como', 456, 'Près de Brera'),
(10, 'Italie', '80100', 'Naples', 'Spaccanapoli', 789, 'Dans le centre historique'),
(11, 'Italie', '50123', 'Florence', 'Piazza della Signoria', 101, 'A proximité du Ponte Vecchio'),
(12, 'Italie', '10121', 'Turin', 'Piazza Castello', 221, 'A proximité du Palais Royal'),
(13, 'Italie', '34121', 'Trieste', 'Piazza Unità d Italia', 3, 'Près de la mer'),
(14, 'Italie', '71100', 'Foggia', 'Viale XXIV Maggio', 505, 'A côté de la gare'),

-- Espagne (7 localisations)
(15, 'Espagne', '28001', 'Madrid', 'Calle Gran Vía', 123, 'Près du musée du Prado'),
(16, 'Espagne', '08001', 'Barcelona', 'Las Ramblas', 456, 'Près de la Sagrada Familia'),
(17, 'Espagne', '41001', 'Seville', 'Calle Sierpes', 78, 'Dans le quartier de Santa Cruz'),
(18, 'Espagne', '46001', 'Valencia', 'Plaza de la Reina', 101, 'Dans le centre historique'),
(19, 'Espagne', '03001', 'Alicante', 'Explanada de España', 221, 'Près du port'),
(20, 'Espagne', '15001', 'La Coruña', 'Plaza de María Pita', 3, 'Dans la vieille ville'),
(21, 'Espagne', '29001', 'Malaga', 'Calle Larios', 505, 'Près de l Alcazaba'),

-- Allemagne (7 localisations)
(22, 'Allemagne', '10115', 'Berlin', 'Unter den Linden', 123, 'Près de la porte de Brandebourg'),
(23, 'Allemagne', '60313', 'Frankfurt', 'Römerberg', 456, 'Dans le centre historique'),
(24, 'Allemagne', '01067', 'Dresden', 'Frauenkirche', 789, 'Dans la vieille ville'),
(25, 'Allemagne', '40474', 'Düsseldorf', 'Königsallee', 101, 'Près de la vieille ville'),
(26, 'Allemagne', '20095', 'Hamburg', 'Jungfernstieg', 221, 'Sur l Alster intérieur'),
(27, 'Allemagne', '81667', 'Munich', 'Marienplatz', 3, 'En plein cœur de la ville'),
(28, 'Allemagne', '53113', 'Bonn', 'Münsterplatz', 505, 'Près de la Maison Beethoven'),

-- Corée du Sud (7 localisations)
(29, 'Corée du Sud', '06592', 'Seoul', 'Gangnam-gu', 123, 'Près de la gare de Gangnam'),
(30, 'Corée du Sud', '04527', 'Seoul', 'Mapo-gu', 456, 'Dans le quartier de Hongdae'),
(31, 'Corée du Sud','100-011', 'Seoul', 'Jung-gu', 789, 'Près de Myeongdong'),
(32, 'Corée du Sud','142-090', 'Incheon', 'Yeonsu-gu', 101, 'Près de l aéroport international d Incheon'),
(33, 'Corée du Sud', '502-210', 'Busan', 'Haeundae-gu', 221, 'Près de la plage de Haeundae'),
(34, 'Corée du Sud', '421-200', 'Ulsan', 'Nam-gu', 3, 'Près du Grand Parc d Ulsan'),
(35, 'Corée du Sud', '63127', 'Gwangju', 'Dong-gu', 505, 'Dans le quartier culturel'),

-- Suisse (7 localisations)
(36, 'Suisse', '8001', 'Zurich', 'Bahnhofstrasse', 123, 'Près du lac de Zurich'),
(37, 'Suisse', '1204', 'Geneva', 'Jet d`Eau', 456, 'Près du lac Léman'),
(38, 'Suisse', '6003', 'Lucerne', 'Chapel Bridge', 789, 'Dans la vieille ville'),
(39, 'Suisse', '4051', 'Basel', 'Münsterplatz', 101, 'Près de la cathédrale de Bâle'),
(40, 'Suisse', '3000', 'Bern', 'Zytglogge', 221, 'Dans la vieille ville'),
(41, 'Suisse', '7000', 'Chur', 'Obere Gasse', 3, 'Dans la vieille ville'),
(42, 'Suisse', '2000', 'Neuchâtel', 'Place Pury', 505, 'Près du Château de Neuchâtel'),

-- Russie (6 localisations)
(43, 'Russie', '101000', 'Moscow', 'Red Square', 123, 'Près du Kremlin'),
(44, 'Russie', '190000', 'Saint Petersburg', 'Palace Square', 456, 'Près du Palais d Hiver'),
(45, 'Russie', '630099', 'Novosibirsk', 'Lenin Square', 789, 'Dans le centre ville'),
(46, 'Russie', '300057', 'Tver', 'Sovetskaya Street', 101, 'Près de la Volga'),
(47, 'Russie', '620075', 'Yekaterinburg', 'Vaynera Street', 221, 'Dans le centre ville'),
(48, 'Russie', '350000', 'Krasnodar', 'Krasnaya Street', 3, 'Dans le quartier historique'),


-- Vietnam (6 localisations)
(49, 'Vietnam', '10000', 'Hanoi', 'Hoan Kiem Lake', 123, 'Dans le vieux quartier'),
(50, 'Vietnam', '70000', 'Ho Chi Minh City', 'Ben Thanh Market', 456, 'Dans le centre ville'),
(51, 'Vietnam', '20000', 'Da Nang', 'My Khe Beach', 789, 'Près des montagnes de marbre'),
(52, 'Vietnam', '50000', 'Nha Trang', 'Tran Phu Street', 101, 'Près de la plage de Nha Trang'),
(53, 'Vietnam', '550000', 'Vung Tau', 'Back Beach', 221, 'Près de la statue du Christ Roi'),
(54, 'Vietnam', '23000', 'Hue', 'Truong Tien Bridge', 3, 'Dans le quartier historique'),


-- Japon (6 localisations)
(55, 'Japon', '100-0005', 'Tokyo', 'Chiyoda', 123, 'Près de la Tour de Tokyo'),
(56, 'Japon', '150-0042', 'Shinagawa', 'Gotenyama', 456, 'Dans le quartier des affaires'),
(57, 'Japon', '630-8301', 'Nara', 'Noborioji Street', 789, 'Près du parc de Nara'),
(58, 'Japon', '460-0008', 'Nagoya', 'Sakae', 101, 'Dans le quartier commerçant'),
(59, 'Japon', '530-0002', 'Osaka', 'Umeda', 221, 'Près de la gare d Osaka'),
(60, 'Japon', '150-6017', 'Kawasaki', 'Kawasaki-ku', 3, 'Près de Kawasaki Daishi'),


-- Remplissage de la table Compte
INSERT INTO Compte (COMPTE_id, COMPTE_Nom, COMPTE_Prenom, COMPTE_sexe, COMPTE_DateDeNaissance, COMPTE_LangueNatal, COMPTE_NumTel, COMPTE_AdresseMail, COMPTE_MotDePasse)
VALUES
(1, 'Dupont', 'Jean', 'M', '1980-05-15', 'français', 123456789, 'jean.dupont@gmail.com', 'motdepasse123'),
(2, 'Smith', 'Emma', 'F', '1985-08-20', 'anglais', 987654321, 'emma.smith@yahoo.com', 'password456'),
(3, 'García', 'Miguel', 'M', '1982-03-10', 'espagnol', 654321987, 'miguel.garcia@hotmail.com', 'contraseña789'),
(4, 'Müller', 'Anna', 'F', '1988-11-25', 'allemand', 789123456, 'anna.muller@gmail.com', 'passwort101'),
(5, 'Jones', 'Michael', 'M', '1984-07-18', 'anglais', 567890123, 'michael.jones@yahoo.com', 'password789'),
(6, 'Martinez', 'Jose', 'M', '1982-07-12', 'espagnol', 567890123, 'jose.martinez@yahoo.com', 'contraseña456'),
(7, 'López', 'Sofía', 'F', '1983-09-02', 'espagnol', 345678901, 'sofia.lopez@gmail.com', 'contraseña456'),
(8, 'Wang', 'Yun', 'F', '1987-12-15', 'chinois', 456789012, 'yun.wang@yahoo.com', 'mima456'),
(9, 'Ferrari', 'Giuseppe', 'M', '1982-04-20', 'italien', 890123456, 'giuseppe.ferrari@gmail.com', 'password789'),
(10, 'Bauer', 'Hans', 'M', '1986-11-10', 'allemand', 901234567, 'hans.bauer@yahoo.com', 'passwort789'),
(11, 'Jones', 'Michael', 'M', '1984-07-18', 'anglais', 567890123, 'michael.jones@yahoo.com', 'password789'),
(12, 'Dubois', 'Sophie', 'F', '1986-02-12', 'français', 234567890, 'sophie.dubois@hotmail.com', 'motdepasse456'),
(13, 'López', 'Sofía', 'F', '1983-09-02', 'espagnol', 345678901, 'sofia.lopez@gmail.com', 'contraseña456'),
(14, 'Wang', 'Yun', 'F', '1987-12-15', 'chinois', 456789012, 'yun.wang@yahoo.com', 'mima456'),
(15, 'Nguyen', 'Quang', 'M', '1975-09-08', 'vietnamien', 456789012, 'quang.nguyen@hotmail.com', 'matkhau789'),
(16, 'Tanaka', 'Yuki', 'F', '1990-01-30', 'japonais', 321654987, 'yuki.tanaka@gmail.com', 'password789'),
(17, 'Lisboa', 'Fernanda', 'F', '1983-07-22', 'portugais', 678901234, 'fernanda.lisboa@yahoo.com', 'senha789'),
(18, 'Chen', 'Mei', 'F', '1980-01-12', 'chinois', 789012345, 'mei.chen@hotmail.com', 'mima123'),
(19, 'Fernández', 'Carlos', 'M', '1978-03-30', 'espagnol', 890123456, 'carlos.fernandez@gmail.com', 'contraseña123'),
(20, 'Yamamoto', 'Akiko', 'F', '1986-07-11', 'japonais', 901234567, 'akiko.yamamoto@yahoo.com', 'password456'),
(21, 'Silva', 'Pedro', 'M', '1982-10-25', 'portugais', 345678901, 'pedro.silva@hotmail.com', 'senha456'),
(22, 'Zhao', 'Wei', 'F', '1985-04-15', 'chinois', 456789012, 'wei.zhao@gmail.com', 'mima789'),
(23, 'Ivanova', 'Olga', 'F', '1976-09-08', 'russe', 567890123, 'olga.ivanova@yahoo.com', 'parol123'),
(24, 'Trinh', 'Tuan', 'M', '1989-01-30', 'vietnamien', 678901234, 'tuan.trinh@hotmail.com', 'matkhau123'),
(25, 'Yoshida', 'Haruto', 'M', '1983-11-20', 'japonais', 789012345, 'haruto.yoshida@gmail.com', 'password123'),
(26, 'Ribeiro', 'Ana', 'F', '1987-06-18', 'portugais', 890123456, 'ana.ribeiro@yahoo.com', 'senha123'),
(27, 'Chung', 'Haeun', 'F', '1984-02-05', 'coréen', 901234567, 'haeun.chung@gmail.com', 'password123'),
(28, 'Park', 'Minho', 'M', '1980-12-15', 'coréen', 123456789, 'minho.park@hotmail.com', 'motdepasse123'),
(29, 'Chung', 'Haeun', 'F', '1984-02-05', 'coréen', 901234567, 'haeun.chung@gmail.com', 'password123'),
(30, 'Park', 'Minho', 'M', '1980-12-15', 'coréen', 123456789, 'minho.park@hotmail.com', 'motdepasse123'),
(31, 'Kim', 'Jiyoung', 'F', '1986-10-20', 'coréen', 234567890, 'jiyoung.kim@yahoo.com', 'mima456'),
(32, 'Gomez', 'Luis', 'M', '1982-07-12', 'espagnol', 345678901, 'luis.gomez@gmail.com', 'contraseña456'),
(33, 'Chen', 'Wei', 'M', '1985-04-15', 'chinois', 456789012, 'wei.chen@yahoo.com', 'mima456'),
(34, 'Santos', 'Isabel', 'F', '1988-09-25', 'portugais', 567890123, 'isabel.santos@hotmail.com', 'senha456'),
(35, 'Nguyen', 'Duc', 'M', '1976-03-30', 'vietnamien', 678901234, 'duc.nguyen@gmail.com', 'matkhau456'),
(36, 'Matsumoto', 'Yuki', 'F', '1989-01-15', 'japonais', 789012345, 'yuki.matsumoto@yahoo.com', 'password456'),
(37, 'Müller', 'Thomas', 'M', '1984-11-28', 'allemand', 890123456, 'thomas.muller@gmail.com', 'passwort456'),
(38, 'Ramos', 'Ana', 'F', '1986-05-12', 'espagnol', 901234567, 'ana.ramos@yahoo.com', 'contraseña789'),
(39, 'Wu', 'Li', 'F', '1982-08-20', 'chinois', 123456789, 'li.wu@gmail.com', 'mima789'),
(40, 'Chen', 'Xiu', 'F', '1988-07-12', 'chinois', 678901234, 'xiu.chen@gmail.com', 'mima789'),
(41, 'Le', 'Thi', 'F', '1987-02-05', 'vietnamien', 345678901, 'thi.le@gmail.com', 'matkhau789'),
(42, 'Hernández', 'David', 'M', '1980-12-15', 'espagnol', 456789012, 'david.hernandez@yahoo.com', 'contraseña789'),
(43, 'Sun', 'Wei', 'F', '1985-06-22', 'chinois', 567890123, 'wei.sun@hotmail.com', 'mima123'),
(44, 'Abe', 'Haruka', 'F', '1982-08-20', 'japonais', 234567890, 'haruka.abe@yahoo.com', 'password789'),
(45, 'Tran', 'Lan', 'F', '1989-01-30', 'vietnamien', 789012345, 'lan.tran@yahoo.com', 'matkhau123'),
(46, 'Oliveira', 'Rafael', 'M', '1983-11-20', 'portugais', 890123456, 'rafael.oliveira@hotmail.com', 'senha123'),
(47, 'Li', 'Xiaoyun', 'F', '1987-06-18', 'chinois', 901234567, 'xiaoyun.li@yahoo.com', 'mima123'),
(48, 'Smirnov', 'Ivan', 'M', '1984-02-05', 'russe', 123456789, 'ivan.smirnov@gmail.com', 'parol123'),
(49, 'Ng', 'Linh', 'F', '1980-12-15', 'vietnamien', 234567890, 'linh.ng@yahoo.com', 'matkhau123'),
(50, 'Silva', 'Carlos', 'M', '1985-06-22', 'espagnol', 345678901, 'carlos.silva@hotmail.com', 'senha123'),
  (51, 'Li', 'Yan', 'F', '1988-09-25', 'japonais', 456789012, 'yan.li@gmail.com', 'mima456'),
(52, 'Durant', 'Jeremy', 'F', '1986-02-12', 'français', 234567890, 'jeremy.duran@hotmail.com', 'depasse456'),
(53, 'Wang', 'Lei', 'M', '1985-04-15', 'coreen', 678901234, 'lei.wang@hotmail.com', 'mima456'),
(54, 'Santos', 'Maria', 'F', '1989-01-15', 'espagnol', 789012345, 'maria.santos@yahoo.com', 'senha456'),
(55, 'Nguyen', 'Minh', 'M', '1976-03-30', 'vietnamien', 890123456, 'minh.nguyen@gmail.com', 'matkhau456'),
(56, 'Matsumoto', 'Takashi', 'M', '1986-05-12', 'japonais', 901234567, 'takashi.matsumoto@yahoo.com', 'password456'),
(57, 'Müller', 'Sophie', 'F', '1982-08-20', 'allemand', 123456789, 'sophie.muller@gmail.com', 'passwort456'),
(58, 'Ramos', 'Juan', 'M', '1978-06-18', 'espagnol', 234567890, 'juan.ramos@yahoo.com', 'contraseña789'),
(59, 'Wu', 'Hui', 'F', '1987-02-05', 'coreen', 345678901, 'hui.wu@gmail.com', 'mima789'),
(60, 'Kuznetsova', 'Olga', 'F', '1980-12-15', 'russe', 456789012, 'olga.kuznetsova@hotmail.com', 'parol789'),
(61, 'Silva', 'Ricardo', 'M', '1983-09-25', 'portugais', 567890123, 'ricardo.silva@yahoo.com', 'senha789'),
(62, 'Kuznetsov', 'Alexei', 'M', '1978-06-18', 'russe', 234567890, 'alexei.kuznetsov@hotmail.com', 'parol789'),
(63, 'Takahashi', 'Yuki', 'F', '1985-04-15', 'japonais', 789012345, 'yuki.takahashi@yahoo.com', 'password789'),
(64, 'Schmidt', 'Paul', 'M', '1989-01-15', 'allemand', 890123456, 'paul.schmidt@gmail.com', 'passwort789'),
(65, 'Gomes', 'Ana', 'F', '1976-03-30', 'francais', 901234567, 'ana.gomes@yahoo.com', 'senha789'),
(66, 'Tran', 'Duc', 'M', '1986-05-12', 'vietnamien', 123456789, 'duc.tran@gmail.com', 'matkhau789'),
(67, 'Ivanov', 'Dmitri', 'M', '1976-09-08', 'russe', 678901234, 'dmitri.ivanov@gmail.com', 'parol123'),
(68, 'Fischer', 'Laura', 'F', '1978-06-18', 'allemand', 345678901, 'laura.fischer@gmail.com', 'passwort789'),
(69, 'Hernández', 'Manuel', 'M', '1987-02-05', 'italien', 456789012, 'manuel.hernandez@yahoo.com', 'contraseña789'),
(70, 'Le', 'Thao', 'F', '1980-12-15', 'vietnamien', 567890123, 'thao.le@hotmail.com', 'matkhau789');


--Données pour la table "Habitation"
(HAB_id, HAB_Nom, HAB_Description, HAB_idLocalisation, HAB_idCompte)
(1, 'Le Charme', 'Bel appartement proche du Vieux-Port', 2, 1),
(2, 'Villa Bella Panorama', 'Villa de luxe avec vue sur Rome', 8, ),
(3, 'Madrid Oasis Apartments', 'Appartement entièrement équipé à Madrid', 15, 3),
(4, 'Historic House of Berlinia', 'Maison ancienne avec charme à Berlin', 22, 4),
(5, 'Munich Skyline Retreat', 'Condo moderne avec vue sur le centre ville', 27, 2),
(6, 'Zurich Secret Garden Residence','Appartement confortable avec jardin privé', 36, 8),
(7, 'Tokyo Tranquil Traditions Inn','Maison japonaise avec jardin zen', 55, 11),
(8, 'Lyon Alpine Bliss Chalet','Chalet pittoresque au cœur de la Presqu île', 3, 6),
(9, 'Moscow Metropolitan Loft','Appartement haut de gamme près du Kremlin', 43, 14),
(10, 'Hanoi Heavenly Haven Villa', 'Villa de luxe avec piscine à Hanoi', 49, 15),
(11, 'Seoul Serenity Condos','Condo moderne au centre de Séoul', 29, 28),
(12, 'Barcelona Vista del Sol', 'Appartement avec vue sur la Sagrada Familia', 16, 7),
(13, 'La Coruña Coastal Retreat', 'Maison de vacances avec vue sur la plage', 20, 22),
(14, 'Shinagawa Timeless Abode', 'Appartement morderne près du quartier d affaire', 56, 11),
(15, 'Naples Palatial Poolside Villa', 'Villa luxueuse avec piscine privée',10, 8),
(16, 'St. Petersburg Enchanting Apartment', 'Bel appartement à quelques pas du Palce d Hiver', 44, 18),
(17, 'Incheon Skyline Residence', 'Appartement contemporain proche de l Aeroport Internationale', 32, 5),
(18, 'Seoul Hanok Heritage House', 'Hanok traditionnel proche de Myeongdong', 31, 30),
(19, 'Da Nang Panoramic View Condo', 'Condo moderne avec vue sur les montagnes', 51, 2),
(20, 'Basel Cityscape Retreat', 'Bel appartement à quelques pas de la cathédrale de Bâle', 39, 12);
(21, 'Frankfurt Urban Oasis', 'Appartement en plein cœur de Frankfurt', 23, 4),
(22, 'Tuscan Countryside Hideaway', 'Maison traditionnelle toscane avec vue', 11, 9),
(23, 'Seville Terrace Tranquility', 'Condo avec vue sur la ville', 17, 7),
(24, 'Dresden Alpine Abode', 'Chalet confortable dans la vielle ville ', 24, 18),
(25, 'Nantes Riverside Retreat', 'Appartement moderne avec vue sur la Loire', 5, 5),
(26, 'Seoul Bohemian Townhouse', 'Maison contemporaine ans le quartier de Hongdae ', 30, 30),
(27, 'Ulsan Panoramic View Haven', 'Condo avec vue panoramique sur le Grand Parc d Ulsan', 34, 2),
(28, 'Malaga Elegance in the City', 'Appartement élégant à proximité de l Alcazaba', 21, 12),
(29, 'Alicante Azure Villa', 'Villa moderne avec piscine privée', 19, 8),
(30, 'Chur Mountain Romance Chalet', 'Chalet romantique avec vue ', 41, 6),
(31, 'Nara Zen Haven', 'Appartement traditionnel près du Park Nara', 57, 11),
(32, 'Geneva Garden Oasis', 'Maison avec jardin dans le quartier animé', 37, 8),
(33, 'Valencia Opulent Luxury Suite', 'Appartement de luxe dans le centre historique ', 18, 3),
(34, 'Gwangju Contemporary Urban Retreat', 'Condo avec design contemporain', 35, 2),
(35, 'Milan Mediterranean Bliss Villa', 'Villa élégante avec jardin méditerranéen', 9, 9),
(36, 'Paris Eiffel Enchantment', 'Appartement avec vue sur la Tour Eiffel', 1, 1),
(37, 'Tver Russian Charm Cottage', 'Maison ancienne avec charme russe', 46, 14),
(38, 'Osaka Urban Retreat', 'Retraite urbaine à proximité de la gare d Osaka', 59, 27),
(39, 'Lucerne Alpine Vista Chalet', 'Chalet avec vue imprenable sur le lac', 38, 19),
(40, 'Busan Plage Paradise', 'Paradis près de la plage de Haeundae', 33, 22);
(41, 'Le Capitole Chic', 'Élégant appartement au cœur de Toulouse', 4, 1),
(42, 'Lille Charm', 'Appartement charmant au centre du Vieux Lille', 6, 8),
(43, 'Bordeaux Éclatant', 'Appartement lumineux près du miroir d eau', 7, 3),
(44, 'Turin Royal', 'Découvrez la royauté à proximité du Palais Royal', 12, 4),
(45, 'Trieste Merveille', 'Appartement merveilleux près de la mer', 13, 5),
(46, 'Foggia Gare Gem', 'Gemme d appartement à côté de la gare', 14, 22),
(47, 'Düsseldorf Élégance', 'Élégance près de la vieille ville', 25, 11),
(48, 'Hamburg Au Fil de l Eau', 'Appartement au fil de l eau sur l Alster intérieur', 26, 27),
(49, 'Bonn Beethoven', 'Découvrez Beethoven près de la Maison Beethoven', 28, 4),
(50, 'Kawasaki Tranquility', 'Tranquillité près de Kawasaki Daishi', 60, 22),
(51, 'Bern Charme Ancien', 'Charme ancien dans la vieille ville', 40, 2),
(52, 'Neuchâtel Château Vue', 'Vue sur le Château de Neuchâtel', 42, 12),
(53, 'Novosibirsk Central', 'Central dans le centre-ville', 45, 14),
(54, 'Yekaterinburg Historique', 'Historique dans le centre-ville', 47, 8),
(55, 'Krasnodar Charme Russe', 'Charme russe dans le quartier historique', 48, 2),
(56, 'Ho Chi Minh City Vibrant', 'Vibrant dans le centre-ville', 50, 30),
(57, 'Nha Trang Plage Escape', 'Évasion plage à Nha Trang', 52, 27),
(58, 'Vung Tau Vue Divine', 'Vue divine près de la statue du Christ Roi', 53, 11),
(59, 'Hue Historique Hideaway', 'Retraite historique dans le quartier historique', 54, 7),
(60, 'Nagoya Shopping Spree', 'Frénésie du shopping dans le quartier commerçant', 58, 3);




-- Remplissage de la table Hotel avec les habitations de 1 à 20
INSERT INTO Hotel (HOTEL_id, HOTEL_Nom, HOTEL_Localisation, HOTEL_NoteSur10, HOTEL_Habitation)
VALUES
(1, 'Le Charme', 2, 9, 1),
(2, 'Villa Bella Panorama', 8, 8, 2),
(3, 'Madrid Oasis Apartments', 15, 7, 3),
(4, 'Historic House of Berlinia', 22, 8, 4),
(5, 'Munich Skyline Retreat', 27, 9, 5),
(6, 'Zurich Secret Garden Residence', 36, 8, 6),
(7, 'Tokyo Tranquil Traditions Inn', 55, 9, 7),
(8, 'Lyon Alpine Bliss Chalet', 3, 7, 8),
(9, 'Moscow Metropolitan Loft', 43, 8, 9),
(10, 'Hanoi Heavenly Haven Villa', 49, 9, 10),
(11, 'Seoul Serenity Condos', 29, 7, 11),
(12, 'Barcelona Vista del Sol', 16, 8, 12),
(13, 'La Coruña Coastal Retreat', 20, 9, 13),
(14, 'Shinagawa Timeless Abode', 56, 8, 14),
(15, 'Naples Palatial Poolside Villa', 10, 9, 15),
(16, 'St. Petersburg Enchanting Apartment', 44, 7, 16),
(17, 'Incheon Skyline Residence', 32, 8, 17),
(18, 'Seoul Hanok Heritage House', 31, 9, 18),
(19, 'Da Nang Panoramic View Condo', 51, 7, 19),
(20, 'Basel Cityscape Retreat', 39, 8, 20);

-- Remplissage de la table Appartement_Maison avec les habitations de 21 à 40
INSERT INTO Appartement_Maison (AM_id, AM_nom, AM_Localisation, AM_NoteSur10, AM_Habitation)
VALUES
(1, 'Frankfurt Urban Oasis', 23, 8, 21),
(2, 'Tuscan Countryside Hideaway', 11, 9, 22),
(3, 'Seville Terrace Tranquility', 17, 7, 23),
(4, 'Dresden Alpine Abode', 24, 8, 24),
(5, 'Nantes Riverside Retreat', 5, 9, 25),
(6, 'Seoul Bohemian Townhouse', 30, 7, 26),
(7, 'Ulsan Panoramic View Haven', 34, 8, 27),
(8, 'Malaga Elegance in the City', 21, 9, 28),
(9, 'Alicante Azure Villa', 19, 7, 29),
(10, 'Chur Mountain Romance Chalet', 41, 8, 30),
(11, 'Nara Zen Haven', 57, 9, 31),
(12, 'Geneva Garden Oasis', 37, 7, 32),
(13, 'Valencia Opulent Luxury Suite', 18, 8, 33),
(14, 'Gwangju Contemporary Urban Retreat', 35, 9, 34),
(15, 'Milan Mediterranean Bliss Villa', 9, 7, 35),
(16, 'Paris Eiffel Enchantment', 1, 8, 36),
(17, 'Tver Russian Charm Cottage', 46, 9, 37),
(18, 'Osaka Urban Retreat', 59, 7, 38),
(19, 'Lucerne Alpine Vista Chalet', 38, 8, 39),
(20, 'Busan Coastal Serenity Apartment', 33, 9, 40);

 -- Remplissage de la table Appartement_Maison avec les habitations de 41 à 60
INSERT INTO Appartement_Hotel (AM_id, AM_nom, AM_Localisation, AM_NoteSur10, AM_Habitation)
VALUES
(1, 'Le Capitole Chic', 4, 8, 41),
(2, 'Lille Charm', 6, 9, 42),
(3, 'Bordeaux Éclatant', 7, 7, 43),
(4, 'Turin Royal', 12, 8, 44),
(5, 'Trieste Merveille', 13, 9, 45),
(6, 'Foggia Gare Gem', 14, 7, 46),
(7, 'Düsseldorf Élégance', 25, 8, 47),
(8, 'Hamburg Au Fil de l Eau', 26, 9, 48),
(9, 'Bonn Beethoven', 28, 7, 49),
(10,'Kawasaki Tranquility', 60, 8, 50),
(11,'Bern Charme Ancien', 40, 9, 51),
(12,'Neuchâtel Château Vue', 42, 7, 52),
(13,'Novosibirsk Central', 45, 8, 53),
(14,'Yekaterinburg Historique' , 47, 9, 54),
(15,'Krasnodar Charme Russe', 48, 7, 55),
(16,'Ho Chi Minh City Vibrant' , 50, 8, 56),
(17,'Nha Trang Plage Escape', 52, 9, 57),
(18,'Vung Tau Vue Divine' , 53, 7, 58),
(19,'Hue Historique Hideaway', 54, 8, 59),
(20,'Nagoya Shopping Spree', 58, 9, 60);

INSERT INTO Hebergeur (HEB_id, HEB_Compte)
VALUES
(1, 51),
(2, 52),
(3, 53),
(4, 54),
(5, 55),
(6, 56),
(7, 57),
(8, 58),
(9, 59),
(10,60);
(11, 61),
(12, 62),
(13, 63),
(14, 64),
(15, 65),
(16, 66),
(17, 67),
(18, 68),
(19, 69),
(20, 70);

INSERT INTO Client (CLIENT_id, CLIENT_compte,CLIENT_paiement)
VALUES
(1,1,1,),
(2,2,2,),
(3,3,3,),
(4,4,4,),
(5,5,5,),
(6,6,6,),
(7,7,7,),
(8,8,8,),
(9,9,9,),
(10,10,10),
(11,11,11), 
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20),
(21,21,21),
(22,22,22),
(23,23,23),
(24,24,24),
(25,25,25),
(26,26,26),
(27,27,27),
(28,28,28),
(29,29,29),
(30,30,30),
(31,31,31),
(32,32,32),
(33,33,33),
(34,34,34),
(35,35,35),
(36,36,36),
(37,37,37),
(38,38,38),
(39,39,39),
(40,40,40),
(41,41,41),
(42,42,42),
(43,43,43),
(44,44,44),
(45,45,45),
(46,46,46),
(47,47,47),
(48,48,48),
(49,49,49),
(50,50,50),
(51,51,51),
(52,52,52),
(53,53,53),
(54,54,54),
(55,55,55),
(56,56,56),
(57,57,57),
(58,58,58),
(59,59,59),
(60,60,60);

INSERT INTO Paiement (PAIEMENT_id, PAIEMENT_Detenteur,PAIEMENT_NumCarte,PAIEMENT_DateExpiration,PAIEMENT_cryptograme)
VALUES
(1,1,4012 8888 8888 1881, 01/12/25,123),
(2,2,5218 1234 5678 9012, 01/06/24,456),
(3,3,4532 5678 9012 3456, 01/09/23,789),
(4,4,6011 1234 5678 9012, 01/03/22,101),
(5,5,5105 6789 0123 4567, 01/11/24,221),
(6,6,5500 1234 5678 9012, 01/05/23,233),
(7,7,4026 1234 5678 9012, 01/08/25,505),
(8,8,4916 1234 5678 9012, 01/02/26,707),
(9,9,3728 1234 5678 901,  01/07/23,509),
(10,10,6011 9876 5432 1234, 01/01/24,111),
(11,11,4111 1111 1111 1111, 01/04/22,222), 
(12,12,5105 1051 0510 5100, 01/10/25,333),
(13,13,6011 6011 6011 6611, 01/03/23,444),
(14,14,6011 0009 9013 9424, 01/12/24,555),
(15,15,5111 1111 1111 1118, 01/07/23,666),
(16,16,4444 3333 2222 1111, 01/05/25,777),
(17,17,5454 5454 5454 5454, 01/02/26,888),
(18,18,4916 9876 5432 1098, 01/09/24,999),
(19,19,6771 2345 6789 0123, 01/11/25,333),
(20,20,6011 1234 5688 1001, 01/08/23,444),
(21,21,5112 3456 7890 1256, 01/01/22,555),
(22,22,3777 8888 8888 8801, 01/04/24,666),
(23,23,3056 9309 0259 0400, 01/07/23,777),
(24,24,6011 1234 5678 9011, 01/10/25,888),
(25,25,5105 5678 9012 3456, 01/05/26,999),
(26,26,4111 2222 3333 4444, 01/08/24,111),
(27,27,5105 1888 8888 1881, 01/03/23,222),
(28,28,6011 9876 5432 1232, 01/12/24,333),
(29,29,4111 1234 4111 1111, 01/07/25,444),
(30,30,5105 5678 9012 3450, 01/02/22,555),
(31,31,6011 6011 6011 1141, 01/11/23,666),
(32,32,5112 3456 7890 1253, 01/05/25,777),
(33,33,6011 1234 5678 9005, 01/09/24,888),
(34,34,4916 1111 1111 1113, 01/01/23,999),
(35,35,2720 1234 5678 9012, 01/04/25,111),
(36,36,6011 6011 6011 6610, 01/07/23,222),
(37,37,6011 1234 5678 9021, 01/10/25,333),
(38,38,5105 1051 0510 5105, 01/05/26,444),
(39,39,4007 4265 7777 7777, 01/08/24,555),
(40,40,5105 5678 9012 3401, 01/02/23,666),
(41,41,6011 1234 5678 9098, 01/11/25,777),
(42,42,4111 1111 1211 1112, 01/05/24,888),
(43,43,5105 1888 8888 1811, 01/01/23,999),
(44,44,6011 9876 5432 1276, 01/04/25,111),
(45,45,4111 1234 4111 1199, 01/09/24,222),
(46,46,5105 5678 9012 3452, 01/02/22,333),
(47,47,6011 6011 6011 1151, 01/07/23,444),
(48,48,5112 3456 7890 1299, 01/11/25,555),
(49,49,6011 1234 5678 9001, 01/08/24,666),
(50,50,4916 1111 1111 1119, 01/03/23,777),
(51,51,2720 1234 5678 9018, 01/06/26,888),
(52,52,6011 6011 6011 6618, 01/10/23,999),
(53,53,6011 1234 5678 9215, 01/01/24,111),
(54,54,5105 1051 0510 5109, 01/05/25,222),
(55,55,4007 4265 7777 7799, 01/08/23,333),
(56,56,5105 5678 9012 3499, 01/02/25,444),
(57,57,6011 1234 5678 9292, 01/09/24,555),
(58,58,4111 1111 1211 1119, 01/11/25,666),
(59,59,5105 1888 8888 1889, 01/04/22,777),
(60,60,6011 9876 5432 1290, 01/07/23,888);  

     
INSERT INTO Cuisine (CUISINE_id, CUISINE_nombre, CUISINE_ustensiles_de_cuisine, CUISINE_grille_pain, CUISINE_lave_vaiselle, CUISINE_micro_ondes, CUISINE_frigo, CUISINE_bouilloir, CUISINE_plaque_de_cuisson, CUISINE_gaziniere, CUISINE_four_electrique, CUISINE_four_a_gaz)
VALUES
(1,  1, true, true, false, true, true, true, false, true, false, true),
(2,  1, true, true, true,  true, true, true, false, true, false, true),
(3,  1, true, true, false, true, true, true, false, true, false, true),
(4,  1, true, true, false, true, true, true, false, true, false, true),
(5,  1, true, true, true,  true, true, true, false, true, false, true),
(6,  1, true, true, false, true, true, true, true, false, false, true),
(7,  1, true, true, false, true, true, true, true, false, false, true),
(8,  1, true, true, false, true, true, true, true, false, false, true),
(9,  1, true, true, true,  true, true, true, true, false, false, true),
(10, 1, true, true, true, true, true, true, true, false, false,true),
(11, 1, true, true, true, true, true, true, false, true, true, false),
(12, 1, true, true, false, true, true, true, false, true, true, false),
(13, 1, true, true, false, true, true, true, false, true, true, false),
(14, 1, true, true, true, true, true, true, false, true, true, false),
(15, 1, true, true, true, true, true, true, false, true, true, false),
(16, 1, true, true, true, true, true, true, true, false, true, false),
(17, 1, true, true, false, true, true, true, true, false, true, false),
(18, 1, true, true, false, true, true, true, true, false, true, false),
(19, 1, true, true, true, true, true, true, true, false, true, false),
(20, 1, true, true, false, true, true, true, true, false, true, false),
(21, 1, true, true, false, true, true, true, false, true, false, true),
(22, 1, true, true, false, true, true, true, false, true, false, true),
(23, 1, true, true, true, true, true, true, false, true, false, true),
(24, 1, true, true, false, true, true, true, false, true, false, true),
(25, 1, true, true, false, true, true, true, false, true, false, true),
(26, 1, true, true, false, true, true, true, true, false, false, true),
(27, 1, true, true, false, true, true, true, true, false, false, true),
(28, 1, true, true, false, true, true, true, true, false, false, true),
(29, 1, true, true, true, true, true, true, true, false, false, true),
(30, 1, true, true, false, true, true, true, true, false, false, true),
(31, 1, true, true, false, true, true, true, false, true, true, false),
(32, 1, true, true, false, true, true, true, false, true, true, false),
(33, 1, true, true, false, true, true, true, false, true, true, false),
(34, 1, true, true, true, true, true, true, false, true, true, false),
(35, 1, true, true, true, true, true, true, false, true, true, false),
(36, 1, true, true, false, true, true, true, true, false, true, false),
(37, 1, true, true, false, true, true, true, true, false, true, false),
(38, 1, true, true, false, true, true, true, true, false, true, false),
(39, 1, true, true, false, true, true, true, true, false, true, false),
(40, 1, true, true, true, true, true, true, true, false, true, false),
(41, 1, true, true, true, true, true, true, false, true, false, true),
(42, 1, true, true, false, true, true, true, false, true, false, true),
(43, 1, true, true, false, true, true, true, false, true, false, true),
(44, 1, true, true, true, true, true, true, false, true, false, true),
(45, 1, true, true, false, true, true, true, false, true, false, true),
(46, 1, true, true, true, true, true, true, true, false, false, true),
(47, 1, true, true, false, true, true, true, true, false, false, true),
(48, 1, true, true, false, true, true, true, true, false, false, true),
(49, 1, true, true, false, true, true, true, true, false, false, true),
(50, 1, true, true, false, true, true, true, true, false, false, true),
(51, 1, true, true, false, true, true, true, false, true, true, false),
(52, 1, true, true, false, true, true, true, false, true, true, false),
(53, 1, true, true, false, true, true, true, false, true, true, false),
(54, 1, true, true, false, true, true, true, false, true, true, false),
(55, 1, true, true, false, true, true, true, false, true, true, false),
(56, 1, true, true, false, true, true, true, true, false, true, false),
(57, 1, true, true, true, true, true, true, true, false, true, false),
(58, 1, true, true, false, true, true, true, true, false, true, false),
(59, 1, true, true, false, true, true, true, true, false, true, false),
(60, 1, true, true, false, true, true, true, true, false, true, false);     
      
     
INSERT INTO Salle_de_bain (SDB_id, SDB_nombre, SDB_beignoir, SDB_douche)
VALUES
(1, 1, true, false),
(2, 1, true, true ),
(3, 1, true, false),
(4, 1, true, false),
(5, 3, true, true,),
(6, 1, true, false),
(7, 1, true, false),
(8, 1, true, false),
(9, 1, true, true ),
(10, 2, true, true ),
(11, 3, true, true ),
(12, 1, true, true),
(13, 1, true, false),
(14, 2, true, true ),
(15, 3, true, true ),
(16, 2, true, true ),
(17, 1, true, false),
(18, 1, true, false),
(19, 3, true, true ),
(20, 1, true, false),
(21, 1, true, true),
(22, 1, true, false),
(23, 2, true, true ),
(24, 1, true, false),
(25, 1, true, false),
(26, 1, true, true),
(27, 1, true, false),
(28, 1, true, false),
(29, 3, true, true ),
(30, 1, true, false),
(31, 1, true, true),
(32, 1, true, false),
(33, 1, true, false),
(34, 2, true, true ),
(35, 3, true, true ),
(36, 1, true, false),
(37, 1, true, true),
(38, 1, true, false),
(39, 1, true, true),
(40, 2, true, true ),
(41, 3, true, true ),
(42, 1, true, false),
(43, 1, true, false),
(44, 2, true, true ),
(45, 1, true, false),
(46, 3, true, true ),
(47, 1, true, true),
(48, 1, true, false),
(49, 1, true, false),
(50, 1, true, true),
(51, 1, true, false),
(52, 1, true, false),
(53, 1, true, true),
(54, 1, true, false),
(55, 1, true, true),
(56, 1, true, false),
(57, 2, true, true ),
(58, 1, true, false),
(59, 1, true, true),
(60, 1, true, false);          
     
INSERT INTO Couchage (COUCHAGE_id, COUCHAGE_salon, COUCHAGE_lit_nb, COUCHAGE_taille_lit)
VALUES
(1,  true, 1, 2),
(2,  true, 2, 2),
(3,  true, 3, 2),
(4,  true, 4, 2),
(5,  true, 5, 2),
(6,  true, 1, 2),
(7,  true, 2, 2),
(8,  true, 3, 2),
(9,  true, 4, 2),
(10, true, 4, 2),
(11, true, 5, 2),
(12, true, 1, 2),
(13, true, 2, 2),
(14, true, 4, 2),
(15, true, 5, 2),
(16, true, 4, 2),
(17, true, 1, 2),
(18, true, 2, 2),
(19, true, 5, 2),
(20, true, 1, 2),
(21, true, 2, 2),
(22, true, 3, 2),
(23, true, 4, 2),
(24, true, 1, 2),
(25, true, 2, 2),
(26, true, 3, 2),
(27, true, 4, 2),
(28, true, 5, 2),
(29, true, 5, 2),
(30, true, 1, 2),
(31, true, 2, 2),
(32, true, 3, 2),
(33, true, 4, 2),
(34, true, 4, 2),
(35, true, 5, 2),
(36, true, 1, 2),
(37, true, 2, 2),
(38, true, 3, 2),
(39, true, 4, 2),
(40, true, 4, 2),
(41, true, 5, 2),
(42, true, 1, 2),
(43, true, 2, 2),
(44, true, 4, 2),
(45, true, 1, 2),
(46, true, 5, 2),
(47, true, 1, 2),
(48, true, 2, 2),
(49, true, 3, 2),
(50, true, 4, 2),
(51, true, 5, 2),
(52, true, 1, 2),
(53, true, 2, 2),
(54, true, 3, 2),
(55, true, 4, 2),
(56, true, 5, 2),
(57, true, 4, 2),
(58, true, 1, 2),
(59, true, 2, 2),
(60, true, 3, 2);  
                   
INSERT INTO Piece (PIECE_id, PIECE_Chambre, PIECE_Salle_de_bain, PIECE_Cuisine)
VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11), 
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20),
(21,21,21),
(22,22,22),
(23,23,23),
(24,24,24),
(25,25,25),
(26,26,26),
(27,27,27),
(28,28,28),
(29,29,29),
(30,30,30),
(31,31,31),
(32,32,32),
(33,33,33),
(34,34,34),
(35,35,35),
(36,36,36),
(37,37,37),
(38,38,38),
(39,39,39),
(40,40,40),
(41,41,41),
(42,42,42),
(43,43,43),
(44,44,44),
(45,45,45),
(46,46,46),
(47,47,47),
(48,48,48),
(49,49,49),
(50,50,50),
(51,51,51),
(52,52,52),
(53,53,53),
(54,54,54),
(55,55,55),
(56,56,56),
(57,57,57),
(58,58,58),
(59,59,59),
(60,60,60);

INSERT INTO Regles_habitation (REGLE_id, REGLE_fumeur, REGLE_animaux,  REGLE_enfants, REGLE_fete)
VALUES
(1,  true, true, false, true ),
(2,  true, true, true,  true ),
(3,  false, true, true, false ),
(4,  true, true, false, true ),
(5,  true, true, true,  true ),
(6,  true, true, false, true ),
(7,  true, true, true, false ),
(8,  true, true, false, true ),
(9,  true, true, true,  true ),
(10, false, true, true, false ),
(11, true, true, true, true ),
(12, true, true, false, true),
(13, false, true, true, false),
(14, true, true, true, true ),
(15, true, true, true, true ),
(16, true, true, true, true ),
(17, true, true, false, true),
(18, false, true, true, false),
(19, false, true, true, false ),
(20, true, true, false, true),
(21, false, false, true, true),
(22, false, true, true, true),
(23, true, true, true,  true),
(24, true, true, false, true),
(25, true, true, false, true),
(26, false, true, true, true),
(27, false, false, true, true),
(28,false, true, true, false),
(29, true, true, true, true ),
(30, false, true, true, true),
(31, false, true, true, true),
(32, false, true, true, false),
(33, true, true, false, true),
(34, true, true, true, true ),
(35, false, true, true, false ),
(36, true, true, false, true),
(37, false, true, true, true),
(38, false, true, true, false),
(39, true, true, false, true),
(40, true, true, true, true ),
(41, true, true, true, true ),
(42,false, true, true, true),
(43,false, true, true, false),
(44, false, true, true, false),
(45, false, true, true, true),
(46, true, true, true, true ),
(47, true, true, false, true),
(48, false, true, true, true),
(49, true, true, false, true),
(50, false, true, true, false),
(51, false, true, true, true),
(52, true, true, false, true),
(53, false, false, true, true),
(54, false, true, true, false),
(55, false, true, true, false),
(56, true, true, false, true),
(57, true, true, true, true ),
(58, true, true, false, true),
(59, false, false, true, true),
(60, false, true, true, false);     
     
INSERT INTO Langue_habitation (LANGUE_id, LANGUE_anglais,LANGUE_francais, LANGUE_italien, LANGUE_espagnole, LANGUE_allemand , LANGUE_coreen, LANGUE_russe, LANGUE_vietnamien, LANGUE_japonais)
VALUES
(1,  true, true, true, true, true, false, false, false, false),
(2,  true, true, true, true, false, false, false, false, false),
(3,  true, true, true, true, false, false, false, false, false),
(4,  true, true, false, false, true, false, true, false, false),
(5,  true, true, false, false, true, false, true, false, false), 
(6,  true, true, true, true, true, false, false, false, false), 
(7,  true, false, false, false, false, true, false, true, true), 
(8,  true, true, true, true, true, false, false, false, false), 
(9,  true, false, false, false, false, false, true, false, false), 
(10, true, false, false, false, false, true, false, true, true), 
(11, true, false, false, false, false, true, false, true, true), 
(12, true, true, true, true, false, false, false, false, false), 
(13, true, true, true, true, false, false, false, false, false), 
(14, true, false, false, false, false, true, false, true, true), 
(15, true, true, true, true, false, false, false, false, false), 
(16, true, false, false, false, false, false, true, false, false), 
(17, true, false, false, false, false, true, false, true, true), 
(18, true, false, false, false, false, true, false, true, true), 
(19, true, false, false, false, false, true, false, true, true), 
(20, true, true, false, false, true, false, false, true, false), 
(21, true, true, false, false, true, false, true, false, false), 
(22, true, true, true, true, false, false, false, false, false), 
(23, true, true, true, true, false, false, false, false, false), 
(24, true, true, false, false, true, false, false, true, false), 
(25, true, true, true, true, true, false, false, false, false), 
(26, true, false, false, false, false, true, false, true, true), 
(27, true, false, false, false, false, true, false, true, true), 
(28, true, true, true, true, false, false, false, false, false), 
(29, true, true, true, true, false, false, false, false, false), 
(30, true, true, true, true, true, false, false, false, false ), 
(31, true, false, false, false, false, true, false, true, true), 
(32, true, true, false, false, true, false, false, true, false), 
(33, true, true, true, true, false, false, false, false, false), 
(34, true, false, false, false, false, true, false, true, true), 
(35, true, true, true, true, false, false, false, false, false), 
(36, true, true, true, true, true, false, false, false, false), 
(37, true, false, false, false, false, false, true, false, false), 
(38, true, false, false, false, false, true, false, true, true), 
(39, true, true, true, true, true, false, false, false, false ), 
(40, true, false, false, false, false, true, false, true, true), 
(41, true, true, true, true, true, false, false, false, false ), 
(42, true, true, false, false, true, false, true, false, false), 
(43, true, true, false, false, true, false, true, false, false), 
(44, true, true, true, true, false, false, false, false, false), 
(45, true, true, true, true, false, false, false, false, false), 
(46, true, true, true, true, false, false, false, false, false), 
(47, true, true, false, false, true, false, true, false, false), 
(48, true, true, false, false, true, false, true, false, false), 
(49, true, true, false, false, true, false, false, true, false), 
(50, true, false, false, false, false, true, false, true, true), 
(51, true, true, true, true, true, false, false, false, false ), 
(52, true, true, true, true, true, false, false, false, false ), 
(53, true, false, false, false, false, false, true, false, false), 
(54, true, false, false, false, false, false, true, false, false), 
(55, true, true, false, false, true, false, false, true, false), 
(56, true, false, false, false, false, true, false, true, true), 
(57, true, false, false, false, false, true, false, true, true), 
(58, true, false, false, false, false, true, false, true, true), 
(59, true, false, false, false, false, true, false, true, true), 
(60, true, false, false, false, false, true, false, true, true), 

INSERT INTO Caracteristique_habitation (CARA_HAB_id, CARA_HAB_climatisation, CARA_HAB_chauffage, CARA_HAB_coWifi_gratuit, CARA_HAB_reception24sur24, CARA_HAB_bar, CARA_HAB_piscine, CARA_HAB_sauna, CARA_HAB_jacuzzi, CARA_HAB_balcon, CARA_HAB_tele, CARA_HAB_lave_linge, CARA_HAB_parking_gratuit)
VALUES
(1,  false, true, true, true, false, true, false, true, true, true,  false, true),
(2,  true, true,  true, true, true,  false, true, true, true, true,  true, true),
(3,  false, true, true, true, false, true, true, false, true, true,  false, true),
(4,  true,  true, true, true, false, true, false, false, true, true,  false, true),
(5,  true, true, true, true, true,  true, true, true, true, true,  false, true),
(6,  false, true, true, true, false, true, false, true,  true, true,  false, true),
(7,  true,  true, true, true, false, false, true, true,  true, true,  false, true),
(8,  false, true, true, true, false, true, true, false,  true, true,  false, true),
(9,  true,  true, true, true, true,  true, false, false, true, true,  false, true),
(10, true, true, true, true, true,  true, true, true, true, true, true, true),
(11, true, true, true, true, true,  true, true, true, true, true, true, true),
(12, false, true, true, true, false, true, true, true, true, true,  true, false),
(13, true,  true, true, true, false, true, true, true, true, true,  true, false),
(14, true, true, true, true, true,  true, true, true, true, true, true, true),
(15, true, true, true, true, true,  true, true, true, true, true, true, true),
(16, true, true, true, true, true,  true, true, true, true, true, true, true),
(17, false, true, true, true, false, true, true, true, true, true,  true, false),
(18, true,  true, true, true, false, true, true, true, true, true,  true, false),
(19, true, true, true, true, true,  true, true, true, true, true, true, true),
(20, false, true, true, true, false, true, true, true, true, true,  true, false),
(21, true,  true, true, true, false, true, true, true, true, true,  false, true),
(22, true, true, true, true, false, true, true, true, true, true,  false, true),
(23, true, true, true, true, true,  true, true, true, true, true, true, true),
(24, false, true, true, true, false, true, false, true,  true, true,  false, true),
(25, true,  true, true, true, false, false, true, true,  true, true,  false, true),
(26, false, true, true, true, false, true, true, false,  true, true,  false, true),
(27, true,  true, true, true, false, true, false, false, true, true,  false, true),
(28, true, true, true, true, false, true, true, true, true, true,  false, true),
(29, true, true, true, true, true,  true, true, true, true, true, true, true),
(30, false, true, true, true, false, true, true, true, true, true,  false, true),
(31, true,  true, true, true, false, true, true, true, true, true,  true, false),
(32, false, true, true, true, false, true, true, true, true, true,  true, false),
(33, true,  true, true, true, false, true, true, true, true, true,  true, false),
(34, true, true, true, true, true, true, true, true,  true, true, true, false),
(35, true, true, true, true, true,  true, true, true, true, true, true, true),
(36, false, true, true, true, false, true, true, true, true, true,  true, false),
(37, true,  true, true, true, false, true, true, true, true, true,  true, false),
(38, false, true, true, true, false, true, true, true, true, true,  true, false),
(39, true,  true, true, true, false, true, true, true, true, true,  true, false),
(40, true, true, true, true, true,  true, true, true, true, true, true, true),
(41, true, true, true, true, true,  true, true, true, true, true, true, true),
(42, false, true, true, true, false, true, true, true, true, true,  false, true),
(43, true,  true, true, true, false, true, true, true, true, true,  false, true),
(44, false, true, true, true, true,  true, true, true, true, true, true, true),
(45, true,  true, true, true, true,  true, true, true, true, true, true, true),
(46, true, true, true, true, true,   true, false, true, true, true, true, true),
(47, false, true, true, true, false, false, true, true,  true, true,  false, true),
(48, true,  true, true, true, false, true, true, false,  true, true,  false, true),
(49, false, true, true, true, false, true, false, false, true, true,  false, true),
(50, true,  true, true, true, false, true, false, true,  true, true,  false, true),
(51, false, true, true, true, false, false, true, true,  true, true,  true, false),
(52, true,  true, true, true, false, true, true, false,  true, true,  true, false),
(53, false, true, true, true, false, true, false, false, true, true,  true, false),
(54, true,  true, true, true, false,true, false, true,  true, true,  true, false),
(55, false, true, true, true, false,false, true, true,  true, true,  true, false),
(56, true,  true, true, true, false,true, true, false,  true, true,  true, false),
(57, true, true, true, true, true,  true, true, true ,true, true, true, true),
(58, false, true, true, true, false,true, false, true,  true, true,  true, false),
(59, true,  true, true, true, false,false, true, true,  true, true,  true, false),
(60, true, true, true, true, false, true, true, false, true, true,  true, false); 

INSERT INTO Habitation (HAB_id, HAB_Superficie,HAB_Petit_dejeuner,HAB_Horaire_ouverture, HAB_Horaire_fermeture,HAB_Regle,HAB_Caractéristique,HAB_Langue,HAB_Piece,HAB_Proprio,HAB_InfoSuppURL)
VALUES
(1,  58, true, '7h', '19h ',1,1,1,1,2,'Bel appartement proche du Vieux-Port'),
(2,  73, false,' 6h ', ' 21h' ,2,2,2,2,19,'Villa de luxe avec vue sur Rome'),
(3,  102, true,' 10h', ', 18h' ,3,3,3,3,4,'Appartement entièrement équipé à Madrid'),
(4,  43, true, '8h ', '20h ',4,4,4,4,7,'Maison ancienne avec charme à Berlin'),
(5,  77, true, '9h ', '19h ',5,5,5,5,6,'Condo moderne avec vue sur le centre ville'),
(6,  94, false,' 7h ', ' 21h' ,6,6,6,6,12,'Appartement confortable avec jardin privé'),
(7,  47, true, '10h ', ' 18h' ,7,7,7,7,1,'Maison japonaise avec jardin zen'),
(8,  65, true, '6h ', '20h ',8,8,8,8,15,'Chalet pittoresque au cœur de la Presqu île'),
(9,  89, true, '9h ', '19h ',9,9,9,9,10,'Appartement haut de gamme près du Kremlin'),
(10, 105, false, '8h' , '21h' ,10,10,10,10,5,'Villa de luxe avec piscine à Hanoi'),
(11, 53, true, '7h ', '18h ',11,11,11,11,3,'Condo moderne au centre de Séoul'), 
(12, 68, true, '10h' ,' 20h' ,12,12,12,12,4,'Appartement avec vue sur la Sagrada Familia'),
(13, 82, false,' 6h' ,' 19h' ,13,13,13,13,8,'Maison de vacances avec vue sur la plage'),
(14, 98, true, '9h ', '21h ',14,14,14,14,1,'Appartement morderne près du quartier d affaire'),
(15, 44, false,' 8h' ,' 18h' ,15,15,15,15,6,'Villa luxueuse avec piscine privée'),
(16, 60, true, '7h ', '20h ',16,16,16,16,10,'Bel appartement à quelques pas du Palce d Hiver'),
(17, 109, true,' 10h' ,' 19h' ,17,17,17,17,1,'Appartement contemporain proche de l Aeroport Internationale'),
(18, 46, true, '6h ', '21h ',18,18,18,18,3,'Hanok traditionnel proche de Myeongdong'),
(19, 72, false,' 9h' ,' 18h' ,19,19,19,19,20,'Condo moderne avec vue sur les montagnes'),
(20, 96, true, '8h ', '20h ',20,20,20,20,18,'Bel appartement à quelques pas de la cathédrale de Bâle'),
(21, 41, true, '7h ', '19h ',21,21,21,21,14,'Appartement en plein cœur de Frankfurt'),
(22, 84, false,' 10h' ,', 21h' ,22,22,22,22,19,'Maison traditionnelle toscane avec vue'),
(23, 50, true, '6h ', '18h ',23,23,23,23,18,'Condo avec vue sur la ville'),
(24, 64, true, '9h ', '20h ',24,24,24,24,14,'Chalet confortable dans la vielle ville '),
(25, 107, true,' 8h' ,' 19h' ,25,25,25,25,15,'Appartement moderne avec vue sur la Loire'),
(26, 49, false,' 7h' ,' 21h' ,26,26,26,26,3,'Maison contemporaine ans le quartier de Hongdae '),
(27, 78, true, '10h' ,' 18h' ,27,27,27,27,9,'Condo avec vue panoramique sur le Grand Parc d Ulsan'),
(28, 93, false,' 6h' ,' 20h' ,28,28,28,28,11,'Appartement élégant à proximité de l Alcazaba'),
(29, 56, true, '9h ', '19h ',29,29,29,29,11,'Villa moderne avec piscine privée'),
(30, 87, false,' 8h' ,' 21h' ,30,30,30,30,9,'Chalet romantique avec vue '),
(31, 100, true,' 7h' ,' 18h' ,31,31,31,31,9,'Appartement traditionnel près du Park Nara'),
(32, 42, true, '10h' ,' 20h' ,32,32,32,32,2,'Maison avec jardin dans le quartier animé'),
(33, 70, true, '6h ', '19h ',33,33,33,33,8,'Appartement de luxe dans le centre historique '),
(34, 95, false,' 9h' ,' 21h' ,34,34,34,34,20,'Condo avec design contemporain'),
(35, 51, false,' 8h' ,' 18h' ,35,35,35,35,2,'Villa élégante avec jardin méditerranéen'),
(36, 69, true, '7h ', '20h ',36,36,36,36,15,'Appartement avec vue sur la Tour Eiffel'),
(37, 80, true, '10h' ,' 19h' ,37,37,37,37,17,'Maison ancienne avec charme russe'),
(38, 106, true,' 6h' ,' 21h' ,38,38,38,38,3,'Retraite urbaine à proximité de la gare d Osaka'),
(39, 61, true, '9h ', '18h ',39,39,39,39,10,'Chalet avec vue imprenable sur le lac'),
(40, 91, true, '8h ', '20h ',40,40,40,40,20,'Paradis près de la plage de Haeundae'),
(41, 55, false,' 7h' ,' 19h' ,41,41,41,41,15,'Élégant appartement au cœur de Toulouse'),
(42, 76, true, '10h' ,' 21h' ,42,42,42,42,2,'Appartement charmant au centre du Vieux Lille'),
(43, 88, true, '6h ', '18h ',43,43,43,43,15,'Appartement lumineux près du miroir d eau'),
(44, 48, false,' 9h' ,' 20h' ,44,44,44,44,13,'Découvrez la royauté à proximité du Palais Royal'),
(45, 66, true, '8h ', '19h ',45,45,45,45,13,'Appartement merveilleux près de la mer'),
(46, 103, true,' 7h' ,' 21h' ,46,46,46,46,19,'Gemme d appartement à côté de la gare'),
(47, 52, true, '10h' ,' 18h' ,47,47,47,47,10,'Élégance près de la vieille ville'),
(48, 75, false,' 6h' ,' 20h' ,48,48,48,48,7,'Appartement au fil de l eau sur l Alster intérieur'),
(49, 97, true, '9h ', '19h ',49,49,49,49,14,'Découvrez Beethoven près de la Maison Beethoven'),
(50, 59, true, '8h ', '21h ',50,50,50,50,16,'Tranquillité près de Kawasaki Daishi'),
(51, 79, false,' 7h' ,' 18h' ,51,51,51,51,2,'Charme ancien dans la vieille ville'),
(52, 92, true, '10h' ,' 20h' ,52,52,52,52,12,'Vue sur le Château de Neuchâtel'),
(53, 45, true, '6h ', '19h ',53,53,53,53,12,'Appartement dans le centre-ville'),
(54, 71, false,' 9h' ,' 21h' ,54,54,54,54,17,'Historique dans le centre-ville'),
(55, 110, true,' 8h' ,' 18h' ,55,55,55,55,17,'Charme russe dans le quartier historique'),
(56, 67, false,' 7h' ,' 20h' ,56,56,56,56,5,'Vibrant dans le centre-ville'),
(57, 83, true, '10h' ,' 19h' ,57,57,57,57,16,'Évasion plage à Nha Trang'),
(58, 99, true, '6h ', '21h ',58,58,58,58,20,'Vue divine près de la statue du Christ Roi'),
(59, 54, false,' 9h' ,' 18h' ,59,59,59,59,5,'Retraite historique dans le quartier historique'),
(60, 86, true, '8h ', '20h ',60,60,60,60,16,'Frénésie du shopping dans le quartier commerçant');

CREATE TABLE Prix(
    PRIX_id integer PRIMARY KEY NOT NULL,
    PRIX_PrixDeQuoi varchar(100),
    PRIX_Prix integer
);

INSERT INTO Prix (PRIX_id, PRIX_PrixDeQuoi, PRIX_Prix)
VALUES
(1,  "Habitation : 1 nuit", 214),
(2,  "Habitation : 1 nuit", 123),
(3,  "Habitation : 1 nuit", 149),
(4,  "Habitation : 1 nuit", 96),
(5,  "Habitation : 1 nuit", 259),
(6,  "Habitation : 1 nuit", 203),
(7,  "Habitation : 1 nuit", 189),
(8,  "Habitation : 1 nuit", 128),
(9,  "Habitation : 1 nuit", 231),
(10, "Habitation : 1 nuit", 107),
(11, "Habitation : 1 nuit", 251),
(12, "Habitation : 1 nuit", 148),
(13, "Habitation : 1 nuit", 157),
(14, "Habitation : 1 nuit", 175),
(15, "Habitation : 1 nuit", 115),
(16, "Habitation : 1 nuit", 236),
(17, "Habitation : 1 nuit", 221),
(18, "Habitation : 1 nuit", 200),
(19, "Habitation : 1 nuit", 172),
(20, "Habitation : 1 nuit", 195),
(21, "Habitation : 1 nuit", 262),
(22, "Habitation : 1 nuit", 97),
(23, "Habitation : 1 nuit", 144),
(24, "Habitation : 1 nuit", 106),
(25, "Habitation : 1 nuit", 138),
(26, "Habitation : 1 nuit", 212),
(27, "Habitation : 1 nuit", 163),
(28, "Habitation : 1 nuit", 116),
(29, "Habitation : 1 nuit", 166),
(30, "Habitation : 1 nuit", 246),
(31, "Habitation : 1 nuit", 227),
(32, "Habitation : 1 nuit", 134),
(33, "Habitation : 1 nuit", 251),
(34, "Habitation : 1 nuit", 90),
(35, "Habitation : 1 nuit", 122),
(36, "Habitation : 1 nuit", 258),
(37, "Habitation : 1 nuit", 169),
(38, "Habitation : 1 nuit", 228),
(39, "Habitation : 1 nuit", 256),
(40, "Habitation : 1 nuit", 144),
(41, "Habitation : 1 nuit", 178),
(42, "Habitation : 1 nuit", 135),
(43, "Habitation : 1 nuit", 121),
(44, "Habitation : 1 nuit", 192),
(45, "Habitation : 1 nuit", 238),
(46, "Habitation : 1 nuit", 214),
(47, "Habitation : 1 nuit", 100),
(48, "Habitation : 1 nuit", 264),
(49, "Habitation : 1 nuit", 140),
(50, "Habitation : 1 nuit", 207),
(51, "Habitation : 1 nuit", 101),
(52, "Habitation : 1 nuit", 242),
(53, "Habitation : 1 nuit", 252),
(54, "Habitation : 1 nuit", 252),
(55, "Habitation : 1 nuit", 108),
(56, "Habitation : 1 nuit", 212),
(57, "Habitation : 1 nuit", 179),
(58, "Habitation : 1 nuit", 99),
(59, "Habitation : 1 nuit", 153),
(60, "Habitation : 1 nuit", 133),
(61, "Prix total", 2060),
(62, "Prix total", 1636),
(63, "Prix total", 149),
(64, "Prix total", 96),
(65, "Prix total", 259),
(66, "Prix total", 203),
(67, "Prix total", 189),
(68, "Prix total", 128),
(69, "Prix total", 231),
(70, "Prix total", 107),
(11, "Prix total", 251),
(12, "Prix total", 148),
(13, "Prix total", 157),
(14, "Prix total", 175),
(15, "Prix total", 115),
(16, "Prix total", 236),
(17, "Prix total", 221),
(18, "Prix total", 200),
(19, "Habitation : 1 nuit", 172),
(20, "Habitation : 1 nuit", 195),
(21, "Habitation : 1 nuit", 262),
(22, "Habitation : 1 nuit", 97),
(23, "Habitation : 1 nuit", 144),
(24, "Habitation : 1 nuit", 106),
(25, "Habitation : 1 nuit", 138),
(26, "Habitation : 1 nuit", 212),
(27, "Habitation : 1 nuit", 163),
(28, "Habitation : 1 nuit", 116),
(29, "Habitation : 1 nuit", 166),
(30, "Habitation : 1 nuit", 246),
(31, "Habitation : 1 nuit", 227),
(32, "Habitation : 1 nuit", 134),
(33, "Habitation : 1 nuit", 251),
(34, "Habitation : 1 nuit", 90),
(35, "Habitation : 1 nuit", 122),
(36, "Habitation : 1 nuit", 258),
(37, "Habitation : 1 nuit", 169),
(38, "Habitation : 1 nuit", 228),
(39, "Habitation : 1 nuit", 256),
(40, "Habitation : 1 nuit", 144),
(41, "Habitation : 1 nuit", 178),
(42, "Habitation : 1 nuit", 135),
(43, "Habitation : 1 nuit", 121),
(44, "Habitation : 1 nuit", 192),
(45, "Habitation : 1 nuit", 238),
(46, "Habitation : 1 nuit", 214),
(47, "Habitation : 1 nuit", 100),
(48, "Habitation : 1 nuit", 264),
(49, "Habitation : 1 nuit", 140),
(50, "Habitation : 1 nuit", 207),
(51, "Habitation : 1 nuit", 101),
(52, "Habitation : 1 nuit", 242),
(53, "Habitation : 1 nuit", 252),
(54, "Habitation : 1 nuit", 252),
(55, "Habitation : 1 nuit", 108),
(56, "Habitation : 1 nuit", 212),
(57, "Habitation : 1 nuit", 179),
(58, "Habitation : 1 nuit", 99),
(59, "Habitation : 1 nuit", 153),
(60, "Habitation : 1 nuit", 133),


CREATE TABLE ReservationHabitation(
    RESERVHAB_id integer PRIMARY KEY NOT NULL,
    RESERVHAB_Client, 
    RESERVHAB_DateArriver date,
    RESERVHAB_DateDepart date,
    RESERVHAB_NbAdulte integer,
    RESERVHAB_NbEnfant integer,
    RESERVHAB_NbAnimaux integer,
    RESERVHAB_Habitation integer,
    RESERVHAB_Pack_Voyage_Extra boolean,
    RESERVHAB_Prix integer
);

INSERT INTO ReservationHabitation (RESERVHAB_id,RESERVHAB_Client, RESERVHAB_DateArriver, RESERVHAB_DateDepart, RESERVHAB_NbAdulte, RESERVHAB_NbEnfant, RESERVHAB_NbAnimaux, RESERVHAB_Habitation)
VALUES
(1, 1,  '2024/01/15', '2024/01/15' , 3, 2, 1,1, true, 1),
(2, 2,  '2024/02/01', '2024/02/01' , 2, 1, 2,2, true, 2),
(3, 3,  '2024/03/10', '2024/03/10' , 1, 3, 0,3, true, 3),
(4, 4,  '2024/04/05', '2024/04/05' , 4, 2, 1,4, true, 4),
(5, 5,  '2024/05/20', '2024/05/20' , 3, 1, 2,5, true, 5),
(6, 6,  '2024/06/10', '2024/06/10' , 1, 3, 0,6, false, 6),
(7, 7,  '2024/07/05', '2024/07/05' , 2, 2, 1,7, false, 7),
(8, 8,  '2024/08/20', '2024/08/20' , 4, 3, 2,8, false, 8),
(9, 9,  '2024/09/15', '2024/09/15' , 3, 2, 0,9, false, 9),
(10,10, '2024/10/30', '2024/10/30' ,1, 1, 1,10, false, 10),
(11,11, '2024/01/15', '2024/01/15' ,2, 3, 2,11, true, 11), 
(12,12, '2024/02/01', '2024/02/01' ,4, 2, 0,12, true, 12),
(13,13, '2024/03/10', '2024/03/10' ,1, 1, 1,13, true, 13),
(14,14, '2024/04/05', '2024/04/05' ,3, 3, 2,14, true, 14),
(15,15, '2024/05/20', '2024/05/20' ,2, 2, 0,15, true, 15),
(16,16, '2024/06/10', '2024/06/10' ,1, 1, 1,16, false,16),
(17,17, '2024/07/05', '2024/07/05' ,4, 3, 2,17, false,17),
(18,18, '2024/08/20', '2024/08/20' ,3, 2, 0,18, false,18),
(19,19, '2024/09/15', '2024/09/15' ,2, 3, 1,19, false,19),
(20,20,'2024/10/30', '2024/10/30' , 1, 1, 2,20, false,20),
(21,21, '2024/01/15', '2024/01/15' ,4, 2, 0,21, true, 21),
(22,22, '2024/02/01', '2024/02/01' ,3, 3, 1,22, true, 22),
(23,23, '2024/03/10', '2024/03/10' ,2, 2, 2,23, true, 23),
(24,24, '2024/04/05', '2024/04/05' ,1, 1, 0,24, true, 24),
(25,25, '2024/05/20', '2024/05/20' ,4, 3, 1,25, true, 25),
(26,26, '2024/06/10', '2024/06/10' ,3, 2, 2,26, false,26),
(27,27, '2024/07/05', '2024/07/05' ,2, 3, 0,27, false,27),
(28,28, '2024/08/20', '2024/08/20' ,1, 1, 1,28, false,28),
(29,29, '2024/09/15', '2024/09/15' ,4, 1, 2,29, false,29),
(30,30,'2024/10/30', '2024/10/30' , 3, 3, 0,30, false,30),
(31,31, '2024/01/15', '2024/01/15' ,1, 2, 1,31, true, 31),
(32,32, '2024/02/01', '2024/02/01' ,2, 3, 2,32, true, 32),
(33,33, '2024/03/10', '2024/03/10' ,3, 1, 0,33, true, 33),
(34,34, '2024/04/05', '2024/04/05' ,4, 2, 1,34, true, 34),
(35,35, '2024/05/20', '2024/05/20' ,1, 1, 2,35, true, 35),
(36,36, '2024/06/10', '2024/06/10' ,2, 2, 0,36, false,36),
(37,37, '2024/07/05', '2024/07/05' ,3, 3, 1,37, false,37),
(38,38, '2024/08/20', '2024/08/20' ,4, 3, 2,38, false,38),
(39,39, '2024/09/15', '2024/09/15' ,1, 1, 0,39, false,39),
(40,40,'2024/10/30', '2024/10/30' , 2, 3, 1,40, false,40),
(41,41, '2024/01/15', '2024/01/15' ,3, 1, 2,41, true, 41),
(42,42, '2024/02/01', '2024/02/01' ,4, 3, 0,42, true, 42),
(43,43, '2024/03/10', '2024/03/10' ,1, 2, 1,43, true, 43),
(44,44, '2024/04/05', '2024/04/05' ,2, 1, 2,44, true, 44),
(45,45, '2024/05/20', '2024/05/20' ,3, 3, 0,45, true, 45),
(46,46, '2024/06/10', '2024/06/10' ,4, 1, 0,46, false,46),
(47,47, '2024/07/05', '2024/07/05' ,1, 2, 1,47, false,47),
(48,48, '2024/08/20', '2024/08/20' ,2, 1, 2,48, false,48),
(49,49, '2024/09/15', '2024/09/15' ,3, 3, 0,49, false,49),
(50,50,'2024/10/30', '2024/10/30' , 4, 1, 1,50, false,50),
(51,1, '2024/01/15', '2024/01/15' , 3, 2, 1,51, true, 51),
(52,2, '2024/02/01', '2024/02/01' , 2, 1, 2,52, true, 52),
(53,3, '2024/03/10', '2024/03/10' , 1, 3, 0,53, true, 53),
(54,4, '2024/04/05', '2024/04/05' , 4, 2, 1,54, true, 54),
(55,5, '2024/05/20', '2024/05/20' , 3, 1, 2,55, true, 55),
(56,6, '2024/06/10', '2024/06/10' , 1, 3, 0,56, false,56),
(57,7, '2024/07/05', '2024/07/05' , 2, 2, 1,57, false,57),
(58,8, '2024/08/20', '2024/08/20' , 4, 3, 2,58, false,58),
(59,9, '2024/09/15', '2024/09/15' , 3, 2, 0,59, false,59),
(60,10,'2024/10/30', '2024/10/30' ,1, 1,  1,60, false,60);


INSERT INTO Avion (AVION_id, AVION_Modele, AVION_NbSiegeEconomique, AVION_NbSiegeEconomiquePremium, AVION_NbSiegeAffaire, AVION_NbSiegePremiereClasse, AVION_Longueur, AVION_Envergure, AVION_Hauteur, AVION_VitesseDeCroisiereEnKmH, AVION_Societe)
VALUES 
-- Avion français
(1, 'Airbus A380', 453, 64, 78, 14, 42, 79, 24.09, 900, 'AirFrance');
-- Avion italien
(2, 'Aermacchi M-346', 340, 21, 13, 45, 38, 9, 4., 1071, 'ITA Airways');
-- Avion espagnol
(3, 'Airbus A350', 440, 32, 92, 14, 66, 64, 17, 945, 'Air Europa');
-- Avion allemand
(4, 'Airbus A320', 380, 12, 24, 8, 37, 35, 11, 903, 'Hahn Air Lines');
-- Avion de Corée du Sud
(5, 'KAI KF-21 Boramae', 368, 54, 33, 24, 16, 10, 4, 836, 'Korean Air ');
-- Avion suisse
(6, 'Pilatus PC-12', 482, 34, 29, 37, 14, 16, 4, 500, 'Swiss');
-- Avion russe
(7, 'Sukhoi Superjet 100', 375, 28, 12, 29, 29, 27, 8, 840, 'Aeroflot');
-- Avion vietnamien
(8, 'Vietnam Airlines Airbus A321', 297, 54, 24, 28, 44, 35, 11, 876, 'Pacific Airlines');
-- Avion japonais
(9, 'Mitsubishi SpaceJet', 376, 45, 26, 35, 35, 31, 11, 903, 'All Nippon Airways');

CREATE TABLE Vol(
    VOL_id integer PRIMARY KEY NOT NULL,
    VOL_Avion integer,
    VOL_NbEscale integer,
    VOL_HeureDepart date,
    VOL_HeureAriver date,
    VOL_AeroportDepart varchar(50),
    VOL_AeroportArriver varchar(50),
    VOL_PrixBagageSoute integer,
    VOL_PrixBagageMain integer,
    VOL_PrixEconomique integer,
    VOL_PrixEconomiquePremium integer,
    VOL_PrixAffaire integer,
    VOL_PrixPremiereClasse integer
);

INSERT INTO Vol (VOL_id, VOL_Avion, VOL_NbEscale, VOL_DateDepart,VOL_HeureDepart, VOL_DateAriver,VOL_HeureAriver, VOL_AeroportDepart, VOL_AeroportArriver, VOL_PrixBagageSoute, VOL_PrixBagageMain, VOL_PrixEconomique, VOL_PrixEconomiquePremium, VOL_PrixAffaire, VOL_PrixPremiereClasse)
VALUES
(1, 1, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Léonard-de-Vinci de Rome', 'Paris-Charles de Gaulle', 30, 15, 450, 650, 1300, 2000),
(2, 1, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Barcelone-El Prat', 'Paris-Charles de Gaulle', 25, 10, 400, 600, 1200, 1800),
(3, 1, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Berlin-Brandenburg', 'Paris-Charles de Gaulle', 35, 20, 500, 700, 1400, 2200),
(4, 1, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Séoul Incheon', 'Paris-Charles de Gaulle', 40, 25, 550, 750, 1500, 2400),
(5, 1, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Moscou Sheremetyevo', 'Paris-Charles de Gaulle', 30, 15, 450, 650, 1300, 2000),
(6, 1, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Hanoi', 'Paris-Charles de Gaulle', 30, 15, 500, 700, 1400, 2200),
(7, 1, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Paris-Charles de Gaulle', 25, 10, 450, 650, 1300, 2000),
(8, 1, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Paris-Charles de Gaulle', 35, 20, 550, 750, 1500, 2400),
(9, 1, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Paris-Charles de Gaulle', 40, 25, 600, 800, 1600, 2600),
(10, 1, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Paris-Charles de Gaulle', 30, 15, 500, 700, 1400, 2200);          
(11, 2, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Léonard-de-Vinci de Rome', 30, 15, 450, 650, 1300, 2000),
(12, 2, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Barcelone-El Prat', 'Léonard-de-Vinci de Rome', 25, 10, 400, 600, 1200, 1800),
(13, 2, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Berlin-Brandenburg', 'Léonard-de-Vinci de Rome', 35, 20, 500, 700, 1400, 2200),
(14, 2, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Séoul Incheon', 'Léonard-de-Vinci de Rome', 40, 25, 550, 750, 1500, 2400),
(15, 2, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Moscou Sheremetyevo', 'Léonard-de-Vinci de Rome', 30, 15, 450, 650, 1300, 2000),
(16, 2, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Hanoi', 'Léonard-de-Vinci de Rome', 30, 15, 500, 700, 1400, 2200),
(17, 2, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Léonard-de-Vinci de Rome', 25, 10, 450, 650, 1300, 2000),
(18, 2, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Léonard-de-Vinci de Rome', 35, 20, 550, 750, 1500, 2400),
(19, 2, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Léonard-de-Vinci de Rome', 40, 25, 600, 800, 1600, 2600),
(20, 2, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Léonard-de-Vinci de Rome', 30, 15, 500, 700, 1400, 2200),     
(21, 3, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Barcelone-El Prat', 30, 15, 450, 650, 1300, 2000),
(22, 3, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Léonard-de-Vinci de Rome', 'Barcelone-El Prat', 25, 10, 400, 600, 1200, 1800),
(23, 3, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Berlin-Brandenburg', 'Barcelone-El Prat', 35, 20, 500, 700, 1400, 2200),
(24, 3, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Séoul Incheon', 'Barcelone-El Prat', 40, 25, 550, 750, 1500, 2400),
(25, 3, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Moscou Sheremetyevo', 'Barcelone-El Prat', 30, 15, 450, 650, 1300, 2000),
(26, 3, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Hanoi', 'Barcelone-El Prat', 30, 15, 500, 700, 1400, 2200),
(27, 3, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Barcelone-El Prat', 25, 10, 450, 650, 1300, 2000),
(28, 3, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Barcelone-El Prat', 35, 20, 550, 750, 1500, 2400),
(29, 3, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Barcelone-El Prat', 40, 25, 600, 800, 1600, 2600),
(30, 3, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Barcelone-El Prat', 30, 15, 500, 700, 1400, 2200),
(31, 4, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Berlin-Brandenburg', 30, 15, 450, 650, 1300, 2000),
(32, 4, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Léonard-de-Vinci de Rome', 'Berlin-Brandenburg', 25, 10, 400, 600, 1200, 1800),
(33, 4, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Barcelone-El Prat', 'Berlin-Brandenburg', 35, 20, 500, 700, 1400, 2200),
(34, 4, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Séoul Incheon', 'Berlin-Brandenburg', 40, 25, 550, 750, 1500, 2400),
(35, 4, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Moscou Sheremetyevo', 'Berlin-Brandenburg', 30, 15, 450, 650, 1300, 2000),
(36, 4, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Hanoi', 'Berlin-Brandenburg', 30, 15, 500, 700, 1400, 2200),
(37, 4, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Berlin-Brandenburg', 25, 10, 450, 650, 1300, 2000),
(38, 4, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Berlin-Brandenburg', 35, 20, 550, 750, 1500, 2400),
(39, 4, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Berlin-Brandenburg', 40, 25, 600, 800, 1600, 2600),
(40, 4, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Berlin-Brandenburg', 30, 15, 500, 700, 1400, 2200),   
(41, 5, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Séoul Incheon', 30, 15, 450, 650, 1300, 2000),
(42, 5, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Léonard-de-Vinci de Rome', 'Séoul Incheon', 25, 10, 400, 600, 1200, 1800),
(43, 5, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Barcelone-El Prat', 'Séoul Incheon', 35, 20, 500, 700, 1400, 2200),
(44, 5, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Berlin-Brandenburg', 'Séoul Incheon', 40, 25, 550, 750, 1500, 2400),
(45, 5, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Moscou Sheremetyevo', 'Séoul Incheon', 30, 15, 450, 650, 1300, 2000),
(46, 5, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Hanoi', 'Séoul Incheon', 30, 15, 500, 700, 1400, 2200),
(47, 5, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Séoul Incheon', 25, 10, 450, 650, 1300, 2000),
(48, 5, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Séoul Incheon', 35, 20, 550, 750, 1500, 2400),
(49, 5, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Séoul Incheon', 40, 25, 600, 800, 1600, 2600),
(50, 5, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Séoul Incheon', 30, 15, 500, 700, 1400, 2200),
(51, 6, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Zurich', 30, 15, 450, 650, 1300, 2000),
(52, 6, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Léonard-de-Vinci de Rome', 'Zurich', 25, 10, 400, 600, 1200, 1800),
(53, 6, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Barcelone-El Prat', 'Zurich', 35, 20, 500, 700, 1400, 2200),
(54, 6, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Berlin-Brandenburg', 'Zurich', 40, 25, 550, 750, 1500, 2400),
(55, 6, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Moscou Sheremetyevo', 'Zurich', 30, 15, 450, 650, 1300, 2000),
(56, 6, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Hanoi', 'Zurich', 30, 15, 500, 700, 1400, 2200),
(57, 6, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Zurich', 25, 10, 450, 650, 1300, 2000),
(58, 6, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Zurich', 35, 20, 550, 750, 1500, 2400),
(59, 6, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Zurich', 40, 25, 600, 800, 1600, 2600),
(60, 6, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Séoul Incheon', 'Zurich', 30, 15, 500, 700, 1400, 2200), 
(61, 7, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Moscou Sheremetyevo', 30, 15, 450, 650, 1300, 2000),
(62, 7, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Léonard-de-Vinci de Rome', 'Moscou Sheremetyevo', 25, 10, 400, 600, 1200, 1800),
(63, 7, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Barcelone-El Prat', 'Moscou Sheremetyevo', 35, 20, 500, 700, 1400, 2200),
(64, 7, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Berlin-Brandenburg', 'Moscou Sheremetyevo', 40, 25, 550, 750, 1500, 2400),
(65, 7, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Séoul Incheon', 'Moscou Sheremetyevo', 30, 15, 450, 650, 1300, 2000),
(66, 7, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Hanoi', 'Moscou Sheremetyevo', 30, 15, 500, 700, 1400, 2200),
(67, 7, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Moscou Sheremetyevo', 25, 10, 450, 650, 1300, 2000),
(68, 7, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Moscou Sheremetyevo', 35, 20, 550, 750, 1500, 2400),
(69, 7, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Moscou Sheremetyevo', 40, 25, 600, 800, 1600, 2600),
(70, 7, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Moscou Sheremetyevo', 30, 15, 500, 700, 1400, 2200),
(71, 8, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Hanoi', 30, 15, 450, 650, 1300, 2000),
(72, 8, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Léonard-de-Vinci de Rome', 'Hanoi', 25, 10, 400, 600, 1200, 1800),
(73, 8, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Barcelone-El Prat', 'Hanoi', 35, 20, 500, 700, 1400, 2200),
(74, 8, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Berlin-Brandenburg', 'Hanoi', 40, 25, 550, 750, 1500, 2400),
(75, 8, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Séoul Incheon', 'Hanoi', 30, 15, 450, 650, 1300, 2000),
(76, 8, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Moscou Sheremetyevo', 'Hanoi', 30, 15, 500, 700, 1400, 2200),
(77, 8, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Tokyo-Narita', 'Hanoi', 25, 10, 450, 650, 1300, 2000),
(78, 8, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Hanoi', 35, 20, 550, 750, 1500, 2400),
(79, 8, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Hanoi', 40, 25, 600, 800, 1600, 2600),
(80, 8, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Hanoi', 30, 15, 500, 700, 1400, 2200),
(91, 9, 1, '2024/01/15', 10, '2024/01/15' , 18, 'Paris-Charles de Gaulle', 'Tokyo-Narita', 30, 15, 450, 650, 1300, 2000),
(92, 9, 2, '2024/02/01', 14, '2024/02/01' , 22, 'Léonard-de-Vinci de Rome', 'Tokyo-Narita', 25, 10, 400, 600, 1200, 1800),
(93, 9, 1, '2024/03/10', 11, '2024/03/10' , 19, 'Barcelone-El Prat', 'Tokyo-Narita', 35, 20, 500, 700, 1400, 2200),
(94, 9, 0, '2024/04/05', 08, '2024/04/05' , 16, 'Berlin-Brandenburg', 'Tokyo-Narita', 40, 25, 550, 750, 1500, 2400),
(95, 9, 2, '2024/05/20', 16, '2024/05/20' , 23, 'Séoul Incheon', 'Tokyo-Narita', 30, 15, 450, 650, 1300, 2000),
(96, 9, 1, '2024/06/10', 09, '2024/06/10' , 17, 'Moscou Sheremetyevo', 'Tokyo-Narita', 30, 15, 500, 700, 1400, 2200),
(97, 9, 2, '2024/07/05', 13, '2024/07/05' , 21, 'Hanoi', 'Tokyo-Narita', 25, 10, 450, 650, 1300, 2000),
(98, 9, 1, '2024/08/20', 10, '2024/08/20' , 18, 'Heathrow', 'Tokyo-Narita', 35, 20, 550, 750, 1500, 2400),
(99, 9, 0, '2024/09/15', 08, '2024/09/15' , 16, 'Pékin-Capitale', 'Tokyo-Narita', 40, 25, 600, 800, 1600, 2600),
(100, 9, 2,'2024/10/30', 16, '2024/10/30' , 23, 'Lisbonne-Portela', 'Tokyo-Narita', 30, 15, 500, 700, 1400, 2200),


CREATE TABLE ReservationVol(
    RESERVVLO_id integer PRIMARY KEY NOT NULL,
    RESERVVLO_Client integer,
    RESERVVLO_Vol integer,
    RESERVVLO_VolRetour integer,
    RESERVVLO_Classe varchar(50),
    RESERVVLO_NbEnfant integer,
    RESERVVLO_NbAdulte integer,
    RESERVVLO_NbAnimaux integer,
    RESERVVLO_DateArriver date,
    RESERVVLO_DateDepart date,
    RESERVHAB_Pack_Voyage_Extra boolean,
    RESERVVLO_PrixTotal integer
);

INSERT INTO ReservationHabitation (RESERVHAB_id,RESERVHAB_Client, RESERVHAB_DateArriver, RESERVHAB_DateDepart, RESERVHAB_NbAdulte, RESERVHAB_NbEnfant, RESERVHAB_NbAnimaux, RESERVHAB_Habitation)
VALUES
(1, 1, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 61),
(2, 2, 13,32, 'EconomiquePremium' , 1, 1, 1,'2024/01/15', '2024/01/15' ,  true, 62),
(3, 3, 1,11, 'Affaire' , 5, 0, 0,'2024/01/15', '2024/01/15' ,  true, 63),
(4, 4, 1,11, 'PremiereClasse' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 64),
(5, 5, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 65),
(6, 6, 1,11, 'EconomiquePremium' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 66),
(7, 7, 1,11, 'Affaire' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 67),
(8, 8, 1,11, 'PremiereClasse' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 68),
(9, 9, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 69),
(10,10,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 70),
(11,11,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 71), 
(12,12,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 72),
(13,13,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 73),
(14,14,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 74),
(15,15,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 75),
(16,16,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 76),
(17,17,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 77),
(18,18,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 78),
(19,19,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 79),
(20,20,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 80),
(21,21,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 81),
(22,22,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 82),
(23,23,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 83),
(24,24,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 84),
(25,25,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 85),
(26,26,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 86),
(27,27,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 87),
(28,28,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 88),
(29,29,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 89),
(30,30,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 90),
(31,31,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 91),
(32,32,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 92),
(33,33,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 93),
(34,34,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 94),
(35,35,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 95),
(36,36,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 96),
(37,37,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 97),
(38,38,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 98),
(39,39,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 99),
(40,40,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 100),
(41,41,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 101),
(42,42,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 102),
(43,43,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 103),
(44,44,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 104),
(45,45,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 105),
(46,46,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 106),
(47,47,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 107),
(48,48,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 108),
(49,49,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 109),
(50,50,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 110),
(51,1, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 111),
(52,2, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 112),
(53,3, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 113),
(54,4, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 114),
(55,5, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 115),
(56,6, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 116),
(57,7, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 117),
(58,8, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 118),
(59,9, 1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 119),
(60,10,1,11, 'Economique' , 3, 2, 1,'2024/01/15', '2024/01/15' ,  true, 120),




     
-- pour afficher une table 
SELECT * FROM NomDeLaTable

-- afficher toute les donnÃ©e du client numéro X
SELECT 
    Compte.COMPTE_Nom, 
    Compte.COMPTE_Prenom, 
    Compte.COMPTE_sexe, 
    Compte.COMPTE_DateDeNaissance, 
    Compte.COMPTE_LangueNatal, 
    Compte.COMPTE_NumTel, 
    Compte.COMPTE_AdresseMail, 
    Compte.COMPTE_MotDePasse, 
    Paiement.PAIEMENT_NumCarte, 
    Paiement.PAIEMENT_DateExpiration, 
    Paiement.PAIEMENT_cryptograme
FROM 
    Client
JOIN 
    Compte ON Client.CLIENT_compte = Compte.COMPTE_id
JOIN 
    Paiement ON Client.CLIENT_paiement = Paiement.PAIEMENT_id
WHERE 
    Client.CLIENT_id = IDClientX;

-- afficher toute les regles habitation d'un hotel numéro X
SELECT
    Regles_habitation.*
FROM
    Hotel
JOIN
    Habitation ON Hotel.HOTEL_Habitation = Habitation.HAB_id
JOIN
    Regles_habitation ON Habitation.HAB_Regle = Regles_habitation.REGLE_id
WHERE
    Hotel.HOTEL_id = IDHottelX;

-- afficher les aviont qui vol entre une heur de depart et une heur d'ariver donnée
SELECT
    *
FROM
    Vol
WHERE
    VOL_HeureDepart >= 'Heur_de_départ'
    AND VOL_HeureAriver <= 'heur_d_ariver';

-- affiche tout les couchage pour un Id  de hotel donnée 
SELECT
    Couchage.*
FROM
    Hotel
JOIN
    Habitation ON Hotel.HOTEL_Habitation = Habitation.HAB_id
JOIN
    Couchage ON Habitation.HAB_Piece = Couchage.COUCHAGE_id
WHERE
    Hotel.HOTEL_id = VOTRE_ID_HOTEL;

--Afficher tous les hébergements avec leurs noms, localisations et notes
SELECT HAB_id, HAB_Superficie, HAB_Petit_dejeuner, HAB_Horaire_ouverture, HAB_Horaire_fermeture, HAB_InfoSuppURL
FROM Habitation;

--Afficher les réservations d'hébergement avec les dates d'arrivée, de départ et le nombre d'adultes
SELECT RESERVHAB_id, RESERVHAB_DateArriver, RESERVHAB_DateDepart, RESERVHAB_NbAdulte
FROM ReservationHabitation;

-- Afficher les informations complètes des réservations d'hébergement, y compris les détails sur l'hébergement et le client
SELECT RH.RESERVHAB_id, RH.RESERVHAB_DateArriver, RH.RESERVHAB_DateDepart, RH.RESERVHAB_NbAdulte, 
H.HAB_id, H.HAB_Superficie, H.HAB_Petit_dejeuner, H.HAB_InfoSuppURL, C.CLIENT_id, C.CLIENT_compte, C.CLIENT_paiement
FROM ReservationHabitation RH
JOIN Habitation H ON RH.RESERVHAB_Habitation = H.HAB_id
JOIN Client C ON RH.RESERVHAB_Client = C.CLIENT_id;

--Afficher les informations détaillées sur les réservations de vols, y compris les détails sur le vol, le client et le prix total
SELECT RV.RESERVVLO_id, RV.RESERVVLO_DateArriver, RV.RESERVVLO_DateDepart, RV.RESERVVLO_NbAdulte, V.VOL_id, V.VOL_HeureDepart, 
V.VOL_HeureAriver, V.VOL_AeroportDepart, V.VOL_AeroportArriver, C.CLIENT_id, C.CLIENT_compte, P.PAIEMENT_id, P.PAIEMENT_NumCarte, 
P.PAIEMENT_DateExpiration, P.PAIEMENT_cryptograme, RV.RESERVVLO_PrixTotal
FROM ReservationVol RV
JOIN Vol V ON RV.RESERVVLO_Vol = V.VOL_id
JOIN Client C ON RV.RESERVVLO_Client = C.CLIENT_id
JOIN Paiement P ON C.CLIENT_paiement = P.PAIEMENT_id;