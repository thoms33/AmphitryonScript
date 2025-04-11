-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 11 avr. 2025 à 11:53
-- Version du serveur : 10.5.15-MariaDB-0+deb11u1
-- Version de PHP : 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `m.mekboub_amphitryon`
--

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE `Categorie` (
  `idCategorie` int(11) NOT NULL,
  `libelleCategorie` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Categorie`
--

INSERT INTO `Categorie` (`idCategorie`, `libelleCategorie`) VALUES
(1, 'Entrée'),
(2, 'Plat'),
(3, 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `idCommande` int(11) NOT NULL,
  `etatCommande` varchar(40) NOT NULL,
  `reglementCommande` tinyint(1) NOT NULL,
  `idTable` int(11) NOT NULL,
  `idService` int(11) NOT NULL,
  `dateCommande` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Commande`
--

INSERT INTO `Commande` (`idCommande`, `etatCommande`, `reglementCommande`, `idTable`, `idService`, `dateCommande`) VALUES
(1, 'prise', 0, 1, 1, '2025-02-07'),
(2, 'prise', 0, 2, 1, '2025-02-07'),
(3, 'prise', 0, 3, 2, '2025-02-07');

-- --------------------------------------------------------

--
-- Structure de la table `CommanderPlat`
--

CREATE TABLE `CommanderPlat` (
  `idPlat` int(11) NOT NULL,
  `idCommande` int(11) NOT NULL,
  `quantiteCommande` int(11) NOT NULL,
  `informationComplementaire` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Plat`
--

CREATE TABLE `Plat` (
  `idPlat` int(11) NOT NULL,
  `nomPlat` varchar(40) NOT NULL,
  `description` varchar(40) NOT NULL,
  `categoriePlat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Plat`
--

INSERT INTO `Plat` (`idPlat`, `nomPlat`, `description`, `categoriePlat`) VALUES
(1, 'plat1', 'test', 1),
(2, 'plat2', 'pareil', 2);

-- --------------------------------------------------------

--
-- Structure de la table `ProposerPlat`
--

CREATE TABLE `ProposerPlat` (
  `quantiteProposee` int(11) NOT NULL,
  `quantiteVendue` int(11) NOT NULL,
  `prixVente` decimal(11,0) NOT NULL,
  `idPlat` int(11) NOT NULL,
  `idService` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Role`
--

CREATE TABLE `Role` (
  `idRole` int(11) NOT NULL,
  `nomRole` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Role`
--

INSERT INTO `Role` (`idRole`, `nomRole`) VALUES
(1, 'chef de salle'),
(2, 'chef cuisinier'),
(3, 'serveurs');

-- --------------------------------------------------------

--
-- Structure de la table `Service`
--

CREATE TABLE `Service` (
  `idService` int(11) NOT NULL,
  `periodeService` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Service`
--

INSERT INTO `Service` (`idService`, `periodeService`) VALUES
(1, 'midi'),
(2, 'soir');

-- --------------------------------------------------------

--
-- Structure de la table `Tables`
--

CREATE TABLE `Tables` (
  `idTable` int(11) NOT NULL,
  `nombrePlace` int(11) NOT NULL,
  `idServeur` int(11) NOT NULL,
  `idService` int(11) NOT NULL,
  `dateCommande` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Tables`
--

INSERT INTO `Tables` (`idTable`, `nombrePlace`, `idServeur`, `idService`, `dateCommande`) VALUES
(15, 6, 3, 2, '2025-04-11'),
(16, 2, 5, 1, '2025-04-11');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `nomUtilisateur` varchar(40) NOT NULL,
  `PrenomUtilisateur` varchar(40) NOT NULL,
  `loginUtilisateur` varchar(40) NOT NULL,
  `mdpUtilisateur` varchar(40) NOT NULL,
  `idRole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`idUtilisateur`, `nomUtilisateur`, `PrenomUtilisateur`, `loginUtilisateur`, `mdpUtilisateur`, `idRole`) VALUES
(1, 'Guyot', 'Thomas', 'chefSalle', '7682fe272099ea26efe39c890b33675b', 1),
(2, 'Tatouille', 'Ra', 'cuisinier', 'aa36dc6e81e2ac7ad03e12fedcb6a2c0', 2),
(3, 'Federer', 'Roger', 'loginF', '233008399a02555353755f9af43b1495', 3),
(4, 'AULAS', 'Jean-Michel', 'ServeurAULAS', 'ServeurAULAS', 3),
(5, 'TAPIE', 'Bernard', 'ServeurTAPIE', 'ServeurTAPIE', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `idService` (`idService`);

--
-- Index pour la table `CommanderPlat`
--
ALTER TABLE `CommanderPlat`
  ADD PRIMARY KEY (`idPlat`,`idCommande`),
  ADD KEY `idPlat` (`idPlat`,`idCommande`),
  ADD KEY `idPlat_2` (`idPlat`,`idCommande`),
  ADD KEY `CommanderPlat_ibfk_1` (`idCommande`);

--
-- Index pour la table `Plat`
--
ALTER TABLE `Plat`
  ADD PRIMARY KEY (`idPlat`),
  ADD KEY `categoriePlat` (`categoriePlat`);

--
-- Index pour la table `ProposerPlat`
--
ALTER TABLE `ProposerPlat`
  ADD PRIMARY KEY (`idPlat`,`idService`,`date`),
  ADD KEY `idPlat` (`idPlat`,`idService`,`date`),
  ADD KEY `idService` (`idService`),
  ADD KEY `date` (`date`);

--
-- Index pour la table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`idRole`);

--
-- Index pour la table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`idService`);

--
-- Index pour la table `Tables`
--
ALTER TABLE `Tables`
  ADD PRIMARY KEY (`idTable`,`idService`,`dateCommande`),
  ADD KEY `idServeur` (`idServeur`),
  ADD KEY `idService` (`idService`,`dateCommande`),
  ADD KEY `date` (`dateCommande`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD KEY `idRole` (`idRole`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Plat`
--
ALTER TABLE `Plat`
  MODIFY `idPlat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Role`
--
ALTER TABLE `Role`
  MODIFY `idRole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Service`
--
ALTER TABLE `Service`
  MODIFY `idService` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Tables`
--
ALTER TABLE `Tables`
  MODIFY `idTable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `CommanderPlat`
--
ALTER TABLE `CommanderPlat`
  ADD CONSTRAINT `CommanderPlat_ibfk_1` FOREIGN KEY (`idCommande`) REFERENCES `Commande` (`idCommande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CommanderPlat_ibfk_2` FOREIGN KEY (`idPlat`) REFERENCES `Plat` (`idPlat`);

--
-- Contraintes pour la table `Plat`
--
ALTER TABLE `Plat`
  ADD CONSTRAINT `Plat_ibfk_1` FOREIGN KEY (`categoriePlat`) REFERENCES `Categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ProposerPlat`
--
ALTER TABLE `ProposerPlat`
  ADD CONSTRAINT `ProposerPlat_ibfk_1` FOREIGN KEY (`idPlat`) REFERENCES `Plat` (`idPlat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ProposerPlat_ibfk_2` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Tables`
--
ALTER TABLE `Tables`
  ADD CONSTRAINT `Tables_ibfk_2` FOREIGN KEY (`idServeur`) REFERENCES `Utilisateur` (`idUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Tables_ibfk_3` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`);

--
-- Contraintes pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD CONSTRAINT `Utilisateur_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `Role` (`idRole`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
