-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 19. Mrz 2020 um 21:42
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(14, 'Macht hoch die TÃ¼r die Tor macht weit\r\n', 'SONG', NULL, NULL, 'CCLI-Liednummer 5588206\r\nGeorg Weissel | Johann Anastasius Freylinghausen\r\nÂ© Words: Public Domain \r\nMusic: Public Domain \r\n', NULL),
(15, 'Der Mond ist aufgegangen\r\n', 'SONG', NULL, NULL, 'CCLI-Liednummer 4335292\r\nMatthias Claudius\r\nPublic Domain \r\nNutzung ausschlieÃŸlich im Rahmen der SongSelectÂ®-Nutzungsbedingungen. Alle Rechte vorbehalten. www.ccli.com\r\n', NULL),
(18, 'Von guten MÃ¤chten treu und still umgeben\r\n', 'SONG', NULL, NULL, 'CCLI-Liednummer 4891516\r\nDietrich Bonhoeffer\r\nPublic Domain \r\nNutzung ausschlieÃŸlich im Rahmen der SongSelectÂ®-Nutzungsbedingungen. Alle Rechte vorbehalten. www.ccli.com\r\n', NULL);

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
(4, 3, 14, 1);

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
  `numOfLang` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `slides`
--

INSERT INTO `slides` (`id`, `partID`, `title`, `shorthand`, `position`, `type`, `data`, `numOfLang`) VALUES
(1, 1, 'Vers 1', 'V1', 0, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(2, 1, 'Chorus', 'C', 1, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"One way, Jesus!\",\r\n\"You\'re the only one that I could live for\",\r\n\"One Way, Jesus!\",\r\n\"You\'re the only one that I could live for\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(3, 1, 'Vers 2', 'V2', 2, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(4, 1, 'Bridge', 'B', 3, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(38, 15, 'Vers 1', 'V1', 0, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(39, 15, 'Chorus', 'C', 1, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(40, 15, 'Vers 2', 'V2', 2, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(41, 15, 'Bridge', 'B', 3, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(42, 14, 'Vers 1', 'V1', 0, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(43, 14, 'Chorus', 'C', 1, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(44, 14, 'Vers 2', 'V2', 2, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1),
(45, 14, 'Bridge', 'B', 3, 'SONGPART', '{\r\n    \"lyrics\": [\r\n      \"I lay my life down at Your feet\",\r\n      \"You\'re the only One I need\",\"I turn to You and You are always there\",\r\n      \"In troubled times it\'s all I need\",\r\n      \"I humble all I am all to You\"\r\n    ], \r\n    \"image\": \"http://localhost/praystorm-beamer-backend/images/test.jpg\",\r\n    \"video\": \"http://localhost/praystorm-beamer-backend/images/video.mp4\",\r\n    \"text\": \"<h1>Das ist ein Text mit echtem HTML</h1>\",\r\n\r\n    \"style\": {\r\n      \"backgroundImage\": \"/media/home/presenter-card.jpg\", \r\n      \"backgroundColor\": \"black\",\r\n      \"verseFontSize\": 48,\r\n      \"verseSpacing\": 20,\r\n      \"copyrightFontSize\": 12,\r\n      \"copyrightColor\": \"orange\",\r\n      \"verseColor\": \"white\"\r\n    }\r\n  }', 1);

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
  ADD KEY `part_id` (`partID`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `parts_to_event`
--
ALTER TABLE `parts_to_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
  ADD CONSTRAINT `slides_ibfk_1` FOREIGN KEY (`partID`) REFERENCES `parts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
