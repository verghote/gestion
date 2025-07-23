-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `gestion`
--

/*!40000 DROP DATABASE IF EXISTS `gestion`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gestion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gestion`;

--
-- Table structure for table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annonce` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `actif` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annonce`
--

LOCK TABLES `annonce` WRITE;
/*!40000 ALTER TABLE `annonce` DISABLE KEYS */;
INSERT INTO `annonce` VALUES (1,'La Domartoise','6ème édition Trail la domartoise. <br>Deux parcours : 12 km et 21 km et un parcours découverte de 6.5 km. <br>Il s’agit de courses à pied sur sentiers balisés, ouvertes à tous, hommes ou femmes, licenciés ou non, âgés de16 ans minimum pour les parcours de 6.5 - 12 km et 18 ans pour celui de 21 km.','2025-09-02',1),(2,'Course solidaire féminine','<p>La 13&egrave;me &eacute;dition de la Course Solidaire F&eacute;minine se d&eacute;roulera dans le cadre de la Journ&eacute;e Internationale des Droits de la Femme, le dimanche 12 mars 2025, au parc de la Hotoie d&rsquo;Amiens. Cette course est organis&eacute;e par l&rsquo;US Camon Athl&eacute;tisme. L&rsquo;objectif est d&rsquo;encourager la pratique du sport chez les femmes. Pour cette raison, la distance est volontairement limit&eacute;e &agrave; 5 km afin que les d&eacute;butantes puissent en faire un premier objectif atteignable en un temps de pr&eacute;paration raisonnable. Pour celles qui ne sont pas attir&eacute;es par la course, une &eacute;preuve de marche nordique a &eacute;t&eacute; ajout&eacute;e au programme depuis 2019. Un Challenge &laquo; Entreprises &raquo; et un Challenge &laquo; Lyc&eacute;es-CFA &raquo; sont organis&eacute;s : l&rsquo;&eacute;quipe est constitu&eacute;e de 4 participantes minimum. De cadettes &agrave; masters.</p>','2025-03-12',1),(3,'Les foulées Méaultoises','La 28 ème édition des foulées Méaultoises aura lieu le dimanche 12 Février.\nCette course est organisée par le club de l\'AMAAC.\n2 parcours de 5 km et 10 km sont proposés, accessibles à tous , de la catégorie cadet à master.\nDeux courses enfants auront lieu entre les deux courses phares.\nMédaille pour tous.\nInscription en ligne ou sur place avec majoration. Lot aux 200 premiers inscrits.\nRemise des dossards et des récompenses dans la salle des fêtes.\nNous vous attendons nombreux et nombreuses.\n','2025-02-12',1),(4,'Ultrabaie','Première édition du Trail entre Baie de Somme et Falaises \nDépart et arrivée à Saint-Valery-sur-Somme \nSolo : 19, 34, 54 et 70 km (Le Hordel, Cayeux sur Mer, Ault et Mess les Bains) Relais à 4 : 70 km','2025-07-02',0),(5,'Trail La Carolus','<strong>Trail de 5 et 17 kms, marches de 5 et 10 kms, courses enfants, le tout &agrave; Heilly dans une ambiance sportive et conviviale. Restauration sur place et animation pour les enfants. Une partie des b&eacute;n&eacute;fices sera revers&eacute;e &agrave;&nbsp;l&#39;association&nbsp;Grandir sans Cancer.</strong>\r\n\r\n<ul>\r\n	<li>Retrait des dossards dans le parc du grand canal&nbsp;&agrave; partir de 8H00.Pas d&#39;inscription sur place pour les deux courses adultes.</li>\r\n	<li>D&eacute;but des courses enfants &agrave; 9H30 (inscriptions sur place), pour gagner du temps pensez &agrave; remplir l&#39;autorisation parentale.</li>\r\n	<li>D&eacute;part du 17 kms &agrave; 10h15</li>\r\n	<li>D&eacute;part du 5 kms &agrave; 10h30</li>\r\n	<li>D&eacute;part des marches &agrave;&nbsp;10H30 (inscription sur place, tarif libre au profit de l&#39;association Grandir sans Cancer).</li>\r\n	<li>Ravitaillement pour tous &agrave; l&#39;arriv&eacute;e solide et liquide ainsi que la bi&egrave;re du Finisher.</li>\r\n	<li>Podium et r&eacute;compenses pour les trois premi&egrave;re et premier de chaques courses.</li>\r\n	<li>Cadeaux pour tous les participants lors de la remise des dossards.</li>\r\n</ul>','2025-05-14',0),(6,'Trail des Anguillères','<p>Le Rotary Club P&eacute;ronne-Albert-Ham organise sa 4&eacute;me &eacute;dition du &quot;Trail des Anguill&egrave;res&quot; le dimanche 02 avril 2025 &agrave; Frise (80).<br />\nAux programmes :<br />\n4 courses 5km / 13km / 23km et 33 km<br />\n2 marches 5km et 13 km<br />\n<br />\nLien d&#39;inscription:<br />\n<a href=\"https://www.klikego.com/inscription/trail-des-anguilleres-2025/course-a-pied-running/1639717766538-3\" target=\"_blank\">https://www.klikego.com/inscription/trail-des-anguilleres-2025/course-a-pied-running/1639717766538-3</a></p>\n\n<p>Vid&eacute;o de pr&eacute;sentation:&nbsp;<a href=\"https://youtu.be/YPuh7WZOQNA\" target=\"_blank\">https://youtu.be/YPuh7WZOQNA</a></p>\n\n<p>Les b&eacute;n&eacute;fices de cette journ&eacute;e seront revers&eacute;s aux lames de joie, c&#39;est une association qui &eacute;quipe des unijambistes avec des lames en carbone dans le but de pratiquer du sport.<br />\nsite internet : <a href=\"https://lamesdejoie.com/medias/\" target=\"_blank\">https://lamesdejoie.com/medias/</a><br />\nProposez-le &agrave; vos amis, votre famille, venez nombreux.</p>','2025-04-02',1),(7,'Corrida de la Vierge Dorée','<p>Corrida de 5 km dans les rues du centre ville, sur un parcours plat en 3 boucles. D&eacute;part &agrave; 20h</p>\n\n<p>En lever de rideau, courses d&eacute;couvertes pour les jeunes, courses des gar&ccedil;ons de caf&eacute;, et marche loisir de 6km.</p>\n\n<p>Date limite d&#39;inscription &agrave; la corrida le dimanche 07/05/2025 &agrave; 23h59, inscription sur place pour les autres &eacute;preuves.</p>\n\n<p>Infos sur le site: http://info-running-pic.com ou www.courses80.fr</p>','2025-05-12',1),(8,'La JULES VERNE ENEDIS 2025','Disputée le dimanche 11 juin prochain en plein centre-ville d\'Amiens et inscrite au challenge. \nLégères modifications du parcours par rapport à l\'édition 2022 avec notamment une arrivée jugée au bout de la rue Amiral Lejeune via la place Dewailly.\nEncore plus de groupes musicaux sur le parcours ! De la bière offerte aux participants du 5km !Un échauffement commun  au départ des courses rythmé par de la musique brésilienne en live !\nDes meneurs d\'allure sur le 10km H et F \nUne remise des dossards dès le jeudi 08 juin et vendredi 09 juin à INTERSPORT GLISY puis au cloitre Dewailly le samedi 10/06 et dimanche 11/06.\nToujours des épreuves de marche au programme (rando et marche nordique), un challenge entreprise sur l\'ensemble des épreuves','2025-06-11',0),(9,'24 HEURES NON STOP D\'EPPEVILLE','<p><strong>Depuis 1987 on court (ou on marche) &agrave; Eppeville chaque ann&eacute;e sur un circuit dor&eacute;navant d&#39;un kilom&egrave;tre de long, traversant la salle des sports.</strong></p>\n\n<p><strong>Choix : 3 heures en solo ou en relais de 3 relayeurs M /F, 6 heures idem en solo ou en relais de 3 relayeurs, 12 heures en solo ou en relais libre (minimum 3), 24 heures en solo ou en relais libre (minimum 4).</strong></p>\n\n<p><strong>En 2025, le rendez-vous est fix&eacute; au samedi 6 mai, d&eacute;part &agrave; 10h pr&eacute;cises.</strong></p>\n\n<p><strong>Les inscriptions se font uniquement par courrier postal jusqu&#39;au mercredi 3 mai au soir.</strong></p>\n\n<p><strong>Renseignements : 24h.eppeville@laposte.net</strong></p>\n\n<p><strong>Bienvenue &agrave; Eppeville, capitale de la course &agrave; pied de grand fond...</strong></p>','2025-05-06',1),(10,'L\'HORTILLONNE','<ul>\n	<li><span style=\"background-color:white\"><span style=\"color:black\">La 9&egrave;me &eacute;dition de l&#39;<strong><em>Hortillonne</em>, <em>trail Daniel VARLET</em>,</strong> se d&eacute;roulera dans le cadre de la f&ecirc;te des Hortillonnages, <strong>samedi 13 mai 2025, &agrave; 14 heures </strong>&agrave; <strong>Camon</strong>.</span></span><span style=\"background-color:white\">&nbsp;</span></li>\n	<li><span style=\"background-color:white\"><span style=\"color:black\">Cette course nature est organis&eacute;e par l&rsquo;<strong><em>US Camon Athl&eacute;tisme</em></strong>.</span></span></li>\n	<li><span style=\"background-color:white\"><span style=\"color:black\">Depuis 2017, l&#39;<strong><em>Hortillonne</em></strong> est devenue une<strong> c<em>ourse nature</em> </strong>d&#39;initiation. Le parcours 2025 mesure&nbsp;<strong>9,75 km</strong>.&nbsp;</span></span><span style=\"background-color:white\"><span style=\"color:black\">L&#39;<em><strong>Hortillonne</strong></em>&nbsp;porte n&eacute;anmoins le nom de <strong><em>Trail Daniel VARLET</em></strong> en hommage &agrave; son cr&eacute;ateur, disparu brutalement en 2017 alors qu&#39;il pr&eacute;parait la 5&egrave;me &eacute;dition.</span></span></li>\n	<li><span style=\"background-color:white\"><span style=\"color:black\">Parce que le sport doit se pratiquer &agrave; tous les niveaux, &agrave; tous les &acirc;ges et dans un large &eacute;ventail de disciplines, il a &eacute;t&eacute; ajout&eacute; une <strong>marche nordique</strong> sur le m&ecirc;me parcours que la course.</span></span><span style=\"background-color:white\">&nbsp;</span></li>\n	<li><span style=\"background-color:white\"><span style=\"color:black\">L</span><span style=\"color:black\">&#39;<strong><em>Hortillonne</em></strong> fait partie de la <strong><em>F&ecirc;te des Hortillonnages</em></strong> : c&#39;est donc l&#39;occasion de d&eacute;couvrir un site naturel de premier ordre, de se restaurer aupr&egrave;s des diff&eacute;rents stands, d&#39;assister &agrave; des concerts, de profiter des jeux, man&egrave;ges, attractions mis &agrave; votre disposition...</span></span></li>\n</ul>','2025-05-13',1),(11,'Tour pour Chloé et Ethan','Chaque année, Frédéric, fonctionnaire de police du commissariat de BEAUVAIS, organise son \"Tour pour Chloé et Ethan\".\nIl court afin de récolter des fonds pour deux enfants de policiers atteints de lourds handicaps.\nL\'Association Sportive de la Police Nationale et l\'Association sportive de la Police Amiénoise le soutiennent dans son périple.\nCette année, il ne courra pas à travers la France, ni à travers les Hauts-de-France, mais en « local », c’est à dire sur une boucle du parc de la Hotoie à AMIENS et cela toute la journée du 06/06/2025 entre 08h30 et 16h30\nSi vous souhaitez l\'aider dans sa démarche et l\'accompagner sur le circuit, vous êtes les bienvenus.\nEn vous remerciant par avance de ce que vous pouvez faire pour lui!','2025-06-06',1),(12,'4 saisons d\'Amiens métropole','<span style=\"color: red;\">Dernière épreuve du challenge 2025</span><ul><li>5 Km découverte: 9H20</li><li>10 Km Course des Joggers: 10H05</li><li>10 Km Course des As: 11H20</li></ul>Tarif unique : 8 € (frais d\'inscription compris)\nCe tarif vous donne droit le droit de participer à l\'ensemble des courses.','2025-07-02',1),(13,'Course pédestre Elle et Lui','La 21éme édition du Relais Elle et Lui a lieu le samedi 10 juin 2025 au départ du magnifique Parc du Petit Château de Dury.\nCourse en couple : Elle puis Lui et Elle&amp;Lui pour terminer main dans la main.\nC\'est aussi une animation VytaKids \"Courir-Sauter-Lancer\" pour les jeunes et une course encadrée 1,5 à 3km sur les allées du parc.\n\nEt à l\'arrivée ravitaillement copieux, tombola en attendant l’appétissant buffet des desserts confectionnés par les bénévoles de Vytajog','2025-06-10',0),(14,'TRAIL DES ÉVOISSONS','Le Trail des Évoissons, plusieurs fois considéré le plus beau Trail de Picardie. Ce Trail vous séduira par sa diversité de paysages traversés par les différentes épreuves. \n4 courses au programme \nUn RELAIS 13 / 22 km - 320D+ / 780 D+\nUne course de 22 km 780 D+\nUn 35 km  1100D+\nEt la course ultime, le 55 km avec ces 1650 mD+ \nN’hésitez pas à venir profiter de notre bonne humeur \nDes bénévoles au top (150) qui vous donneront la banane \nEt sans oublier notre buvette restauration qui vous accueillera de 7h à 17h sans interruptions ????.','2025-07-02',0),(15,'Les 5 km d\'Amiens-métropole','Organisée à la Hotoie à Amiens, et support de la seule demi-finale des championnats de France de 5KM dans les Hauts-de-France, qualificatives pour les championnats de France du 22/10 à St Omer\r\nParcours plat très performant (4 boucles de 1,25 km)\r\nLabel FFA régional\r\nInscriptions sur klikego jusqu’au jeudi 14 septembre à 23h00.\r\nRetrait des dossards sur place à partir de 9h\r\n3 départs : 10h (plus de 25 minutes), 10h45 (entre 20 et 25 minutes), 11h30 (moins de 20 minutes)\r\nCadeau à tous les participants et grille de primes\r\nCette demi finale est ouverte à tous (même aux non licenciés)','2025-09-17',1),(16,'LE CIRCUIT DU CHATEAU FORT - Challenge Maurice Herlein','Cette Course intramuros de 8800 m, en 4 tours de 2200 m avec la montée à chaque tour de l’escalier St martin pour un total de 588 marches et la descente de l \'escalier St Jean pour un total 384 marches à descendre, est organisée par la municipalité de Picquigny avec le groupement des commerçants et le running club de Picquigny .\r\n\r\nLes portes d’accès à la collégiale sont ouvertes pour votre entrainement jusque 20 h.\r\n\r\nLes inscriptions, à partir de la catégorie de cadets, sont ouverte sur le site de l’épreuve http://circuitduchateaufort.free.fr\r\nLes sportifs non licenciés doivent fournir un certificat d’aptitude à la course pédestre en compétitions.\r\nDépart de l\'épreuve 19h Retrait des dossards à partir de 16h à l\'hôtel de ville','2025-07-13',1);
/*!40000 ALTER TABLE `annonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloc`
--

DROP TABLE IF EXISTS `bloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloc` (
  `id` int NOT NULL,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloc`
--

LOCK TABLES `bloc` WRITE;
/*!40000 ALTER TABLE `bloc` DISABLE KEYS */;
INSERT INTO `bloc` VALUES (1,'Support et mise à disposition de services informatiques'),(2,'Conception et développement d\'applications'),(3,'Cybersécurité des services informatiques');
/*!40000 ALTER TABLE `bloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id` char(3) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `ageMin` tinyint NOT NULL,
  `ageMax` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`),
  CONSTRAINT `categorie_chk_1` CHECK ((`ageMin` < `ageMax`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES ('CA','Cadet',16,17),('ES','Espoir',20,22),('JU','Junior',18,19),('M0','Master 0',35,39),('M1','Master 1',40,44),('M10','Master 10',85,99),('M2','Master 2',45,49),('M3','Master 3',50,54),('M4','Master 4',55,59),('M5','Master 5',60,64),('M6','Master 6',65,69),('M7','Master 7',70,74),('M8','Master 8',75,79),('M9','Master 9',80,84),('MI','Minime',14,15),('SE','Senior',23,34);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantAjoutCategorie` BEFORE INSERT ON `categorie` FOR EACH ROW begin
    -- Mise en forme et vérification sur le code
    set new.id = ucase(new.id);

    if new.id not regexp '^[A-Za-z][A-Za-z0-9]{1,2}$' then
        signal sqlstate '45000' set message_text = '~Le code ne respecte pas le format attendu.';
    end if;

    if exists(select 1 from categorie where id = new.id) then
        signal sqlstate '45000' set message_text = '~Ce code est déjà attribué à une autre catégorie';
    end if;

    -- Mise en forme et vérification sur le nom
    Set new.nom = CONCAT(UPPER(LEFT(new.nom, 1)), LOWER(SUBSTRING(new.nom, 2)));

    if char_length(new.nom) not between 5 and 20 then
        signal sqlstate '45000' set message_text = '~Le nom doit comporter entre 5 et 20 caractères';
    end if;

    if new.nom not regexp '^[A-Za-z][A-Za-z]*( [0-9]{1,2})*$' then
        signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
    end if;

    if exists(select 1 from categorie where nom = new.nom) then
        signal sqlstate '45000' set message_text = '~Ce nom est déjà utilisé par une autre catégorie';
    end if;

    -- Vérification de l'intervalle des âges

    if new.ageMin not regexp '^([1-9]|[1-9][0-9])$' then
        signal sqlstate '45000' set message_text = '~Le format de l\'âge minimale est invalide.';
    end if;

    if new.ageMax not regexp '^([1-9]|[1-9][0-9])$' then
        signal sqlstate '45000' set message_text = '~Le format de l\'âge maximale est invalide.';
    end if;

    if new.ageMin > new.ageMax then
        signal sqlstate '45000' set message_text = '~L''intervalle des âges est invalide';
    end if;
    -- chevauchement de la tranche d'âge avec une catégorie existante
    -- pas de chevauchement si :  new.ageMax < ageMin ou new.ageMin > ageMax
    -- donc chevauchement si  : new.ageMax >= ageMin et new.ageMin <= ageMax
    if exists(select 1 from categorie where new.ageMax >= ageMin and new.ageMin <= ageMax) then
        signal sqlstate '45000' set message_text =
                '~L''intervalle de cette catégorie est en conflit avec une autre catégorie';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantMajCategorie` BEFORE UPDATE ON `categorie` FOR EACH ROW begin
    -- si l'identifiant est modifié il doit respecter le format attendu et être unique
    if new.id <> old.id then
        set new.id = ucase(new.id);

        if new.id not regexp '^[A-Za-z][A-Za-z0-9]{1,2}$' then
            signal sqlstate '45000' set message_text = '~Le code ne respecte pas le format attendu.';
        end if;

        if exists(select 1 from categorie where id = new.id) then
            signal sqlstate '45000' set message_text = '~Ce code est déjà attribué à une autre catégorie';
        end if;
    end if;

    -- si le nom est modifié il doit respecter le format attendu et être unique
    if new.nom <> old.nom then
        Set new.nom = CONCAT(UPPER(LEFT(new.nom, 1)), LOWER(SUBSTRING(new.nom, 2)));

        if char_length(new.nom) not between 5 and 20 then
            signal sqlstate '45000' set message_text = '~Le nom doit comporter entre 5 et 20 caractères';
        end if;

        if new.nom not regexp '^[A-Za-z][A-Za-z]*( [0-9]{1,2})*$' then
            signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
        end if;

        if exists(select 1 from categorie where nom = new.nom) then
            signal sqlstate '45000' set message_text = '~Ce nom est déjà utilisé par une autre catégorie';
        end if;
    end if;

    -- Si l'intervalle est modifié
    if new.ageMin <> old.ageMin or new.ageMax <> old.ageMax then
        if new.ageMin not regexp '^([1-9]|[1-9][0-9])$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'âge minimale est invalide.';
        end if;

        if new.ageMax not regexp '^([1-9]|[1-9][0-9])$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'âge maximale est invalide.';
        end if;

        if new.ageMin > new.ageMax then
            signal sqlstate '45000' set message_text = '~L''intervalle des âges est invalide';
        end if;
        -- chevaucchement
        -- pas de chevauchement si :  new.ageMax < ageMin ou new.ageMin > ageMax
        -- donc chevauchement si  : new.ageMax >= ageMin et new.ageMin <= ageMax
        if exists(select 1 from categorie where new.ageMax >= ageMin and new.ageMin <= ageMax and new.id != id) then
            signal sqlstate '45000' set message_text =
                    '~L''intervalle de cette catégorie est en conflit avec une autre catégorie';
        end if;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantSuppressionCategorie` BEFORE DELETE ON `categorie` FOR EACH ROW begin
    if exists(select 1 from coureur where idCategorie = old.id) then
        signal sqlstate '45000' set message_text =
                '~Cette catégorie ne peut être supprimée car elle est attachée à au moins un coureur';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id` char(6) NOT NULL,
  `nom` varchar(70) NOT NULL,
  `fichier` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('080004','AMIENS UC','auc.png'),('080014','US CAMON','camon.png'),('080021','AMICALE DU VAL DE SOMME','vds.png'),('080027','SAINT-OUEN DSL','dsl.png'),('080028','ALBERT MEAULTE AEROSPA.AC','amaac.png'),('080044','RUNNING CLUB DE CORBIE','rcc.png'),('080045','PERONNE ATHLETISME CLUB','peronne.png'),('080049','ESPRIT RUN','espritrun.webp'),('080060','RUNNING CLUB ABBEVILLOIS','rca.png'),('080061','VYTAJOG','vytajog.png'),('080071','SPORTING CLUB ABBEVILLOIS ATHL','sca.png');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantAjoutClub` BEFORE INSERT ON `club` FOR EACH ROW begin
    -- Vérification sur l'id
    IF new.id REGEXP '^[0-8]{3}[0-9]{3}$' = 0 then
        signal sqlstate '45000' set message_text =
                'Le numéro du club doit être un nombre de 6 chiffres commençant par 080';
    end if;

    if exists(select 1 from club where id = new.id) then
        signal sqlstate '45000' set message_text = '~Ce numéro est déjà attribué';
    end if;

    -- Mise en forme et vérification sur le nom
    set new.nom = ucase(new.nom);

    if char_length(new.nom) not between 3 and 60 then
        signal sqlstate '45000' set message_text = '~Le nom doit comprendre entre 3 et 60 caractères';
    end if;

    if new.nom not regexp '^[A-Za-z]+([ ''\-.]?[A-Za-z])*$' then
        signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
    end if;

    if exists(select 1 from club where nom = new.nom) then
        signal sqlstate '45000' set message_text = '~Ce nom est déjà utilisé';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantMajClub` BEFORE UPDATE ON `club` FOR EACH ROW begin
    -- Vérification sur l'id
    if new.id != old.id then
        IF new.id REGEXP '^[0-8]{3}[0-9]{3}$' = 0 then
            signal sqlstate '45000' set message_text =
                    'Le numéro du club doit être un nombre de 6 chiffres commençant par 080';
        end if;

        if exists(select 1 from club where id = new.id) then
            signal sqlstate '45000' set message_text = '~Ce numéro est déjà attribué';
        end if;

    end if;

    -- Mise en forme et vérification sur le nom

    if new.nom != old.nom then
        set new.nom = ucase(new.nom);

        if char_length(new.nom) not between 3 and 60 then
            signal sqlstate '45000' set message_text = '~Le nom doit comprendre entre 3 et 60 caractères';
        end if;

        if new.nom not regexp '^[A-Za-z]+([ ''\-.]?[A-Za-z])*$' then
            signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
        end if;

        if exists(select 1 from club where nom = new.nom) then
            signal sqlstate '45000' set message_text = '~Ce nom est déjà utilisé';
        end if;

    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantSuppressionClub` BEFORE DELETE ON `club` FOR EACH ROW begin
    -- il ne doit pas exister de coureur dans le club
    if exists(select 1 from coureur where idClub = old.id) then
        signal sqlstate '45000' set message_text =
                '~La suppression de ce club est impossible car il comprend des coureurs';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idBloc` int NOT NULL,
  `idDomaine` int NOT NULL,
  `idCompetence` int NOT NULL,
  `libelle` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idBloc` (`idBloc`,`idDomaine`,`idCompetence`),
  CONSTRAINT `competence_ibfk_1` FOREIGN KEY (`idBloc`, `idDomaine`) REFERENCES `domaine` (`idBloc`, `idDomaine`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence`
--

LOCK TABLES `competence` WRITE;
/*!40000 ALTER TABLE `competence` DISABLE KEYS */;
INSERT INTO `competence` VALUES (1,1,1,1,'Recenser et identifier les ressources numériques'),(2,1,1,2,'Exploiter des référentiels, normes et standards adoptés par le prestataire informatique'),(3,1,1,3,'Mettre en place et vérifier les niveaux d\'habilitation associés à un service'),(4,1,1,4,'Vérifier les conditions de la continuité d\'un service informatique'),(5,1,1,5,'Gérer des sauvegardes'),(6,1,1,6,'Vérifier le respect des règles d\'utilisation des ressources numériques'),(7,1,2,1,'Collecter, suivre et orienter des demandes'),(8,1,2,2,'Traiter des demandes concernant les services réseau et système, applicatifs'),(9,1,2,3,'Traiter des demandes concernant les applications'),(10,1,3,1,'Participer à la valorisation de l\'image de l\'organisation sur les médias numériques en tenant compte du cadre juridique et des enjeux économiques'),(11,1,3,2,'Référencer les services en ligne de l\'organisation et mesurer leur visibilité'),(12,1,3,3,'Participer à l\'évolution d\'un site Web exploitant les données de l\'organisation'),(13,1,4,1,'Analyser les objectifs et les modalités d\'organisation d\'un projet'),(14,1,4,2,'Planifier les activités'),(15,1,4,3,'Évaluer les indicateurs de suivi d\'un projet et analyser les écarts'),(16,1,5,1,'Réaliser les tests d\'intégration et d\'acceptation d\'un service'),(17,1,5,2,'Déployer un service'),(18,1,5,3,'Accompagner les utilisateurs dans la mise en place d\'un service'),(19,1,6,1,'Mettre en place son environnement d\'apprentissage personnel'),(20,1,6,2,'Mettre en œuvre des outils et stratégies de veille informationnelle'),(21,1,6,3,'Gérer son identité professionnelle'),(22,1,6,4,'Développer son projet professionnel'),(23,2,1,1,'Analyser un besoin exprimé et son contexte juridique'),(24,2,1,2,'Participer à la conception de l\'architecture d\'une solution applicative'),(25,2,1,3,'Modéliser une solution applicative'),(26,2,1,4,'Exploiter les ressources du cadre applicatif (framework)'),(27,2,1,5,'Identifier, développer, utiliser ou adapter des composants logiciels'),(28,2,1,6,'Exploiter les technologies Web pour mettre en œuvre les échanges entre applications, y compris de mobilité'),(29,2,1,7,'Utiliser des composants d\'accès aux données'),(30,2,1,8,'Intégrer en continu les versions d\'une solution applicative'),(31,2,1,9,'Réaliser les tests nécessaires à la validation ou à la mise en production d\'éléments adaptés ou développés'),(32,2,1,10,'Rédiger des documentations technique et d\'utilisation d\'une solution applicative'),(33,2,1,11,'Exploiter les fonctionnalités d\'un environnement de développement et de tests'),(34,2,2,1,'Recueillir, analyser et mettre à jour les informations sur une version d\'une solution applicative'),(35,2,2,2,'étudier l\'impact d\'une évolution d\'un élément d\'infrastructure sur le système informatique'),(36,2,2,3,'évaluer la qualité d\'une solution applicative'),(37,2,2,4,'Analyser et corriger un dysfonctionnement'),(38,2,2,5,'élaborer et réaliser les tests des éléments mis à jour'),(39,2,3,1,'Exploiter des données à l\'aide d\'un langage de requêtes'),(40,2,3,2,'Développer des fonctionnalités applicatives au sein d\'un système de gestion de base de données (relationnel ou non)'),(41,2,3,3,'Concevoir ou adapter une base de données'),(42,2,3,4,'Administrer et déployer une base de données'),(43,3,1,1,'Recenser les traitements sur les données à caractère personnel au sein de l\'organisation'),(44,3,1,2,'Identifier les risques liés à la collecte, au traitement, au stockage et à la diffusion des données à caractère personnel'),(45,3,1,3,'Appliquer la réglementation en matière de collecte, de traitement et de conservation des données à caractère personnel'),(46,3,1,4,'Sensibiliser les utilisateurs à la protection des données à caractère personnel'),(47,3,2,1,'Protéger l\'identité numérique d\'une organisation'),(48,3,2,2,'Déployer les moyens appropriés de preuve électronique'),(49,3,3,1,'Informer les utilisateurs sur les risques associés à l\'utilisation d\'une ressource numérique et promouvoir les bons usages à adopter'),(50,3,3,2,'Identifier les menaces et mettre en œuvre les défenses appropriées'),(51,3,3,3,'Gérer les accès et les privilèges appropriés'),(52,3,3,4,'Vérifier l\'efficacité de la protection'),(53,3,4,1,'Caractériser les risques liés à l\'utilisation malveillante d\'un service informatique'),(54,3,4,2,'Recenser les conséquences d\'une perte de disponibilité, d\'intégrité ou de confidentialité'),(55,3,4,3,'Identifier les obligations légales qui s\'imposent en matière d\'archivage et de protection des données de l\'organisation'),(56,3,4,4,'Organiser la collecte et la conservation des preuves numériques'),(57,3,4,5,'Appliquer les procédures garantissant le respect des obligations légales'),(58,3,5,1,'Participer à la vérification des éléments contribuant à la qualité d\'un développement informatique'),(59,3,5,2,'Prendre en compte la sécurité dans un projet de développement d\'une solution applicative'),(60,3,5,3,'Mettre en œuvre et vérifier la conformité d\'une solution applicative et de son développement à un référentiel, une norme ou un standard de sécurité'),(61,3,5,4,'Prévenir les attaques'),(62,3,5,5,'Analyser les connexions (logs)'),(63,3,5,6,'Analyser des incidents de sécurité, proposer et mettre en œuvre des contre-mesures');
/*!40000 ALTER TABLE `competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competenceprojet`
--

DROP TABLE IF EXISTS `competenceprojet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competenceprojet` (
  `idProjet` int NOT NULL,
  `idCompetence` int NOT NULL,
  PRIMARY KEY (`idProjet`,`idCompetence`),
  KEY `idCompetence` (`idCompetence`),
  CONSTRAINT `competenceprojet_ibfk_1` FOREIGN KEY (`idProjet`) REFERENCES `projet` (`id`) ON DELETE CASCADE,
  CONSTRAINT `competenceprojet_ibfk_2` FOREIGN KEY (`idCompetence`) REFERENCES `competence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competenceprojet`
--

LOCK TABLES `competenceprojet` WRITE;
/*!40000 ALTER TABLE `competenceprojet` DISABLE KEYS */;
INSERT INTO `competenceprojet` VALUES (2,1),(1,2),(2,5),(2,10),(1,12),(2,12),(1,13),(1,14),(2,14),(1,15),(1,16),(1,17),(2,18);
/*!40000 ALTER TABLE `competenceprojet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantAjoutCompetenceprojet` BEFORE INSERT ON `competenceprojet` FOR EACH ROW begin
    declare existeCompetence int default 0;
    declare bloc int default 0;
    declare message text;

    -- vérifie que le projet cible existe
    if not exists (select 1 from projet where id = new.idProjet) then
        signal sqlstate '45000'
            set message_text = "#Ce projet n''existe pas";
    end if;

    -- vérifie que la compétence existe et récupère son idbloc
    select count(*), ifnull(idbloc, 0)
    into existeCompetence, bloc
    from competence
    where id = new.idCompetence;

    if existeCompetence = 0 then
        set message = concat('~La compétence ', new.idCompetence, ' n''existe pas');
        signal sqlstate '45000' set message_text = message;
    end if;

    -- vérifie que la compétence appartient au bloc 1
    if bloc != 1 then
        set message = concat('~La compétence ', new.idCompetence, ' ne fait pas partie du bloc 1.');
        signal sqlstate '45000' set message_text = message;
    end if;


end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `coureur`
--

DROP TABLE IF EXISTS `coureur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coureur` (
  `licence` char(7) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `sexe` char(1) NOT NULL DEFAULT 'M',
  `dateNaissance` date NOT NULL,
  `idCategorie` char(3) NOT NULL,
  `idClub` varchar(6) NOT NULL,
  `ffa` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `telephone` char(10) DEFAULT NULL,
  PRIMARY KEY (`licence`),
  UNIQUE KEY `nom` (`nom`,`prenom`,`dateNaissance`),
  UNIQUE KEY `email` (`email`),
  KEY `idCategorie` (`idCategorie`),
  KEY `idClub` (`idClub`),
  CONSTRAINT `coureur_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `coureur_ibfk_2` FOREIGN KEY (`idClub`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coureur`
--

LOCK TABLES `coureur` WRITE;
/*!40000 ALTER TABLE `coureur` DISABLE KEYS */;
INSERT INTO `coureur` VALUES ('000010','SOUFFLET','STEPHANE','M','1976-04-14','M2','080028',0,NULL,NULL),('000011','MELET','VINCENT','M','1984-10-01','M1','080044',0,NULL,NULL),('000012','HUANT LEPINE','ANNIE','F','1962-06-22','M5','080021',0,NULL,NULL),('1062520','MASCRE','CHRISTINE','F','1962-02-14','M5','080049',0,NULL,NULL),('1062529','DIETRICH','PASCAL','M','1971-03-27','M3','080021',0,NULL,NULL),('1062531','DELATTRE','JEAN MARIE','M','1951-08-30','M7','080021',0,NULL,NULL),('1062538','CARON','DOMINIQUE','M','1971-06-28','M3','080061',0,NULL,NULL),('1062540','MELIQUE','JEAN MARC','M','1958-03-19','M6','080021',0,NULL,NULL),('1062542','DEKOONINCK','JEAN PAUL','M','1957-10-25','M6','080021',0,NULL,NULL),('1062544','WYCKAERT','CHRISTIAN','M','1961-05-21','M5','080021',0,NULL,NULL),('1062547','ROCHE','DANIELLE','F','1949-06-29','M8','080021',0,NULL,NULL),('1062612','DEBEAUVAIS','CHRISTIAN','M','1957-03-24','M6','080021',0,NULL,NULL),('1062615','CARANTON','BERNARD','M','1963-11-10','M5','080021',0,NULL,NULL),('1062616','BARBIER','JEAN MARC','M','1960-10-09','M6','080021',0,NULL,NULL),('1062617','GERVOISE','MAXIMILIEN','M','1983-04-21','M1','080049',0,NULL,NULL),('1062618','SIMIONI','CLAUDE','F','1957-04-21','M6','080021',0,NULL,NULL),('1062620','GILLON','BRIGITTE','F','1965-11-27','M5','080021',0,NULL,NULL),('1062659','DELEFOLLY','BENOIT','M','1982-05-21','M1','080014',0,NULL,NULL),('1062670','LEBESGUE','BRUNO','M','1968-01-05','M4','080014',0,NULL,NULL),('1063342','CARANTON','BEATRICE','F','1967-06-13','M4','080021',0,NULL,NULL),('1063343','DAMIENS','DOMINIQUE','M','1961-08-23','M5','080021',0,NULL,NULL),('1063347','LEBEAU','PATRICE','M','1956-11-27','M6','080021',0,NULL,NULL),('1064555','GAY','ERIC','M','1965-11-24','M5','080021',0,NULL,NULL),('1064889','SOUFFLET','VALERIE','F','1974-04-16','M3','080028',0,NULL,NULL),('1067964','KAESER','DIDIER','M','1961-01-21','M5','080021',0,NULL,NULL),('1078681','MOY','PHILIPPE','M','1966-09-27','M4','080021',0,NULL,NULL),('1079158','JOLY','JEAN PIERRE','M','1957-12-22','M6','080021',0,NULL,NULL),('1080735','BREHON','LAURENT','M','1969-06-07','M4','080044',0,NULL,NULL),('1081918','CROUTTE','JEAN RAYMOND','M','1962-04-28','M5','080049',0,NULL,NULL),('1082420','LISEK','CELINE','F','1983-02-06','M1','080044',0,NULL,NULL),('1084308','TURBEAU','RAYMOND','M','1955-12-14','M7','080021',0,NULL,NULL),('1086136','LEDREUX','JOSE','M','1965-02-16','M5','080021',0,NULL,NULL),('1095504','BELLEMERE','THIERRY','M','1969-07-20','M4','080021',0,NULL,NULL),('1095945','DAMAY','OLIVIER','M','1961-06-07','M5','080021',0,NULL,NULL),('1095947','HECART','DANIEL','M','1968-05-24','M4','080021',0,NULL,NULL),('1102338','BIALAIS','FREDERIC','M','1984-07-20','M1','080028',0,NULL,NULL),('1102547','POLOSSE','JEAN PAUL','M','1952-11-11','M7','080021',0,NULL,NULL),('1109905','LECOIN','HELENE','F','1976-09-14','M2','080071',0,NULL,NULL),('1114122','CROIZE','JACQUES','M','1971-05-12','M3','080014',0,NULL,NULL),('1114687','NOREL','THIERRY','M','1974-01-06','M3','080014',0,NULL,NULL),('1115977','DUBREUCQ','ANTOINE','M','1983-11-01','M1','080021',0,NULL,NULL),('1115979','DUBREUCQ','LUDOVIC','M','1982-06-22','M1','080021',0,NULL,NULL),('1119810','CAPART','MARYSE','F','1959-06-30','M6','080021',0,NULL,NULL),('1124257','PELOSO','PIERRE','M','1969-04-26','M4','080021',0,NULL,NULL),('1124414','LIBESSART','DANIEL','M','1967-02-27','M4','080021',0,NULL,NULL),('1124611','PILOT','DIMITRI','M','1988-12-18','M0','080028',0,NULL,NULL),('1134664','DELATTRE','EMMANUEL','M','1957-03-27','M6','080049',0,NULL,NULL),('1145800','BEAUJARD','PHILIPPE','M','1970-09-12','M4','080014',0,NULL,NULL),('1149978','HAMIEZ','BERNARD','M','1969-03-04','M4','080044',0,NULL,NULL),('1156526','RUET','JIMMY','M','1995-09-22','SE','080021',0,NULL,NULL),('1158463','ELIAS','EMMANUEL','M','1974-02-05','M3','080014',0,NULL,NULL),('1159220','LAZURE','DOMINIQUE','M','1971-07-08','M3','080021',0,NULL,NULL),('1165311','BOUCHER','DENIS','M','1969-12-25','M4','080021',0,NULL,NULL),('1172476','BRUSSELLE','DANIA','F','1968-05-27','M4','080049',0,NULL,NULL),('1179489','ROSE','JEAN CHRISTOPHE','M','1976-05-10','M2','080049',0,NULL,NULL),('1180115','LEFEBVRE','CHRISTOPHE','M','1975-06-07','M3','080044',0,NULL,NULL),('118034','LAFORGUE','EMMANUEL','M','1981-06-05','M1','080014',0,NULL,NULL),('1183280','SIRJACOBS','ROSINE','F','1956-01-24','M6','080049',0,NULL,NULL),('1184435','DUBUC','FRANCIS','M','1965-09-09','M5','080021',0,NULL,NULL),('1187974','DEGAVRE','MATHIEU','M','1985-12-22','M1','080021',0,NULL,NULL),('1188800','LADENT','SEBASTIEN','M','1977-07-30','M2','080044',0,NULL,NULL),('1189313','MALGARINI','CAMILLE','F','1997-06-12','SE','080014',0,NULL,NULL),('1191078','VIOT','DAVID','M','1978-05-17','M2','080049',0,NULL,NULL),('1191083','KELLER','BASTIEN','M','1981-02-21','M1','080049',0,NULL,NULL),('1191092','HAMIEZ','MICKAEL','M','1979-08-04','M2','080021',0,NULL,NULL),('1192957','LALLIER','LAETITIA','F','1986-03-20','M0','080049',0,NULL,NULL),('1195994','BOUREL','DIDIER','M','1972-05-09','M3','080028',0,NULL,NULL),('1196327','COULMONT','ALAIN','M','1970-08-04','M4','080071',0,NULL,NULL),('120612','CAULET','DOMINIQUE','M','1956-10-04','M6','080028',0,NULL,NULL),('1206224','CARLE','ERIC','M','1972-04-14','M3','080061',0,NULL,NULL),('1207713','LECAT','FLORENCE','F','1969-10-18','M4','080044',0,NULL,NULL),('1209651','PIC','STEPHANE','M','1977-08-09','M2','080021',0,NULL,NULL),('1209959','BOIDIN','OLIVIER','M','1973-07-18','M3','080028',0,NULL,NULL),('1212503','BOIZART','FREDERIC','M','1978-12-26','M2','080014',0,NULL,NULL),('1212555','MARTIN','OLIVIER','M','1965-05-02','M5','080061',0,NULL,NULL),('1212556','VERMUNT','CORINNE','F','1972-09-17','M3','080014',0,NULL,NULL),('1212557','VERMUNT','JEAN MARC','M','1971-07-05','M3','080014',0,NULL,NULL),('1213956','BRET','CHRISTOPHE','M','1977-12-08','M2','080004',0,NULL,NULL),('1214548','VASSEUR','CHRISTOPHE','M','1974-07-01','M3','080028',0,NULL,NULL),('1216712','FAUCHEUX','LAURENCE','F','1975-06-15','M3','080021',0,NULL,NULL),('1217179','CHICHERY','FABIEN','M','1979-08-05','M2','080049',0,NULL,NULL),('1217206','ANDRE','STEPHANE','M','1979-02-16','M2','080021',0,NULL,NULL),('1217207','LASSALLE','DOMINIQUE','M','1971-02-08','M3','080021',0,NULL,NULL),('1217329','DENEUX','CLAUDE','M','1975-07-12','M3','080071',0,NULL,NULL),('1217891','FLAMENT','SAMUEL','M','1988-01-26','M0','080044',0,NULL,NULL),('1221034','DUVIELGUERBIGNY','BENOIT','M','1981-03-05','M1','080049',0,NULL,NULL),('122697','DHEILLY','AMELINE','F','1993-07-02','SE','080014',0,NULL,NULL),('123148','STROH','SYLVIE','F','1961-05-14','M5','080061',0,NULL,NULL),('1233503','FLAUTRE','VINCENT','M','1966-06-08','M4','080021',0,NULL,NULL),('1234354','BLIN LEFEVRE','LANCELOT','M','2005-03-02','ES','080004',0,NULL,NULL),('1245397','GORDOR','FREDERIC','M','1983-11-27','M1','080021',0,NULL,NULL),('1245399','BASIN','JEROME','M','1979-06-22','M2','080049',0,NULL,NULL),('1246359','DUVETTE','MAXIMILIEN','M','1992-08-25','SE','080021',0,NULL,NULL),('1248499','PIGNON','PATRICK','M','1968-07-13','M4','080021',0,NULL,NULL),('1251762','VOISIN','SANDRINE','F','1975-01-11','M3','080028',0,NULL,NULL),('1254657','GELE','GREGORY','M','1990-01-26','M0','080014',0,NULL,NULL),('1259972','HALLIER','GILLES','M','1964-10-25','M5','080021',0,NULL,NULL),('1261871','NANTOIS','LAETITIA','F','1980-08-23','M2','080049',0,NULL,NULL),('126530','PRUDHOMME','JEAN PIERRE','M','1965-01-11','M5','080021',0,NULL,NULL),('1265836','RINGARD','BRUNO','M','1970-08-24','M4','080021',0,NULL,NULL),('1265896','FREIH','NAIMA','F','2007-08-08','JU','080014',0,NULL,NULL),('1267512','FATIER','ODILE','F','1977-03-25','M2','080021',0,NULL,NULL),('1267588','DELCROS','CRISTELE','F','1973-11-20','M3','080014',0,NULL,NULL),('1269267','GOSSELIN','VIRGINIE','F','1980-04-21','M2','080044',0,NULL,NULL),('1284087','TRANCART','CHRISTINE','F','1966-12-11','M4','080061',0,NULL,NULL),('1285547','HEIN','XAVIER','M','1982-03-31','M1','080014',0,NULL,NULL),('128599','DUPONT','FABIOLA','F','1980-06-06','M2','080021',0,NULL,NULL),('1287790','MORELLE','JEAN PHILIPPE','M','1977-10-23','M2','080004',0,NULL,NULL),('1288882','DECOUTURE','CHRISTOPHE','M','1975-11-11','M3','080021',0,NULL,NULL),('1291516','FERKIOUI','ALI','M','1972-05-29','M3','080021',0,NULL,NULL),('1291517','ABDESMED','MOHAMED','M','1961-04-21','M5','080021',0,NULL,NULL),('1291718','HOLLEVILLE','FRANCINE','F','1962-09-13','M5','080014',0,NULL,NULL),('1293983','LECOIN','CAMILLE','F','2000-12-20','SE','080071',0,NULL,NULL),('1293996','VUE','FREDERIC','M','1973-02-03','M3','080021',0,NULL,NULL),('1294072','BATTEZ','DAMIEN','M','1990-12-13','M0','080004',0,NULL,NULL),('1294908','LECLERC','PHILIPPE','M','1971-09-07','M3','080021',0,NULL,NULL),('1298472','LEFEVRE','JEREMY','M','1992-01-17','SE','080014',0,NULL,NULL),('1298481','VICART','KEVIN','M','1993-07-04','SE','080021',0,NULL,NULL),('1298930','PATTE','ANDRE','M','1973-09-10','M3','080021',0,NULL,NULL),('1299732','BIVILLE','VINCENT','M','1988-04-01','M0','080021',0,NULL,NULL),('1300664','DURAND','ROBERT','M','1963-05-02','M5','080049',0,NULL,NULL),('130122','LHEUREUX','FABIEN','M','1986-12-07','M0','080021',0,NULL,NULL),('130624','VERDIER','OLIVIER','M','1979-02-13','M2','080044',0,NULL,NULL),('1308283','LANFLE','LAURENT','M','1974-01-08','M3','080014',0,NULL,NULL),('1313570','DASSE','FREDERIC','M','1974-07-21','M3','080061',0,NULL,NULL),('1318788','LEBECQUE','ANTOINE','M','2002-08-09','SE','080004',0,NULL,NULL),('1320064','BOIZART','LILI','F','2008-01-04','CA','080014',0,NULL,NULL),('1320710','RUDNICKI','VERONIQUE','F','1962-12-31','M5','080028',0,NULL,NULL),('1322514','OLIVIER','CANDICE','F','2009-12-11','CA','080071',0,NULL,NULL),('1326968','NORMAND','QUENTIN','M','2007-10-26','JU','080044',0,NULL,NULL),('1329365','VASSEUR','PASCAL','M','1976-10-02','M2','080021',0,NULL,NULL),('1337730','DEMARLE','PHILIPPE','M','1955-11-07','M7','080028',0,NULL,NULL),('1362979','GERU','SYLVIE','F','1971-07-29','M3','080044',0,NULL,NULL),('1364950','TUVERI','JULIE','F','1995-06-06','SE','080014',0,NULL,NULL),('1374023','VIOT','SABINE','F','1972-11-19','M3','080049',0,NULL,NULL),('1374123','VIDAL','MARTINE','F','1963-12-07','M5','080014',0,NULL,NULL),('1375527','BETOURNE','DOMINIQUE','M','1980-06-26','M2','080014',0,NULL,NULL),('1375528','SEGUIN','JEAN LUC','M','1971-06-04','M3','080021',0,NULL,NULL),('1375530','BIVILLE','MYRIAM','F','1988-08-20','M0','080021',0,NULL,NULL),('1375582','DEWITTE','MICKAEL','M','1980-01-15','M2','080049',0,NULL,NULL),('1380403','LEGRIS','CLEMENCE','F','2010-05-05','MI','080071',0,NULL,NULL),('1380506','CAUET','CLAUDE','M','1967-11-23','M4','080028',0,NULL,NULL),('1380509','CAUET','MARYVONNE','F','1969-07-25','M4','080028',0,NULL,NULL),('1383314','BELLEVILLE','GREGORY','M','1984-07-18','M1','080021',0,NULL,NULL),('1383397','FOURMANOIR','GUILLAUME','M','1981-06-11','M1','080004',0,NULL,NULL),('1384725','BELET','MARTINE','F','1959-07-08','M6','080061',0,NULL,NULL),('1384729','MOLIN','JEAN PAUL','M','1953-03-21','M7','080061',0,NULL,NULL),('1384737','GRISONI','JACK','M','1954-10-11','M7','080061',0,NULL,NULL),('1385778','JOUBERT','DANIEL','M','1984-02-12','M1','080021',0,NULL,NULL),('1387002','CATHARY','CHRISTOPHE','M','1979-07-09','M2','080049',0,NULL,NULL),('1388149','SAULDUBOIS KELLER','ANNE LISE','F','1978-09-25','M2','080049',0,NULL,NULL),('1390589','DELANGUE','FREDERIC','M','1976-05-02','M2','080021',0,NULL,NULL),('1392367','CLEMENT','CORINNE','F','1974-03-04','M3','080061',0,NULL,NULL),('1392394','MAHIEUX','ALEXANDRE','M','1987-08-23','M0','080049',0,NULL,NULL),('1392412','RENAHY','PIERRE','M','1989-12-10','M0','080028',0,NULL,NULL),('1392922','COCATRIX','LAURENT','M','1971-05-20','M3','080021',0,NULL,NULL),('1393882','CASCALES','GAUTHIER','M','2002-12-12','SE','080014',0,NULL,NULL),('1395981','ROHAUT','GUILLAUME','M','1979-11-15','M2','080014',0,NULL,NULL),('1400912','BENOIT','JEAN','M','1954-08-01','M7','080021',0,NULL,NULL),('1408373','FONTAINE','NELLY','F','1984-10-18','M1','080044',0,NULL,NULL),('1410136','GRISONI','THEO','M','2005-01-20','ES','080004',0,NULL,NULL),('1410229','LEFEVRE','YANNICK','M','1960-05-09','M6','080021',0,NULL,NULL),('1411882','DEGARDIN','STEVEN','M','1989-12-02','M0','080021',0,NULL,NULL),('1415727','DUVERNE','JULIE','F','1990-01-24','M0','080061',0,NULL,NULL),('1419551','FLEURET','MARIE ODILE','F','1971-07-06','M3','080021',0,NULL,NULL),('1419989','KELLER','LOUISON','F','2009-07-27','CA','080004',0,NULL,NULL),('1422043','POTAGE','CYRIL','M','1979-03-04','M2','080028',0,NULL,NULL),('1427567','BELET','DIDIER','M','1961-01-10','M5','080061',0,NULL,NULL),('1427762','DHUBERT','DOROTHEE','F','1978-08-10','M2','080021',0,NULL,NULL),('1431360','DELBRAYELLLE','THEO','M','2006-09-30','JU','080044',0,NULL,NULL),('1432000','BOUCHOUCHA','OMEYA','F','2006-02-09','JU','080044',0,NULL,NULL),('143607','FOSSIER','STEPHANE','M','1974-06-04','M3','080014',0,NULL,NULL),('1437575','LE BOULAIR','GENEVIEVE','F','1969-01-12','M4','080044',0,NULL,NULL),('1437576','LE BOULAIR','MARC','M','1963-12-28','M5','080044',0,NULL,NULL),('1444561','DELBRAYELLE','CHRISTELLE','F','1975-09-08','M3','080044',0,NULL,NULL),('1448306','GUILLERAND','SANDRA','F','1980-12-16','M2','080044',0,NULL,NULL),('1448651','TRANCART','PHILIPPE','M','1965-12-22','M5','080061',0,NULL,NULL),('1451480','VANTARD','FLORENT','M','1989-02-21','M0','080049',0,NULL,NULL),('1452626','BOUGIS','ERIC','M','1974-03-02','M3','080049',0,NULL,NULL),('1454498','BOUZRAR','PATRICE','M','1979-03-17','M2','080014',0,NULL,NULL),('1454567','LARTIQUE','STEPHANE','M','1979-01-06','M2','080044',0,NULL,NULL),('1457112','MAGHRAOUI','HAMAD','M','1981-06-20','M1','080021',0,NULL,NULL),('1461132','DEPUILLE','CELINE','F','1981-12-10','M1','080021',0,NULL,NULL),('1461133','POINTURIER','MARYLENE','F','1964-12-25','M5','080021',0,NULL,NULL),('1461174','PRINGARBE','DIDIER','M','1970-05-08','M4','080021',0,NULL,NULL),('1461175','PHUNG','CHUNG LAM','F','1972-01-17','M3','080021',0,NULL,NULL),('1461184','CASCALES','LAURENT','M','1975-03-15','M3','080014',0,NULL,NULL),('1464826','GODE','OLIVIER','M','1979-04-01','M2','080021',0,NULL,NULL),('1465371','SELLEZ','CLOE','F','1987-05-04','M0','080049',0,NULL,NULL),('1469047','BOCLET','JEAN YVES','M','1971-04-21','M3','080004',0,NULL,NULL),('1478328','MELLOR','DOROTHEE','F','1979-07-09','M2','080014',0,NULL,NULL),('1491169','GIFFARD','MATHILDE','F','2003-02-25','ES','080004',0,NULL,NULL),('1494697','DELBRAYELLE','CLEMENT','M','2001-07-10','SE','080044',0,NULL,NULL),('1497288','MONNEHAY','MORGAN','M','2003-07-18','ES','080014',0,NULL,NULL),('1499899','MERCIER','MELVYN','M','2000-05-05','SE','080044',0,NULL,NULL),('1501621','BOUCHER','ANNE SOPHIE','F','1976-03-02','M2','080021',0,NULL,NULL),('1505752','THUILLIER','GERALD','M','1976-01-21','M2','080027',0,NULL,NULL),('1512477','RACINE','KARINE','F','1982-05-29','M1','080044',0,NULL,NULL),('1512510','JOSSE','NATHALIE','F','1972-05-02','M3','080021',0,NULL,NULL),('1516301','DENEL','ARNAUD','M','1983-09-24','M1','080021',0,NULL,NULL),('1516306','DHERSE','VIRGINIE','F','1986-08-15','M0','080021',0,NULL,NULL),('1519038','GERARD','GAETAN','M','2004-02-14','ES','080044',0,NULL,NULL),('1520358','HONORE','CATHERINE','F','1965-05-08','M5','080061',0,NULL,NULL),('1520443','RICQUE','ANNE','F','1975-08-25','M3','080021',0,NULL,NULL),('1526008','FLORIN','CHARLOTTE','F','2001-11-29','SE','080004',0,NULL,NULL),('1526914','GELLE','LUDOVIC','M','1976-06-15','M2','080021',0,NULL,NULL),('1528964','BUIGNET','MICHAEL','M','1975-05-03','M3','080014',0,NULL,NULL),('1531258','GROSSI','SOPHIE','F','1972-05-01','M3','080061',0,NULL,NULL),('1534200','QUEFFELEC','ALINE','F','1973-03-12','M3','080014',0,NULL,NULL),('1535411','FOUET','CAROLINE','F','1980-12-10','M2','080061',0,NULL,NULL),('1541742','MOUKAWANE','MOHAMED','M','1979-07-07','M2','080014',0,NULL,NULL),('1543128','NORMAND','GREGORY','M','1980-03-21','M2','080021',0,NULL,NULL),('1545211','MOREIRA','ISABELLE','F','1978-08-12','M2','080021',0,NULL,NULL),('1546118','PERON','YANNICK','M','1959-04-18','M6','080021',0,NULL,NULL),('1548026','SUEL','MARIE CHRISTINE','F','1975-03-12','M3','080021',0,NULL,NULL),('1548505','TROUILLET','MICHEL','M','1972-04-28','M3','080021',0,NULL,NULL),('1548728','ALFRED','CHRISTOPHE','M','1979-12-20','M2','080021',0,NULL,NULL),('1555730','RICHARD','DELPHINE','F','1985-03-12','M1','080021',0,NULL,NULL),('1555731','MONTARIOL','SYLVIE','F','1961-12-22','M5','080021',0,NULL,NULL),('1555733','MONTARIOL','PHILIPPE','M','1962-03-21','M5','080021',0,NULL,NULL),('1555734','DUPUIS','GWENAELLE','F','1981-01-08','M1','080014',0,NULL,NULL),('1556154','DELIENS','ROMUALD','M','1979-05-18','M2','080021',0,NULL,NULL),('1556159','RINGARD','CLEMENT','M','2002-06-26','SE','080014',0,NULL,NULL),('1556546','BATTE','FRANCK','M','1980-03-23','M2','080014',0,NULL,NULL),('1557051','TABARY','LIONEL','M','1975-08-11','M3','080021',0,NULL,NULL),('1558185','MACQUART','ANTHONY','M','1981-10-01','M1','080014',0,NULL,NULL),('1558812','PAYEN','CATHERINE','F','1968-05-07','M4','080061',0,NULL,NULL),('1558815','DUBOIS','FREDERIC','M','1968-11-18','M4','080061',0,NULL,NULL),('1559271','POTAGE','FABIENNE','F','1979-10-13','M2','080028',0,NULL,NULL),('1560332','VANSUYT','GUILLAUME','M','2001-09-27','SE','080004',0,NULL,NULL),('1563280','LEROY','HENRI','M','2008-03-15','CA','080071',0,NULL,NULL),('1567034','GENART','SAMUEL','M','1987-08-21','M0','080021',0,NULL,NULL),('1571497','DUPONCHELLE','VALERIE','F','1978-02-21','M2','080044',0,NULL,NULL),('1573082','GROSSI','DIDIER','M','1971-04-20','M3','080061',0,NULL,NULL),('1573378','TUTOIS','GREGORY','M','1987-05-07','M0','080021',0,NULL,NULL),('1573416','BUIGNET','CHRISTELLE','F','1976-06-07','M2','080014',0,NULL,NULL),('1573449','GIBOULET','PAUL','M','2009-08-08','CA','080014',0,NULL,NULL),('1574377','MOREIRA','CHRISTELLE','F','1979-11-13','M2','080021',0,NULL,NULL),('1575525','BISSIERE','SARAH','F','1982-08-17','M1','080021',0,NULL,NULL),('1576423','GOSSELIN','THOMAS','M','1980-02-12','M2','080021',0,NULL,NULL),('1580302','VATEL','ARNAUD','M','1978-10-16','M2','080061',0,NULL,NULL),('1581450','VAQUETTE','FREDERIC','M','1976-09-06','M2','080014',0,NULL,NULL),('1589422','HUSS','CHRISTELLE','F','1989-03-01','M0','080044',0,NULL,NULL),('1596432','GAUMET','PASCALINE','F','1989-03-04','M0','080021',0,NULL,NULL),('1596741','NONNON','DANIEL','M','1972-09-13','M3','080028',0,NULL,NULL),('1597469','PEDRON','CHRISTOPHE','M','1979-06-05','M2','080049',0,NULL,NULL),('1599459','DECLE','CLAUDINE','F','1965-10-15','M5','080049',0,NULL,NULL),('1602943','MESSIO','MELANIE','F','1999-07-14','SE','080004',0,NULL,NULL),('1608045','DESCAMPS','DENIS','M','1973-01-09','M3','080027',0,NULL,NULL),('1608046','PERNEL','FREDERIC','M','1966-12-30','M4','080027',0,NULL,NULL),('1608065','LAURENT','OLIVIER','M','1971-03-07','M3','080027',0,NULL,NULL),('1617428','VIEIRA','OLIVIER','M','1977-06-18','M2','080027',0,NULL,NULL),('1621186','BLED','EMILIE','F','1985-05-14','M1','080044',0,NULL,NULL),('1623013','BAECHER','SEBASTIEN','M','1985-02-13','M1','080049',0,NULL,NULL),('1624920','BOIDIN','GASPARD','M','2006-09-18','JU','080028',0,NULL,NULL),('1625159','LEFEBVRE','ELVIS','M','2000-04-01','SE','080049',0,NULL,NULL),('1625941','HOORNAERT','VINCENT','M','1981-11-06','M1','080021',0,NULL,NULL),('1625974','PAUCHET','YANNICK','M','1988-01-29','M0','080071',0,NULL,NULL),('1627243','THEVENIN LEBRAN','LOUISE MARIE','F','2003-05-01','ES','080071',0,NULL,NULL),('1633850','NANTOIS','JULIETTE','F','2007-01-10','JU','080014',0,NULL,NULL),('1639858','COLLIN','ISABELLE','F','1984-03-08','M1','080049',0,NULL,NULL),('1640606','MARTIN','CLAUDINE','F','1970-07-11','M4','080049',0,NULL,NULL),('1645137','BETTAN','MIKAEL','M','1986-07-28','M0','080004',0,NULL,NULL),('1646360','HUET RODRIGUEZ','NATHALIE','F','1975-11-29','M3','080014',0,NULL,NULL),('1649266','POCHET','MAXIME','M','2005-08-17','ES','080004',0,NULL,NULL),('1650342','ANDRIEUX','VINCENT','M','1991-02-20','SE','080021',0,NULL,NULL),('1650344','POUSSET','PATRICE','M','1958-06-17','M6','080021',0,NULL,NULL),('1650409','BARIS','CHLOE','F','1990-09-25','M0','080021',0,NULL,NULL),('1650412','ALLONNEAU','JEAN MARIE','M','1958-02-09','M6','080021',0,NULL,NULL),('1650419','SKRZYPCZAK','ELISA','F','1990-07-11','M0','080021',0,NULL,NULL),('1650837','BARTHELEMY','BENOIT','M','1976-04-09','M2','080049',0,NULL,NULL),('1650843','DENIN','NICOLAS','M','1990-07-23','M0','080021',0,NULL,NULL),('1650846','DECLERCQ','GUILHEM','M','2006-05-02','JU','080014',0,NULL,NULL),('1651105','DEJANCOURT','AMANDINE','F','1988-08-09','M0','080061',0,NULL,NULL),('1651626','PANSERI','MATTHIEU','M','1982-12-28','M1','080049',0,NULL,NULL),('1651641','MUCHEMBLED','JEREMY','M','1984-12-26','M1','080021',0,NULL,NULL),('1651695','MIART','SYLVIE','F','1973-11-01','M3','080049',0,NULL,NULL),('1651809','ROUCHEREAU','BRUNO','M','1979-01-15','M2','080021',0,NULL,NULL),('1652282','MARCHEUX','BENJAMIN','M','1990-02-17','M0','080044',0,NULL,NULL),('1652756','MELCHIOR','LAETITIA','F','1978-05-18','M2','080021',0,NULL,NULL),('1653131','BELLET','MARINA','F','1995-03-06','SE','080049',0,NULL,NULL),('1653146','FEURTE','SEBASTIEN','M','1977-12-02','M2','080021',0,NULL,NULL),('1653708','THIERRY','FLORENT','M','1987-08-28','M0','080028',0,NULL,NULL),('1653712','THIERRY','FLORIANE','F','1991-01-04','SE','080028',0,NULL,NULL),('1656066','CAPRON','ANTHONY','M','1995-06-06','SE','080049',0,NULL,NULL),('1657465','DEKERVEL','ALINE','F','1985-06-27','M1','080021',0,NULL,NULL),('165915','TABUTEAU','QUENTIN','M','1972-10-13','M3','080014',0,NULL,NULL),('1659847','MEDMOUN','ALI','M','1983-03-12','M1','080021',0,NULL,NULL),('1660844','MALASSAGNE','PASCAL','M','1967-07-25','M4','080021',0,NULL,NULL),('1662139','EUGENE','PEGGY','F','1977-07-01','M2','080021',0,NULL,NULL),('1662143','MICHAU','EMMANUEL','M','1975-08-25','M3','080014',0,NULL,NULL),('1664389','CARON','DIDIER','M','1975-07-31','M3','080014',0,NULL,NULL),('1664416','LAFFORGUE','OLIVIER','M','1973-10-25','M3','080014',0,NULL,NULL),('1664780','PILVOIX','CLAUDE','M','1962-09-15','M5','080021',0,NULL,NULL),('1668502','HARASSE','OLIVIER','M','1988-01-13','M0','080044',0,NULL,NULL),('1672765','DEBRAY','MICHEL','M','1964-11-10','M5','080028',0,NULL,NULL),('1676555','DOUTART','MELANIE','F','1994-04-13','SE','080004',0,NULL,NULL),('1680382','CHARON','PASCAL','M','1959-10-01','M6','080028',0,NULL,NULL),('1681145','COLAU','GERALD','M','1976-02-21','M2','080028',0,NULL,NULL),('1696704','FECAMP','AGNES','F','1976-03-28','M2','080027',0,NULL,NULL),('1699766','BOSSU','LAURENT','M','1979-03-06','M2','080014',0,NULL,NULL),('1701942','LALOI','BRUNO','M','1972-07-06','M3','080044',0,NULL,NULL),('1701966','MROZINSKI','LUCAS','M','2006-04-12','JU','080044',0,NULL,NULL),('1705876','HOLLVILLE','ESTELLE','F','1976-11-01','M2','080061',0,NULL,NULL),('1705993','VANSUYT','CLEMENT','M','2007-12-12','JU','080028',0,NULL,NULL),('1712074','LAMPAERT','JEAN CHARLES','M','1971-01-10','M3','080049',0,NULL,NULL),('1712076','OSSART','MARTINE','F','1973-12-27','M3','080049',0,NULL,NULL),('1715014','BIRD','JOHN','M','1964-07-20','M5','080044',0,NULL,NULL),('1720390','REMY','PHILIPPE','M','1965-03-17','M5','080028',0,NULL,NULL),('1721061','OLIVIER','GREGORY','M','1989-12-16','M0','080004',0,NULL,NULL),('1723153','CAZIER','SEVERINE','F','1978-03-24','M2','080014',0,NULL,NULL),('1733001','HONORE','PAUL','M','1977-08-27','M2','080061',0,NULL,NULL),('1735670','GALLAIS','LAURENCE','F','1973-01-08','M3','080014',0,NULL,NULL),('1736229','BIOCHE','JEREMY','M','1994-09-09','SE','080044',0,NULL,NULL),('1736848','PELOSO','SANDRINE','F','1968-11-05','M4','080021',0,NULL,NULL),('1738243','LEFEVRE','MATHILDE','F','1982-12-03','M1','080021',0,NULL,NULL),('1738246','RUTTEN','ERIC','M','1969-06-08','M4','080021',0,NULL,NULL),('1740840','BIGOT','MATHILDE','F','1975-08-01','M3','080021',0,NULL,NULL),('1743576','COZETTE','LUDOVIC','M','1983-03-14','M1','080014',0,NULL,NULL),('1744274','TELLIER','TEDDY','M','1979-07-26','M2','080021',0,NULL,NULL),('1744303','DESLANDES','SEVERINE','F','1984-08-01','M1','080014',0,NULL,NULL),('1747422','PAU ROBLOT','CORINNE','F','1976-06-28','M2','080021',0,NULL,NULL),('1747675','GEORGES','SEBASTIEN','M','1983-06-05','M1','080021',0,NULL,NULL),('1747791','BLOT','ETIENNE','M','1989-04-29','M0','080021',0,NULL,NULL),('1748379','RAYEZ','TIFFANY','F','2001-09-30','SE','080027',0,NULL,NULL),('1749441','HERMITTE','PASCAL','M','1961-11-15','M5','080021',0,NULL,NULL),('1750495','COUNE','SYLVIE','F','1974-05-04','M3','080014',0,NULL,NULL),('1751038','FERNANDES','SANDRINE','F','1979-10-06','M2','080021',0,NULL,NULL),('1752261','HUCLEUX','DAVID','M','1982-02-24','M1','080071',0,NULL,NULL),('1754552','LESAGE','SIMON','M','1991-07-01','SE','080014',0,NULL,NULL),('1754592','DEZENCLOS','FREDERIQUE','F','1967-12-09','M4','080027',0,NULL,NULL),('1754702','LARUELLE','LIONEL','M','1977-12-28','M2','080014',0,NULL,NULL),('1754870','NOWAK','ALISA','F','1988-10-24','M0','080021',0,NULL,NULL),('1755734','LOBBE','JULIEN','M','1986-09-26','M0','080004',0,NULL,NULL),('1756062','RAUX','CLEMENT','M','1986-11-17','M0','080021',0,NULL,NULL),('1756069','MAGHRAOUI','FARID','M','1974-08-26','M3','080021',0,NULL,NULL),('1756075','HART','CHRISTOPHE','M','1975-05-08','M3','080021',0,NULL,NULL),('1756081','LECLERCQ','FANNY','F','1982-12-17','M1','080021',0,NULL,NULL),('1756085','WISCART','JEAN PHILIPPE','M','1980-02-22','M2','080021',0,NULL,NULL),('1756092','GAY','VALENTIN','M','1999-08-23','SE','080021',0,NULL,NULL),('1756431','FOURDINIER','QUENTIN','M','1994-05-25','SE','080028',0,NULL,NULL),('1756436','DECOBERT','FRANCK','M','1968-10-08','M4','080021',0,NULL,NULL),('1756448','KADDOURI','HAMADI','M','1982-11-02','M1','080021',0,NULL,NULL),('1756890','LE GRANDIC','GREGORY','M','1982-11-30','M1','080049',0,NULL,NULL),('1758145','DELEPINE','BERTRAND','M','1987-07-26','M0','080021',0,NULL,NULL),('1758165','LECOMTE','THIERRY','M','1970-08-31','M4','080061',0,NULL,NULL),('1759148','CAPITANI','JACKIE','M','1964-10-07','M5','080014',0,NULL,NULL),('1759297','COUPEL','CHRISTOPHE','M','1982-08-11','M1','080021',0,NULL,NULL),('1761615','DELAFOSSE','NAOMIE','F','1976-11-14','M2','080061',0,NULL,NULL),('1765457','PLEE','MARILAINE','F','1974-03-21','M3','080028',0,NULL,NULL),('1765469','BOULAIN','CHRISTOPHE','M','1980-07-02','M2','080028',0,NULL,NULL),('1765475','NOIROT','SEBASTIEN','M','1987-04-10','M0','080028',0,NULL,NULL),('1766038','LEROY','LUDOVIC','M','1976-11-03','M2','080071',0,NULL,NULL),('1770185','DEMILLY','STEPHANE','M','1968-09-28','M4','080028',0,NULL,NULL),('1770629','MILANO','GAETAN','M','1992-02-05','SE','080004',0,NULL,NULL),('1770639','JOUENNE','EMILIE','F','1995-11-19','SE','080004',0,NULL,NULL),('1771251','MAGNIEZ','CYRIL','M','1997-12-12','SE','080049',0,NULL,NULL),('1772143','PEETERS','FRANCK','M','1969-06-22','M4','080044',0,NULL,NULL),('1772159','WALLET','STEPHANE','M','1971-10-05','M3','080044',0,NULL,NULL),('1775061','ZAMBELLI','LOIC','M','1988-10-14','M0','080021',0,NULL,NULL),('1775139','VAN DE MOORTELE','STEPHANE','M','1978-01-26','M2','080061',0,NULL,NULL),('1775746','BRUCHE','CATHY','F','1976-09-22','M2','080004',0,NULL,NULL),('1778656','RUIS','JENNIFER','F','1984-03-13','M1','080021',0,NULL,NULL),('1778661','FLAN','DIMITRI','M','1982-12-02','M1','080021',0,NULL,NULL),('1781239','MARGOTIN','NICOLAS','M','1974-03-08','M3','080028',0,NULL,NULL),('1792911','LAMOTTE','CYRIL','M','1981-09-16','M1','080028',0,NULL,NULL),('1794059','GOUBET','CHRISTELLE','F','1976-08-18','M2','080014',0,NULL,NULL),('1794083','FLAHAUT','FREDERIC','M','1983-08-24','M1','080014',0,NULL,NULL),('1798662','MOREL','YVES ANDRE','M','1962-06-06','M5','080061',0,NULL,NULL),('1806101','SZCZEPANIAK','AUDE','F','1977-02-06','M2','080044',0,NULL,NULL),('181039','MACQUET','SAMUEL','M','1971-02-26','M3','080021',0,NULL,NULL),('1811817','JOLY','FLORENCE','F','1969-09-21','M4','080061',0,NULL,NULL),('1821572','LAGUILLAUMIE','CHRISTIAN','M','1970-04-02','M4','080021',0,NULL,NULL),('1823351','DELAMBRE','MELANIE','F','1988-07-13','M0','080028',0,NULL,NULL),('1824725','CAZIER','FABIENNE','F','1977-01-06','M2','080014',0,NULL,NULL),('1824728','HONVOH','SANDRINE','F','1977-07-17','M2','080044',0,NULL,NULL),('1825711','DUQUENHEM','CORINNE','F','1972-12-25','M3','080061',0,NULL,NULL),('1829277','CONNAN','DOMINIQUE','M','1988-09-21','M0','080004',0,NULL,NULL),('1833298','PEETERS','HENRY','M','1994-06-04','SE','080044',0,NULL,NULL),('1834038','PARAGE','CHRISTOPHE','M','1986-06-15','M0','080044',0,NULL,NULL),('1837207','BORCK','NICOLAS','M','1986-08-14','M0','080028',0,NULL,NULL),('1838144','GROGNOT','YANNICK','M','1986-09-18','M0','080028',0,NULL,NULL),('1843376','LAMRANI','MENAD','M','2001-04-20','SE','080004',0,NULL,NULL),('1846416','DELAMBRE','JACQUES','M','1962-10-11','M5','080028',0,NULL,NULL),('1848332','LENAFF','ELISABETH','F','1959-02-05','M6','080061',0,NULL,NULL),('1848911','HOLLVILLE','SABINE','F','1974-01-22','M3','080014',0,NULL,NULL),('1849840','CABASSA','CLAIRE','F','1991-06-26','SE','080021',0,NULL,NULL),('1850427','BIGARNET','EMMANUEL','M','1988-06-25','M0','080021',0,NULL,NULL),('1850972','DRUEZ','BRUNO','M','1974-08-21','M3','080021',0,NULL,NULL),('1851962','RINGARD','GEOFFREY','M','2002-06-26','SE','080014',0,NULL,NULL),('1855206','RABHI','MIHIDINN','M','1984-01-31','M1','080021',0,NULL,NULL),('1860513','SEGUIN','CEDRIC','M','1986-08-18','M0','080044',0,NULL,NULL),('1861421','GASTIGAR','FABIEN','M','1983-12-20','M1','080049',0,NULL,NULL),('1862015','URBANIAK','MARIE','F','1986-11-08','M0','080021',0,NULL,NULL),('1862020','DUPONT','GAEL','M','1987-08-09','M0','080021',0,NULL,NULL),('1862024','SKRZYNIARZ','BENJAMIN','M','1997-12-13','SE','080021',0,NULL,NULL),('1862358','RAUX','JULIEN','M','1983-11-23','M1','080021',0,NULL,NULL),('1862369','QUENTIN','FRANCK','M','1974-06-04','M3','080021',0,NULL,NULL),('1862374','ROBILLARD','SEBASTIEN','M','1984-06-08','M1','080021',0,NULL,NULL),('1862383','LEBON','MEGANNE','F','2006-01-14','JU','080021',0,NULL,NULL),('1862419','THERON','REMI','M','1988-11-10','M0','080014',0,NULL,NULL),('1862870','LEFEVRE','ANTOINE','M','1991-10-11','SE','080004',0,NULL,NULL),('1863249','HUK','LAURENT','M','1973-05-26','M3','080021',0,NULL,NULL),('1863279','DEMARSEILLE','MARTIAL','M','1975-02-14','M3','080049',0,NULL,NULL),('1863322','DAVOUSE','THOMAS','M','1977-03-17','M2','080061',0,NULL,NULL),('1863392','PINAUD','BENOIT','M','1967-04-10','M4','080061',0,NULL,NULL),('1863748','BELLET','JEROME','M','1980-11-30','M2','080028',0,NULL,NULL),('1864251','MARCHAL','CHRISTOPHE','M','1971-06-05','M3','080021',0,NULL,NULL),('1864512','VERMES','MATHIEU','M','1971-06-23','M3','080071',0,NULL,NULL),('1865251','SERAFFIN','MARIE','F','1999-08-16','SE','080004',0,NULL,NULL),('1865352','GHANDAOUI','YASSINE','M','1986-09-18','M0','080014',0,NULL,NULL),('1866869','BALDE','MARIE','F','1978-08-13','M2','080049',0,NULL,NULL),('1866891','LEULIER','ARNAUD','M','1981-07-02','M1','080021',0,NULL,NULL),('1867354','DETOURNAY','ALAIN','M','1992-12-28','SE','080021',0,NULL,NULL),('1874064','HERMANT','FANNY','F','1982-01-13','M1','080021',0,NULL,NULL),('1875202','GALET','LAURY','F','1987-12-15','M0','080044',0,NULL,NULL),('1878810','FAY','STEPHANIE','F','1975-03-04','M3','080014',0,NULL,NULL),('1878820','GIBOULET','JULIETTE','F','1977-09-18','M2','080014',0,NULL,NULL),('1879381','FOURNIER','YOHANN','M','1984-08-28','M1','080021',0,NULL,NULL),('1880311','LEGRIS','LIONEL','M','1974-12-14','M3','080071',0,NULL,NULL),('1885501','VERMES','VALENTIN','M','2002-07-15','SE','080071',0,NULL,NULL),('1886800','POIDEVIN','OLIVIER','M','1986-04-19','M0','080049',0,NULL,NULL),('1888097','FEURTE','CYRILLE','F','1977-01-05','M2','080049',0,NULL,NULL),('1888450','OGER','MAGALI','F','1974-05-16','M3','080061',0,NULL,NULL),('1888505','ROUSSEL','SOPHIE','F','1985-04-14','M1','080014',0,NULL,NULL),('1888688','DESMARET','JADE','F','2008-07-05','CA','080071',0,NULL,NULL),('1894249','DALONGEVILLE','AURELIEN','M','1989-02-20','M0','080028',0,NULL,NULL),('1897118','VANSUYT','PASCAL','M','1970-05-12','M4','080028',0,NULL,NULL),('189917','BOUBERT','VIRGINIE','F','1980-10-12','M2','080021',0,NULL,NULL),('1901160','COLLOMB','ALEXIS','M','2004-11-05','ES','080071',0,NULL,NULL),('1903552','MONNIER','ALAIN','M','1975-05-29','M3','080028',0,NULL,NULL),('1906509','MONTARDIER','SEBASTIEN','M','1983-03-05','M1','080021',0,NULL,NULL),('1906524','COZETTE','DAVID','M','1981-08-11','M1','080021',0,NULL,NULL),('1907396','TRAN VAN','SOLENE','F','2005-03-10','ES','080004',0,NULL,NULL),('1907409','TOUATI','CLEMENT','M','2006-01-23','JU','080004',0,NULL,NULL),('1907451','TRAN VAN','PIERRE','M','2007-07-13','JU','080004',0,NULL,NULL),('1907474','RICHE','HELENE','F','1982-04-24','M1','080049',0,NULL,NULL),('1907521','MASSE','ELISE','F','2001-07-04','SE','080049',0,NULL,NULL),('1914570','SERRISIER','CLAIRE','F','2004-01-16','ES','080004',0,NULL,NULL),('1914576','HATIF','FREDERIC','M','1974-09-05','M3','080061',0,NULL,NULL),('1914588','ITSWEIRE','LIONEL','M','1968-06-30','M4','080061',0,NULL,NULL),('1914596','ITSWEIRE','VALERIE','F','1971-04-03','M3','080061',0,NULL,NULL),('1918777','EVEN','GUILLAUME','M','1988-10-08','M0','080028',0,NULL,NULL),('1918890','VANHUSE','VINCENT','M','1987-01-19','M0','080021',0,NULL,NULL),('1921049','LAURAIN','VALERIE','F','1981-09-24','M1','080061',0,NULL,NULL),('1925380','MURAZ','JULIETTE','F','2005-05-24','ES','080014',0,NULL,NULL),('1933244','FERNET','LISE','F','1973-01-12','M3','080014',0,NULL,NULL),('1938261','LEMAIRE','JULES','M','2007-12-31','JU','080004',0,NULL,NULL),('1938663','NOURTIER','JEAN PIERRE','M','1956-07-27','M6','080061',0,NULL,NULL),('1938724','MAGNIER','VINCENT','M','1982-03-20','M1','080021',0,NULL,NULL),('1940013','GROSSI','CAMILLE','F','2005-05-02','ES','080004',0,NULL,NULL),('1940956','DEFOSSE','LAETITIA','F','1985-05-01','M1','080044',0,NULL,NULL),('1941456','BOURDILLON','FRANCK','M','1977-08-05','M2','080044',0,NULL,NULL),('1942432','DE BAILLIENCOURT','NATHALIE','F','1980-11-02','M2','080071',0,NULL,NULL),('1944439','NEUEZ','DAVID','M','1980-04-28','M2','080021',0,NULL,NULL),('1945880','BERTRAND','TONY','M','1986-01-31','M0','080049',0,NULL,NULL),('1946329','LEGRIS','SANDRA','F','1978-01-24','M2','080071',0,NULL,NULL),('194981','LAMPAERT','JEAN MICHEL','M','1963-10-06','M5','080044',0,NULL,NULL),('1951380','DEMARCY','CHRISTELLE','F','1979-01-13','M2','080044',0,NULL,NULL),('1953193','CHESNEAU','MARIE','F','1994-07-13','SE','080049',0,NULL,NULL),('1954511','BRIOIS','ANDONIAINA MIRANA','F','1981-05-08','M1','080027',0,NULL,NULL),('1955850','GANTIER','BAPTISTE','M','2005-02-21','ES','080071',0,NULL,NULL),('1957144','DUPAS','STEPHANE','M','1974-07-29','M3','080049',0,NULL,NULL),('1958133','CHASSINE','MARIE CELESTE','F','1992-07-24','SE','080049',0,NULL,NULL),('1958202','PRONIEZ','FABIEN','M','1979-11-16','M2','080028',0,NULL,NULL),('1958933','BOURBON','CATHERINE','F','1997-09-29','SE','080004',0,NULL,NULL),('1959344','CARPENTIER','CORENTIN','M','2010-03-19','MI','080028',0,NULL,NULL),('1960005','LEGUILLIER','STEPHANIE','F','1983-08-12','M1','080014',0,NULL,NULL),('1960218','PODJUK','JORDAN','M','1998-03-09','SE','080028',0,NULL,NULL),('1960631','CLERENTIN','CYRIL','M','1981-12-30','M1','080004',0,NULL,NULL),('1961962','LEGUILLIER','WILLIAMS','M','1977-07-15','M2','080014',0,NULL,NULL),('1962493','DUHAUPAS','SAMUEL','M','1988-11-27','M0','080021',0,NULL,NULL),('1963547','VARELA FERNANDES','NALDI','F','1978-03-23','M2','080021',0,NULL,NULL),('1963548','MARRAS','GIUSEPPINA','F','1983-05-28','M1','080021',0,NULL,NULL),('1964326','LOLEKO MBOYO','HAROUNA','M','2001-07-26','SE','080004',0,NULL,NULL),('1964597','ABDELKARIM','ABDELMOUMAINE','M','2005-04-27','ES','080071',0,NULL,NULL),('1964697','LECLERC','CHRISTOPHE','M','1976-07-28','M2','080021',0,NULL,NULL),('1965024','DELAPORTE','LAURENT','M','1982-09-28','M1','080021',0,NULL,NULL),('1966872','CANON','LISE','F','1972-05-23','M3','080021',0,NULL,NULL),('1966884','DUHAMEL','RUDY','M','1983-03-01','M1','080027',0,NULL,NULL),('1966901','DA SILVA BARBOSA','TEDDY','M','1987-06-13','M0','080021',0,NULL,NULL),('1967364','BOULNOIS','PHILIPPE','M','1969-06-20','M4','080004',0,NULL,NULL),('1967656','BOETTE','STEPHANIE','F','1981-01-05','M1','080021',0,NULL,NULL),('1967907','LEDOUX','DAVID','M','1979-12-02','M2','080028',0,NULL,NULL),('1967945','LEGRAND','AMELIE','F','1991-07-30','SE','080061',0,NULL,NULL),('1967946','HUMBERT','PAULINE','F','1990-09-16','M0','080061',0,NULL,NULL),('1967969','MOREL','EMELINE','F','1983-03-16','M1','080061',0,NULL,NULL),('1968181','MOREL','ALAN','M','1987-03-21','M0','080014',0,NULL,NULL),('1968682','BOULAIN','EMMA','F','2009-06-10','CA','080028',0,NULL,NULL),('1968944','BODECOT','JULIEN','M','1987-04-24','M0','080014',0,NULL,NULL),('1969070','VALERS','KENJI','M','1992-05-28','SE','080028',0,NULL,NULL),('1969435','AVISSE','SEBASTIEN','M','1993-11-18','SE','080061',0,NULL,NULL),('1970289','VANHERPE','JEAN REMI','M','1959-04-10','M6','080049',0,NULL,NULL),('1970491','LEFEBVRE','FRANCK','M','1975-07-08','M3','080021',0,NULL,NULL),('1970505','GAZEAU','CHLOE','F','1999-06-08','SE','080004',0,NULL,NULL),('1970510','TROGNEUX','JEAN JACQUES','M','1988-02-14','M0','080004',0,NULL,NULL),('1973429','GREBONVAL','BRIGITTE','F','1963-11-29','M5','080061',0,NULL,NULL),('1973450','DEVISMES','LAURENT','M','1982-02-09','M1','080071',0,NULL,NULL),('1974389','OGER','PASCALE','F','1980-12-24','M2','080014',0,NULL,NULL),('1974538','VARLET','ALIX','F','2007-03-02','JU','080014',0,NULL,NULL),('1974967','BERNARD','GEOFFREY','M','1996-12-13','SE','080028',0,NULL,NULL),('1977353','LECOMTE','AGATHE','F','2009-09-13','CA','080014',0,NULL,NULL),('1980321','FAUVERGUE','BENJAMIN','M','1995-05-04','SE','080004',0,NULL,NULL),('1980332','DANIEL','KEVIN','M','2002-09-22','SE','080004',0,NULL,NULL),('1981118','RAYON','CATHERINE','F','1974-08-24','M3','080061',0,NULL,NULL),('1982799','SOW','ROBERT','M','1979-08-05','M2','080061',0,NULL,NULL),('1987082','DARRAS','REGINE','F','1984-10-01','M1','080021',0,NULL,NULL),('1987090','GAMARD','CHRISTOPHE','M','1972-10-04','M3','080021',0,NULL,NULL),('1987101','PERRAI','RENAUD','M','1987-03-17','M0','080021',0,NULL,NULL),('1987561','SAVOYE','SEVERINE','F','1979-02-12','M2','080061',0,NULL,NULL),('1991297','ABDELKRIM','TAHAR','M','1981-11-11','M1','080021',0,NULL,NULL),('1992914','TINENCOURT','CLAIRE','F','1987-02-14','M0','080014',0,NULL,NULL),('1992920','REID','ALISON','F','1988-11-03','M0','080014',0,NULL,NULL),('1993205','DUFOUR','LOUISE','F','2010-03-13','MI','080071',0,NULL,NULL),('1993427','LEFERT','AGNES','F','1987-08-30','M0','080061',0,NULL,NULL),('1999386','HANNECART','ESTELLE','F','1982-11-20','M1','080028',0,NULL,NULL),('2000417','DESWAERTE','CHARLES','M','2000-04-25','SE','080028',0,NULL,NULL),('200222','ZOUAD','AKIM','M','1983-07-09','M1','080004',0,NULL,NULL),('2005519','CARREZ','HELENE','F','1986-09-28','M0','080049',0,NULL,NULL),('2010299','ELMEMARI PUBLIO','ANA PAULA','F','1982-03-28','M1','080014',0,NULL,NULL),('2010619','FRANCATEL','LAURENT','M','1975-12-06','M3','080061',0,NULL,NULL),('2011134','JOLY','HELENE','F','1973-10-06','M3','080021',0,NULL,NULL),('2012775','VASSEUR','ADELE','F','2010-02-17','MI','080028',0,NULL,NULL),('2012981','CARRUETTE','CLEMENCE','F','1990-02-16','M0','080049',0,NULL,NULL),('2012985','JOLY','THIERRY','M','1980-11-16','M2','080049',0,NULL,NULL),('2016784','PECOURT','XAVIER','M','2005-07-03','ES','080014',0,NULL,NULL),('2016790','PECOURT','ANAIS','F','2007-07-09','JU','080014',0,NULL,NULL),('2016795','DUHAMEL','JULIE','F','1991-03-04','SE','080014',0,NULL,NULL),('2017323','LARGILLERE','FRANCK','M','1995-10-26','SE','080028',0,NULL,NULL),('2020312','LE BESQ','STEPHANIE','F','1986-02-07','M0','080071',0,NULL,NULL),('2020533','GHANDAOUI','ILYAS','M','2009-12-10','CA','080014',0,NULL,NULL),('2022024','JORON','AURELIE','F','1992-03-06','SE','080014',0,NULL,NULL),('2023671','TEURKI','SMAEL','M','1994-03-08','SE','080021',0,NULL,NULL),('202748','FEUCHER','JEAN LUC','M','1964-09-07','M5','080021',0,NULL,NULL),('2028357','BOOMKARTNER','FLORIAN','M','1998-06-29','SE','080004',0,NULL,NULL),('2028710','SKUPIEN','RAPHAELE','F','1994-04-02','SE','080004',0,NULL,NULL),('2029188','DEVILLERS','FREDERIC','M','1979-11-17','M2','080021',0,NULL,NULL),('2029973','DEMABRE','AGNES','F','1974-05-06','M3','080014',0,NULL,NULL),('2030257','LEGRAND','NICOLAS','M','1980-07-18','M2','080049',0,NULL,NULL),('2033990','HANNECART','MARIANNE','F','2009-10-20','CA','080028',0,NULL,NULL),('2034341','PELTIER','MICHELE','F','1973-07-01','M3','080061',0,NULL,NULL),('2037360','POUTRAIN','PHILIPPINE','F','2010-07-18','MI','080014',0,NULL,NULL),('2038546','ROUSSEL','GREGORY','M','1987-01-30','M0','080028',0,NULL,NULL),('2038558','MORELLE','HUGO','M','2007-04-28','JU','080028',0,NULL,NULL),('2038843','MARECHAL','JOHANN','M','1982-03-21','M1','080049',0,NULL,NULL),('2038929','GODOT','VIRGINIE','F','1979-09-24','M2','080021',0,NULL,NULL),('2039793','BARDET','JONATHAN','M','1989-05-23','M0','080049',0,NULL,NULL),('2040756','AYMARD','JOELLE','F','1976-09-09','M2','080061',0,NULL,NULL),('2044892','DUBUC','MARIE','F','1977-02-22','M2','080021',0,NULL,NULL),('2048013','POCQUES','LAURENT','M','1976-11-12','M2','080014',0,NULL,NULL),('2049060','DOLLE','SANDRINE','F','1983-06-06','M1','080044',0,NULL,NULL),('2050449','TROQUENET','CLEMENT','M','2005-11-07','ES','080049',0,NULL,NULL),('2054055','ABOUBI','MAURAD','M','1983-12-19','M1','080014',0,NULL,NULL),('2056015','SCHMUCK','ROMANIE','F','1989-12-18','M0','080044',0,NULL,NULL),('2056676','LOPES LAMY','SARAH','F','1979-02-12','M2','080021',0,NULL,NULL),('2057461','LHERBIER','NICOLAS','M','1979-06-17','M2','080021',0,NULL,NULL),('2057667','GAUTHIER','VALERIE','F','1985-01-12','M1','080061',0,NULL,NULL),('2059008','MERCIER','JULIEN','M','1987-03-25','M0','080044',0,NULL,NULL),('2059648','SPICHER','SABINE','F','1981-07-26','M1','080021',0,NULL,NULL),('2060397','CADET','JUSTIN','M','2000-10-12','SE','080071',0,NULL,NULL),('2061788','MERLIN','SABRINA','F','1988-02-18','M0','080021',0,NULL,NULL),('2061867','OGER','FRANCOIS','M','1966-04-01','M4','080014',0,NULL,NULL),('2064281','LONGCHAMP','NICOLAS','M','1993-08-12','SE','080004',0,NULL,NULL),('2065395','PICQUE','MICHAEL','M','1987-06-29','M0','080028',0,NULL,NULL),('2065860','OMS','NICOLAS','M','1986-10-28','M0','080061',0,NULL,NULL),('2065986','CLAISSE','JULIEN','M','1984-10-05','M1','080061',0,NULL,NULL),('2071179','DALONGEVILLE','VERONIQUE','F','1990-10-22','M0','080028',0,NULL,NULL),('2071189','CAUMARTIN','CHRISTOPHE','M','1975-05-26','M3','080021',0,NULL,NULL),('2071311','BOURGOIS','MAXIME','M','1986-09-24','M0','080021',0,NULL,NULL),('2071369','COUDEVYLLE','VANESSA','F','1979-09-29','M2','080021',0,NULL,NULL),('2071374','DOMINGUES ALVES','JEAN PAUL','M','1980-07-12','M2','080021',0,NULL,NULL),('2071375','BLOT','DOROTHEE','F','1986-07-18','M0','080028',0,NULL,NULL),('2071377','DORDAIN','STEPHANE','M','1980-02-09','M2','080021',0,NULL,NULL),('2071489','BERTRAND','OLIVIER','M','1981-03-24','M1','080049',0,NULL,NULL),('2071497','LEROGNON','AURORE','F','1978-06-12','M2','080021',0,NULL,NULL),('2071501','LOUEY','SOPHIE','F','1993-10-28','SE','080021',0,NULL,NULL),('2071507','POQUET','ANGELIQUE','F','1983-05-17','M1','080021',0,NULL,NULL),('2071508','ROUCHEREAU','AMELIE','F','1980-03-04','M2','080021',0,NULL,NULL),('2071637','GOTTIS','VANESSA','F','1987-07-20','M0','080028',0,NULL,NULL),('2071711','GAFFE','EDDY','M','1993-05-18','SE','080071',0,NULL,NULL),('2071796','DUPONCHEL','MATTHIEU','M','1996-02-27','SE','080028',0,NULL,NULL),('2071798','DUPONCHEL','CONSTANCE','F','1996-01-09','SE','080028',0,NULL,NULL),('2071812','POQUET','CHARLYNE','F','2010-05-13','MI','080021',0,NULL,NULL),('2071865','ROBLIN','ARNAUD','M','1981-01-15','M1','080021',0,NULL,NULL),('2071968','LEBLOND','SEBASTIEN','M','1980-08-05','M2','080027',0,NULL,NULL),('2072318','BIZET','CECILIA','F','1980-10-16','M2','080014',0,NULL,NULL),('2072532','MIRVAL','MELISSA','F','1995-11-02','SE','080004',0,NULL,NULL),('2072537','BONNAY','CHARLINE','F','1998-05-08','SE','080004',0,NULL,NULL),('2072538','ANSARD','ALEXIS','M','1995-06-08','SE','080004',0,NULL,NULL),('2072833','HAVRET','EMILIE','F','1988-11-16','M0','080021',0,NULL,NULL),('2073046','BENOIT','ARTHUR','M','2008-06-13','CA','080021',0,NULL,NULL),('2073468','THERIER','THIBAUT','M','1991-08-10','SE','080014',0,NULL,NULL),('2073792','DUQUESNE','FRANCOIS','M','1997-04-01','SE','080004',0,NULL,NULL),('2073795','BAILLET','ALEXANDRE','M','1990-04-24','M0','080004',0,NULL,NULL),('2074097','DACHEUX','ELODIE','F','1990-09-30','M0','080061',0,NULL,NULL),('2074261','PECOURT','CHRISTOPHE','M','1983-11-14','M1','080014',0,NULL,NULL),('2074438','LEROY','GERARD','M','1960-02-20','M6','080004',0,NULL,NULL),('2074441','DELAHAYE','JULIEN','M','1996-10-04','SE','080004',0,NULL,NULL),('2075732','LANNOY','FANNY','F','1976-04-06','M2','080021',0,NULL,NULL),('2075938','PENEL','MARION','F','1990-02-12','M0','080021',0,NULL,NULL),('2076725','DHAILLE','GUILLAUME','M','1986-02-06','M0','080004',0,NULL,NULL),('2076796','LAMAN','REGIS','M','1964-12-23','M5','080021',0,NULL,NULL),('2077056','HILEY','ALEXANDER','M','1987-10-04','M0','080071',0,NULL,NULL),('2077084','DEBUSSCHER','JEAN','M','2010-07-26','MI','080004',0,NULL,NULL),('2077200','BOUMEDIENE','AHMED','M','1984-02-29','M1','080021',0,NULL,NULL),('2079767','HAUTECOEUR','RENAUD','M','1981-12-13','M1','080049',0,NULL,NULL),('2080071','DESMAREST','MARIE','F','2008-11-23','CA','080004',0,NULL,NULL),('2080118','KOZAK DOLPHIN','JEAN EDOUARD','M','2010-04-07','MI','080004',0,NULL,NULL),('2080838','LECOMTE','CHRISTOPHE','M','1973-03-09','M3','080014',0,NULL,NULL),('2083400','CARREZ','SEBASTIEN','M','1981-02-06','M1','080049',0,NULL,NULL),('2083407','FINET','JULIEN','M','1985-10-16','M1','080049',0,NULL,NULL),('2084069','BOURSE','PHILIPPE','M','1977-11-30','M2','080044',0,NULL,NULL),('2084075','BOURSE','VALERIE','F','1976-01-06','M2','080044',0,NULL,NULL),('2084830','WISCART','CATHERINE','F','1979-08-23','M2','080021',0,NULL,NULL),('2085241','HENONIN','VERONIQUE','F','1981-10-24','M1','080014',0,NULL,NULL),('2087814','RENSON','SALOME','F','2008-06-27','CA','080004',0,NULL,NULL),('2087820','DOS SANTOS','MAEL','M','2011-02-15','MI','080004',0,NULL,NULL),('208801','FRANCELLE','HUBERT','M','1955-09-29','M7','080021',0,NULL,NULL),('208803','CLAISSE','CHRISTIANE','F','1956-10-16','M6','080061',0,NULL,NULL),('2090891','BELHADI','NORDINE','M','1985-12-26','M1','080061',0,NULL,NULL),('2092087','GILLE','YOHAN','M','1994-07-25','SE','080049',0,NULL,NULL),('2094365','MARTIN','LAURENT','M','1984-07-09','M1','080014',0,NULL,NULL),('2094431','GASPARINI','MATTHIEU','M','1987-02-09','M0','080028',0,NULL,NULL),('2095318','ROUXEL','AUDREY','F','1985-11-01','M1','080014',0,NULL,NULL),('2095355','MONCONDHUY','MELANY','F','1986-05-20','M0','080014',0,NULL,NULL),('2096068','LEDUC','EMILE','M','2009-05-12','CA','080028',0,NULL,NULL),('2096796','DEHAIL','CORINNE','F','1983-12-26','M1','080071',0,NULL,NULL),('2098887','LECLERC','FRANCOIS','M','1962-11-01','M5','080014',0,NULL,NULL),('2099148','NOLLET','LAURINE','F','1987-10-25','M0','080028',0,NULL,NULL),('2099482','EL MOURTAFI','SAID','M','1984-07-13','M1','080021',0,NULL,NULL);
/*!40000 ALTER TABLE `coureur` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantAjoutCoureur` BEFORE INSERT ON `coureur` FOR EACH ROW begin
    -- Initialiser l'année de la saison en cours qui commence en septembre de l'année précédente
    declare annee int;
    set annee = year(curdate());
    if month(curdate()) >= 9 then
        set annee = annee + 1;
    end if;

    -- Vérification sur le numéro de licence
    if new.licence not regexp '^[0-9]{6,7}$' then
        signal sqlstate '45000' set message_text = '~Le numéro de licence ne respecte pas le format attendu.';
    end if;

    if exists(select 1 from coureur where licence = new.licence) then
        signal sqlstate '45000' set message_text = '~Ce numéro de licence est déjà attribué.';
    end if;

    -- Mise en forme et vérification sur le nom
    set new.nom = ucase(new.nom);

    if char_length(new.nom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '~Le nom doit comporter entre 3 et 30 caractères';
    end if;

    if new.nom not regexp '^[A-Z]( ?[A-Z])*$' then
        signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
    end if;

    -- mise en forme et vérification sur le prénom
    set new.prenom = ucase(new.prenom);

    if char_length(new.prenom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '~Le prénom doit comporter entre 3 et 30 caractères';
    end if;

    if new.prenom not regexp '^[A-Z]( ?[A-Z])*$' then
        signal sqlstate '45000' set message_text = '~Le format du prénom est invalide.';
    end if;

    -- Vérification de la date de naissance et détermination de la catégorie correspondante
    if new.dateNaissance not regexp '^(19|20)[0-9]{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$' then
        signal sqlstate '45000' set message_text = '~Le format de la date de naissance est invalide.';
    end if;

    select id
    into @idCategorie
    from categorie
    where annee - year(new.dateNaissance) between ageMin and AgeMax;
    if @idCategorie is not null then
        set new.idCategorie = @idCategorie;
    else
        signal sqlstate '45000' set message_text =
                '~Aucune catégorie ne correspond à ce coureur, veuillez vérifier sa date de naissance';
    end if;

    -- vérification de l'unicité sur le triplet nom, prenom, dateNaissance
    if exists(select 1
              from coureur
              where nom = new.nom
                and prenom = new.prenom
                and dateNaissance = new.dateNaissance) then
        signal sqlstate '45000' set message_text = '~Un homonyme est déjà présent dans la table';
    end if;

    -- vérification de l'existence de l'identifant du club
    if not exists(select 1 from club where id = new.idClub) then
        signal sqlstate '45000' set message_text = '~Ce club n''existe pas.';
    end if;

    -- vérification de la validité et de l'unicité de l'email si le champ est renseigné
    if new.email is not null then
        if new.email not regexp '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*[\.][a-zA-Z]{2,4}$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
        end if;

        if exists(select 1 from coureur where email = new.email) then
            signal sqlstate '45000' set message_text = '~Cette adresse mail est déjà associée à un autre coureur';
        end if;
    end if;

    -- vérification de la validité du téléphone si le champ est renseigné
    if new.telephone is not null then
        if new.telephone not regexp '^0(6|7)[0-9]{8}$' then
            signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
        end if;
   end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantMajCoureur` BEFORE UPDATE ON `coureur` FOR EACH ROW begin
    -- Initialiser l'année de la saison en cours qui commence en septembre de l'année précédente
    declare annee int;
    set annee = year(curdate());
    if month(curdate()) >= 9 then
        set annee = annee + 1;
    end if;

    -- Vérification sur le numéro de licence

    if new.licence != old.licence then
        if exists(select 1 from coureur where licence = new.licence) then
            signal sqlstate '45000' set message_text = '~Ce numéro de licence est déjà attribué';
        end if;
    end if;

    -- Mise en forme et vérification sur le nom

    if new.nom != old.nom then

        set new.nom = ucase(new.nom);

        if char_length(new.nom) not between 3 and 30 then
            signal sqlstate '45000' set message_text = '~Le nom doit comporter entre 3 et 30 caractères';
        end if;

        if new.nom not regexp '^[A-Z]( ?[A-Z])*$' then
            signal sqlstate '45000' set message_text = '~Le format du nom est invalide.';
        end if;

    end if;

    -- mise en forme et vérification sur le prénom

    if new.prenom != old.prenom then
        set new.prenom = ucase(new.prenom);


        if char_length(new.prenom) not between 3 and 30 then
            signal sqlstate '45000' set message_text = '~Le prénom doit comporter entre 3 et 30 caractères';
        end if;

        if new.prenom not regexp '^[A-Z]( ?[A-Z])*$' then
            signal sqlstate '45000' set message_text = '~Le format du prénom est invalide.';
        end if;

    end if;

    -- Vérification de la date de naissance et détermination de la catégorie correspondante

    if new.dateNaissance != old.dateNaissance then

        if new.dateNaissance not regexp '^(19|20)[0-9]{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$' then
            signal sqlstate '45000' set message_text = '~Le format de la date de naissance est invalide.';
        end if;

        select id
        into @idCategorie
        from categorie
        where annee - year(new.dateNaissance) between ageMin and AgeMax;
        if @idCategorie is not null then
            set new.idCategorie = @idCategorie;
        else
            signal sqlstate '45000' set message_text =
                    '~Aucune catégorie ne correspond à ce coureur, veuillez vérifier sa date de naissance';
        end if;

    end if;

    -- vérification de l'unicité sur le triplet nom, prenom, dateNaissance
    if new.nom != old.nom or new.prenom != old.prenom or new.dateNaissance != old.dateNaissance then

        if exists(select 1
                  from coureur
                  where nom = new.nom
                    and prenom = new.prenom
                    and dateNaissance = new.dateNaissance) then
            signal sqlstate '45000' set message_text = '~Un homonyme est déjà présent dans la table';
        end if;
    end if;

    -- vérification de l'existence de l'identifant du club
    if new.idClub != old.idClub then
        if not exists(select 1 from club where id = new.idClub) then
            signal sqlstate '45000' set message_text = '~Ce club n''existe pas.';
        end if;
    end if;

    -- vérification de l'unicité de l'email si le champ est renseigné
    if new.email != old.email then
        if new.email is not null then
            if new.email not regexp '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*[\.][a-zA-Z]{2,4}$' then
                signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
            end if;

            if exists(select 1 from coureur where email = new.email) then
                signal sqlstate '45000' set message_text = '~Cette adresse mail est déjà associée à un autre coureur';
            end if;
        end if;
    end if;

    -- vérification du format du téléphone si le champ est renseigné
    if new.telephone != old.telephone then
        if new.telephone is not null then
            if new.telephone not regexp '^0(6|7)[0-9]{8}$' then
                signal sqlstate '45000' set message_text = '~Le format de l\'email est invalide.';
            end if;
        end if;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domaine` (
  `idBloc` int NOT NULL,
  `idDomaine` int NOT NULL,
  `libelle` varchar(150) NOT NULL,
  PRIMARY KEY (`idBloc`,`idDomaine`),
  CONSTRAINT `domaine_ibfk_1` FOREIGN KEY (`idBloc`) REFERENCES `bloc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domaine`
--

LOCK TABLES `domaine` WRITE;
/*!40000 ALTER TABLE `domaine` DISABLE KEYS */;
INSERT INTO `domaine` VALUES (1,1,'Gérer le patrimoine informatique'),(1,2,'Répondre aux incidents et aux demandes d\'assistance et d\'évolution'),(1,3,'Développer la présence en ligne de l\'organisation'),(1,4,'Travail en mode projet'),(1,5,'Mettre à disposition des utilisateurs un service informatique'),(1,6,'Organiser son développement professionnel'),(2,1,'Concevoir une solution applicative'),(2,2,'Assurer la maintenance corrective ou évolutive d\'une solution applicative'),(2,3,'Gérer les données '),(3,1,'Protéger les données à caractère personnel '),(3,2,'Préserver l\'identité numérique de l\'organisation'),(3,3,'Sécuriser les équipements et les usages des utilisateurs'),(3,4,'Garantir la disponibilité, l\'intégrité et la confidentialité des services informatiques et des données de l\'organisation face à des cyberattaques'),(3,5,'Assurer la cybersécurité d\'une solution applicative et de son développement');
/*!40000 ALTER TABLE `domaine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS `projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet`
--

LOCK TABLES `projet` WRITE;
/*!40000 ALTER TABLE `projet` DISABLE KEYS */;
INSERT INTO `projet` VALUES (2,'Création d\'un site Web pour une association'),(1,'Gestion des grands prix de formule 1');
/*!40000 ALTER TABLE `projet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `avantAjoutProjet` BEFORE INSERT ON `projet` FOR EACH ROW begin

    # mise en forme et vérification du nom
    set new.nom = TRIM(REGEXP_REPLACE(new.nom, '\\s+', ' '));

    if length(new.nom) not between 10 and 150 then
        signal sqlstate '45000' set message_text = "#Le nom du projet doit comporter entre 10 et 150 caractères";
    end if;

    if exists(select 1 from projet where nom = new.nom) then
        signal sqlstate '45000' set message_text = "#Ce projet existe déjà";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'gestion'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-23 10:56:24
