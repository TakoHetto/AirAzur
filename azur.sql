-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 26 Septembre 2017 à 22:06
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

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
-- Structure de la table `aeroportarrivee`
--

CREATE TABLE `aeroportarrivee` (
  `idA` int(2) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aeroportarrivee`
--

INSERT INTO `aeroportarrivee` (`idA`, `libelle`, `ville`) VALUES
(1, 'Plaisance', 'Maurice'),
(2, 'Madrid', 'Espagne');

-- --------------------------------------------------------

--
-- Structure de la table `aeroportdepart`
--

CREATE TABLE `aeroportdepart` (
  `idAD` int(2) NOT NULL,
  `libelleAD` varchar(50) DEFAULT NULL,
  `villeAD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aeroportdepart`
--

INSERT INTO `aeroportdepart` (`idAD`, `libelleAD`, `villeAD`) VALUES
(1, 'Charles de Gaulle', 'Paris'),
(2, 'Orly', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `numR` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `nbVoyageurs` int(11) NOT NULL,
  `numeroVols` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vols`
--

CREATE TABLE `vols` (
  `numero` varchar(10) NOT NULL,
  `dateDepart` date NOT NULL,
  `dateArrivee` date NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `places` int(11) NOT NULL,
  `idad` int(11) DEFAULT NULL,
  `idaa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vols`
--

INSERT INTO `vols` (`numero`, `dateDepart`, `dateArrivee`, `prix`, `places`, `idad`, `idaa`) VALUES
('AIR5007', '2011-12-16', '2011-12-16', '526', 311, NULL, NULL),
('AIR5108', '2011-01-01', '2011-01-01', '250', 130, NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `aeroportarrivee`
--
ALTER TABLE `aeroportarrivee`
  ADD PRIMARY KEY (`idA`);

--
-- Index pour la table `aeroportdepart`
--
ALTER TABLE `aeroportdepart`
  ADD PRIMARY KEY (`idAD`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`numR`),
  ADD KEY `fk_v` (`numeroVols`);

--
-- Index pour la table `vols`
--
ALTER TABLE `vols`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fk_ad` (`idad`),
  ADD KEY `fk_aa` (`idaa`);

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
  ADD CONSTRAINT `fk_aa` FOREIGN KEY (`idaa`) REFERENCES `aeroportarrivee` (`idA`),
  ADD CONSTRAINT `fk_ad` FOREIGN KEY (`idad`) REFERENCES `aeroportdepart` (`idAD`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
