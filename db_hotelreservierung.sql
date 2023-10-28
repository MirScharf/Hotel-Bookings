-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 28. Okt 2023 um 19:58
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_hotelreservierung`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ausstattung`
--

CREATE TABLE `ausstattung` (
  `nummer` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `aufpreis_einmalig` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `ausstattung`
--

INSERT INTO `ausstattung` (`nummer`, `name`, `aufpreis_einmalig`) VALUES
(1, 'Fernseher', 10),
(2, 'Balkon', 12),
(3, 'Klimaanlage', 15),
(4, 'Minibar', 20),
(5, 'Privatsafe', 20),
(6, 'Meerblick', 50),
(7, 'Lounge', 60);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buchung`
--

CREATE TABLE `buchung` (
  `buchungsnummer` int(11) NOT NULL,
  `anreise` date DEFAULT NULL,
  `abreise` date DEFAULT NULL,
  `reservierung` datetime DEFAULT NULL,
  `zimmernummer` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `buchung`
--

INSERT INTO `buchung` (`buchungsnummer`, `anreise`, `abreise`, `reservierung`, `zimmernummer`) VALUES
(1, '2016-04-01', '2016-04-21', '2016-01-03 12:23:00', 11),
(2, '2016-04-03', '2016-04-05', '2016-02-08 10:11:00', 12),
(3, '2016-04-05', '2016-04-08', '2016-03-30 09:15:00', 33),
(4, '2016-04-05', '2016-04-24', '2016-02-09 15:32:00', 44),
(5, '2016-04-08', '2016-04-12', '2016-03-20 10:00:00', 22),
(6, '2016-04-15', '2016-04-20', '2016-04-10 08:10:00', 40),
(7, '2016-04-22', '2016-05-10', '2016-04-15 12:00:00', 24),
(8, '2016-05-10', '2016-05-25', '2016-02-13 15:00:00', 25),
(9, '2016-05-12', '2016-05-19', '2016-02-18 08:35:00', 31),
(10, '2016-05-22', '2016-05-24', '2016-03-23 07:12:00', 15),
(11, '2016-05-04', '2016-05-29', '2016-02-27 20:00:00', 35),
(12, '2016-06-06', '2016-06-12', '2016-03-05 23:22:00', 40),
(13, '2016-06-13', '2016-06-28', '2016-03-20 14:08:00', 22),
(14, '2016-06-25', '2016-07-08', '2016-01-28 12:09:00', 15),
(15, '2016-07-04', '2016-07-09', '2016-05-05 15:05:00', 22),
(16, '2016-07-06', '2016-07-18', '2016-05-08 22:00:00', 11),
(17, '2016-07-09', '2016-08-02', '2016-03-01 07:00:00', 35),
(18, '2016-07-12', '2016-07-21', '2016-06-06 05:45:00', 31);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buchung_optionen`
--

CREATE TABLE `buchung_optionen` (
  `nummer` int(11) NOT NULL,
  `buchung` int(11) DEFAULT NULL,
  `optionen` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `buchung_optionen`
--

INSERT INTO `buchung_optionen` (`nummer`, `buchung`, `optionen`) VALUES
(1, 1, 2),
(2, 1, 6),
(3, 1, 10),
(4, 2, 1),
(5, 3, 1),
(6, 4, 4),
(7, 4, 5),
(8, 5, 3),
(9, 6, 1),
(10, 7, 2),
(11, 8, 3),
(12, 8, 7),
(13, 8, 11),
(14, 9, 4),
(15, 9, 7),
(16, 9, 8),
(17, 9, 9),
(18, 10, 3),
(19, 10, 5),
(20, 10, 6),
(21, 10, 7),
(22, 11, 2),
(23, 11, 8),
(24, 12, 1),
(25, 12, 9),
(26, 12, 6),
(27, 13, 3),
(28, 13, 11),
(29, 14, 4),
(30, 14, 5),
(31, 14, 8),
(32, 15, 1),
(33, 15, 9),
(34, 16, 1),
(35, 16, 9),
(36, 16, 10),
(37, 17, 1),
(38, 17, 9),
(39, 18, 1),
(40, 18, 9),
(41, 18, 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buchung_person`
--

CREATE TABLE `buchung_person` (
  `nummer` smallint(6) NOT NULL,
  `buchung` int(11) NOT NULL,
  `person` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `buchung_person`
--

INSERT INTO `buchung_person` (`nummer`, `buchung`, `person`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 2, 2),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 4, 8),
(9, 4, 9),
(10, 5, 10),
(11, 5, 11),
(12, 6, 12),
(13, 6, 13),
(14, 7, 14),
(15, 7, 15),
(16, 8, 16),
(17, 8, 17),
(18, 8, 18),
(19, 9, 19),
(20, 10, 20),
(21, 10, 21),
(22, 10, 22),
(23, 11, 23),
(24, 11, 24),
(25, 12, 25),
(26, 12, 26),
(27, 13, 27),
(28, 13, 28),
(29, 14, 29),
(30, 14, 30),
(31, 14, 31),
(32, 15, 32),
(33, 15, 33),
(34, 16, 34),
(35, 17, 23),
(36, 17, 24),
(37, 18, 19);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `optionen`
--

CREATE TABLE `optionen` (
  `nummer` smallint(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `preis_tag_person` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `optionen`
--

INSERT INTO `optionen` (`nummer`, `name`, `preis_tag_person`) VALUES
(1, 'Fruehstueck', 5),
(2, 'Halbpension', 20),
(3, 'Vollpension', 40),
(4, 'All Inclusive', 50),
(5, 'Tischtennis', 3),
(6, 'Tennis', 6),
(7, 'Fussball', 3),
(8, 'Volleyball', 5),
(9, 'W-Lan', 2),
(10, 'Sauna', 10),
(11, 'Fitness', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `kundennummer` int(11) NOT NULL,
  `vorname` varchar(30) NOT NULL,
  `nachname` varchar(30) NOT NULL,
  `strasse` varchar(60) NOT NULL,
  `ort` varchar(30) NOT NULL,
  `plz` varchar(5) NOT NULL,
  `anrede` varchar(4) DEFAULT NULL,
  `telefonnummer` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`kundennummer`, `vorname`, `nachname`, `strasse`, `ort`, `plz`, `anrede`, `telefonnummer`) VALUES
(1, 'Elke', 'Bach', 'Rothenbaumchaussee 120', 'Hamburg', '20149', 'Frau', '040 / 23456781'),
(2, 'Horst', 'Bach', 'Rothenbaumchaussee 120', 'Hamburg', '20149', 'Herr', '040 / 23456781'),
(3, 'Reiner', 'Kanne', 'Hausberg 61', 'Dresden', '1326', 'Herr', '0351 / 7369274'),
(4, 'Rolf', 'Mueller', 'Bauernstrasse 4', 'Bremen', '28219', 'Herr', '0421 / 334567'),
(5, 'Anton', 'Mueller', 'Bauernstrasse 4', 'Bremen', '28219', 'Herr', '0421 / 334567'),
(6, 'Waltraud', 'Mueller', 'Bauernstrasse 4', 'Bremen', '28219', 'Frau', '0421 / 334567'),
(7, 'Karin', 'Mueller', 'Bauernstrasse 4', 'Bremen', '28219', 'Frau', '0421 / 334567'),
(8, 'Karl', 'Lender', 'Hauptstrasse 12', 'Bremen', '28389', 'Herr', '0421/3782721'),
(9, 'Anna', 'Bolika', 'Bahnhofstrasse 5', 'Bremen', '26790', 'Frau', '0421/4672284'),
(10, 'Rainer', 'Zufall', 'Kirchweg 2', 'Berlin', '69666', 'Herr', '030/377495'),
(11, 'Lukas', 'Traube', 'Schulstrasse 12', 'Hannover', '30234', 'Herr', '0511/95824'),
(12, 'Felix', 'Wein', 'Gartenstrasse 16', 'Osnabrueck', '49012', 'Herr', '0541/692374'),
(13, 'Mareike', 'Schlemmer', 'Amselweg 17', 'Dresden', '1547', 'Frau', '0351/492860'),
(14, 'Moritz', 'Bohmhoff', 'Ahornweg 20', 'Berlin', '69456', 'Herr', '030/95284'),
(15, 'Louis', 'Lampe', 'Starenweg 82', 'Bremen', '28219', 'Herr', '0421 / 547633'),
(16, 'Frederike', 'Kraft', 'Frankfurter Ring 124', 'Muenchen', '80807', 'Herr', '089 / 97252756'),
(17, 'Walter', 'Zimmermann', 'Lammertweg 34', 'Leipzig', '4207', 'Herr', '0341 / 8735652'),
(18, 'Karin', 'Struss', 'Obere Kirchgasse 4', 'Heidelberg', '69121', 'Frau', '06221 / 762396'),
(19, 'Mustafa', 'Ali', 'Feldstrasse 12', 'Frankfurt', '60542', 'Herr', '069/49127'),
(20, 'Christoph', 'Reele', 'Am Sportplatz', 'Oldenburg', '26145', 'Herr', '0441/49234'),
(21, 'Chantal', 'Reele', 'Am Sportplatz', 'Oldenburg', '26145', 'Frau', '0441/49235'),
(22, 'Mark', 'Reele', 'Lerchenweg 4', 'Oldenburg', '26145', 'Herr', '0441/49234'),
(23, 'Dieter', 'Bohne', 'Poststrasse 12', 'Hessen', '34963', 'Herr', '06641/902348'),
(24, 'Anastasia', 'Vogel', 'Muehlenstrasse 22', 'Hannover', '30324', 'Frau', '0511/195404'),
(25, 'Max', 'Mustermann', 'Lessingstrasse 46', 'Bremen', '28564', 'Herr', '0421/926842'),
(26, 'Malte', 'Seidenhof', 'Opernstrasse 23', 'Muenchen', '80643', 'Herr', '089/295378'),
(27, 'Melanie', 'Meyer', 'Schlossparkallee 12', 'Hannover', '30534', 'Frau', '0511/4907483'),
(28, 'Julia', 'Crest', 'Koenigsberger Strasse 5', 'Mainz', '55493', 'Frau', '06131/348034'),
(29, 'Iris', 'Gleichen', 'Burgstrasse 66', 'Duesseldorf', '40342', 'Frau', '0211/406735'),
(30, 'Angela', 'Anaconda', 'Wienerstrasse 52', 'Koeln', '51234', 'Frau', '0221/953451'),
(31, 'Felix', 'Gleichen', 'Burgstrasse 66', 'Duesseldorf', '40342', 'Herr', '0211/406735'),
(32, 'Ruediger', 'Steinmeier', 'Feldweg 38', 'Mainz', '55493', 'Herr', '06131/396756'),
(33, 'Bettina', 'Steinmeier', 'Feldweg 39', 'Mainz', '55493', 'Frau', '06131/396757'),
(34, 'Wilhelm', 'Schweiger', 'Buschweg 77', 'Hannover', '30324', 'Herr', '0511/305404');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zimmer`
--

CREATE TABLE `zimmer` (
  `raumnummer` int(11) NOT NULL,
  `etage` tinyint(4) DEFAULT NULL,
  `qm` smallint(6) NOT NULL,
  `betten` tinyint(4) NOT NULL,
  `art` tinyint(4) DEFAULT NULL,
  `preis_tag` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `zimmer`
--

INSERT INTO `zimmer` (`raumnummer`, `etage`, `qm`, `betten`, `art`, `preis_tag`) VALUES
(11, 1, 15, 1, 2, 76.5),
(12, 1, 20, 2, 1, 127),
(15, 1, 24, 3, 3, 158),
(21, 2, 18, 2, 4, 159),
(22, 2, 18, 2, 1, 124),
(23, 2, 18, 2, 1, 124),
(24, 2, 16, 2, 1, 50),
(25, 2, 24, 3, 3, 150),
(31, 3, 12, 1, 2, 88),
(33, 3, 30, 4, 3, 241),
(35, 3, 22, 2, 5, 210),
(40, 4, 26, 2, 5, 252),
(42, 4, 42, 2, 5, 253),
(44, 4, 25, 2, 1, 170);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zimmerart`
--

CREATE TABLE `zimmerart` (
  `nummer` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `aufpreis_einmalig` float DEFAULT NULL,
  `beschreibung` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `zimmerart`
--

INSERT INTO `zimmerart` (`nummer`, `name`, `aufpreis_einmalig`, `beschreibung`) VALUES
(1, 'Doppelzimmer', 20, 'Ein Doppelzimmer ist ein Zimmer mit Schlafgelegenheiten f?r zwei Personen in einem Doppelbett oder zwei l?ngsseits aneinandergef?gten Einzelbetten.'),
(2, 'Einzelzimmer', 0, 'Ein Einzelzimmer ist ein Zimmer mit Schlafgelegenheit f?r nur eine Person.'),
(3, 'Familienzimmer', 30, 'Ein Familienzimmer ist ein Zimmer mit Schlafgelegenheiten f?r drei oder mehr Personen, von denen mindestens zwei f?r Erwachsene geeignet sind.'),
(4, 'Juniorsuite', 35, 'Eine Juniorsuite ist eine Unterkunft in einem Raum mit zus?tzlichem Platz f?r Sitzgelegenheiten.'),
(5, 'Suite', 45, 'Eine Suite ist eine Unterkunft mit separaten, verbundenen Schlaf- und Wohnr?umen.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zimmer_ausstattung`
--

CREATE TABLE `zimmer_ausstattung` (
  `nummer` int(11) NOT NULL,
  `zimmer` smallint(6) DEFAULT NULL,
  `ausstattung` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `zimmer_ausstattung`
--

INSERT INTO `zimmer_ausstattung` (`nummer`, `zimmer`, `ausstattung`) VALUES
(1, 11, 1),
(2, 11, 2),
(3, 11, 3),
(4, 24, 1),
(5, 24, 2),
(6, 31, 1),
(7, 31, 2),
(8, 31, 3),
(9, 12, 1),
(10, 12, 2),
(11, 12, 3),
(12, 12, 4),
(13, 15, 1),
(14, 15, 2),
(15, 15, 3),
(16, 15, 4),
(17, 21, 1),
(18, 21, 2),
(19, 21, 3),
(20, 21, 4),
(21, 22, 1),
(22, 22, 2),
(23, 22, 3),
(24, 22, 4),
(25, 23, 1),
(26, 23, 2),
(27, 23, 3),
(28, 25, 1),
(29, 25, 2),
(30, 25, 3),
(31, 33, 1),
(32, 33, 2),
(33, 33, 3),
(34, 33, 4),
(35, 33, 5),
(36, 33, 6),
(37, 35, 1),
(38, 35, 2),
(39, 35, 3),
(40, 35, 4),
(41, 35, 5),
(42, 35, 6),
(43, 40, 1),
(44, 40, 2),
(45, 40, 3),
(46, 40, 4),
(47, 40, 5),
(48, 40, 6),
(49, 40, 7),
(50, 42, 1),
(51, 42, 2),
(52, 42, 3),
(53, 42, 4),
(54, 42, 5),
(55, 42, 6),
(56, 42, 7),
(57, 44, 1),
(58, 44, 2),
(59, 44, 3),
(60, 44, 4),
(61, 44, 5);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ausstattung`
--
ALTER TABLE `ausstattung`
  ADD PRIMARY KEY (`nummer`);

--
-- Indizes für die Tabelle `buchung`
--
ALTER TABLE `buchung`
  ADD PRIMARY KEY (`buchungsnummer`);

--
-- Indizes für die Tabelle `buchung_optionen`
--
ALTER TABLE `buchung_optionen`
  ADD PRIMARY KEY (`nummer`);

--
-- Indizes für die Tabelle `buchung_person`
--
ALTER TABLE `buchung_person`
  ADD PRIMARY KEY (`nummer`);

--
-- Indizes für die Tabelle `optionen`
--
ALTER TABLE `optionen`
  ADD PRIMARY KEY (`nummer`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`kundennummer`);

--
-- Indizes für die Tabelle `zimmer`
--
ALTER TABLE `zimmer`
  ADD PRIMARY KEY (`raumnummer`);

--
-- Indizes für die Tabelle `zimmerart`
--
ALTER TABLE `zimmerart`
  ADD PRIMARY KEY (`nummer`);

--
-- Indizes für die Tabelle `zimmer_ausstattung`
--
ALTER TABLE `zimmer_ausstattung`
  ADD PRIMARY KEY (`nummer`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ausstattung`
--
ALTER TABLE `ausstattung`
  MODIFY `nummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `buchung`
--
ALTER TABLE `buchung`
  MODIFY `buchungsnummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `buchung_optionen`
--
ALTER TABLE `buchung_optionen`
  MODIFY `nummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT für Tabelle `buchung_person`
--
ALTER TABLE `buchung_person`
  MODIFY `nummer` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT für Tabelle `optionen`
--
ALTER TABLE `optionen`
  MODIFY `nummer` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `kundennummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT für Tabelle `zimmerart`
--
ALTER TABLE `zimmerart`
  MODIFY `nummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `zimmer_ausstattung`
--
ALTER TABLE `zimmer_ausstattung`
  MODIFY `nummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
