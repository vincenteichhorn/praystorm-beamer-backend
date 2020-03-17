-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Mrz 2020 um 11:46
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
(1, 'praystorm', 'Ablauf praystorm Lobpreisabend', '2020-04-04');

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
(1, 1, 1, 0);

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
  `numOfLang` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `slides`
--

INSERT INTO `slides` (`id`, `partID`, `title`, `shorthand`, `position`, `type`, `data`, `numOfLang`) VALUES
(1, 1, 'Vers 1', 'V1', 0, 'SONGPART', '{"lyrics": ["I lay my life down at Your feet","You''re the only One I need","I turn to You and You are always there","In troubled times it''s all I need","I humble all I am all to You"],}', 1),
(2, 1, 'Chorus', 'C', 1, 'SONGPART', '{"lyrics": ["One way","Jesus","You''re the only One that I could live for","","One way","Jesus","You''re the only One that I could live for"],}', 1),
(3, 1, 'Vers 2', 'V2', 2, 'SONGPART', '{"lyrics": ["You are always","Always there","Every how and every where","Your grace abounds so deeply within me","You will never ever change","Yesterday today the same","Forever ''til forever meets no end"],}', 1),
(4, 1, 'Bridge', 'B', 3, 'SONGPART', '{"lyrics": ["You are the Way","The Truth and the Life","We live by faith and not by sight","For You","We''re living all for You","You are the Way","The Truth and the Life","We live by faith and not by sight","For You","We''re living all for You"],}\r\n\r\n', 1),
(12, 14, 'Vers 1\r\n', 'V1\r\n', 0, 'SONGPART', '{"lyrics": ["Macht hoch die TÃ¼r, die Tor macht weit;","es kommt der Herr der Herrlichkeit,","ein KÃ¶nig aller KÃ¶nigreich,","ein Heiland aller Welt zugleich,","der Heil und Leben mit sich bringt;","derhalben jauchzt, mit Freuden singt:","Gelobet sei mein Gott,","mein SchÃ¶pfer reich an Rat!",],}', 1),
(13, 14, 'Vers 2\r\n', 'V2\r\n', 1, 'SONGPART', '{"lyrics": ["Er ist gerecht, ein Helfer wert;","SanftmÃ¼tigkeit ist sein GefÃ¤hrt,","sein KÃ¶nigskron ist Heiligkeit,","sein Zepter ist Barmherzigkeit;","all unsre Not zum End er bringt,","derhalben jauchzt, mit Freuden singt:","Gelobet sei mein Gott,","mein Heiland groÃŸ von Tat!",],}', 1),
(14, 14, 'Vers 3\r\n', 'V3\r\n', 2, 'SONGPART', '{"lyrics": ["O wohl dem Land, o wohl der Stadt,","so diesen KÃ¶nig bei sich hat!","Wohl allen Herzen insgemein,","da dieser KÃ¶nig ziehet ein!","Er ist die rechte Freudensonn,","bringt mit sich lauter Freud und Wonn.","Gelobet sei mein Gott,","mein TrÃ¶ster frÃ¼h und spat!",],}', 1),
(15, 14, 'Vers 4\r\n', 'V4\r\n', 3, 'SONGPART', '{"lyrics": ["Macht hoch die TÃ¼r, die Tor macht weit!","Eur Herz zum Tempel zubereit''.","Die Zweiglein der Gottseligkeit","steckt auf mit Andacht, Lust und Freud;","so kommt der KÃ¶nig auch zu euch,","ja, Heil und Leben mit zugleich.","Gelobet sei mein Gott,","voll Rat, voll Tat, voll Gnad!",],}', 1),
(16, 14, 'Vers 5\r\n', 'V5\r\n', 4, 'SONGPART', '{"lyrics": ["Komm, o mein Heiland Jesu Christ,","meins Herzens TÃ¼r dir offen ist.","Ach zieh mit deiner Gnade ein;","dein Freundlichkeit auch uns erschein.","Dein Heilger Geist uns fÃ¼hr und leit","den Weg zur ewgen Seligkeit.","Dem Namen dein, o Herr,","sei ewig Preis und Ehr!",],}', 1),
(17, 15, 'Vers 1\r\n', 'V1\r\n', 0, 'SONGPART', '{"lyrics": ["Der Mond ist aufgegangen,","die goldnen Sternlein prangen","am Himmel hell und klar.","Der Wald steht schwarz und schweiget,","und aus den Wiesen steiget","der weiÃŸe Nebel wunderbar.",],}', 1),
(18, 15, 'Vers 2\r\n', 'V2\r\n', 1, 'SONGPART', '{"lyrics": ["Wie ist die Welt so stille","und in der DÃ¤mmrung HÃ¼lle","so traulich und so hold","als eine stille Kammer,","wo ihr des Tages Jammer","verschlafen und vergessen sollt.",],}', 1),
(19, 15, 'Vers 3\r\n', 'V3\r\n', 2, 'SONGPART', '{"lyrics": ["Seht ihr den Mond dort stehen?","Er ist nur halb zu sehen","und ist doch rund und schÃ¶n.","So sind wohl manche Sachen,","die wir getrost belachen,","weil unsre Augen sie nicht sehn.",],}', 1),
(20, 15, 'Vers 4\r\n', 'V4\r\n', 3, 'SONGPART', '{"lyrics": ["Wir stolzen Menschenkinder","sind eitel arme SÃ¼nder","und wissen gar nicht viel.","Wir spinnen Luftgespinste","und suchen viele KÃ¼nste","und kommen weiter von dem Ziel.",],}', 1),
(21, 15, 'Vers 5\r\n', 'V5\r\n', 4, 'SONGPART', '{"lyrics": ["Gott, lass uns dein Heil schauen,","auf nichts VergÃ¤nglichs trauen,","nicht Eitelkeit uns freun;","lass uns einfÃ¤ltig werden","und vor dir hier auf Erden","wie Kinder fromm und frÃ¶hlich sein.",],}', 1),
(22, 15, 'Vers 6\r\n', 'V6\r\n', 5, 'SONGPART', '{"lyrics": ["Wollst endlich sonder GrÃ¤men","aus dieser Welt uns nehmen","durch einen sanften Tod;","und wenn du uns genommen,","lass uns in'' Himmel kommen,","du unser Herr und unser Gott.",],}', 1),
(23, 15, 'Vers 7\r\n', 'V7\r\n', 6, 'SONGPART', '{"lyrics": ["So legt euch denn, ihr BrÃ¼der,","in Gottes Namen nieder;","kalt ist der Abendhauch.","Verschon uns, Gott, mit Strafen","und lass uns ruhig schlafen.","Und unsern kranken Nachbarn auch!",],}', 1),
(31, 18, 'Vers 1\r\n', 'V1\r\n', 0, 'SONGPART', '{"lyrics": ["Von guten MÃ¤chten treu und still umgeben,","behÃ¼tet und getrÃ¶stet wunderbar.","So will ich diese Tage mit euch leben","und mit euch gehen in ein neues Jahr.",],}', 1),
(32, 18, 'Chorus\r\n', 'C', 1, 'SONGPART', '{"lyrics": ["Von guten MÃ¤chten wunderbar geborgen,","erwarten wir getrost, was kommen mag.","Gott ist bei uns am Abend und am Morgen","und ganz gewiss an jedem neuen Tag.",],}', 1),
(33, 18, 'Vers 2\r\n', 'V2\r\n', 2, 'SONGPART', '{"lyrics": ["Noch will das alte unsre Herzen quÃ¤len,","noch drÃ¼ckt uns bÃ¶ser Tage schwere Last.","Ach, Herr, gib unsern aufgeschreckten Seelen","das Heil, fÃ¼r das du uns geschaffen hast.",],}', 1),
(34, 18, 'Vers 3\r\n', 'V3\r\n', 3, 'SONGPART', '{"lyrics": ["Und reichst du uns den schweren Kelch, den bittern","des Leids, gefÃ¼llt bis an den hÃ¶chsten Rand,","So nehmen wir ihn dankbar ohne Zittern","aus deiner guten und geliebten Hand.",],}', 1),
(35, 18, 'Vers 4\r\n', 'V4\r\n', 4, 'SONGPART', '{"lyrics": ["Doch willst du uns noch einmal Freude schenken","an dieser Welt und ihrer Sonne Glanz,","Dann wolln wir des Vergangenen gedenken","und dann gehÃ¶rt dir unser Leben ganz.",],}', 1),
(36, 18, 'Vers 5\r\n', 'V5\r\n', 5, 'SONGPART', '{"lyrics": ["Lass warm und hell die Kerzen heute flammen,","die du in unsre Dunkelheit gebracht.","FÃ¼hr, wenn es sein kann, wieder uns zusammen.","Wir wissen es, dein Licht scheint in der Nacht.",],}', 1),
(37, 18, 'Vers 6\r\n', 'V6\r\n', 6, 'SONGPART', '{"lyrics": ["Wenn sich die Stille nun tief um uns breitet,","So lass uns hÃ¶ren jenen vollen Klang","Der Welt, die unsichtbar sich um uns weitet,","All deiner Kinder hohen Lobgesang.",],}', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT für Tabelle `parts_to_event`
--
ALTER TABLE `parts_to_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_ibfk_1` FOREIGN KEY (`partID`) REFERENCES `parts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
