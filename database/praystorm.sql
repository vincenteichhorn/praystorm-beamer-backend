-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Mrz 2020 um 14:49
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.1

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
(1, 'praystorm', 'Ablauf praystorm Lobpreisabend', '2020-04-04');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `foreign_events_parts`
--

CREATE TABLE `foreign_events_parts` (
  `event_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `foreign_events_parts`
--

INSERT INTO `foreign_events_parts` (`event_id`, `part_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parts`
--

CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `type` enum('SONG','INSERT') NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `parts`
--

INSERT INTO `parts` (`id`, `title`, `position`, `type`, `author`, `album`, `copyright`) VALUES
(1, 'One Way', 0, 'SONG', 'Hillsong Worship', 'Ultimate Worship Vol 1', '© Hillsong Music 2006\r\nWords & Music by Joel Houston and Jonathon Douglass');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `shorthand` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `type` enum('SONGPART','IMAGE','VIDEO','TEXT') NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `slides`
--

INSERT INTO `slides` (`id`, `part_id`, `title`, `shorthand`, `position`, `type`, `data`) VALUES
(1, 1, 'Vers 1', 'V1', 0, 'SONGPART', '{\"lyrics\": [\"I lay my life down at Your feet\",\"You\'re the only One I need\",\"I turn to You and You are always there\",\"In troubled times it\'s all I need\",\"I humble all I am all to You\"],}'),
(2, 1, 'Chorus', 'C', 1, 'SONGPART', '{\"lyrics\": [\"One way\",\"Jesus\",\"You\'re the only One that I could live for\",\"\",\"One way\",\"Jesus\",\"You\'re the only One that I could live for\"],}'),
(3, 1, 'Vers 2', 'V2', 2, 'SONGPART', '{\"lyrics\": [\"You are always\",\"Always there\",\"Every how and every where\",\"Your grace abounds so deeply within me\",\"You will never ever change\",\"Yesterday today the same\",\"Forever \'til forever meets no end\"],}'),
(4, 1, 'Bridge', 'B', 3, 'SONGPART', '{\"lyrics\": [\"You are the Way\",\"The Truth and the Life\",\"We live by faith and not by sight\",\"For You\",\"We\'re living all for You\",\"You are the Way\",\"The Truth and the Life\",\"We live by faith and not by sight\",\"For You\",\"We\'re living all for You\"],}\r\n\r\n');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `foreign_events_parts`
--
ALTER TABLE `foreign_events_parts`
  ADD PRIMARY KEY (`event_id`,`part_id`),
  ADD KEY `part_id` (`part_id`);

--
-- Indizes für die Tabelle `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_id` (`part_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `foreign_events_parts`
--
ALTER TABLE `foreign_events_parts`
  ADD CONSTRAINT `foreign_events_parts_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `foreign_events_parts_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
