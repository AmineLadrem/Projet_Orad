-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 12 mai 2023 à 12:15
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `epal`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `ID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`ID`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) NOT NULL,
  `prix` decimal(7,2) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chef_de_parcs`
--

CREATE TABLE `chef_de_parcs` (
  `CDP_ID` int(11) NOT NULL,
  `NumParc` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chef_de_parcs`
--

INSERT INTO `chef_de_parcs` (`CDP_ID`, `NumParc`, `created_at`, `updated_at`) VALUES
(8, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `conducteurs`
--

CREATE TABLE `conducteurs` (
  `CDC_ID` int(11) NOT NULL,
  `NbrDemandesAcc` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `conducteurs`
--

INSERT INTO `conducteurs` (`CDC_ID`, `NbrDemandesAcc`, `created_at`, `updated_at`) VALUES
(9, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `conteneurs`
--

CREATE TABLE `conteneurs` (
  `Cont_ID` varchar(30) NOT NULL,
  `Cont_Type` varchar(5) NOT NULL,
  `Cont_Poids` double NOT NULL,
  `Cont_Status` varchar(15) NOT NULL,
  `ModNum` int(11) NOT NULL,
  `NumLivraison` bigint(20) UNSIGNED NOT NULL,
  `NumEmbarquement` bigint(20) UNSIGNED NOT NULL,
  `NumDebarquement` bigint(20) UNSIGNED NOT NULL,
  `NumVisite` bigint(20) UNSIGNED NOT NULL,
  `NumParc` int(11) NOT NULL,
  `Admin_ID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `conteneurs`
--

INSERT INTO `conteneurs` (`Cont_ID`, `Cont_Type`, `Cont_Poids`, `Cont_Status`, `ModNum`, `NumLivraison`, `NumEmbarquement`, `NumDebarquement`, `NumVisite`, `NumParc`, `Admin_ID`, `created_at`, `updated_at`) VALUES
('CCWA 6582', '40p', 35547, 'Debarque', 5, 1, 1, 1, 1, 1, 1, NULL, NULL),
('TGHU 23811', '20p', 30546, 'Stocke', 3, 2, 2, 2, 3, 16, 1, NULL, NULL),
('TGHU 53546', '20p', 20314, 'Debarque', 2, 1, 1, 1, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `debarquements`
--

CREATE TABLE `debarquements` (
  `NumDebarquement` bigint(20) UNSIGNED NOT NULL,
  `DateDebarquement` date NOT NULL,
  `HeureDebarquement` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `debarquements`
--

INSERT INTO `debarquements` (`NumDebarquement`, `DateDebarquement`, `HeureDebarquement`, `created_at`, `updated_at`) VALUES
(1, '2023-05-15', '12:30:00', NULL, NULL),
(2, '2023-05-16', '15:45:00', NULL, NULL),
(3, '2023-05-17', '09:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `demandes`
--

CREATE TABLE `demandes` (
  `CDP_ID` int(11) NOT NULL,
  `CDC_ID` int(11) NOT NULL,
  `DateDemande` date NOT NULL,
  `HeureDemande` time NOT NULL,
  `Status` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deplacements`
--

CREATE TABLE `deplacements` (
  `CDC_ID` int(11) NOT NULL,
  `Cont_ID` varchar(255) NOT NULL,
  `DateDep` date NOT NULL,
  `HeureDep` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `embarquements`
--

CREATE TABLE `embarquements` (
  `NumEmbarquement` bigint(20) UNSIGNED NOT NULL,
  `DateEmbarquement` date NOT NULL,
  `HeureEmbarquement` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `embarquements`
--

INSERT INTO `embarquements` (`NumEmbarquement`, `DateEmbarquement`, `HeureEmbarquement`, `created_at`, `updated_at`) VALUES
(1, '2023-05-17', '10:30:00', NULL, NULL),
(2, '2023-05-18', '09:45:00', NULL, NULL),
(3, '2023-05-19', '11:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livraisons`
--

CREATE TABLE `livraisons` (
  `NumLivraison` bigint(20) UNSIGNED NOT NULL,
  `DateLivraison` date NOT NULL,
  `HeureLivraison` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livraisons`
--

INSERT INTO `livraisons` (`NumLivraison`, `DateLivraison`, `HeureLivraison`, `created_at`, `updated_at`) VALUES
(1, '2023-05-16', '10:00:00', NULL, NULL),
(2, '2023-05-16', '14:30:00', NULL, NULL),
(3, '2023-05-17', '12:00:00', NULL, NULL),
(4, '2023-05-17', '15:45:00', NULL, NULL),
(5, '2023-05-19', '11:30:00', NULL, NULL),
(6, '2023-05-20', '16:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_13_213633_create_cars_table', 1),
(6, '2023_04_13_224049_create_modulesuivis_table', 1),
(7, '2023_04_13_225207_create_zones_table', 1),
(8, '2023_04_13_225441_create_visites_table', 1),
(9, '2023_04_13_225450_create_debarquements_table', 1),
(10, '2023_04_13_225457_create_embarquements_table', 1),
(11, '2023_04_13_225503_create_livraisons_table', 1),
(12, '2023_04_13_232450_create_utilisateurs_table', 1),
(13, '2023_04_14_043036_create_parcs_table', 1),
(14, '2023_04_14_043901_create_admins_table', 1),
(15, '2023_04_14_044806_create_conteneurs_table', 2),
(16, '2023_04_14_050508_create_conducteurs_table', 2),
(17, '2023_04_14_050840_create_deplacements_table', 2),
(18, '2023_04_14_051356_create_chef_de_parcs_table', 2),
(19, '2023_04_14_051509_create_pointeurs_table', 2),
(20, '2023_04_18_121430_create_demandes_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `modulesuivis`
--

CREATE TABLE `modulesuivis` (
  `ModNum` int(11) NOT NULL,
  `ModStatus` varchar(255) NOT NULL,
  `ModBatterie` double NOT NULL,
  `PositionX` double NOT NULL,
  `PositionY` double NOT NULL,
  `PositionH` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `modulesuivis`
--

INSERT INTO `modulesuivis` (`ModNum`, `ModStatus`, `ModBatterie`, `PositionX`, `PositionY`, `PositionH`, `created_at`, `updated_at`) VALUES
(1, 'Inactive', 100, 0, 0, 0, NULL, NULL),
(2, 'Active', 75.5, 36.760324, 3.072334, 0, NULL, NULL),
(3, 'Active', 50, 36.758385, 3.072243, 0, NULL, NULL),
(4, 'Inactive', 25.5, 0, 0, 0, NULL, NULL),
(5, 'Active', 75, 36.757705, 3.072298, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `parcs`
--

CREATE TABLE `parcs` (
  `NumParc` int(11) NOT NULL,
  `NomParc` varchar(30) NOT NULL,
  `NbrTotal` int(11) NOT NULL,
  `NbrDispo` int(11) NOT NULL,
  `Zone_ID` varchar(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `parcs`
--

INSERT INTO `parcs` (`NumParc`, `NomParc`, `NbrTotal`, `NbrDispo`, `Zone_ID`, `created_at`, `updated_at`) VALUES
(1, 'Parc 1', 50, 49, '1', NULL, NULL),
(2, 'Parc 2', 50, 49, '1', NULL, NULL),
(3, 'Parc 3', 50, 49, '2', NULL, NULL),
(4, 'Parc 4', 50, 49, '2', NULL, NULL),
(5, 'Parc 5', 50, 49, '2', NULL, NULL),
(6, 'Parc 6', 50, 49, '2', NULL, NULL),
(7, 'Parc 7', 50, 49, '2', NULL, NULL),
(8, 'Parc 8', 50, 49, '2', NULL, NULL),
(9, 'Parc 9', 50, 49, '3', NULL, NULL),
(10, 'Parc 10', 50, 49, '3', NULL, NULL),
(11, 'Parc 11', 50, 49, '3', NULL, NULL),
(12, 'Parc 12', 50, 49, '3', NULL, NULL),
(13, 'Parc 13', 50, 49, '3', NULL, NULL),
(14, 'Parc 14', 50, 49, '4', NULL, NULL),
(15, 'Parc 15', 50, 49, '4', NULL, NULL),
(16, 'Parc 16', 50, 49, '4', NULL, NULL),
(17, 'Parc 17', 50, 49, '4', NULL, NULL),
(18, 'Parc 18', 50, 49, '4', NULL, NULL),
(19, 'Parc 19', 50, 49, '5', NULL, NULL),
(20, 'Parc 20', 50, 49, '5', NULL, NULL),
(21, 'Parc 21', 50, 49, '5', NULL, NULL),
(22, 'Parc 22', 50, 49, '5', NULL, NULL),
(23, 'Parc 23', 50, 49, '5', NULL, NULL),
(24, 'Parc 24', 50, 49, '5', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pointeurs`
--

CREATE TABLE `pointeurs` (
  `Pointeur_ID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pointeurs`
--

INSERT INTO `pointeurs` (`Pointeur_ID`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Role` varchar(30) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `E-mail` varchar(30) NOT NULL,
  `tel` int(11) NOT NULL,
  `MotPass` varchar(16) NOT NULL,
  `Shift` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID`, `Nom`, `Prenom`, `Role`, `Adresse`, `E-mail`, `tel`, `MotPass`, `Shift`) VALUES
(1, 'Ahmed', 'Belhadj', 'admin', 'Alger', 'awwadxrr@gmail.com', 123456789, 'moha2002', 'Journée'),
(2, 'Mohamed', 'Benali', 'pointeur', '123 Rue Algiers', 'awpxrr@gmail.com', 5551234, 'moha2002', 'Matin'),
(8, 'Leila', 'Feriel', 'chef_de_parc', '789 Oak Street', 'chefparc@gmail.com', 2147483647, 'moha2002', 'Nuit'),
(9, 'Hicham', 'Ahmed', 'conducteur', '246 Maple Street', 'acccwpxrr@gmail.com', 2147483647, 'moha2002', 'Matin');

-- --------------------------------------------------------

--
-- Structure de la table `visites`
--

CREATE TABLE `visites` (
  `NumVisite` bigint(20) UNSIGNED NOT NULL,
  `DateVisite` date NOT NULL,
  `HeureVisite` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `visites`
--

INSERT INTO `visites` (`NumVisite`, `DateVisite`, `HeureVisite`, `created_at`, `updated_at`) VALUES
(1, '2023-05-25', '08:30:00', NULL, NULL),
(2, '2023-05-25', '10:00:00', NULL, NULL),
(3, '2023-05-26', '14:15:00', NULL, NULL),
(4, '2023-05-27', '09:45:00', NULL, NULL),
(5, '2023-05-28', '13:30:00', NULL, NULL),
(6, '2023-05-28', '16:00:00', NULL, NULL),
(7, '2023-05-29', '11:00:00', NULL, NULL),
(8, '2023-05-29', '15:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `zones`
--

CREATE TABLE `zones` (
  `Zone_ID` varchar(6) NOT NULL,
  `Zone_Nom` varchar(255) NOT NULL,
  `Zone_Type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `zones`
--

INSERT INTO `zones` (`Zone_ID`, `Zone_Nom`, `Zone_Type`, `created_at`, `updated_at`) VALUES
('1', 'Zone debarquement', 'debarquement', NULL, NULL),
('2', 'Zone d\'embarquement', 'embarquement', NULL, NULL),
('3', 'Zone de livraison', 'livraison', NULL, NULL),
('4', 'Zone de stockage', 'stockage', NULL, NULL),
('5', 'Zone de visite', 'visite', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_user_id_foreign` (`user_id`);

--
-- Index pour la table `chef_de_parcs`
--
ALTER TABLE `chef_de_parcs`
  ADD PRIMARY KEY (`CDP_ID`),
  ADD KEY `chef_de_parcs_numparc_foreign` (`NumParc`);

--
-- Index pour la table `conducteurs`
--
ALTER TABLE `conducteurs`
  ADD PRIMARY KEY (`CDC_ID`);

--
-- Index pour la table `conteneurs`
--
ALTER TABLE `conteneurs`
  ADD PRIMARY KEY (`Cont_ID`),
  ADD KEY `conteneurs_numparc_foreign` (`NumParc`),
  ADD KEY `conteneurs_admin_id_foreign` (`Admin_ID`),
  ADD KEY `conteneurs_modnum_foreign` (`ModNum`),
  ADD KEY `conteneurs_numlivraison_foreign` (`NumLivraison`),
  ADD KEY `conteneurs_numembarquement_foreign` (`NumEmbarquement`),
  ADD KEY `conteneurs_numdebarquement_foreign` (`NumDebarquement`),
  ADD KEY `conteneurs_numvisite_foreign` (`NumVisite`);

--
-- Index pour la table `debarquements`
--
ALTER TABLE `debarquements`
  ADD PRIMARY KEY (`NumDebarquement`);

--
-- Index pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD PRIMARY KEY (`CDC_ID`,`CDP_ID`),
  ADD KEY `demandes_cdp_id_foreign` (`CDP_ID`);

--
-- Index pour la table `deplacements`
--
ALTER TABLE `deplacements`
  ADD PRIMARY KEY (`CDC_ID`,`Cont_ID`),
  ADD KEY `deplacements_cont_id_foreign` (`Cont_ID`);

--
-- Index pour la table `embarquements`
--
ALTER TABLE `embarquements`
  ADD PRIMARY KEY (`NumEmbarquement`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `livraisons`
--
ALTER TABLE `livraisons`
  ADD PRIMARY KEY (`NumLivraison`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modulesuivis`
--
ALTER TABLE `modulesuivis`
  ADD PRIMARY KEY (`ModNum`);

--
-- Index pour la table `parcs`
--
ALTER TABLE `parcs`
  ADD PRIMARY KEY (`NumParc`),
  ADD KEY `parcs_zone_id_foreign` (`Zone_ID`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `pointeurs`
--
ALTER TABLE `pointeurs`
  ADD PRIMARY KEY (`Pointeur_ID`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `visites`
--
ALTER TABLE `visites`
  ADD PRIMARY KEY (`NumVisite`);

--
-- Index pour la table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`Zone_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `debarquements`
--
ALTER TABLE `debarquements`
  MODIFY `NumDebarquement` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `embarquements`
--
ALTER TABLE `embarquements`
  MODIFY `NumEmbarquement` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livraisons`
--
ALTER TABLE `livraisons`
  MODIFY `NumLivraison` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `visites`
--
ALTER TABLE `visites`
  MODIFY `NumVisite` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_id_foreign` FOREIGN KEY (`ID`) REFERENCES `utilisateurs` (`ID`);

--
-- Contraintes pour la table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `chef_de_parcs`
--
ALTER TABLE `chef_de_parcs`
  ADD CONSTRAINT `chef_de_parcs_cdp_id_foreign` FOREIGN KEY (`CDP_ID`) REFERENCES `utilisateurs` (`ID`),
  ADD CONSTRAINT `chef_de_parcs_numparc_foreign` FOREIGN KEY (`NumParc`) REFERENCES `parcs` (`NumParc`);

--
-- Contraintes pour la table `conducteurs`
--
ALTER TABLE `conducteurs`
  ADD CONSTRAINT `conducteurs_cdc_id_foreign` FOREIGN KEY (`CDC_ID`) REFERENCES `utilisateurs` (`ID`);

--
-- Contraintes pour la table `conteneurs`
--
ALTER TABLE `conteneurs`
  ADD CONSTRAINT `ModNumFK` FOREIGN KEY (`ModNum`) REFERENCES `modulesuivis` (`ModNum`),
  ADD CONSTRAINT `conteneurs_admin_id_foreign` FOREIGN KEY (`Admin_ID`) REFERENCES `admins` (`ID`),
  ADD CONSTRAINT `conteneurs_numdebarquement_foreign` FOREIGN KEY (`NumDebarquement`) REFERENCES `debarquements` (`NumDebarquement`),
  ADD CONSTRAINT `conteneurs_numembarquement_foreign` FOREIGN KEY (`NumEmbarquement`) REFERENCES `embarquements` (`NumEmbarquement`),
  ADD CONSTRAINT `conteneurs_numlivraison_foreign` FOREIGN KEY (`NumLivraison`) REFERENCES `livraisons` (`NumLivraison`),
  ADD CONSTRAINT `conteneurs_numparc_foreign` FOREIGN KEY (`NumParc`) REFERENCES `parcs` (`NumParc`),
  ADD CONSTRAINT `conteneurs_numvisite_foreign` FOREIGN KEY (`NumVisite`) REFERENCES `visites` (`NumVisite`);

--
-- Contraintes pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD CONSTRAINT `demandes_cdc_id_foreign` FOREIGN KEY (`CDC_ID`) REFERENCES `conducteurs` (`CDC_ID`),
  ADD CONSTRAINT `demandes_cdp_id_foreign` FOREIGN KEY (`CDP_ID`) REFERENCES `chef_de_parcs` (`CDP_ID`);

--
-- Contraintes pour la table `deplacements`
--
ALTER TABLE `deplacements`
  ADD CONSTRAINT `deplacements_cdc_id_foreign` FOREIGN KEY (`CDC_ID`) REFERENCES `conducteurs` (`CDC_ID`),
  ADD CONSTRAINT `deplacements_cont_id_foreign` FOREIGN KEY (`Cont_ID`) REFERENCES `conteneurs` (`Cont_ID`);

--
-- Contraintes pour la table `parcs`
--
ALTER TABLE `parcs`
  ADD CONSTRAINT `parcs_zone_id_foreign` FOREIGN KEY (`Zone_ID`) REFERENCES `zones` (`Zone_ID`);

--
-- Contraintes pour la table `pointeurs`
--
ALTER TABLE `pointeurs`
  ADD CONSTRAINT `pointeurs_pointeur_id_foreign` FOREIGN KEY (`Pointeur_ID`) REFERENCES `utilisateurs` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
