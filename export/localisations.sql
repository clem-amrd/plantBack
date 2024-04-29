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

-- Listage des données de la table izzie.localisations : ~95 rows (environ)
INSERT INTO `localisations` (`id`, `created_at`, `updated_at`, `departement`) VALUES
	(1, '2023-10-18 10:16:28', '2023-10-18 10:16:29', 'Ain'),
	(2, NULL, NULL, 'Aisne'),
	(3, NULL, NULL, 'Allier'),
	(4, NULL, NULL, 'Alpes de Haute-Provence'),
	(5, NULL, NULL, 'Hautes-Alpes'),
	(6, NULL, NULL, 'Alpes-Maritimes'),
	(7, NULL, NULL, 'Ardèche'),
	(8, NULL, NULL, 'Ardennes'),
	(9, NULL, NULL, 'Ariège'),
	(10, NULL, NULL, 'Aube'),
	(11, NULL, NULL, 'Aude'),
	(12, NULL, NULL, 'Aveyron'),
	(13, NULL, NULL, 'Bouches-du-Rhône'),
	(14, NULL, NULL, 'Calvados'),
	(15, NULL, NULL, 'Cantal'),
	(16, NULL, NULL, 'Charente-maritime'),
	(17, NULL, NULL, 'Cher'),
	(18, NULL, NULL, 'Corrèze'),
	(19, NULL, NULL, 'Corse-du-Sud'),
	(20, NULL, NULL, 'Haute-Corse'),
	(21, NULL, NULL, 'Côte-d\'Or'),
	(22, NULL, NULL, 'Côtes-d\'Armor'),
	(23, NULL, NULL, 'Creuse'),
	(24, NULL, NULL, 'Dordogne'),
	(25, NULL, NULL, 'Doubs'),
	(26, NULL, NULL, 'Drôme'),
	(27, NULL, NULL, 'Eure'),
	(28, NULL, NULL, 'Eure-et-Loire'),
	(29, NULL, NULL, 'Finister'),
	(30, NULL, NULL, 'Guard'),
	(31, NULL, NULL, 'Haute-Garonne'),
	(32, NULL, NULL, 'Gers'),
	(33, NULL, NULL, 'Gironde'),
	(34, NULL, NULL, 'Hérault'),
	(35, NULL, NULL, 'Ille-et-Vilaine'),
	(36, NULL, NULL, 'Indre'),
	(37, NULL, NULL, 'Indre-et-Loire'),
	(38, NULL, NULL, 'Isère'),
	(39, NULL, NULL, 'Jura'),
	(40, NULL, NULL, 'Landes'),
	(41, NULL, NULL, 'Loire-et-Cher'),
	(42, NULL, NULL, 'Loire'),
	(43, NULL, NULL, 'Haute-Loire'),
	(44, NULL, NULL, 'Loire-Atlantique'),
	(45, NULL, NULL, 'Loiret'),
	(46, NULL, NULL, 'Lot'),
	(47, NULL, NULL, 'Lot-et-Garonne'),
	(48, NULL, NULL, 'Lozère'),
	(49, NULL, NULL, 'Maine-et-Loire'),
	(50, NULL, NULL, 'Manche'),
	(51, NULL, NULL, 'Marne'),
	(52, NULL, NULL, 'Haute-Marne'),
	(53, NULL, NULL, 'Mayenne'),
	(54, NULL, NULL, 'Meurthe-et-Moseille'),
	(55, NULL, NULL, 'Meuse'),
	(56, NULL, NULL, 'Morbihan'),
	(57, NULL, NULL, 'Moselle'),
	(58, NULL, NULL, 'Nièvre'),
	(59, NULL, NULL, 'Nord'),
	(60, NULL, NULL, 'Oise'),
	(61, NULL, NULL, 'Orne'),
	(62, NULL, NULL, 'Pas-de-Calais'),
	(63, NULL, NULL, 'Puy-de-Dôme'),
	(64, NULL, NULL, 'Pyrénées-Atlantiques'),
	(65, NULL, NULL, 'Hautes-Pyrénées'),
	(66, NULL, NULL, 'Pyrénées-Orientales'),
	(67, NULL, NULL, 'Bas-Rhin'),
	(68, NULL, NULL, 'Haut-Rhin'),
	(69, NULL, NULL, 'Rhône'),
	(70, NULL, NULL, 'Haute-saône'),
	(71, NULL, NULL, 'Saône-et-Loire'),
	(72, NULL, NULL, 'Sarthe'),
	(73, NULL, NULL, 'Savoie'),
	(74, NULL, NULL, 'Haute-Savoie'),
	(75, NULL, NULL, 'Paris'),
	(76, NULL, NULL, 'Seine-Maritime'),
	(77, NULL, NULL, 'Seine-et-Marne'),
	(78, NULL, NULL, 'Yvelines'),
	(79, NULL, NULL, 'Deux-Sèvres'),
	(80, NULL, NULL, 'Somme'),
	(81, NULL, NULL, 'Tarn'),
	(82, NULL, NULL, 'tarn-et-Garonne'),
	(83, NULL, NULL, 'Var'),
	(84, NULL, NULL, 'Vaucluse'),
	(85, NULL, NULL, 'Vendée'),
	(86, NULL, NULL, 'Vienne'),
	(87, NULL, NULL, 'Haute-Vienne'),
	(88, NULL, NULL, 'Vosges'),
	(89, NULL, NULL, 'Yonne'),
	(90, NULL, NULL, 'Territoire de Belfort'),
	(91, NULL, NULL, 'Essonne'),
	(92, NULL, NULL, 'Hauts-de-Seine'),
	(93, NULL, NULL, 'Seine-Saint-Denis'),
	(94, NULL, NULL, 'Val-de-Marne'),
	(95, NULL, NULL, 'Val-d\'Oise');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
