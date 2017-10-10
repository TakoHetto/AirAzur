-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 10 Octobre 2017 à 08:56
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `azur`
--

-- --------------------------------------------------------

--
-- Structure de la table `aeroport`
--

DROP TABLE IF EXISTS `aeroport`;
CREATE TABLE IF NOT EXISTS `aeroport` (
  `id` int(2) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aeroport`
--

INSERT INTO `aeroport` (`id`, `libelle`, `ville`) VALUES
(1, 'Plaisance', 'Maurice'),
(2, 'Madrid', 'Espagne'),
(3, 'Paris CDG', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `numR` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `nbVoyageurs` int(11) NOT NULL,
  `numeroVols` varchar(10) NOT NULL,
  PRIMARY KEY (`numR`),
  KEY `fk_v` (`numeroVols`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`numR`, `nom`, `prenom`, `adresse`, `mail`, `nbVoyageurs`, `numeroVols`) VALUES
(1, 'Saillant', 'Elwan', '43 Rue Pixérécourt, Boite 14', 'elwansroronoa@hotmail.fr', 1, 'AIR5007'),
(2, 'Saillant', 'Elwan', '43 Rue Pixérécourt, Boite 14', 'elwansroronoa@hotmail.fr', 1, 'AIR5007'),
(3, 'truc', 'bidule', 'paris', 'truc@plop.fr', 2, 'AIR5108'),
(4, 'Cousin', 'Laurine', 'bled', 'truc@machin.com', 2, 'AIR5108'),
(5, 'Saillant', 'Elwan', 'truc', 'truc@machin.com', 2, 'AIR5108'),
(6, 'Saillant', 'Elwan', 'truc', 'truc@machin.com', 1, 'AIR5108'),
(7, 'Cousin', 'Laurine', '16 rue blob', 'truc@machin.com', 1, 'AIR5108');

-- --------------------------------------------------------

--
-- Structure de la table `vols`
--

DROP TABLE IF EXISTS `vols`;
CREATE TABLE IF NOT EXISTS `vols` (
  `numero` varchar(10) NOT NULL,
  `dateDepart` date NOT NULL,
  `dateArrivee` date NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `places` int(11) NOT NULL,
  `idad` int(11) DEFAULT NULL,
  `idaa` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_ad` (`idad`),
  KEY `fk_aa` (`idaa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vols`
--

INSERT INTO `vols` (`numero`, `dateDepart`, `dateArrivee`, `prix`, `places`, `idad`, `idaa`) VALUES
('AIR5007', '2011-12-16', '2011-12-16', '526', 311, 1, 2),
('AIR5108', '2011-01-01', '2011-01-01', '250', 130, 2, 1);

--
-- Déclencheurs `vols`
--
DROP TRIGGER IF EXISTS `tr_aeroport`;
DELIMITER $$
CREATE TRIGGER `tr_aeroport` BEFORE INSERT ON `vols` FOR EACH ROW BEGIN
	IF new.idad = new.idaa then 
    	SIGNAL SQLSTATE '45000';
    END IF;
END
$$
DELIMITER ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_v` FOREIGN KEY (`numeroVols`) REFERENCES `vols` (`numero`);

--
-- Contraintes pour la table `vols`
--
ALTER TABLE `vols`
  ADD CONSTRAINT `fk_aa` FOREIGN KEY (`idaa`) REFERENCES `aeroport` (`id`),
  ADD CONSTRAINT `fk_ad` FOREIGN KEY (`idad`) REFERENCES `aeroport` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
