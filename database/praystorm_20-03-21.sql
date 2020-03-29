-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Mrz 2020 um 18:52
-- Server-Version: 10.1.19-MariaDB
-- PHP-Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `praystorm`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `date`) VALUES
(1, 'praystorm', 'Ablauf praystorm Lobpreisabend', '2020-04-04'),
(3, 'Jugengottesdienst', 'Ablauf Jugengottesdiens', '2020-04-04');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parts`
--

CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('SONG','INSERT') NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `indivSeq` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `parts`
--

INSERT INTO `parts` (`id`, `title`, `type`, `author`, `album`, `copyright`, `indivSeq`) VALUES
(1, 'One Way', 'SONG', 'Hillsong Worship', 'Ultimate Worship Vol 1', 'Hillsong Music 2006\nWords & Music by Joel Houston and Jonathon Douglass', NULL),
(15, 'Der Mond ist aufgegangen\r\n', 'SONG', NULL, NULL, 'CCLI-Liednummer 4335292\r\nMatthias Claudius\r\nPublic Domain \r\nNutzung ausschlieÃŸlich im Rahmen der SongSelectÂ®-Nutzungsbedingungen. Alle Rechte vorbehalten. www.ccli.com\r\n', NULL),
(22, 'Von guten MÃ¤chten treu und still umgeben\r\n', 'SONG', NULL, NULL, 'CCLI-Liednummer 4891516\r\nDietrich Bonhoeffer\r\nPublic Domain \r\nNutzung ausschlieÃŸlich im Rahmen der SongSelectÂ®-Nutzungsbedingungen. Alle Rechte vorbehalten. www.ccli.com\r\n', NULL),
(23, 'Macht hoch die TÃ¼r die Tor macht weit\r\n', 'SONG', NULL, NULL, 'CCLI-Liednummer 5588206\r\nGeorg Weissel | Johann Anastasius Freylinghausen\r\nÂ© Words: Public Domain \r\nMusic: Public Domain \r\n', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parts_to_event`
--

CREATE TABLE `parts_to_event` (
  `id` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `position` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `parts_to_event`
--

INSERT INTO `parts_to_event` (`id`, `eventID`, `partID`, `position`) VALUES
(1, 1, 1, 0),
(2, 1, 15, 0),
(7, 3, 22, 2),
(8, 3, 23, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `shorthand` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `type` enum('SONGPART','IMAGE','VIDEO','TEXT') NOT NULL,
  `data` longtext NOT NULL,
  `numOfLang` int(1) NOT NULL DEFAULT '1',
  `styleID` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `slides`
--

INSERT INTO `slides` (`id`, `partID`, `title`, `shorthand`, `position`, `type`, `data`, `numOfLang`, `styleID`) VALUES
(1, 1, 'Vers 1', 'V1', 0, 'SONGPART', '{\n    "lyrics": [\n      "I lay my life down at Your feet",\n      "You''re the only One I need","I turn to You and You are always there",\n      "In troubled times it''s all I need",\n      "I humble all I am all to You"\n    ], \n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4"\n  }', 1, 1),
(2, 1, 'Chorus', 'C', 1, 'SONGPART', '{\r\n    "lyrics": [\r\n      "One way, Jesus!",\r\n"You''re the only one that I could live for",\r\n"One Way, Jesus!",\r\n"You''re the only one that I could live for"\r\n    ], \r\n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\r\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4"\r\n  }', 1, 1),
(3, 1, 'Vers 2', 'V2', 2, 'SONGPART', '{\r\n    "lyrics": [\r\n      "I lay my life down at Your feet",\r\n      "You''re the only One I need","I turn to You and You are always there",\r\n      "In troubled times it''s all I need",\r\n      "I humble all I am all to You"\r\n    ], \r\n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\r\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4"\r\n  }', 1, 1),
(4, 1, 'Bridge', 'B', 3, 'SONGPART', '{\r\n    "lyrics": [\r\n      "I lay my life down at Your feet",\r\n      "You''re the only One I need","I turn to You and You are always there",\r\n      "In troubled times it''s all I need",\r\n      "I humble all I am all to You"\r\n    ], \r\n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\r\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4"\r\n  }', 1, 1),
(38, 15, 'Vers 1', 'V1', 0, 'SONGPART', '{\r\n    "lyrics": [\r\n      "I lay my life down at Your feet",\r\n      "You''re the only One I need","I turn to You and You are always there",\r\n      "In troubled times it''s all I need",\r\n      "I humble all I am all to You"\r\n    ], \r\n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\r\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4",\r\n    "text": "<h1>Das ist ein Text mit echtem HTML</h1>"\r\n  }', 1, 1),
(39, 15, 'Chorus', 'C', 1, 'SONGPART', '{\r\n    "lyrics": [\r\n      "I lay my life down at Your feet",\r\n      "You''re the only One I need","I turn to You and You are always there",\r\n      "In troubled times it''s all I need",\r\n      "I humble all I am all to You"\r\n    ], \r\n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\r\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4",\r\n    "text": "<h1>Das ist ein Text mit echtem HTML</h1>"\r\n  }', 1, 1),
(40, 15, 'Vers 2', 'V2', 2, 'SONGPART', '{\r\n    "lyrics": [\r\n      "I lay my life down at Your feet",\r\n      "You''re the only One I need","I turn to You and You are always there",\r\n      "In troubled times it''s all I need",\r\n      "I humble all I am all to You"\r\n    ], \r\n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\r\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4",\r\n    "text": "<h1>Das ist ein Text mit echtem HTML</h1>"\r\n  }', 1, 1),
(41, 15, 'Bridge', 'B', 3, 'SONGPART', '{\r\n    "lyrics": [\r\n      "I lay my life down at Your feet",\r\n      "You''re the only One I need","I turn to You and You are always there",\r\n      "In troubled times it''s all I need",\r\n      "I humble all I am all to You"\r\n    ], \r\n    "image": "http://localhost/praystorm-beamer-backend/images/test.jpg",\r\n    "video": "http://localhost/praystorm-beamer-backend/images/video.mp4",\r\n    "text": "<h1>Das ist ein Text mit echtem HTML</h1>"\r\n  }', 1, 1),
(60, 22, 'Vers 1\r\n', 'V1\r\n', 0, 'SONGPART', '{"lyrics":["Von guten M\\u00e4chten treu und still umgeben,","beh\\u00fctet und getr\\u00f6stet wunderbar.","So will ich diese Tage mit euch leben","und mit euch gehen in ein neues Jahr."],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(61, 22, 'Chorus\r\n', 'C', 1, 'SONGPART', '{"lyrics":["Von guten M\\u00e4chten wunderbar geborgen,","erwarten wir getrost, was kommen mag.","Gott ist bei uns am Abend und am Morgen","und ganz gewiss an jedem neuen Tag."],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(62, 22, 'Vers 2\r\n', 'V2\r\n', 2, 'SONGPART', '{"lyrics":["Noch will das alte unsre Herzen qu\\u00e4len,","noch dr\\u00fcckt uns b\\u00f6ser Tage schwere Last.","Ach, Herr, gib unsern aufgeschreckten Seelen","das Heil, f\\u00fcr das du uns geschaffen hast."],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(63, 22, 'Vers 3\r\n', 'V3\r\n', 3, 'SONGPART', '{"lyrics":["Und reichst du uns den schweren Kelch, den bittern","des Leids, gef\\u00fcllt bis an den h\\u00f6chsten Rand,","So nehmen wir ihn dankbar ohne Zittern","aus deiner guten und geliebten Hand."],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(64, 22, 'Vers 4\r\n', 'V4\r\n', 4, 'SONGPART', '{"lyrics":["Doch willst du uns noch einmal Freude schenken","an dieser Welt und ihrer Sonne Glanz,","Dann wolln wir des Vergangenen gedenken","und dann geh\\u00f6rt dir unser Leben ganz."],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(65, 22, 'Vers 5\r\n', 'V5\r\n', 5, 'SONGPART', '{"lyrics":["Lass warm und hell die Kerzen heute flammen,","die du in unsre Dunkelheit gebracht.","F\\u00fchr, wenn es sein kann, wieder uns zusammen.","Wir wissen es, dein Licht scheint in der Nacht."],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(66, 22, 'Vers 6\r\n', 'V6\r\n', 6, 'SONGPART', '{"lyrics":["Wenn sich die Stille nun tief um uns breitet,","So lass uns h\\u00f6ren jenen vollen Klang","Der Welt, die unsichtbar sich um uns weitet,","All deiner Kinder hohen Lobgesang."],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(67, 23, 'Vers 1\r\n', 'V1\r\n', 0, 'SONGPART', '{"lyrics":["Macht hoch die T\\u00fcr, die Tor macht weit;","es kommt der Herr der Herrlichkeit,","ein K\\u00f6nig aller K\\u00f6nigreich,","ein Heiland aller Welt zugleich,","der Heil und Leben mit sich bringt;","derhalben jauchzt, mit Freuden singt:","Gelobet sei mein Gott,","mein Sch\\u00f6pfer reich an Rat!"],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(68, 23, 'Vers 2\r\n', 'V2\r\n', 1, 'SONGPART', '{"lyrics":["Er ist gerecht, ein Helfer wert;","Sanftm\\u00fctigkeit ist sein Gef\\u00e4hrt,","sein K\\u00f6nigskron ist Heiligkeit,","sein Zepter ist Barmherzigkeit;","all unsre Not zum End er bringt,","derhalben jauchzt, mit Freuden singt:","Gelobet sei mein Gott,","mein Heiland gro\\u00df von Tat!"],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(69, 23, 'Vers 3\r\n', 'V3\r\n', 2, 'SONGPART', '{"lyrics":["O wohl dem Land, o wohl der Stadt,","so diesen K\\u00f6nig bei sich hat!","Wohl allen Herzen insgemein,","da dieser K\\u00f6nig ziehet ein!","Er ist die rechte Freudensonn,","bringt mit sich lauter Freud und Wonn.","Gelobet sei mein Gott,","mein Tr\\u00f6ster fr\\u00fch und spat!"],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(70, 23, 'Vers 4\r\n', 'V4\r\n', 3, 'SONGPART', '{"lyrics":["Macht hoch die T\\u00fcr, die Tor macht weit!","Eur Herz zum Tempel zubereit''.","Die Zweiglein der Gottseligkeit","steckt auf mit Andacht, Lust und Freud;","so kommt der K\\u00f6nig auch zu euch,","ja, Heil und Leben mit zugleich.","Gelobet sei mein Gott,","voll Rat, voll Tat, voll Gnad!"],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1),
(71, 23, 'Vers 5\r\n', 'V5\r\n', 4, 'SONGPART', '{"lyrics":["Komm, o mein Heiland Jesu Christ,","meins Herzens T\\u00fcr dir offen ist.","Ach zieh mit deiner Gnade ein;","dein Freundlichkeit auch uns erschein.","Dein Heilger Geist uns f\\u00fchr und leit","den Weg zur ewgen Seligkeit.","Dem Namen dein, o Herr,","sei ewig Preis und Ehr!"],"image":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/test.jpg","video":"http:\\/\\/localhost\\/praystorm-beamer-backend\\/images\\/video.mp4"}', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `slidestyle`
--

CREATE TABLE `slidestyle` (
  `id` int(11) NOT NULL,
  `backgroundImage` varchar(100) NOT NULL,
  `backgroundColor` varchar(7) NOT NULL,
  `verseFontSize` int(2) NOT NULL,
  `verseSpacing` int(2) NOT NULL,
  `copyrightFontSize` int(2) NOT NULL,
  `copyrightColor` varchar(7) NOT NULL,
  `verseColor` varchar(7) NOT NULL,
  `additive` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `slidestyle`
--

INSERT INTO `slidestyle` (`id`, `backgroundImage`, `backgroundColor`, `verseFontSize`, `verseSpacing`, `copyrightFontSize`, `copyrightColor`, `verseColor`, `additive`) VALUES
(1, '/media/home/presenter-card.jpg', 'black', 48, 20, 12, 'orange', 'white', '');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `parts_to_event`
--
ALTER TABLE `parts_to_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `partID` (`partID`);

--
-- Indizes für die Tabelle `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_id` (`partID`),
  ADD KEY `styleID` (`styleID`);

--
-- Indizes für die Tabelle `slidestyle`
--
ALTER TABLE `slidestyle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT für Tabelle `parts_to_event`
--
ALTER TABLE `parts_to_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT für Tabelle `slidestyle`
--
ALTER TABLE `slidestyle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `parts_to_event`
--
ALTER TABLE `parts_to_event`
  ADD CONSTRAINT `parts_to_event_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `parts_to_event_ibfk_2` FOREIGN KEY (`partID`) REFERENCES `parts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_ibfk_1` FOREIGN KEY (`partID`) REFERENCES `parts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `slides_ibfk_2` FOREIGN KEY (`styleID`) REFERENCES `slidestyle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
