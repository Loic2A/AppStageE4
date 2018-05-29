-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 14 Novembre 2016 à 12:28
-- Version du serveur :  5.5.52-0+deb8u1
-- Version de PHP :  5.6.27-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `geststages`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
`num_classe` int(32) NOT NULL,
  `nom_classe` varchar(128) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`num_classe`, `nom_classe`) VALUES
(1, 'SIO');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS `entreprise` (
`num_entreprise` int(32) NOT NULL,
  `raison_sociale` varchar(128) NOT NULL,
  `nom_contact` varchar(128) DEFAULT NULL,
  `nom_resp` varchar(128) DEFAULT NULL,
  `rue_entreprise` varchar(128) DEFAULT NULL,
  `cp_entreprise` int(32) DEFAULT NULL,
  `ville_entreprise` varchar(128) NOT NULL,
  `tel_entreprise` varchar(32) DEFAULT NULL,
  `fax_entreprise` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `observation` text,
  `site_entreprise` varchar(128) DEFAULT NULL,
  `niveau` varchar(32) NOT NULL,
  `en_activite` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `entreprise` (`num_entreprise`, `raison_sociale`, `nom_contact`, `nom_resp`, `rue_entreprise`, `cp_entreprise`, `ville_entreprise`, `tel_entreprise`, `fax_entreprise`, `email`, `observation`, `site_entreprise`, `niveau`, `en_activite`) VALUES
(1, 'Webzine Maker (Campusplex)', 'Jérôme Pietri', 'Jérôme Pietri', '12 Rue Général Fiorella', 20000, 'Ajaccio', '09 72 12 82 06', '', 'info@webzinemaker.net', '', 'http://www.wmaker.net/', 'BAC+1/BAC+2', 1),
(2, 'DuoApps (Campusplex)', 'Mathieu Fancello', '', '12 Rue Général Fiorella', 20000, 'Ajaccio', '06 70 43 03 72', '', 'mathieu.fancello@gmail.com', '', 'http://www.duoapps.com/', 'BAC+1/BAC+2', 1),
(3, 'Ollandini', 'Bruno Mortreuil', '', '1 Rue Paul Colonna d''Istria', 20000, 'Ajaccio', '04 95 23 92 90', '', 'bruno.mortreuil@ollandini.fr', '', 'http://www.ollandini.fr/', 'BAC+2', 1),
(4, 'Conseil Départemental de la Corse du Sud', 'Elisabeth Bernard', '', '4 Cours Napoléon', 20183, 'Ajaccio', '04 95 29 16 20', '', 'elisabeth.bernard@cg-corsedusud.fr', '', 'http://www.cg-corsedusud.fr', 'BAC+1/BAC+2', 1),
(5, 'Communauté d''Agglomération du Pays Ajaccien (CAPA)', 'Laurent Alvarez Pinnelli', '', '18 rue Comte de Marbeuf', 20000, 'Ajaccio', '04 95 52 95 00', '', 'l.alvarez@ca-ajaccien.fr', '', 'http://www.ca-ajaccien.fr/', 'BAC+1/BAC+2', 1),
(6, 'Centre Hospitalier Miséricorde', 'Fontana Gérard', '', 'Av Impératrice Eugénie', 20303, 'Ajaccio', '04 95 29 94 36', '', '', '', '', 'Bac+1/Bac+2', 1),
(7, 'IPC - Informatique Professionnelle Corse', 'Marie Moretti', 'Marie Moretti', 'Parc San Lazaro - Av Napoléon III', 20000, 'Ajaccio', '0495211183', '', '', '', 'http://www.ipc-corse.com', 'Bac+1/Bac+2', 1),
(8, 'La Poste - Centre financier d''Ajaccio', 'Roger Bianchini', '', '22 avenue du Colonel Colonna d''Ornano', 20090, 'Ajaccio', '04 95 50 94 68', '', 'roger.bianchini@labanquepostale.fr', '', '', 'BAC+1/BAC+2', 1),
(9, 'Conseil Départemental de la Corse du Sud', 'Yves Vaccarezza', '', '8 Cours général Leclerc', 20000, 'Ajaccio', '04 95 29 12 42', '', 'yves.vaccarezza@cg-corsedusud.fr', '', 'http://www.cg-corsedusud.fr', 'BAC+1', 1),
(10, 'IRA de Bastia', 'Thierry Lacreuse', '', 'Quai des Martyrs de la Libération', 20200, 'Bastia', '04 95 32 87 15', '', '', '', 'https://www.ira-bastia.fr', 'BAC+1/BAC+2', 1),
(11, 'ARS - Agence Régionale de la Santé', 'Alain Husselstein', '', 'Route Saint-Joseph', 20700, 'Ajaccio', '04 95 51 99 14', '', 'alain.husselstein@ars.sante.fr', '', 'http://www.ars.corse.sante.fr/Internet.corse.0.html', 'BAC+1/BAC+2', 1),
(12, 'Lycée Montesoro', 'Alain Perinneti', '', 'rue de la 4éme DMM', 20200, 'Bastia', '06 88 08 11 88', '', 'alain.perinetti@montesoro.net', '', '', 'BAC+1/BAC+2', 1),
(13, 'Rectorat de Corse', 'Valérie Massot-Nanni', '', 'Bd Pascal Rossini', 20192, 'Ajaccio', '04 95 50 33 20', '', 'valerie.massot@ac-corse.fr', '', 'http://www.ac-corse.fr', 'BAC+1/BAC+2', 1),
(14, 'EDF - SEI Centre de Corse', 'Gaetan Tafani', '', '2 Avenue Impératrice Eugénie', 20000, 'Ajaccio', '04 95 29 72 90', '', 'gaetan.tafani@edf.fr', '', '', 'BAC+1/BAC+2', 1),
(15, 'France 3 Corse Via Stella', 'Olivier Bonnemayre', '', '8 Rue André Touranjon', 20700, 'Ajaccio', '06 87 70 85 97', '', '', '', '', 'BAC+1/BAC+2', 1),
(16, 'CCI  Corse du Sud', 'Hervé Delachanal', '', 'Gare maritime', 20000, 'Ajaccio', '04 95 51 55 55', '', 'herve.delachanal@sudcorse.cci.fr', '', 'http://www.2a.cci.fr', 'BAC+2', 1),
(17, 'Conseil Départemental de la Corse du Sud', 'André Allemand', '', '8 Cours général Leclerc', 20000, 'Ajaccio', '06 71 25 39 87', '', 'andre.allemand@cg-corsedusud.fr', '', 'http://www.cg-corsedusud.fr', 'BAC+2', 1),
(18, 'SARL OCTAEDRA', 'Samuel Sallei', '', 'Route du Vazzio pont du Ricanto', 20090, 'Ajaccio', '04 95 50 03 80', '', 'ssallei@octaedra.com', '', 'http://www.aria-tourisme.com', 'BAC+1/BAC+2', 1),
(19, 'ESI-DGFIP d''Ajaccio', 'Nicolas Cartallier', '', 'Immeuble Castellani Saint-Joseph', 20090, 'Ajaccio', '04 95 23 51 25', '', 'nicolas.cartallier@dgfip.finances.gouv.fr', '', '', 'BAC+1/BAC+2', 1),
(20, 'Rocca Transport', 'Frédéric Bor', '', 'ZI Baleone', 20501, 'Ajaccio', '06 37 20 43 41', '', 'frederic.bor@grouperocca.fr', '', 'http://www.rocca-transports.fr', 'BAC+1/BAC+2', 1),
(21, 'EDF Corse', 'Christophe Armani', '', '2 Avenue Impératrice', 20174, 'Ajaccio', '04 95 29 76 71', '', 'christophe.armani@edf.fr', '', '', 'BAC+1', 1),
(22, 'PIC Informatique', 'Pierre-Eric Babylon', '', 'Immeuble LOGOS, Avenue du mont Thabor', 20000, 'Ajaccio', '04 95 10 56 00', '', 'babylon@picinformatique.com', '', '', 'BAC+1', 1),
(23, 'Servitec Calvi', 'Pierre Panneton', '', 'Lieu-Dit Campo Longo, Route de Calenzana', 20260, 'Calvi', '04 95 65 32 20', '', '', '', '', 'BAC+1', 1),
(24, 'ARS - Agence Régionale de la Santé', 'Alain Marchand', '', 'Route Saint-Joseph', 20700, 'Ajaccio', '04 95 51 99 22', '', 'alain.marchand@ars.sante.fr', '', 'http://www.ars.corse.sante.fr/Internet.corse.0.html', 'BAC+1', 1),
(25, 'Crédit Agricole', 'Paul Poli', '', '1 Avenue Napoléon III', 20090, 'Ajaccio', '04 95 29 34 90', '', 'paul.poli@ca-corse.fr', '', '', 'BAC+1/BAC+2', 1),
(26, 'Raffalli Travaux Publics', 'Barthélémy Gabillaud', '', 'Zone Industrielle Caldaniccia', 20167, 'Sarrola Carcopino', '04 95 24 61 53', '', 'barthelemy.gabillaud@raffalli.fr', '', '', 'BAC+1/BAC+2', 1),
(27, 'Centre Hospitalier de Bastia', 'Olivier Murati', '', 'Bastia', 20600, 'Bastia', '04 95 59 18 19', '', 'omurati@ch-bastia.fr', '', 'http://www.ch-bastia.fr/', 'BAC+1/BAC+2', 1),
(28, 'CTC - Collectivité Territoriale de Corse', 'Valérie Petreto', '', 'Service Recherche 22 cours Grandval', 20187, 'Ajaccio', '04 95 51 66 08', '', 'valerie.petreto@ct-corse.fr', '', 'http://www.corse.fr', 'BAC+1', 1),
(29, 'CTC - Collectivité Territoriale de Corse', 'Laurence Pinelli', '', 'Service SIG - 22 cours Grandval', 20000, 'Ajaccio', '06 73 62 98 37', '', 'laurence.pinelli@ct-corse.fr', '', 'http://www.corse.fr', 'BAC+1/BAC+2', 1),
(30, 'CTC - Collectivité Territoriale de Corse', 'Jean-Thomas', '', 'DSI - 22 cours Grandval', 20000, 'Ajaccio', '04 95 51 65 01', '', 'jean-thomas.poletti@ct-corse.fr', '', 'http://www.corse.fr', 'BAC+1/BAC+2', 1),
(31, 'GIRTEC', 'Tumasgiu Rossini', '', '28 cours Grandval', 20000, 'Ajaccio', '06 15 80 96 00', '', 'tumasgiurossini­girtec@orange.fr', '', 'http://www.cg-corsedusud.fr/collectivite-departementale/ses-partenaires/le-girtec/', 'BAC+1/BAC+2', 1),
(32, 'SAGES Informatique', 'Mathieu Donzel', '', 'Lieu-dit Pernicaggio, ZA de la Caldaniccia', 20167, 'Sarrola-Carcopino', '04 95 10 84 91', '', 'm.donzel@zeendoc.com', '', 'http://www.sages-informatique.com', 'BAC+1/BAC+2', 1),
(33, 'Nextiraone', 'Toussaint Sauli', '', 'Chemin de Pietralba', 20090, 'Ajaccio', '04 95 23 10 10', '', 'Toussaint.SAULI@nextiraone.eu', '', 'http://www.nextiraone.fr/fr/home', 'BAC+1/BAC+2', 1);

-- --------------------------------------------------------

--
-- Structure de la table `equipe_pedag`
--

CREATE TABLE IF NOT EXISTS `equipe_pedag` (
  `num_prof` int(32) NOT NULL,
  `num_classe` int(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
`num_etudiant` int(32) NOT NULL,
  `nom_etudiant` varchar(64) NOT NULL,
  `prenom_etudiant` varchar(64) NOT NULL,
  `annee_obtention_bts` int(4) DEFAULT NULL,
  `num_classe` int(32) NOT NULL,
  `num_spec` int(32) NOT NULL,
  `en_activite` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`num_etudiant`, `nom_etudiant`, `prenom_etudiant`, `annee_obtention_bts`, `num_classe`, `num_spec`, `en_activite`) VALUES
(12, 'Dos Santos Velasco', 'Thomas', NULL, 1, 1, 1),
(11, 'Biernas', 'Norddine', NULL, 1, 1, 1),
(8, 'Mazan', 'Pierre', NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

CREATE TABLE IF NOT EXISTS `mission` (
`num_mission` int(32) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `num_stage` int(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE IF NOT EXISTS `professeur` (
`num_prof` int(32) NOT NULL,
  `nom_prof` varchar(64) NOT NULL,
  `prenom_prof` varchar(64) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `professeur`
--

INSERT INTO `professeur` (`num_prof`, `nom_prof`, `prenom_prof`) VALUES
(1, 'Raffalli', 'Apollonie'),
(2, 'Nivaggioni', 'Cécile'),
(3, 'Reymond', 'Paul-Henri'),
(4, 'Morillas', 'Julien');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
`num_spec` int(32) NOT NULL,
  `libelle` varchar(128) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`num_spec`, `libelle`) VALUES
(1, 'SLAM'),
(2, 'SISR'),
(3, 'ECO'),
(4, 'SN');

-- --------------------------------------------------------

--
-- Structure de la table `spec_entreprise`
--

CREATE TABLE IF NOT EXISTS `spec_entreprise` (
  `num_entreprise` int(32) NOT NULL,
  `num_spec` int(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `spec_entreprise`
--

INSERT INTO `spec_entreprise` (`num_entreprise`, `num_spec`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(5, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 1),
(16, 1),
(16, 2),
(17, 2),
(18, 1),
(19, 1),
(20, 2),
(21, 2),
(22, 1),
(23, 2),
(24, 1),
(25, 2),
(26, 1),
(27, 2),
(28, 2),
(29, 1),
(30, 2),
(31, 1),
(32, 1),
(33, 2);

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
`num_stage` int(32) NOT NULL,
  `debut_stage` datetime NOT NULL,
  `fin_stage` datetime NOT NULL,
  `type_stage` varchar(128) DEFAULT NULL,
  `desc_projet` text,
  `observation_stage` text,
  `num_etudiant` int(32) NOT NULL,
  `num_prof` int(32) NOT NULL,
  `num_entreprise` int(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stage`
--

INSERT INTO `stage` (`num_stage`, `debut_stage`, `fin_stage`, `type_stage`, `desc_projet`, `observation_stage`, `num_etudiant`, `num_prof`, `num_entreprise`) VALUES
(1, '2015-07-13 00:00:00', '2016-08-31 00:00:00', 'alternance', '', '', 8, 2, 1),
(3, '2016-01-11 00:00:00', '2016-02-19 00:00:00', 'stage', '', '', 11, 2, 4),
(4, '2016-01-11 00:00:00', '2016-02-19 00:00:00', 'stage', '', '', 12, 2, 5);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
 ADD PRIMARY KEY (`num_classe`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
 ADD PRIMARY KEY (`num_entreprise`);

--
-- Index pour la table `equipe_pedag`
--
ALTER TABLE `equipe_pedag`
 ADD PRIMARY KEY (`num_prof`,`num_classe`), ADD KEY `num_classe` (`num_classe`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
 ADD PRIMARY KEY (`num_etudiant`), ADD KEY `num_classe` (`num_classe`), ADD KEY `num_spec` (`num_spec`);

--
-- Index pour la table `mission`
--
ALTER TABLE `mission`
 ADD PRIMARY KEY (`num_mission`), ADD KEY `num_stage` (`num_stage`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
 ADD PRIMARY KEY (`num_prof`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
 ADD PRIMARY KEY (`num_spec`);

--
-- Index pour la table `spec_entreprise`
--
ALTER TABLE `spec_entreprise`
 ADD PRIMARY KEY (`num_entreprise`,`num_spec`), ADD KEY `num_spec` (`num_spec`);

--
-- Index pour la table `stage`
--
ALTER TABLE `stage`
 ADD PRIMARY KEY (`num_stage`), ADD KEY `num_etudiant` (`num_etudiant`), ADD KEY `num_prof` (`num_prof`), ADD KEY `num_entreprise` (`num_entreprise`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
MODIFY `num_classe` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
MODIFY `num_entreprise` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
MODIFY `num_etudiant` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `mission`
--
ALTER TABLE `mission`
MODIFY `num_mission` int(32) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
MODIFY `num_prof` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
MODIFY `num_spec` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
MODIFY `num_stage` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
