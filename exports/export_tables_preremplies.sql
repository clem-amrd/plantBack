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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
