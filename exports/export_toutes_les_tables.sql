-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.1.0 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de table graine. habitats
CREATE TABLE IF NOT EXISTS `habitats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.habitats : ~3 rows (environ)
INSERT INTO `habitats` (`id`, `type`, `created_at`, `updated_at`) VALUES
	(1, 'jardin à même la terre', NULL, NULL),
	(2, 'Balcon/Terrasse', NULL, NULL),
	(3, 'Les deux', NULL, NULL);

-- Listage de la structure de table graine. localisations
CREATE TABLE IF NOT EXISTS `localisations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_temperature` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.localisations : ~13 rows (environ)
INSERT INTO `localisations` (`id`, `region`, `average_temperature`, `created_at`, `updated_at`) VALUES
	(1, 'Île-de-France', 12, NULL, NULL),
	(2, 'Provence-Alpes-Côte d\'Azur', 16, NULL, NULL),
	(3, 'Bretagne', 12, NULL, NULL),
	(4, 'Occitanie', 16, NULL, NULL),
	(5, 'Nouvelle-Aquitaine', 14, NULL, NULL),
	(6, 'Auvergne-Rhône-Alpes', 12, NULL, NULL),
	(7, 'Hauts-de-France', 11, NULL, NULL),
	(8, 'Grand Est', 10, NULL, NULL),
	(9, 'Pays de la Loire', 13, NULL, NULL),
	(10, 'Centre-Val de Loire', 12, NULL, NULL),
	(11, 'Normandie', 11, NULL, NULL),
	(12, 'Bourgogne-Franche-Comté', 10, NULL, NULL),
	(13, 'Corse', 16, NULL, NULL);

-- Listage de la structure de table graine. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.migrations : ~9 rows (environ)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2024_04_29_135518_create_users_table', 1),
	(7, '2024_04_29_140439_create_habitats_table', 1),
	(8, '2024_04_29_140452_create_localisations_table', 1),
	(10, '2024_04_29_145956_add_habitat_id_to_users', 2),
	(11, '2024_04_29_174346_create_plants_users_table', 3),
	(12, '2024_04_29_174646_create_plants_table', 4),
	(13, '2024_04_30_093914_add_plant_id_to_plants_users', 5),
	(14, '2024_04_30_133524_create_my_plants_table', 6);

-- Listage de la structure de table graine. my_plants
CREATE TABLE IF NOT EXISTS `my_plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wateringDate` datetime DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `plant_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `my_plants_user_id_foreign` (`user_id`),
  KEY `my_plants_plant_id_foreign` (`plant_id`),
  CONSTRAINT `my_plants_plant_id_foreign` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `my_plants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.my_plants : ~2 rows (environ)
INSERT INTO `my_plants` (`id`, `created_at`, `updated_at`, `wateringDate`, `user_id`, `plant_id`) VALUES
	(23, '2024-05-03 11:33:27', '2024-05-03 11:33:27', '2024-05-03 00:00:00', 2, 5),
	(24, '2024-05-03 11:33:37', '2024-05-03 11:33:37', '2024-05-03 00:00:00', 2, 7),
	(26, '2024-05-03 12:50:23', '2024-05-03 12:50:23', '2024-05-03 00:00:00', 7, 6),
	(27, '2024-05-03 12:50:25', '2024-05-03 12:50:25', '2024-05-03 00:00:00', 7, 8),
	(28, '2024-05-03 13:14:21', '2024-05-03 13:14:21', '2024-05-03 00:00:00', 10, 6),
	(29, '2024-05-03 13:14:23', '2024-05-03 13:14:23', '2024-05-03 00:00:00', 10, 8),
	(30, '2024-05-03 13:15:42', '2024-05-03 13:15:42', '2024-05-03 00:00:00', 10, 10),
	(31, '2024-05-03 13:17:05', '2024-05-03 13:17:05', '2024-05-03 00:00:00', 2, 6),
	(32, '2024-05-03 13:18:40', '2024-05-03 13:18:40', '2024-05-03 00:00:00', 11, 6),
	(33, '2024-05-03 13:19:47', '2024-05-03 13:19:47', '2024-05-03 00:00:00', 11, 8),
	(34, '2024-05-03 13:22:59', '2024-05-03 13:22:59', '2024-05-03 00:00:00', 12, 6),
	(35, '2024-05-03 13:24:16', '2024-05-03 13:24:16', '2024-05-03 00:00:00', 12, 18);

-- Listage de la structure de table graine. personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.personal_access_tokens : ~3 rows (environ)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(2, 'App\\Models\\User', 1, 'API TOKEN', 'a85e0cae7b9f69ab76842b6463f1fe497123bba17a15512088b944b2ddcb885b', '["*"]', '2024-04-29 12:22:30', NULL, '2024-04-29 12:22:30', '2024-04-29 12:22:30'),
	(9, 'App\\Models\\User', 5, 'API TOKEN', '1597343ad34db5d48c7de8906e32c1f076a4510ac891b9b36a1e958b1b9583fd', '["*"]', NULL, NULL, '2024-05-02 16:36:00', '2024-05-02 16:36:00'),
	(13, 'App\\Models\\User', 7, 'API TOKEN', '9d8a78692d9755db6cc8837e867e7cffe6dfc0e76896d67f4eb1af0d8360389d', '["*"]', '2024-05-03 13:02:07', NULL, '2024-05-03 12:44:54', '2024-05-03 13:02:07'),
	(14, 'App\\Models\\User', 8, 'API TOKEN', '622850deb0828b700f55b5922b6e434922c8bac716b052ecedab584b7163afa0', '["*"]', '2024-05-03 13:10:27', NULL, '2024-05-03 13:10:12', '2024-05-03 13:10:27'),
	(15, 'App\\Models\\User', 9, 'API TOKEN', 'a9c33b91fb7d75716241911ee4f4f292dee82c4789f7889ad8f701bc06d5a979', '["*"]', '2024-05-03 13:11:59', NULL, '2024-05-03 13:11:47', '2024-05-03 13:11:59'),
	(17, 'App\\Models\\User', 2, 'API TOKEN', '3253a4f81c581fd26473adc22f0bd6bc69c42ea3008fd9de0fc74ae84b51a720', '["*"]', '2024-05-03 13:17:08', NULL, '2024-05-03 13:16:29', '2024-05-03 13:17:08');

-- Listage de la structure de table graine. plants
CREATE TABLE IF NOT EXISTS `plants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scientific_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_height` int DEFAULT NULL,
  `average_height` int DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light` int DEFAULT NULL,
  `temperature_min` int DEFAULT NULL,
  `temperature_max` int DEFAULT NULL,
  `temperature_perfect` int DEFAULT NULL,
  `seed_months` json DEFAULT NULL,
  `fruit_months` json DEFAULT NULL,
  `row_spacing` int DEFAULT NULL,
  `toxicity` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `watering` int DEFAULT NULL,
  `humidity` int DEFAULT NULL,
  `compatibility` json DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fruit` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.plants : ~16 rows (environ)
INSERT INTO `plants` (`id`, `name`, `scientific_name`, `maximum_height`, `average_height`, `photo`, `light`, `temperature_min`, `temperature_max`, `temperature_perfect`, `seed_months`, `fruit_months`, `row_spacing`, `toxicity`, `description`, `watering`, `humidity`, `compatibility`, `difficulty`, `created_at`, `updated_at`, `fruit`) VALUES
	(5, 'Tomate', 'Lycopersicon esculentum', 200, 150, 'tomate.png', 100, 10, 35, 22, '{"months": ["03", "04", "05", "06"]}', '{"months": ["07", "10"]}', NULL, 1, 'Fruit rouge juteux, utilisé dans une variété de plats, riche en vitamine C.', 2, NULL, '{"habitat": ["3"]}', 0, NULL, NULL, 1),
	(6, 'Courgette', 'Cucurbita pepo', 100, 70, 'courgette.png', 100, 10, 35, 22, '{"months": ["04", "05", "06", "07"]}', '{"months": ["07", "10"]}', NULL, 0, 'Légume vert allongé, doux, utilisé souvent cuit', 3, NULL, '{"habitat": ["3"]}', 0, NULL, NULL, 0),
	(7, 'Radis', 'Raphanus sativus', 50, 25, 'radis.png', 60, 4, 30, 18, '{"months": ["03", "04", "05", "06", "07", "08", "09", "10"]}', '{"months": ["04", "11"]}', NULL, 0, 'Petits légumes croquants, souvent rouges, à croissance très rapide et goût piquant.', 3, NULL, '{"habitat": ["3"]}', 0, NULL, NULL, 0),
	(8, 'Laitue', 'Lactuca sativa', 30, 20, 'laitue.png', 60, -2, 28, 15, '{"months": ["03", "04", "05", "06", "07", "08", "09"]}', '{"months": ["04", "11"]}', NULL, 0, 'Feuilles tendres utilisées principalement pour les salades, variété de couleurs et de formes.', 2, NULL, '{"habitat": ["3"]}', 0, NULL, NULL, 0),
	(9, 'Carotte', 'Daucus carota subsp. sativus', 30, 17, 'carotte.png', 60, -4, 30, 18, '{"months": ["03", "04", "05", "06", "07"]}', '{"months": ["05", "12"]}', NULL, 0, 'Légume racine allongé, généralement de couleur orange, mais existe en violet, jaune et blanc. Croissance souterraine avec des feuilles frisées en surface.', 4, NULL, '{"habitat": ["1"]}', 1, NULL, NULL, 0),
	(10, 'Concombre', 'Cucumis sativus', 200, 120, 'concombre.png', 100, 15, 35, 24, '{"months": ["04", "05", "06", "07"]}', '{"months": ["07", "10"]}', NULL, 0, 'Fruits longs et verts, consommés crus, souvent en salade. Plantes grimpantes nécessitant un support pour une bonne croissance.', 2, NULL, '{"habitat": ["1"]}', 1, NULL, NULL, 0),
	(11, 'Poivron', 'Capsicum annuum', 150, 100, 'poivrons.png', 100, 18, 30, 24, '{"months": ["03", "04", "05", "06"]}', '{"months": ["07", "11"]}', NULL, 0, 'Fruits de diverses couleurs (vert, rouge, jaune, orange) selon la maturité et la variété. Utilisés crus ou cuits, sucrés ou piquants selon la variété.', 4, NULL, '{"habitat": ["3"]}', 1, NULL, NULL, 0),
	(12, 'Haricot vert', 'Phaseolus vulgaris', 250, 170, 'haricot.png', 100, 10, 30, 21, '{"months": ["04", "05", "06", "07", "08"]}', '{"months": ["06", "10"]}', NULL, 0, 'Légumes longs et minces, verts, jaunes ou violets. Croissance en buisson ou en grimpant, nécessitant un support pour les variétés grimpantes.', 3, NULL, '{"habitat": ["1"]}', 1, NULL, NULL, 0),
	(13, 'Aubergine', 'Solanum melongena', 180, 120, 'aubergine.png', 100, 18, 30, 25, '{"months": ["04", "05", "06", "07"]}', '{"months": ["07", "10"]}', NULL, 1, 'Fruit de forme oblongue, généralement de couleur pourpre foncé, utilisé dans de nombreux plats, notamment grillées, en ragoût ou en caviar.', 3, NULL, '{"habitat": ["1"]}', 2, NULL, NULL, 0),
	(14, 'Choux', 'Brassica oleracea', 120, 70, 'choux.png', 60, -15, 24, 17, '{"months": ["03", "04", "05", "06", "07"]}', '{"months": ["07", "12"]}', NULL, 1, 'Inclut plusieurs variétés comme le chou frisé, chou de Bruxelles, chou-fleur, et brocoli. Crucifères nécessitant une surveillance pour éviter les attaques de parasites.', 4, NULL, '{"habitat": ["1"]}', 2, NULL, NULL, 0),
	(15, 'Brocolis', 'Brassica oleracea var. italica', 90, 60, 'brocolis.png', 60, -7, 24, 20, '{"months": ["03", "04", "05", "06", "07"]}', '{"months": ["04", "08"]}', NULL, 0, 'Légume vert à fleurs compactes, riche en vitamines et minéraux. Sensible aux fluctuations de température, qui peuvent affecter la formation des têtes.', 3, NULL, '{"habitat": ["1"]}', 2, NULL, NULL, 0),
	(16, 'Pomme de terre', 'Solanum tuberosum', 90, 60, 'pomme_terre.png', 60, 4, 25, 17, '{"months": ["03", "04", "05"]}', '{"months": ["06", "10"]}', NULL, 1, 'Tubercule souterrain riche en amidon, consommé dans le monde entier sous de nombreuses formes.', 5, NULL, '{"habitat": ["3"]}', 2, NULL, NULL, 0),
	(17, 'Framboise', 'Rubus idaeus', 200, 150, 'framboise.png', 60, -30, 30, 20, '{"months": ["01", "02", "03", "04"]}', '{"months": ["06", "09"]}', NULL, 0, 'Arbuste produisant des fruits rouges, juteux et délicats. Nécessite un support pour les tiges et une taille annuelle.', 4, NULL, '{"habitat": ["3"]}', 3, NULL, NULL, 1),
	(18, 'Melon', 'Cucumis melo', 300, 200, 'melon.png', 100, 18, 35, 28, '{"months": ["04", "05", "06", "07"]}', '{"months": ["07", "10"]}', NULL, 0, 'Fruit à chair sucrée, disponible en plusieurs variétés (cantaloup, miel, etc.). Nécessite un espace important pour la croissance et un sol très fertile.', 4, NULL, '{"habitat": ["1"]}', 3, NULL, NULL, 1),
	(19, 'Asperge', 'Asparagus officinalis', 200, 100, 'asperge.png', 60, -20, 30, 20, '{"months": ["03", "04", "05", "06"]}', '{"months": ["04", "07"]}', NULL, 0, 'Plante vivace produisant des tiges comestibles vertes ou blanches. Nécessite plusieurs années avant la première récolte. Fournit des récoltes annuelles une fois établie.', 4, NULL, '{"habitat": ["1"]}', 3, NULL, NULL, 0),
	(20, 'Artichaut', 'Cynara cardunculus var. scolymus', 200, 150, 'artichaut.png', 100, -5, 30, 20, '{"months": ["03", "04", "05", "06", "07"]}', '{"months": ["08", "11"]}', NULL, 0, 'Plante vivace produisant de grandes têtes florales comestibles. Nécessite un sol fertile et bien drainé, ainsi que beaucoup d\'espace. Sensible aux parasites et aux maladies.', 4, NULL, '{"habitat": ["1"]}', 3, NULL, NULL, 0);

-- Listage de la structure de table graine. plants_users
CREATE TABLE IF NOT EXISTS `plants_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `plant_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plants_users_user_id_foreign` (`user_id`,`plant_id`) USING BTREE,
  KEY `plant_users_plant_id_foreign` (`plant_id`),
  CONSTRAINT `plant_users_plant_id_foreign` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plants_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.plants_users : ~0 rows (environ)
INSERT INTO `plants_users` (`id`, `created_at`, `updated_at`, `user_id`, `plant_id`) VALUES
	(18, NULL, NULL, 7, 5),
	(20, NULL, NULL, 10, 9),
	(21, NULL, NULL, 2, 5),
	(22, NULL, NULL, 2, 6),
	(23, NULL, NULL, 2, 8),
	(25, NULL, NULL, 11, 9),
	(26, NULL, NULL, 12, 9);

-- Listage de la structure de table graine. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `google_id` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` longtext COLLATE utf8mb4_unicode_ci,
  `vegetable_garden_size` int DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `localisation_id` bigint unsigned DEFAULT NULL,
  `habitat_id` bigint unsigned DEFAULT NULL,
  `experience` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_localisation_id_foreign` (`localisation_id`),
  KEY `users_habitat_id_foreign` (`habitat_id`),
  CONSTRAINT `users_habitat_id_foreign` FOREIGN KEY (`habitat_id`) REFERENCES `habitats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_localisation_id_foreign` FOREIGN KEY (`localisation_id`) REFERENCES `localisations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table graine.users : ~3 rows (environ)
INSERT INTO `users` (`id`, `google_id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `vegetable_garden_size`, `remember_token`, `created_at`, `updated_at`, `localisation_id`, `habitat_id`, `experience`) VALUES
	(2, NULL, 'clem', 'clem.amiard@gmail.com', NULL, '$2y$10$1od6D5H/PjmhdgLlHcbDjOamBhGtQrdkLvn5KRPmC8SZnQtdI/rru', 'avatar_cat.png', 30, NULL, '2024-04-30 08:46:24', '2024-05-01 13:38:03', 1, 2, 1),
	(5, NULL, 'tulilipe', 'tulipe@gmail.com', NULL, '$2y$10$zL7f0NqXIdWnjjF5mVJ37OUnDoIVUl3L5MY6yuWr6Om7l4ooCGDNu', 'avatar_cat.png', NULL, NULL, '2024-05-02 16:36:00', '2024-05-02 16:36:00', NULL, NULL, NULL),
	(6, NULL, 'm', 'cjp@gmail.com', NULL, '$2y$10$i8ilEEUyCKoXNJhKroQwS.qdtBhjMmImge3KO5b7J6k5t3YCbwSry', 'avatar_cat.png', 5, NULL, '2024-05-02 16:38:06', '2024-05-02 16:38:53', 1, 2, 1),
	(7, NULL, 'oui', 'clem.amiaeerd@gmail.com', NULL, '$2y$10$hSi1tObKAM.jxxe1OyHtfOZkhfkN9wcK3rdZESltbY4rsgyCJ6vBG', 'avatar_cat.png', 2, NULL, '2024-05-03 12:44:54', '2024-05-03 12:50:14', 3, 3, 0),
	(8, NULL, 'clemence', 'clem@gmail.com', NULL, '$2y$10$DZUFfqH9bpcVjbzOF582WeNruS1hI2vefqNufyGl4QU6JAu3vf5ku', 'avatar_cat.png', 25, NULL, '2024-05-03 13:10:12', '2024-05-03 13:10:25', 2, 3, 0),
	(9, NULL, 'clemence amiard', 'clemamiard@gmail.com', NULL, '$2y$10$ZuJCsK...tyZSTDBtMKtX.joSQOxQKH7hU2mU.dnIRW5ReaIBZcGu', 'avatar_cat.png', 25, NULL, '2024-05-03 13:11:47', '2024-05-03 13:11:57', 2, 3, 0),
	(10, NULL, 'lili', 'lili@gmail.com', NULL, '$2y$10$bUb0gTz7em3ckhGSvmdYJObJxmw/Qh/7y/NlJqLzJkA0Wq9QsyGQ6', 'avatar_cat.png', 25, NULL, '2024-05-03 13:14:04', '2024-05-03 13:14:14', 2, 1, 0),
	(11, NULL, 'lily', 'lily@gmail.com', NULL, '$2y$10$F1pplS0FvzguZkPQ.i7ejO04VJl8PSei9fgvaO8ifxTuA8E/q33c.', 'avatar_cat.png', 25, NULL, '2024-05-03 13:18:23', '2024-05-03 13:18:34', 2, 1, 0),
	(12, NULL, 'lilii', 'lilii@gmail.com', NULL, '$2y$10$/SQsqASApsGP2CD7SF4vMuP8M/oACZEjoEfKeUbu22vZ9u4jXjIzO', 'avatar_cat.png', 25, NULL, '2024-05-03 13:22:37', '2024-05-03 13:22:53', 2, 1, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
