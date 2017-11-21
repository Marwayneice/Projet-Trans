-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 21 Novembre 2017 à 16:39
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `projet_trans`
--

-- --------------------------------------------------------

--
-- Structure de la table `civilite`
--

CREATE TABLE IF NOT EXISTS `civilite` (
  `Lib_Civ` varchar(25) NOT NULL,
  PRIMARY KEY (`Lib_Civ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE IF NOT EXISTS `contrat` (
  `Num_Cont` int(11) NOT NULL,
  `Date_Cont` date NOT NULL,
  `Sal_mensuel_Cont` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Num_Cont`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dater`
--

CREATE TABLE IF NOT EXISTS `dater` (
  `Date` date DEFAULT NULL,
  `Num_Pers` int(11) NOT NULL,
  `Lib_Dipl` varchar(25) NOT NULL,
  PRIMARY KEY (`Num_Pers`,`Lib_Dipl`),
  KEY `FK_Dater_Lib_Dipl` (`Lib_Dipl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `diplume`
--

CREATE TABLE IF NOT EXISTS `diplume` (
  `Lib_Dipl` varchar(25) NOT NULL,
  PRIMARY KEY (`Lib_Dipl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `Num_Pers` int(11) NOT NULL,
  `Nom_Pers` varchar(50) NOT NULL,
  `Prenom_Pers` varchar(50) NOT NULL,
  `Adresse1_Pers` varchar(50) NOT NULL,
  `Adresse2_Pers` varchar(50) NOT NULL,
  `Ville_Pers` varchar(50) NOT NULL,
  `CP_Pers` char(25) NOT NULL,
  `Telephone_Pers` char(25) DEFAULT NULL,
  `DateNaissance_Pers` date NOT NULL,
  `Lib_Post` varchar(25) NOT NULL,
  `Lib_Civ` varchar(25) NOT NULL,
  `Num_Stat` int(11) NOT NULL,
  `Num_Cont` int(11) NOT NULL,
  `Identifiant_pers` varchar(250) NOT NULL,
  `MotDePasse_pers` varchar(50) NOT NULL,
  PRIMARY KEY (`Num_Pers`),
  KEY `FK_Personnel_Lib_Post` (`Lib_Post`),
  KEY `FK_Personnel_Lib_Civ` (`Lib_Civ`),
  KEY `FK_Personnel_Num_Stat` (`Num_Stat`),
  KEY `FK_Personnel_Num_Cont` (`Num_Cont`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE IF NOT EXISTS `poste` (
  `Lib_Post` varchar(25) NOT NULL,
  PRIMARY KEY (`Lib_Post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `Num_Serv` int(11) NOT NULL,
  `Nom_Serv` varchar(50) NOT NULL,
  `Lib_Post` varchar(25) NOT NULL,
  PRIMARY KEY (`Num_Serv`),
  KEY `FK_Service_Lib_Post` (`Lib_Post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `Num_Stat` int(11) NOT NULL,
  `Nom_Stat` varchar(50) NOT NULL,
  PRIMARY KEY (`Num_Stat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `dater`
--
ALTER TABLE `dater`
  ADD CONSTRAINT `FK_Dater_Lib_Dipl` FOREIGN KEY (`Lib_Dipl`) REFERENCES `diplume` (`Lib_Dipl`),
  ADD CONSTRAINT `FK_Dater_Num_Pers` FOREIGN KEY (`Num_Pers`) REFERENCES `personnel` (`Num_Pers`);

--
-- Contraintes pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `FK_Personnel_Lib_Civ` FOREIGN KEY (`Lib_Civ`) REFERENCES `civilite` (`Lib_Civ`),
  ADD CONSTRAINT `FK_Personnel_Lib_Post` FOREIGN KEY (`Lib_Post`) REFERENCES `poste` (`Lib_Post`),
  ADD CONSTRAINT `FK_Personnel_Num_Cont` FOREIGN KEY (`Num_Cont`) REFERENCES `contrat` (`Num_Cont`),
  ADD CONSTRAINT `FK_Personnel_Num_Stat` FOREIGN KEY (`Num_Stat`) REFERENCES `status` (`Num_Stat`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_Service_Lib_Post` FOREIGN KEY (`Lib_Post`) REFERENCES `poste` (`Lib_Post`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
