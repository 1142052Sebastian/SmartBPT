-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Apr 27, 2023 alle 01:10
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TEST_SmartBPT`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Data`
--

CREATE TABLE `Data` (
  `Id` int(10) NOT NULL,
  `Id_Sensor` int(10) NOT NULL,
  `Value_Sensor` varchar(50) NOT NULL,
  `Mesured` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Data`
--

INSERT INTO `Data` (`Id`, `Id_Sensor`, `Value_Sensor`, `Mesured`) VALUES
(1, 10, '120', '2023-04-27'),
(2, 2, '22.5 °C', '2023-04-27'),
(3, 2, '23.0 °C', '2023-04-27'),
(4, 2, '22.9 °C', '2023-04-27'),
(5, 3, '48 %', '2023-04-27'),
(6, 3, '45 %', '2023-04-27'),
(7, 3, '46 %', '2023-04-27'),
(8, 4, '1', '2023-04-27'),
(9, 4, '0', '2023-04-27'),
(10, 4, '1', '2023-04-27'),
(11, 5, '62 dB', '2023-04-27'),
(12, 5, '60 dB', '2023-04-27'),
(13, 5, '64 dB', '2023-04-27'),
(14, 6, '190 ppm', '2023-04-27'),
(15, 6, '185 ppm', '2023-04-27'),
(16, 6, '191 ppm', '2023-04-27'),
(17, 7, '0.15 %', '2023-04-27'),
(18, 7, '0.10 %', '2023-04-27'),
(19, 7, '0.14 %', '2023-04-27'),
(20, 8, '100 kPa', '2023-04-27'),
(21, 8, '99 kPa', '2023-04-27'),
(22, 8, '101 kPa', '2023-04-27'),
(23, 9, '320 lx', '2023-04-27'),
(24, 9, '280 lx', '2023-04-27'),
(25, 9, '340 lx', '2023-04-27'),
(26, 10, '800 ppm', '2023-04-27'),
(27, 10, '750 ppm', '2023-04-27'),
(28, 10, '810 ppm', '2023-04-27'),
(29, 11, '1', '2023-04-27'),
(30, 11, '0', '2023-04-27'),
(31, 11, '1', '2023-04-27');

-- --------------------------------------------------------

--
-- Struttura della tabella `House`
--

CREATE TABLE `House` (
  `Id` int(10) NOT NULL,
  `Name` varchar(10) NOT NULL DEFAULT 'Home',
  `GPS_Location` text NOT NULL,
  `Created` date NOT NULL,
  `Updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `House`
--

INSERT INTO `House` (`Id`, `Name`, `GPS_Location`, `Created`, `Updated`) VALUES
(1, 'Casa Nonni', 'Italy, VI, Vicenza, 36100, Via Poli 12', '2023-04-27', '2023-04-27'),
(2, 'Villa', 'Italy, FI, Firenze, 50100, Via dei Mille 10', '2023-04-27', '2023-04-27'),
(3, 'Casa Mia', 'Italy, TO, Torino, 10100, Via Milano 20', '2023-04-27', '2023-04-27');

-- --------------------------------------------------------

--
-- Struttura della tabella `Rooms`
--

CREATE TABLE `Rooms` (
  `Id` int(10) NOT NULL,
  `Id_House` int(10) NOT NULL,
  `Type` varchar(50) NOT NULL DEFAULT 'Room',
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Rooms`
--

INSERT INTO `Rooms` (`Id`, `Id_House`, `Type`, `Name`) VALUES
(1, 1, 'Camera', 'Camera Mia'),
(2, 1, 'Bagno', 'Bagno Grande'),
(3, 1, 'Salotto', 'Salotto Principale'),
(4, 1, 'Camera', 'Camera dei Bambini'),
(5, 1, 'Stanza', 'Stanza degli Ospiti'),
(6, 1, 'Cucina', 'Cucina Moderna'),
(7, 1, 'Bagno', 'Bagno Piccolo'),
(8, 1, 'Studio', 'Studio Personale'),
(9, 1, 'Camera', 'Camera Matrimoniale'),
(10, 1, 'Soggiorno', 'Soggiorno Accogliente'),
(11, 1, 'Terrazza', 'Terrazza Panoramica');

-- --------------------------------------------------------

--
-- Struttura della tabella `Sensor`
--

CREATE TABLE `Sensor` (
  `Id` int(10) NOT NULL,
  `Id_Room` int(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Manufacturer` varchar(20) DEFAULT NULL,
  `Type` varchar(20) NOT NULL,
  `Installed` date NOT NULL DEFAULT current_timestamp(),
  `Revised` date NOT NULL DEFAULT current_timestamp(),
  `Status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Sensor`
--

INSERT INTO `Sensor` (`Id`, `Id_Room`, `Name`, `Model`, `Manufacturer`, `Type`, `Installed`, `Revised`, `Status`) VALUES
(1, 1, 'LightSensor', 'MTC22', 'Ligthme', 'LightSensor', '2023-04-27', '2023-04-27', 0),
(2, 2, 'TemperatureSensor', 'MTA42', 'ThermoTech', 'TemperatureSensor', '2023-04-27', '2023-04-27', 0),
(3, 3, 'HumiditySensor', 'MHB33', 'HumidMe', 'HumiditySensor', '2023-04-27', '2023-04-27', 0),
(4, 4, 'MotionSensor', 'MMT12', 'MoveSense', 'MotionSensor', '2023-04-27', '2023-04-27', 0),
(5, 5, 'SoundSensor', 'MST66', 'SoundTech', 'SoundSensor', '2023-04-27', '2023-04-27', 0),
(6, 6, 'GasSensor', 'MGS11', 'GasDetect', 'GasSensor', '2023-04-27', '2023-04-27', 0),
(7, 7, 'SmokeSensor', 'MSS22', 'SmokeTech', 'SmokeSensor', '2023-04-27', '2023-04-27', 0),
(8, 8, 'PressureSensor', 'MPS33', 'PressureMe', 'PressureSensor', '2023-04-27', '2023-04-27', 0),
(9, 9, 'LightSensor', 'MTL55', 'Lumin', 'LightSensor', '2023-04-27', '2023-04-27', 0),
(10, 10, 'CO2Sensor', 'MCO22', 'CO2Tech', 'CO2Sensor', '2023-04-27', '2023-04-27', 0),
(11, 11, 'PressureSensor', 'MPS44', 'PressureMe', 'PressureSensor', '2023-04-27', '2023-04-27', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `User`
--

CREATE TABLE `User` (
  `Id` int(8) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `ID_Code` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Subscribed` date NOT NULL,
  `Updated` date NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `User`
--

INSERT INTO `User` (`Id`, `Name`, `ID_Code`, `Email`, `Subscribed`, `Updated`, `Password`) VALUES
(3, 'Giovanni', 'BRSRSB01B02Z129Y', 'prova@test.vu', '2023-04-27', '2023-04-27', '123456789'),
(4, 'Maria', 'MPLMRA80A41L219A', 'mariap@gmail.com', '2023-04-27', '2023-04-27', 'password123'),
(5, 'Marco', 'MRCMRC01A01L219K', 'marco@outlook.it', '2023-04-27', '2023-04-27', 'mysecretpassword'),
(6, 'Luisa', 'LSSLSA03B55L219D', 'luisa@yahoo.com', '2023-04-27', '2023-04-27', 'password1234'),
(7, 'Matteo', 'MTTMTA04C44L219R', 'matteo@hotmail.com', '2023-04-27', '2023-04-27', 'qwerty123'),
(8, 'Federica', 'FDRFCA05D33L219B', 'federica@gmail.com', '2023-04-27', '2023-04-27', 'letmein123'),
(9, 'Carlo', 'CRLCLR06E22L219C', 'carlo@libero.it', '2023-04-27', '2023-04-27', 'mypassword'),
(10, 'Chiara', 'CHRCHR07F11L219G', 'chiara@live.com', '2023-04-27', '2023-04-27', '12345678'),
(11, 'Dario', 'DRDDRA08G00L219H', 'dario@tiscali.it', '2023-04-27', '2023-04-27', 'password01'),
(12, 'Alessandra', 'ALSLSN09H19L219S', 'alessandra@hotmail.it', '2023-04-27', '2023-04-27', 'mypassword123'),
(13, 'Maria', 'MPLMRA80A41L219A', 'mariap@gmail.com', '2023-04-27', '2023-04-27', 'password123'),
(14, 'Marco', 'MRCMRC01A01L219K', 'marco@outlook.it', '2023-04-27', '2023-04-27', 'mysecretpassword'),
(15, 'Luisa', 'LSSLSA03B55L219D', 'luisa@yahoo.com', '2023-04-27', '2023-04-27', 'password1234'),
(16, 'Matteo', 'MTTMTA04C44L219R', 'matteo@hotmail.com', '2023-04-27', '2023-04-27', 'qwerty123'),
(17, 'Federica', 'FDRFCA05D33L219B', 'federica@gmail.com', '2023-04-27', '2023-04-27', 'letmein123'),
(18, 'Carlo', 'CRLCLR06E22L219C', 'carlo@libero.it', '2023-04-27', '2023-04-27', 'mypassword'),
(19, 'Chiara', 'CHRCHR07F11L219G', 'chiara@live.com', '2023-04-27', '2023-04-27', '12345678'),
(20, 'Dario', 'DRDDRA08G00L219H', 'dario@tiscali.it', '2023-04-27', '2023-04-27', 'password01'),
(21, 'Alessandra', 'ALSLSN09H19L219S', 'alessandra@hotmail.it', '2023-04-27', '2023-04-27', 'mypassword123');

-- --------------------------------------------------------

--
-- Struttura della tabella `User_House`
--

CREATE TABLE `User_House` (
  `Id` int(10) NOT NULL,
  `ID_User` int(10) NOT NULL,
  `ID_House` int(10) NOT NULL,
  `Role` int(2) NOT NULL,
  `Joined` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `User_House`
--

INSERT INTO `User_House` (`Id`, `ID_User`, `ID_House`, `Role`, `Joined`) VALUES
(1, 21, 1, 1, '2023-04-27'),
(3, 3, 1, 0, '2023-04-27'),
(4, 9, 1, 2, '2023-04-27'),
(5, 5, 2, 0, '2023-04-27'),
(6, 5, 1, 2, '2023-04-27');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Data`
--
ALTER TABLE `Data`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Sensor_Data` (`Id_Sensor`);

--
-- Indici per le tabelle `House`
--
ALTER TABLE `House`
  ADD PRIMARY KEY (`Id`);

--
-- Indici per le tabelle `Rooms`
--
ALTER TABLE `Rooms`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_House_2` (`Id_House`);

--
-- Indici per le tabelle `Sensor`
--
ALTER TABLE `Sensor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Room` (`Id_Room`);

--
-- Indici per le tabelle `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Id`);

--
-- Indici per le tabelle `User_House`
--
ALTER TABLE `User_House`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_User` (`ID_User`),
  ADD KEY `FK_House` (`ID_House`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Data`
--
ALTER TABLE `Data`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT per la tabella `House`
--
ALTER TABLE `House`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Rooms`
--
ALTER TABLE `Rooms`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `Sensor`
--
ALTER TABLE `Sensor`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `User`
--
ALTER TABLE `User`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `User_House`
--
ALTER TABLE `User_House`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Data`
--
ALTER TABLE `Data`
  ADD CONSTRAINT `FK_Sensor_Data` FOREIGN KEY (`Id_Sensor`) REFERENCES `Sensor` (`Id`);

--
-- Limiti per la tabella `Rooms`
--
ALTER TABLE `Rooms`
  ADD CONSTRAINT `FK_House_2` FOREIGN KEY (`Id_House`) REFERENCES `House` (`Id`);

--
-- Limiti per la tabella `Sensor`
--
ALTER TABLE `Sensor`
  ADD CONSTRAINT `FK_Room` FOREIGN KEY (`Id_Room`) REFERENCES `Rooms` (`Id`);

--
-- Limiti per la tabella `User_House`
--
ALTER TABLE `User_House`
  ADD CONSTRAINT `FK_House` FOREIGN KEY (`ID_House`) REFERENCES `House` (`Id`),
  ADD CONSTRAINT `FK_User` FOREIGN KEY (`ID_User`) REFERENCES `User` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
