--
-- Structure de la table `vols`
--

CREATE TABLE `vols` (
  `numero` varchar(10) NOT NULL,
  `depart` varchar(50) NOT NULL,
  `arrivee` varchar(50) NOT NULL,
  `dateDepart` date NOT NULL,
  `dateArrivee` date NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `places` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vols`
--

INSERT INTO `vols` (`numero`, `depart`, `arrivee`, `dateDepart`, `dateArrivee`, `prix`, `places`) VALUES
('AIR5007', 'Paris CDG - France', 'Dakar - Sénégal', '2011-12-16', '2011-12-16', '526', 311),
('AIR5108', 'PARIS ORY - France', 'MADRID - Espagne', '2011-01-01', '2011-01-01', '250', 130);

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `No` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `nbVoyageurs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`No`);

--
-- Index pour la table `vols`
--
ALTER TABLE `vols`
  ADD PRIMARY KEY (`numero`);
  
  -- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;