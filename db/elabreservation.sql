-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3319
-- Généré le : sam. 17 juin 2023 à 22:42
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `elabreservation`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneeuniversitaire`
--

CREATE TABLE `anneeuniversitaire` (
  `idanneeuniversitaire` bigint(20) NOT NULL,
  `titreannee` varchar(9) DEFAULT NULL,
  `datedebutanne` date DEFAULT NULL,
  `datefinannee` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `composanteelabs`
--

CREATE TABLE `composanteelabs` (
  `idcomposante` bigint(20) NOT NULL,
  `nomcomp` varchar(255) DEFAULT NULL,
  `descelabcomp` text DEFAULT NULL,
  `elabs_idelabs` bigint(20) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `deschtml` longtext DEFAULT NULL,
  `parametreaffichecomp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `datagenerated`
--

CREATE TABLE `datagenerated` (
  `iddatagenerated` bigint(20) NOT NULL,
  `datetimegenerate` datetime DEFAULT NULL,
  `datagenerated` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datagenerated`)),
  `idcomposante` bigint(20) DEFAULT NULL,
  `parametreaffiche` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `elabs`
--

CREATE TABLE `elabs` (
  `idelabes` bigint(20) NOT NULL,
  `nomelab` varchar(255) DEFAULT NULL,
  `descelabs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

CREATE TABLE `formations` (
  `idformations` bigint(20) NOT NULL,
  `titreformations` text DEFAULT NULL,
  `abrevformation` text DEFAULT NULL,
  `idtypeformation` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`idformations`, `titreformations`, `abrevformation`, `idtypeformation`) VALUES
(1, 'Internet of things', 'RIOT', 'Licence');

-- --------------------------------------------------------

--
-- Structure de la table `inscriptionelabs`
--

CREATE TABLE `inscriptionelabs` (
  `idinscriptionelabs` bigint(20) NOT NULL,
  `elabs_idelabs` bigint(20) DEFAULT NULL,
  `dateinscription` datetime DEFAULT NULL,
  `idinscriptionetudiants` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscriptionetudiants`
--

CREATE TABLE `inscriptionetudiants` (
  `idinscriptionetudiants` bigint(20) NOT NULL,
  `idniveauformations` bigint(20) DEFAULT NULL,
  `idanneeuniversitaire` bigint(20) DEFAULT NULL,
  `idsemestres` varchar(10) DEFAULT NULL,
  `idpersonnes` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lespageselabs`
--

CREATE TABLE `lespageselabs` (
  `idlespageselabs` bigint(20) NOT NULL,
  `idelabes` bigint(20) DEFAULT NULL,
  `pagescontent` longtext DEFAULT NULL,
  `parametreaffiche` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveauformations`
--

CREATE TABLE `niveauformations` (
  `idniveauformations` bigint(20) NOT NULL,
  `labelniveau` varchar(255) DEFAULT NULL,
  `formations_idformations` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

CREATE TABLE `personnes` (
  `idpersonnes` bigint(20) NOT NULL,
  `nom` varchar(125) DEFAULT NULL,
  `prenom` varchar(125) DEFAULT NULL,
  `login` text DEFAULT NULL,
  `pwd` text DEFAULT NULL,
  `roles_idroles` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`idpersonnes`, `nom`, `prenom`, `login`, `pwd`, `roles_idroles`) VALUES
(2, 'Limam', 'Oussama', 'dqs', 'dqsdqs', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `idreservation` bigint(20) NOT NULL,
  `datereservation` datetime DEFAULT NULL,
  `datefinreservation` datetime DEFAULT NULL,
  `inscriptionelabs_idinscriptionelabs` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `idroles` varchar(45) NOT NULL,
  `labelrole` varchar(255) DEFAULT NULL,
  `descroles` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`idroles`, `labelrole`, `descroles`) VALUES
('admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE `semestre` (
  `idsemestres` varchar(10) NOT NULL,
  `labelsemestre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typeformation`
--

CREATE TABLE `typeformation` (
  `idtypeformation` varchar(45) NOT NULL,
  `titretypeformation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `typeformation`
--

INSERT INTO `typeformation` (`idtypeformation`, `titretypeformation`) VALUES
('Ingénieur', 'Ingénieur'),
('Licence', 'Licence');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `anneeuniversitaire`
--
ALTER TABLE `anneeuniversitaire`
  ADD PRIMARY KEY (`idanneeuniversitaire`);

--
-- Index pour la table `composanteelabs`
--
ALTER TABLE `composanteelabs`
  ADD PRIMARY KEY (`idcomposante`),
  ADD KEY `fk_composanteelabs_elabs` (`elabs_idelabs`);

--
-- Index pour la table `datagenerated`
--
ALTER TABLE `datagenerated`
  ADD PRIMARY KEY (`iddatagenerated`),
  ADD KEY `fk_datagenerated_composanteelabs` (`idcomposante`);

--
-- Index pour la table `elabs`
--
ALTER TABLE `elabs`
  ADD PRIMARY KEY (`idelabes`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`idformations`),
  ADD KEY `fk_formations_typeformation` (`idtypeformation`);

--
-- Index pour la table `inscriptionelabs`
--
ALTER TABLE `inscriptionelabs`
  ADD PRIMARY KEY (`idinscriptionelabs`),
  ADD KEY `fk_inscriptionelabs_elabs` (`elabs_idelabs`),
  ADD KEY `fk_inscriptionelabs_inscriptionetudiants` (`idinscriptionetudiants`);

--
-- Index pour la table `inscriptionetudiants`
--
ALTER TABLE `inscriptionetudiants`
  ADD PRIMARY KEY (`idinscriptionetudiants`),
  ADD KEY `fk_inscriptionetudiants_personnes` (`idpersonnes`),
  ADD KEY `fk_inscriptionetudiants_semestre` (`idsemestres`),
  ADD KEY `fk_inscriptionetudiants_anneeuniversitaire` (`idanneeuniversitaire`),
  ADD KEY `fk_inscriptionetudiants_niveauformations` (`idniveauformations`);

--
-- Index pour la table `lespageselabs`
--
ALTER TABLE `lespageselabs`
  ADD PRIMARY KEY (`idlespageselabs`),
  ADD KEY `fk_lespageselabs_elabs` (`idelabes`);

--
-- Index pour la table `niveauformations`
--
ALTER TABLE `niveauformations`
  ADD PRIMARY KEY (`idniveauformations`),
  ADD KEY `fk_niveauformations_formations` (`formations_idformations`);

--
-- Index pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD PRIMARY KEY (`idpersonnes`),
  ADD KEY `fk_personnes_roles` (`roles_idroles`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idreservation`),
  ADD KEY `fk_reservation_inscriptionelabs` (`inscriptionelabs_idinscriptionelabs`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idroles`);

--
-- Index pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`idsemestres`);

--
-- Index pour la table `typeformation`
--
ALTER TABLE `typeformation`
  ADD PRIMARY KEY (`idtypeformation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `anneeuniversitaire`
--
ALTER TABLE `anneeuniversitaire`
  MODIFY `idanneeuniversitaire` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `composanteelabs`
--
ALTER TABLE `composanteelabs`
  MODIFY `idcomposante` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `datagenerated`
--
ALTER TABLE `datagenerated`
  MODIFY `iddatagenerated` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `elabs`
--
ALTER TABLE `elabs`
  MODIFY `idelabes` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `idformations` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `inscriptionelabs`
--
ALTER TABLE `inscriptionelabs`
  MODIFY `idinscriptionelabs` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `inscriptionetudiants`
--
ALTER TABLE `inscriptionetudiants`
  MODIFY `idinscriptionetudiants` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lespageselabs`
--
ALTER TABLE `lespageselabs`
  MODIFY `idlespageselabs` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveauformations`
--
ALTER TABLE `niveauformations`
  MODIFY `idniveauformations` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personnes`
--
ALTER TABLE `personnes`
  MODIFY `idpersonnes` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idreservation` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `composanteelabs`
--
ALTER TABLE `composanteelabs`
  ADD CONSTRAINT `fk_composanteelabs_elabs` FOREIGN KEY (`elabs_idelabs`) REFERENCES `elabs` (`idelabes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `datagenerated`
--
ALTER TABLE `datagenerated`
  ADD CONSTRAINT `fk_datagenerated_composanteelabs` FOREIGN KEY (`idcomposante`) REFERENCES `composanteelabs` (`idcomposante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `formations`
--
ALTER TABLE `formations`
  ADD CONSTRAINT `fk_formations_typeformation` FOREIGN KEY (`idtypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `inscriptionelabs`
--
ALTER TABLE `inscriptionelabs`
  ADD CONSTRAINT `fk_inscriptionelabs_elabs` FOREIGN KEY (`elabs_idelabs`) REFERENCES `elabs` (`idelabes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscriptionelabs_inscriptionetudiants` FOREIGN KEY (`idinscriptionetudiants`) REFERENCES `inscriptionetudiants` (`idinscriptionetudiants`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `inscriptionetudiants`
--
ALTER TABLE `inscriptionetudiants`
  ADD CONSTRAINT `fk_inscriptionetudiants_anneeuniversitaire` FOREIGN KEY (`idanneeuniversitaire`) REFERENCES `anneeuniversitaire` (`idanneeuniversitaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscriptionetudiants_niveauformations` FOREIGN KEY (`idniveauformations`) REFERENCES `niveauformations` (`idniveauformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscriptionetudiants_personnes` FOREIGN KEY (`idpersonnes`) REFERENCES `personnes` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscriptionetudiants_semestre` FOREIGN KEY (`idsemestres`) REFERENCES `semestre` (`idsemestres`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `lespageselabs`
--
ALTER TABLE `lespageselabs`
  ADD CONSTRAINT `fk_lespageselabs_elabs` FOREIGN KEY (`idelabes`) REFERENCES `elabs` (`idelabes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `niveauformations`
--
ALTER TABLE `niveauformations`
  ADD CONSTRAINT `fk_niveauformations_formations` FOREIGN KEY (`formations_idformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD CONSTRAINT `fk_personnes_roles` FOREIGN KEY (`roles_idroles`) REFERENCES `roles` (`idroles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_inscriptionelabs` FOREIGN KEY (`inscriptionelabs_idinscriptionelabs`) REFERENCES `inscriptionelabs` (`idinscriptionelabs`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
