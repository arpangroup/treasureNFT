-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: revptc_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_password_resets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Super Admin','arpangroup1@gmail.com','admin',NULL,'6655b1d0db58a1716892112.png','$2y$12$21tL4N36iipVRB8VFP1ACOfqfH87.quqCjicACmBKoPnLPbBkCz/u','Db4J2mkPKbqnlI1eMB5DidsDYwbX6rdOSiMCgyMzreJ5EywV7XYgpLWoPe7K',NULL,'2025-05-10 19:54:25');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bv_logs`
--

DROP TABLE IF EXISTS `bv_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bv_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT '1=L,2=R',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv_logs`
--

LOCK TABLES `bv_logs` WRITE;
/*!40000 ALTER TABLE `bv_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bv_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_job_logs`
--

DROP TABLE IF EXISTS `cron_job_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_job_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cron_job_id` int unsigned NOT NULL DEFAULT '0',
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int unsigned NOT NULL DEFAULT '0',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_job_logs`
--

LOCK TABLES `cron_job_logs` WRITE;
/*!40000 ALTER TABLE `cron_job_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_job_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_jobs`
--

DROP TABLE IF EXISTS `cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_jobs` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cron_schedule_id` int NOT NULL DEFAULT '0',
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_jobs`
--

LOCK TABLES `cron_jobs` WRITE;
/*!40000 ALTER TABLE `cron_jobs` DISABLE KEYS */;
INSERT INTO `cron_jobs` VALUES (1,'Matching Bonus','matching_bonus','[\"App\\\\Http\\\\Controllers\\\\CronController\", \"matchingBonus\"]',NULL,3,'2024-05-28 10:42:33','2024-05-27 10:42:33',1,1,NULL,'2024-05-27 05:12:33');
/*!40000 ALTER TABLE `cron_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_schedules`
--

DROP TABLE IF EXISTS `cron_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_schedules` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_schedules`
--

LOCK TABLES `cron_schedules` WRITE;
/*!40000 ALTER TABLE `cron_schedules` DISABLE KEYS */;
INSERT INTO `cron_schedules` VALUES (1,'Hourly',3600,1,'2024-03-13 17:34:09','2024-05-05 22:45:32'),(3,'Daily',86400,1,'2024-05-05 22:46:39','2024-05-05 22:46:39');
/*!40000 ALTER TABLE `cron_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `plan_id` int unsigned DEFAULT '0',
  `method_code` int unsigned NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `btc_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_try` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `admin_feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `is_app` tinyint(1) NOT NULL DEFAULT '0',
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extensions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
INSERT INTO `extensions` VALUES (1,'tawk-chat','Tawk.to','Key location is shown bellow','tawky_big.png','<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>','{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}','twak.png',0,'2019-10-18 23:16:05','2024-05-19 04:36:33'),(2,'google-recaptcha2','Google Recaptcha 2','Key location is shown bellow','recaptcha3.png','\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>','{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}','recaptcha.png',0,'2019-10-18 23:16:05','2024-05-19 04:36:31'),(3,'custom-captcha','Custom Captcha','Just put any random string','customcaptcha.png',NULL,'{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}','na',0,'2019-10-18 23:16:05','2024-05-19 04:36:43'),(4,'google-analytics','Google Analytics','Key location is shown bellow','google_analytics.png','<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>','{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}','ganalytics.png',0,NULL,'2021-05-04 10:19:12'),(5,'fb-comment','Facebook Comment ','Key location is shown bellow','Facebook.png','<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>','{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}','fb_com.png',0,NULL,'2022-03-22 05:18:36');
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frontends`
--

DROP TABLE IF EXISTS `frontends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frontends` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_keys` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frontends`
--

LOCK TABLES `frontends` WRITE;
/*!40000 ALTER TABLE `frontends` DISABLE KEYS */;
INSERT INTO `frontends` VALUES (1,'seo.data','{\"seo_image\":\"1\",\"keywords\":[\"mlm\",\"multi level marketing\",\"ptc\",\"click and earn\",\"advertisement\",\"binary mlm\",\"ptc site\",\"referral commission\",\"mlm business\",\"ptc business\",\"mlm invest\"],\"description\":\"Win more commissions by making more members and increasing your capital. And you can earn more money by viewing advertisements on our site.\",\"social_title\":\"RevPTC - Multilevel Binary PTC Platform\",\"social_description\":\"Win more commissions by making more members and increasing your capital. And you can earn more money by viewing advertisements on our site.\",\"image\":\"6655a0418b0ad1716887617.png\"}',NULL,'basic','','2020-07-04 23:42:52','2024-05-28 03:13:38'),(24,'about.content','{\"has_image\":\"1\",\"heading\":\"What We Are\",\"sub_heading\":\"ABOUT RevPTC\",\"description\":\"We are not just an online version of any Business market, but also, the reflection of each and every MLM business. We are an international financial company engaged in investment activities, which are related to MLM on financial markets by qualified professional traders. Our goal is to provide our investors with a reliable source of high income, while minimizing any possible risks and offering a high-quality service, allowing us to automate and simplify the relations between the investors and the trustees. We work towards increasing your profit margin by profitable investment. We look forward to you being part of our community.\",\"background_image\":\"6381e0483a4b41669455944.png\"}',NULL,'basic',NULL,'2020-10-28 00:51:20','2022-11-26 07:15:44'),(25,'blog.content','{\"heading\":\"Latest News\",\"sub_heading\":\"BLOGS\"}',NULL,'basic',NULL,'2020-10-28 00:51:34','2022-11-22 02:56:32'),(27,'contact_us.content','{\"has_image\":\"1\",\"email_address\":\"demo@gmail.com\",\"contact_details\":\"Demo World Expo\\/Demo Enterprise Events\",\"contact_number\":\"00123547895\",\"map_url\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m14!1m12!1m3!1d14594.22539131533!2d90.38426189999998!3d23.869882849999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1672208416636!5m2!1sen!2sbd\",\"background_image\":\"6382005b6f9281669464155.png\"}',NULL,'basic',NULL,'2020-10-28 00:59:19','2022-12-28 03:53:10'),(28,'counter.content','{\"has_image\":\"1\",\"background_image\":\"6381eabfdf9891669458623.jpg\"}',NULL,'basic',NULL,'2020-10-28 01:04:02','2022-11-26 08:00:24'),(33,'feature.content','{\"heading\":\"What We Serve To Our Members\",\"sub_heading\":\"OUR SERVICES\"}',NULL,'basic',NULL,'2021-01-03 23:40:54','2022-11-21 09:35:20'),(36,'service.content','{\"heading\":\"What We Serve To Our Members\",\"sub_heading\":\"OUR SERVICES\"}',NULL,'basic',NULL,'2021-03-06 01:27:34','2023-02-14 08:38:48'),(39,'banner.content','{\"has_image\":\"1\",\"title\":\"Enlarge Your Network And Get More Commissions\",\"left_button\":\"Let\'s Start\",\"left_button_link\":\"user\\/register\",\"right_button\":\"Choose Plan\",\"right_button_link\":\"#plan\",\"description\":\"Win more commissions by making more members and increase your capital. And you can earn more money by viewing advertisements on our site.\",\"background_image\":\"6381de5b2c50b1669455451.png\"}',NULL,'basic',NULL,'2021-05-02 06:09:30','2022-11-26 07:07:31'),(41,'cookie.data','{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div><h3>What information do we collect?<\\/h3><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br><\\/p><\\/div><div><h3>How do we protect your information?<\\/h3><p>All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br><\\/p><\\/div><div><h3>Do we disclose any information to outside parties?<\\/h3><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br><\\/p><\\/div><div><h3>Children\'s Online Privacy Protection Act Compliance<\\/h3><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br><\\/p><\\/div><div><h3>Changes to our Privacy Policy<\\/h3><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br><\\/p><\\/div><div><h3>How long we retain your information?<\\/h3><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br><\\/p><\\/div><div><h3>What we don\\u2019t do with your data<\\/h3><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}',NULL,'basic',NULL,'2020-07-04 23:42:52','2024-05-28 03:24:17'),(42,'policy_pages.element','{\"title\":\"Privacy Policy\",\"details\":\"<div><h3>What information do we collect?<\\/h3><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h3>How do we protect your information?<\\/h3><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Do we disclose any information to outside parties?<\\/h3><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Children\'s Online Privacy Protection Act Compliance<\\/h3><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Changes to our Privacy Policy<\\/h3><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br \\/><\\/p><\\/div><div><h3>How long we retain your information?<\\/h3><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h3>What we don\\u2019t do with your data<\\/h3><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}',NULL,'basic','privacy-policy','2021-06-09 08:50:42','2024-05-28 03:16:41'),(43,'policy_pages.element','{\"title\":\"Terms of Service\",\"details\":\"<div><p>We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div><ul><li>Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li>Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li>Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li>Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, & installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li><br \\/><\\/li><li>Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li>We Don\'t support any child porn or such material.<\\/li><li>No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li>No harassing material that may cause people to retaliate against you.<\\/li><li>No phishing pages.<\\/li><li>You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li>If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li>Malicious Botnets are strictly forbidden.<\\/li><li>Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li>Malicious hacking materials, trojans, viruses, & malicious bots running or for download are forbidden.<\\/li><li>Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li>Php\\/CGI proxies are strictly forbidden.<\\/li><li>CGI-IRC is strictly forbidden.<\\/li><li>No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li>NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><li><br \\/><\\/li><\\/ul><\\/div><div><h3>Terms & Conditions for Users<\\/h3><p>Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Support<\\/h3><p>Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p>On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul><li>Hang tight for additional update discharge.<\\/li><li>Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><li><br \\/><\\/li><\\/ul><\\/div><div><h3>Ownership<\\/h3><p>You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Warranty<\\/h3><p>We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Unauthorized\\/Illegal Usage<\\/h3><p>You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p>We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk<\\/p><p><br \\/><\\/p><\\/div><div><h3>Payment\\/Refund Policy<\\/h3><p>No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><p><br \\/><\\/p><\\/div><div><h3>Free Balance \\/ Coupon Policy<\\/h3><p>We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}',NULL,'basic','terms-of-service','2021-06-09 08:51:18','2024-05-28 03:15:53'),(44,'maintenance.data','{\"description\":\"<div style=\\\"text-align: center;\\\"><h6>THE SITE IS UNDER MAINTENANCE<\\/h6><\\/div><div style=\\\"text-align: center; \\\"><span><p>Sorry, we are down for maintenance but will return as soon as possible.<\\/p><\\/span><\\/div>\",\"image\":\"6649e6ac920e21716119212.png\"}',NULL,'basic',NULL,'2020-07-04 23:42:52','2024-05-28 03:23:16'),(45,'breadcrumb.content','{\"has_image\":\"1\",\"background_image\":\"6381fefd2975c1669463805.jpg\"}',NULL,'basic',NULL,'2022-11-21 08:34:19','2022-11-26 09:26:45'),(46,'feature.element','{\"icon\":\"<i class=\\\"fas fa-money-bill-wave\\\"><\\/i>\",\"title\":\"Profitable\",\"description\":\"You can get the golden opportunity to actually win a lot of profit here.\"}',NULL,'basic',NULL,'2022-11-21 09:36:28','2022-11-21 09:36:28'),(47,'feature.element','{\"icon\":\"<i class=\\\"fas fa-lock\\\"><\\/i>\",\"title\":\"Secure\",\"description\":\"Gives ultimate security with 2FA authentication with this system\"}',NULL,'basic',NULL,'2022-11-21 09:36:46','2022-11-21 09:36:46'),(48,'feature.element','{\"icon\":\"<i class=\\\"fas fa-language\\\"><\\/i>\",\"title\":\"Multilingual\",\"description\":\"This site can be easily translated into your own language.\"}',NULL,'basic',NULL,'2022-11-21 09:37:12','2022-11-21 09:37:12'),(49,'feature.element','{\"icon\":\"<i class=\\\"las la-coins\\\"><\\/i>\",\"title\":\"Crypto\",\"description\":\"Cryptocurrency stored on our servers is covered by our insurance policy.\"}',NULL,'basic',NULL,'2022-11-21 09:37:30','2022-11-21 09:37:30'),(50,'feature.element','{\"icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\",\"title\":\"Support\",\"description\":\"We always provide the best \\r\\nsupport to all our users.\"}',NULL,'basic',NULL,'2022-11-21 09:37:52','2022-11-21 09:37:52'),(51,'feature.element','{\"icon\":\"<i class=\\\"fas fa-globe-americas\\\"><\\/i>\",\"title\":\"Global\",\"description\":\"We support a variety of the most popular digital currencies.\"}',NULL,'basic',NULL,'2022-11-21 09:38:11','2022-11-21 09:38:11'),(52,'how_work.content','{\"has_image\":\"1\",\"heading\":\"Our Work Process In 4 Steps\",\"sub_heading\":\"HOW WE WORK\",\"video_link\":\"https:\\/\\/www.youtube.com\\/embed\\/WOb4cj7izpE\",\"background_image\":\"6381e32817cd51669456680.jpg\"}',NULL,'basic',NULL,'2022-11-21 09:44:35','2022-11-26 07:28:00'),(53,'how_work.element','{\"title\":\"Create An Account\"}',NULL,'basic',NULL,'2022-11-21 09:44:58','2022-11-21 09:44:59'),(54,'how_work.element','{\"title\":\"Invite More People\"}',NULL,'basic','','2022-11-21 09:45:08','2024-05-27 03:37:15'),(55,'how_work.element','{\"title\":\"Choose Plan\"}',NULL,'basic','','2022-11-21 09:45:18','2024-05-27 03:37:08'),(56,'how_work.element','{\"title\":\"Get Commission\"}',NULL,'basic',NULL,'2022-11-21 09:45:32','2022-11-21 09:45:32'),(57,'footer.content','{\"has_image\":\"1\",\"background_image\":\"6381ef78c2b901669459832.jpg\"}',NULL,'basic',NULL,'2022-11-21 09:57:00','2022-11-26 08:22:06'),(58,'social_icon.element','{\"title\":\"Facebook\",\"icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\"}',NULL,'basic',NULL,'2022-11-21 09:57:48','2022-11-21 09:57:48'),(59,'social_icon.element','{\"title\":\"Twitter\",\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\"}',NULL,'basic',NULL,'2022-11-21 09:58:07','2022-11-21 09:58:07'),(60,'social_icon.element','{\"title\":\"Youtube\",\"icon\":\"<i class=\\\"fab fa-youtube\\\"><\\/i>\",\"url\":\"https:\\/\\/www.youtube.com\"}',NULL,'basic',NULL,'2022-11-21 09:58:37','2022-11-21 09:58:37'),(61,'social_icon.element','{\"title\":\"Telegram\",\"icon\":\"<i class=\\\"lab la-telegram-plane\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\"}',NULL,'basic',NULL,'2022-11-21 09:59:00','2022-11-21 09:59:00'),(62,'team.content','{\"heading\":\"Let\'s Meet Our Experts\",\"sub_heading\":\"OUR TEAM\"}',NULL,'basic',NULL,'2022-11-21 10:11:54','2022-11-21 10:11:54'),(63,'team.element','{\"has_image\":[\"1\"],\"name\":\"Asuntiry Siomony\",\"designation\":\"Senior Advisor\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi.\",\"image\":\"6381e8b41541c1669458100.png\"}',NULL,'basic',NULL,'2022-11-21 10:12:29','2022-11-26 07:51:40'),(64,'team.element','{\"has_image\":[\"1\"],\"name\":\"William Trosyon\",\"designation\":\"Senior Consultant\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi.\",\"image\":\"6381e8ab8f4b31669458091.png\"}',NULL,'basic',NULL,'2022-11-21 10:13:09','2022-11-26 07:51:31'),(65,'team.element','{\"has_image\":[\"1\"],\"name\":\"Kathi Angel\",\"designation\":\"Marketing Executive\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi.\",\"image\":\"6381e87735ba21669458039.png\"}',NULL,'basic',NULL,'2022-11-21 10:13:41','2022-11-26 07:50:39'),(66,'team.element','{\"has_image\":[\"1\"],\"name\":\"Shane Grilson\",\"designation\":\"CEO\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi.\",\"image\":\"6381e8983b0091669458072.png\"}',NULL,'basic',NULL,'2022-11-21 10:14:16','2022-11-26 07:51:12'),(67,'testimonial.content','{\"has_image\":\"1\",\"heading\":\"What People Say About Us\",\"sub_heading\":\"OUR CLIENTS\",\"background_image\":\"6381e940e052f1669458240.png\"}',NULL,'basic',NULL,'2022-11-22 02:15:49','2022-11-26 07:54:01'),(68,'testimonial.element','{\"has_image\":[\"1\"],\"author\":\"Kathi Angel\",\"designation\":\"Managing Director\",\"rating\":\"5\",\"quote\":\"Tenetur fugiat deleniti nisi ad dolores accusamus cumque sapiente sequi hic nam dolorum culpa laborum libero minima quas expedita quae\",\"image\":\"6381e94f0e9861669458255.png\"}',NULL,'basic',NULL,'2022-11-22 02:17:08','2022-11-26 07:54:15'),(69,'testimonial.element','{\"has_image\":[\"1\"],\"author\":\"William Trosyon\",\"designation\":\"Hedom Jater Kocchop\",\"rating\":\"4\",\"quote\":\"Tenetur fugiat deleniti nisi ad dolores accusamus cumque sapiente sequi hic nam dolorum culpa laborum libero minima quas expedita quae\",\"image\":\"6381e959a14021669458265.png\"}',NULL,'basic',NULL,'2022-11-22 02:17:55','2022-11-26 07:54:25'),(70,'counter.element','{\"title\":\"Total Invest\",\"counter_digit\":\"9\",\"counter_digit_unit\":\"M+\"}',NULL,'basic',NULL,'2022-11-22 02:24:44','2022-11-22 02:24:44'),(71,'counter.element','{\"title\":\"Total Deposit\",\"counter_digit\":\"10\",\"counter_digit_unit\":\"M+\"}',NULL,'basic',NULL,'2022-11-22 02:25:06','2022-11-22 02:25:06'),(72,'counter.element','{\"title\":\"Total Withdraw\",\"counter_digit\":\"9\",\"counter_digit_unit\":\"M+\"}',NULL,'basic',NULL,'2022-11-22 02:25:17','2022-11-22 02:25:17'),(73,'counter.element','{\"title\":\"Total Users\",\"counter_digit\":\"10\",\"counter_digit_unit\":\"M+\"}',NULL,'basic',NULL,'2022-11-22 02:25:32','2022-11-22 02:25:32'),(74,'subscribe.content','{\"has_image\":\"1\",\"heading\":\"Subscribe To Our Newsletter\",\"sub_heading\":\"SUBSCRIBE\",\"background_image\":\"6381f30b8c2471669460747.jpg\"}',NULL,'basic',NULL,'2022-11-22 02:29:17','2022-11-26 08:35:47'),(75,'payment_methods.content','{\"heading\":\"Our Payment System For You\",\"sub_heading\":\"PAYMENT METHODS\"}',NULL,'basic',NULL,'2022-11-22 02:32:46','2022-11-22 02:32:46'),(76,'blog.element','{\"has_image\":[\"1\"],\"title\":\"Popular Words in the Multi-Level Marketing Industry\",\"description\":\"<p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font face=\\\"Open Sans, Arial, sans-serif\\\" color=\\\"#000000\\\">While MLMs focus almost exclusively on direct selling, this is not an accurate synonym because direct selling is simply the method by which distributors in MLMs sell products and\\/or recruit new members. Direct selling is the idea that sales people leverage their personal contacts and relationships, whereas salesmen at a normal company are often working with people that they don\\u2019t personally know. Multi-level marketing companies that have lasted many years or even decades have generally done a better job of emphasizing direct sales over recruiting.<\\/font><br \\/><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font face=\\\"Open Sans, Arial, sans-serif\\\" color=\\\"#000000\\\"><br \\/><\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font face=\\\"Open Sans, Arial, sans-serif\\\" color=\\\"#000000\\\">In 1979, a landmark ruling involving Amway helped to legitimize the multi-level marketing industry. The FTC found that Amway was not operating as a pyramid scheme according to the strict statutory definition of one, but did order the company to stop deceiving its distributors about their income potential.<\\/font><\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"<\\/p>\",\"blog_image\":\"6381ee14b006d1669459476.png\"}',NULL,'basic','popular-words-in-the-multi-level-marketing-industry','2022-11-22 02:57:12','2022-11-26 08:14:37'),(77,'blog.element','{\"has_image\":[\"1\"],\"title\":\"History of Multi-Level Marketing You Need To Know\",\"description\":\"<p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">The first recognized MLM businesses in the United States were the California Vitamin Company (founded in the 1920s and later renamed Nutrilite in 1939), and the California Perfume Company (incorporated in 1909 and later renamed Avon Products in 1932).<\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\"><br \\/><\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">In 1979, a landmark ruling involving Amway helped to legitimize the multi-level marketing industry. The FTC found that Amway was not operating as a pyramid scheme according to the strict statutory definition of one, but did order the company to stop deceiving its distributors about their income potential.<\\/font><\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"<\\/p>\",\"blog_image\":\"6381ee1ea840c1669459486.jpg\"}',NULL,'basic','history-of-multi-level-marketing-you-need-to-know','2022-11-22 02:57:46','2022-11-26 08:14:46'),(78,'blog.element','{\"has_image\":[\"1\"],\"title\":\"What is Multi-Level Marketing? What You Need to Know About the Industry\",\"description\":\"<p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">This stands in stark contrast to most standard businesses, where employees are rewarded for sales made to other businesses (B2B companies) or to consumers (B2C companies). Additionally, obtaining a higher rank within multi-level marketing companies depends on your ability to recruit others, rather than by appointment. MLMs that rely too heavily on recruitment rather than emphasizing direct sales generally fail over time because of the natural progression of pyramid schemes which are unsustainable in the long run.<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"<\\/p>\",\"blog_image\":\"6381ee28a087f1669459496.jpg\"}',NULL,'basic','what-is-multi-level-marketing?-what-you-need-to-know-about-the-industry','2022-11-22 02:58:16','2022-11-26 08:14:56'),(79,'blog.element','{\"has_image\":[\"1\"],\"title\":\"Melaleuca CEO Frank VanderSloot Promises to Resign\",\"description\":\"<p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;\\\"><font face=\\\"PT Sans, Arial, Helvetica, sans-serif\\\"><span style=\\\"font-size:16px;\\\">In an interview with East Idaho News today, Melalecua CEO Frank Vandersloot promised to resign his executive position with the company if his world record rowing attempt fails. VanderSloot will attempt to complete a 100-meter row on a Concept 2 Rower within 15.3 seconds on Tuesday, which also happens to be his 70th birthday.<\\/span><\\/font><br \\/><\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"<\\/p>\",\"blog_image\":\"6381ee30bcae11669459504.jpg\"}',NULL,'basic','melaleuca-ceo-frank-vandersloot-promises-to-resign','2022-11-22 02:58:44','2022-11-26 08:15:04'),(80,'blog.element','{\"has_image\":[\"1\"],\"title\":\"Amway Co-Founder Richard DeVos Passes Away at Age 92\",\"description\":\"<p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">Rick DeVos announced earlier today that his grandfather and co-founder of Amway Richard DeVos has passed away at age 92. DeVos got his start in the multi-level marketing world as a distributor with Nutrilite, a direct selling company that primarily sold vitamins and supplements. Along with his partner Jay Van Andel, DeVos eventually started his own MLM called Amway (short for American Way), which eventually purchased Nutrilite in 1972. Since then, Amway has grown to become the largest MLM in the U.S., boasting over 3 million distributors worldwide.<\\/font><br \\/><\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"<\\/p>\",\"blog_image\":\"6381ee38258d41669459512.jpg\"}',NULL,'basic','amway-co-founder-richard-devos-passes-away-at-age-92','2022-11-22 02:59:23','2022-11-26 08:15:12'),(81,'blog.element','{\"has_image\":[\"1\"],\"title\":\"2020 Top 50 MLM Companies in the U.S.\",\"description\":\"<p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">*Note: 2019 revenue numbers coming soon.<\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\"><br \\/><\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">Below is the comprehensive list of multi-level marketing companies generating the most amount of revenue in the United States. After compiling this list, we noticed some interesting trends:<\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\"><br \\/><\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">Only 2 companies in the Top 10 were founded after the year 2000. Out of the Top 50, only 20 were founded after 2000.<\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">38% (19 total) of the Top 50 MLMs were in the supplements industry, by far the most popular category. The Beauty industry is second with 16% (8 total).<\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">Of the Top 10, 50% of the companies are in the Beauty industry.<\\/font><\\/p><p style=\\\"margin:-10px 0px 15px;font-family:Montserrat, sans-serif;padding:0px;text-align:justify;\\\"><font color=\\\"#000000\\\" face=\\\"Open Sans, Arial, sans-serif\\\">Have any others you\\u2019d like to add to the top MLMs list? Let us know in the comments.<\\/font><\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;font-weight:700;line-height:1.3;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;padding:0px;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin:-10px 0px 15px;color:rgb(0,0,0);font-size:14px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;\\\">\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"<\\/p>\",\"blog_image\":\"6381ee41b90f91669459521.jpg\"}',NULL,'basic','2020-top-50-mlm-companies-in-the-us','2022-11-22 03:00:10','2022-11-26 08:15:21'),(82,'faq.content','{\"heading\":\"A Frequently Asked Questions\",\"sub_heading\":\"We always care for our clients, we have tried to answer some frequent questions about your business\"}',NULL,'basic',NULL,'2022-11-22 03:25:04','2022-11-22 03:25:04'),(83,'faq.element','{\"question\":\"How to making a withdrawal?\",\"answer\":\"You can make a withdrawal from the Withdraw page. Where possible we are required to send funds back to the payment method that was used to deposit the original funds.\\r\\nFor further details relating to processing times and any applicable fees, please refer to the Withdrawals section of our Payments page.\\r\\nYou can make a withdrawal from the Withdraw page. Where possible we are required to send funds back to the payment method that was used to deposit the original funds.\\r\\nFor further details relating to processing times and any applicable fees, please refer to the Withdrawals section of our Payments page.\"}',NULL,'basic',NULL,'2022-11-22 03:25:20','2022-11-22 03:25:20'),(84,'faq.element','{\"question\":\"I have not received my withdrawal\",\"answer\":\"The processing time for your withdrawal will vary depending on your payment method.\\r\\nYou can view further information on withdrawal clearance times by visiting our Payment Method page. If you are unable to locate your withdrawal after the processing time has passed, please Contact Us.\"}',NULL,'basic',NULL,'2022-11-22 03:25:36','2022-11-22 03:25:36'),(85,'faq.element','{\"question\":\"Advantages\\/Benefits of Binary MLM Plan\",\"answer\":\"Unlimited depth: Binary plan allows distributors to add members to unlimited levels and earn a high income.\\r\\n\\r\\nGroup work: With left leg or right spilling preferences, the distributors become active as they have to balance the tree for compensations.\\r\\n\\r\\nQuick growth: Binary plan offers quick business growth opportunities.\\r\\n\\r\\nCarry forward: Unpaid sales volume (SV) after present binary payout cycle is carry forward for the next binary payout cycle.\\r\\n\\r\\nSpillover: New members after completing the first level is spilled over to the unlimited downline levels.\"}',NULL,'basic',NULL,'2022-11-22 03:25:50','2022-11-22 03:25:50'),(86,'faq.element','{\"question\":\"How Does the Binary MLM Plan Works?\",\"answer\":\"Binary MLM plan is a network marketing compensation strategy used by many top-performing MLM companies. The new members sponsored by distributors are added either on the left or right leg. Upon adding two new members on either side of the subtree, a binary tree gets formed.\\r\\n\\r\\nAll the new members referred after forming a binary tree gets spilled to the downlines.\\r\\n\\r\\nNote: Distributors become a part of the binary plan by purchasing an enrollment package. The enrollment package here means either a service or a list of products. The distributor buys the package and becomes a part of the binary MLM company.\"}',NULL,'basic',NULL,'2022-11-22 03:26:03','2022-11-22 03:26:03'),(87,'faq.element','{\"question\":\"What is a Binary MLM Plan?\",\"answer\":\"The binary MLM plan is defined as a compensation plan that consists of two legs (left &amp; right) or subtrees under every distributor. Upon adding subtrees, a binary tree gets formed. New members joining after them are spilled over to the downlines or next business level.\"}',NULL,'basic',NULL,'2022-11-22 03:26:18','2022-11-22 03:26:18'),(88,'faq.element','{\"question\":\"How to Deposit Money?\",\"answer\":\"You can make a deposit from the deposit page. You will see several payment methods to pay, choose any one of them and pay the money to deposit that amount in your balance\"}',NULL,'basic',NULL,'2022-11-22 03:26:40','2022-11-22 03:26:40'),(89,'sign_up.content','{\"has_image\":\"1\",\"heading\":\"Create Your Account\",\"short_details\":\"Haven\'t registered yet! don\'t worry just fillip all the information below and get your account now.\",\"login_section_heading\":\"Well Come To MLM world\",\"login_section_short_details\":\"Haven\'t registered yet! don\'t worry just fillip all the information below and get your account now.\",\"background_image\":\"637c6abcf12a41669098172.jpg\"}',NULL,'basic',NULL,'2022-11-22 03:52:52','2022-11-22 03:53:15'),(90,'plan.content','{\"heading\":\"Choose The Most Suitable Plan For You\",\"sub_heading\":\"OUR PLANS\"}',NULL,'basic',NULL,'2022-11-26 07:35:01','2022-11-26 07:35:01'),(91,'footer_section.content','{\"has_image\":\"1\",\"description\":\"Maecenas tempus tellus egondime honcus sequam seitmet dipiscing sem eque sedipsuNam quam egondime honcus sequam\",\"background_image\":\"6381eebe13cb51669459646.jpg\"}',NULL,'basic',NULL,'2022-11-26 08:17:26','2022-11-26 08:17:26'),(92,'transaction.content','{\"heading\":\"Our Latest Deposits and Withdraws\",\"sub_heading\":\"TRANSACTIONS\"}',NULL,'basic',NULL,'2022-11-26 08:25:44','2022-11-26 08:25:44'),(93,'sign_in.content','{\"has_image\":\"1\",\"heading\":\"Login Account\",\"background_image\":\"63820c73e017a1669467251.jpg\"}',NULL,'basic',NULL,'2022-11-26 10:24:11','2022-11-26 10:24:12'),(94,'login.content','{\"has_image\":\"1\",\"heading\":\"Login Account\",\"background_image\":\"638333a01abe31669542816.jpg\"}',NULL,'basic',NULL,'2022-11-27 07:23:36','2022-11-27 07:23:36'),(95,'register.content','{\"has_image\":\"1\",\"heading\":\"Register Account\",\"background_image\":\"638333b7a5a031669542839.jpg\"}',NULL,'basic',NULL,'2022-11-27 07:23:59','2022-11-27 07:23:59'),(96,'notice.element','{\"title\":\"All User Notice\",\"description\":\"<span style=\\\"color:rgb(33,37,41);font-family:\'Open Sans\', sans-serif;font-size:14px;\\\">Multi-level marketing is a diverse and varied industry, employing many different structures and methods of selling. Although there may be significant differences in how multi-level marketers sell their products or services, core consumer protection principles are applicable to every member of the industry. The Commission staff offers this non-binding guidance to assist multi-level marketers in applying those core principles to their business practices.<\\/span><br \\/>\"}',NULL,'basic',NULL,'2022-12-28 07:25:51','2022-12-28 07:25:51'),(97,'notice.element','{\"title\":\"Free User notice\",\"description\":\"<span style=\\\"color:rgb(33,37,41);font-family:\'Open Sans\', sans-serif;font-size:14px;\\\">Multi-level marketing is a diverse and varied industry, employing many different structures and methods of selling. Although there may be significant differences in how multi-level marketers sell their products or services, core consumer protection principles are applicable to every member of the industry. The Commission staff offers this non-binding guidance to assist multi-level marketers in applying those core principles to their business practices.<\\/span><br \\/>\"}',NULL,'basic',NULL,'2022-12-28 07:26:03','2022-12-28 07:26:03'),(98,'maintenance_mode.content','{\"has_image\":\"1\",\"heading\":\"THE SITE IS UNDER MAINTENANCE\",\"description\":\"<h2 style=\\\"text-align:center;\\\"><font size=\\\"6\\\">We\'re just tuning up a few things.<\\/font><\\/h2><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;clear:both;color:rgb(54,54,54);font-family:Exo, sans-serif;text-align:center;\\\"><\\/h3><p>We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<br \\/><\\/p>\",\"image\":\"63f9b013e93301677307923.png\"}',NULL,'basic',NULL,'2023-01-07 05:52:58','2023-02-25 06:52:04'),(99,'service.element','{\"icon\":\"<i class=\\\"fas fa-money-bill-wave\\\"><\\/i>\",\"title\":\"Profitable\",\"description\":\"You can get the golden opportunity to actually win a lot of profit here.\"}',NULL,'basic',NULL,'2023-02-14 08:39:30','2023-02-14 08:39:30'),(100,'service.element','{\"icon\":\"<i class=\\\"fas fa-lock\\\"><\\/i>\",\"title\":\"Secure\",\"description\":\"Gives ultimate security with 2FA authentication with this system\"}',NULL,'basic',NULL,'2023-02-14 08:40:02','2023-02-14 08:40:02'),(101,'service.element','{\"icon\":\"<i class=\\\"fas fa-language\\\"><\\/i>\",\"title\":\"Multilingual\",\"description\":\"This site can be easily translated into your own language.\"}',NULL,'basic',NULL,'2023-02-14 08:40:43','2023-02-14 08:40:43'),(102,'service.element','{\"icon\":\"<i class=\\\"las la-coins\\\"><\\/i>\",\"title\":\"Crypto\",\"description\":\"Cryptocurrency stored on our servers is covered by our insurance policy.\"}',NULL,'basic',NULL,'2023-02-14 08:42:20','2023-02-14 08:42:20'),(103,'service.element','{\"icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\",\"title\":\"Support\",\"description\":\"We always provide the best support to all our users.\"}',NULL,'basic',NULL,'2023-02-14 08:42:55','2023-02-14 08:42:55'),(104,'service.element','{\"icon\":\"<i class=\\\"fas fa-globe-americas\\\"><\\/i>\",\"title\":\"Global\",\"description\":\"We support a variety of the most popular digital currencies.\"}',NULL,'basic',NULL,'2023-02-14 08:43:31','2023-02-14 08:43:31'),(105,'kyc.content','{\"required\":\"Complete KYC to unlock the full potential of our platform! KYC helps us verify your identity and keep things secure. It is quick and easy just follow the on-screen instructions. Get started with KYC verification now!\",\"pending\":\"Your KYC verification is being reviewed. We might need some additional information. You will get an email update soon. In the meantime, explore our platform with limited features.\",\"reject\":\"We regret to inform you that the Know Your Customer (KYC) information provided has been reviewed and unfortunately, it has not met our verification standards.\"}',NULL,'basic','','2023-02-15 06:46:53','2024-05-27 03:35:06'),(106,'payment.content','{\"heading\":\"PAYMENT METHODS\",\"subheading\":\"Our Payment System For You\"}',NULL,'basic',NULL,'2023-02-15 07:05:47','2023-02-15 07:05:47'),(107,'payment.element','{\"name\":\"Paypal\",\"has_image\":\"1\",\"image\":\"63f9daaad40a11677318826.jpg\"}',NULL,'basic',NULL,'2023-02-15 07:06:25','2023-02-25 09:53:46'),(108,'payment.element','{\"name\":\"Stripe\",\"has_image\":\"1\",\"image\":\"63f9d9d3e4cbb1677318611.jpg\"}',NULL,'basic',NULL,'2023-02-15 07:11:40','2023-02-25 09:50:11'),(109,'payment.element','{\"name\":\"Authorize\",\"has_image\":\"1\",\"image\":\"63f9d9e6ac6331677318630.png\"}',NULL,'basic',NULL,'2023-02-15 07:11:59','2023-02-25 09:50:30'),(110,'payment.element','{\"name\":\"Paystack\",\"has_image\":\"1\",\"image\":\"63f9d9f89d9901677318648.jpg\"}',NULL,'basic',NULL,'2023-02-15 07:13:56','2023-02-25 09:50:48'),(111,'payment.element','{\"name\":\"Western union\",\"has_image\":\"1\",\"image\":\"63f9db2b3949d1677318955.png\"}',NULL,'basic',NULL,'2023-02-15 07:14:24','2023-02-25 09:55:55'),(113,'payment.element','{\"name\":\"Flutter Wave\",\"has_image\":\"1\",\"image\":\"63f9da927d0481677318802.png\"}',NULL,'basic',NULL,'2023-02-25 09:53:22','2023-02-25 09:53:22'),(114,'banned.content','{\"has_image\":\"1\",\"heading\":\"This Account Is Banned\",\"image\":\"63f9dfeebc02e1677320174.jpg\"}',NULL,'basic',NULL,'2023-02-25 10:16:14','2023-02-25 10:16:14'),(115,'register_disable.content','{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exit or an other error occurred or temporarily unavailable.\",\"button_name\":\"Go to Home\",\"button_url\":\"#\",\"image\":\"66544c4d805bf1716800589.png\"}',NULL,'basic','','2024-05-27 03:33:09','2024-05-27 03:33:10');
/*!40000 ALTER TABLE `frontends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateway_currencies`
--

DROP TABLE IF EXISTS `gateway_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateway_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int DEFAULT NULL,
  `gateway_alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `gateway_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateway_currencies`
--

LOCK TABLES `gateway_currencies` WRITE;
/*!40000 ALTER TABLE `gateway_currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `gateway_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL DEFAULT '0',
  `code` int DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `code_2` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT INTO `gateways` VALUES (1,0,101,'Paypal','Paypal','663a38d7b455d1715091671.png',1,'{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}','{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:21:11'),(2,0,102,'Perfect Money','PerfectMoney','663a3920e30a31715091744.png',1,'{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}','{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:22:24'),(3,0,103,'Stripe Hosted','Stripe','663a39861cb9d1715091846.png',1,'{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}','{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:24:06'),(4,0,104,'Skrill','Skrill','663a39494c4a91715091785.png',1,'{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}','{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:23:05'),(5,0,105,'PayTM','Paytm','663a390f601191715091727.png',1,'{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}','{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:22:07'),(6,0,106,'Payeer','Payeer','663a38c9e2e931715091657.png',1,'{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}','{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}',0,'{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}',NULL,'2019-09-14 13:14:22','2024-05-07 08:20:57'),(7,0,107,'PayStack','Paystack','663a38fc814e91715091708.png',1,'{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}','{\"USD\":\"USD\",\"NGN\":\"NGN\"}',0,'{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n',NULL,'2019-09-14 13:14:22','2024-05-07 08:21:48'),(9,0,109,'Flutterwave','Flutterwave','663a36c2c34d61715091138.png',1,'{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}','{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:12:18'),(10,0,110,'RazorPay','Razorpay','663a393a527831715091770.png',1,'{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}','{\"INR\":\"INR\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:22:50'),(11,0,111,'Stripe Storefront','StripeJs','663a3995417171715091861.png',1,'{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}','{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:24:21'),(12,0,112,'Instamojo','Instamojo','663a384d54a111715091533.png',1,'{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}','{\"INR\":\"INR\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:18:53'),(13,0,501,'Blockchain','Blockchain','663a35efd0c311715090927.png',1,'{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}','{\"BTC\":\"BTC\"}',1,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:08:47'),(15,0,503,'CoinPayments','Coinpayments','663a36a8d8e1d1715091112.png',1,'{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"---------------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"---------------------\"}}','{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}',1,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:11:52'),(16,0,504,'CoinPayments Fiat','CoinpaymentsFiat','663a36b7b841a1715091127.png',1,'{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}','{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:12:07'),(17,0,505,'Coingate','Coingate','663a368e753381715091086.png',1,'{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}','{\"USD\":\"USD\",\"EUR\":\"EUR\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:11:26'),(18,0,506,'Coinbase Commerce','CoinbaseCommerce','663a367e46ae51715091070.png',1,'{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}','{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n',0,'{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}',NULL,'2019-09-14 13:14:22','2024-05-07 08:11:10'),(24,0,113,'Paypal Express','PaypalSdk','663a38ed101a61715091693.png',1,'{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}','{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:21:33'),(25,0,114,'Stripe Checkout','StripeV3','663a39afb519f1715091887.png',1,'{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}','{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}',0,'{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}',NULL,'2019-09-14 13:14:22','2024-05-07 08:24:47'),(27,0,115,'Mollie','Mollie','663a387ec69371715091582.png',1,'{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}','{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}',0,NULL,NULL,'2019-09-14 13:14:22','2024-05-07 08:19:42'),(30,0,116,'Cashmaal','Cashmaal','663a361b16bd11715090971.png',1,'{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}','{\"PKR\":\"PKR\",\"USD\":\"USD\"}',0,'{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}',NULL,NULL,'2024-05-07 08:09:31'),(36,0,119,'Mercado Pago','MercadoPago','663a386c714a91715091564.png',1,'{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}}','{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}',0,NULL,NULL,NULL,'2024-05-07 08:19:24'),(37,0,120,'Authorize.net','Authorize','663a35b9ca5991715090873.png',1,'{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"59e4P9DBcZv\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"47x47TJyLw2E7DbR\"}}','{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}',0,NULL,NULL,NULL,'2024-05-07 08:07:53'),(46,0,121,'NMI','NMI','663a3897754cf1715091607.png',1,'{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}}','{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}',0,NULL,NULL,NULL,'2024-05-07 08:20:07'),(50,0,507,'BTCPay','BTCPay','663a35cd25a8d1715090893.png',1,'{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"HsqFVTXSeUFJu7caoYZc3CTnP8g5LErVdHhEXPVTheHf\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"4436bd706f99efae69305e7c4eff4780de1335ce\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/testnet.demo.btcpayserver.org\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"SUCdqPn9CDkY7RmJHfpQVHP2Lf2\"}}','{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}',1,'{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}',NULL,NULL,'2024-05-07 08:08:13'),(51,0,508,'Now payments hosted','NowPaymentsHosted','663a38b8d57a81715091640.png',1,'{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------------\"}}','{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}',1,'',NULL,NULL,'2024-05-07 08:20:40'),(52,0,509,'Now payments checkout','NowPaymentsCheckout','663a38a59d2541715091621.png',1,'{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------\"}}','{\"USD\":\"USD\",\"EUR\":\"EUR\"}',1,'',NULL,NULL,'2024-05-07 08:20:21'),(53,0,122,'2Checkout','TwoCheckout','663a39b8e64b91715091896.png',1,'{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"253248016872\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"eQM)ID@&vG84u!O*g[p+\"}}','{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}',0,'{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"ipn.TwoCheckout\"}}',NULL,NULL,'2024-05-07 08:24:56'),(54,0,123,'Checkout','Checkout','663a3628733351715090984.png',1,'{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"------\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"------\"}}','{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}',0,NULL,NULL,NULL,'2024-05-07 08:09:44'),(56,0,510,'Binance','Binance','663a35db4fd621715090907.png',1,'{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"tsu3tjiq0oqfbtmlbevoeraxhfbp3brejnm9txhjxcp4to29ujvakvfl1ibsn3ja\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"jzngq4t04ltw8d4iqpi7admfl8tvnpehxnmi34id1zvfaenbwwvsvw7llw3zdko8\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"231129033\"}}','{\"BTC\":\"Bitcoin\",\"USD\":\"USD\",\"BNB\":\"BNB\"}',1,'{\"cron\":{\"title\": \"Cron Job URL\",\"value\":\"ipn.Binance\"}}',NULL,NULL,'2024-05-07 08:08:27'),(57,0,124,'SslCommerz','SslCommerz','663a397a70c571715091834.png',1,'{\"store_id\":{\"title\":\"Store ID\",\"global\":true,\"value\":\"---------\"},\"store_password\":{\"title\":\"Store Password\",\"global\":true,\"value\":\"----------\"}}','{\"BDT\":\"BDT\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"SGD\":\"SGD\",\"INR\":\"INR\",\"MYR\":\"MYR\"}',0,NULL,NULL,NULL,'2024-05-07 08:23:54'),(58,0,125,'Aamarpay','Aamarpay','663a34d5d1dfc1715090645.png',1,'{\"store_id\":{\"title\":\"Store ID\",\"global\":true,\"value\":\"---------\"},\"signature_key\":{\"title\":\"Signature Key\",\"global\":true,\"value\":\"----------\"}}','{\"BDT\":\"BDT\"}',0,NULL,NULL,NULL,'2024-05-07 08:04:05');
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `firebase_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT '1',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `in_app_payment` tinyint(1) NOT NULL DEFAULT '1',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multi_language` tinyint(1) NOT NULL DEFAULT '0',
  `balance_transfer` tinyint(1) NOT NULL DEFAULT '0',
  `balance_transfer_fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `balance_transfer_percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `balance_transfer_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `bv_price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `total_bv` int NOT NULL DEFAULT '0',
  `max_bv` int NOT NULL DEFAULT '0',
  `cary_flash` tinyint(1) NOT NULL DEFAULT '0',
  `matching_bonus_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matching_when` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dispatch_commission_module` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '1=commissions based on lower plan,\r\n2= commissions based on Child user''s plan,\r\n3=Commissions based self plan,\r\n',
  `last_paid` datetime DEFAULT NULL,
  `last_cron` datetime DEFAULT NULL,
  `available_version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_customized` tinyint(1) NOT NULL DEFAULT '0',
  `paginate_number` int NOT NULL DEFAULT '0',
  `currency_format` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>Both\r\n2=>Text Only\r\n3=>Symbol Only',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` VALUES (1,'RevPTC','USD','$','info@viserlab.com','{{site_name}}','<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>','hi {{fullname}} ({{username}}), {{message}}','ViserAdmin','{{site_name}}','hi {{fullname}} ({{username}}), {{message}}','ff7149','36274c','{\"name\":\"php\"}','{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}','{\"apiKey\":\"-------------\",\"authDomain\":\"---------------\",\"projectId\":\"-----------------\",\"storageBucket\":\"--------------\",\"messagingSenderId\":\"-------------------\",\"appId\":\"------------------\",\"measurementId\":\"--------------\",\"serverKey\":\"----------------\"}','{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}',0,0,1,0,0,0,0,0,0,0,1,1,'basic',1,1,2.00000000,1.00,1000.00000000,10.00000000,500,500,1,'weekly','sun',2,NULL,'2024-05-27 10:42:33','1',0,20,1,NULL,'2025-05-10 19:54:24');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en',1,'6655a1a6874a61716887974.png','2024-05-28 03:19:34','2024-05-28 03:19:37');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_logs`
--

DROP TABLE IF EXISTS `notification_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `sender` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_logs`
--

LOCK TABLES `notification_logs` WRITE;
/*!40000 ALTER TABLE `notification_logs` DISABLE KEYS */;
INSERT INTO `notification_logs` VALUES (1,1,'php','info@viserlab.com','user@site.com','Please verify your email address','<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello test test (revptc)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;556149</span></font></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">RevPTC</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>','email',NULL,0,'2024-05-28 04:30:22','2024-05-28 04:30:22');
/*!40000 ALTER TABLE `notification_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `push_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `email_sent_from_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent_from_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
INSERT INTO `notification_templates` VALUES (1,'BAL_ADD','Balance - Added','Your Account has been Credited',NULL,'<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>','{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"',NULL,'{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}',1,NULL,NULL,0,NULL,0,'2021-11-03 12:00:00','2022-04-03 02:18:28'),(2,'BAL_SUB','Balance - Subtracted','Your Account has been Debited',NULL,'<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>','{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}',NULL,'{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-04-03 02:24:11'),(3,'DEPOSIT_COMPLETE','Deposit - Automated - Successful','Deposit Completed Successfully',NULL,'<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>','{{amount}} {{site_currency}} Deposit successfully by {{method_name}}',NULL,'{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-04-03 02:25:43'),(4,'DEPOSIT_APPROVE','Deposit - Manual - Approved','Your Deposit is Approved',NULL,'<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>','Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}',NULL,'{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-04-03 02:26:07'),(5,'DEPOSIT_REJECT','Deposit - Manual - Rejected','Your Deposit Request is Rejected',NULL,'<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>','Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}',NULL,'{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-04-05 03:45:27'),(6,'DEPOSIT_REQUEST','Deposit - Manual - Requested','Deposit Request Submitted Successfully',NULL,'<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>','{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}',NULL,'{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-04-03 02:29:19'),(7,'PASS_RESET_CODE','Password - Reset - Code','Password Reset',NULL,'<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>','Your account recovery code is: {{code}}',NULL,'{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}',1,NULL,NULL,0,NULL,0,'2021-11-03 12:00:00','2022-03-20 20:47:05'),(8,'PASS_RESET_DONE','Password - Reset - Confirmation','You have reset your password',NULL,'<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>','Your password has been changed successfully',NULL,'{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-04-05 03:46:35'),(9,'ADMIN_SUPPORT_REPLY','Support - Reply','Reply Support Ticket',NULL,'<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>','Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.',NULL,'{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-03-20 20:47:51'),(10,'EVER_CODE','Verification - Email','Please verify your email address',NULL,'<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>','---',NULL,'{\"code\":\"Email verification code\"}',1,NULL,NULL,0,NULL,0,'2021-11-03 12:00:00','2022-04-03 02:32:07'),(11,'SVER_CODE','Verification - SMS','Verify Your Mobile Number',NULL,'---','Your phone verification code is: {{code}}',NULL,'{\"code\":\"SMS Verification Code\"}',0,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-03-20 19:24:37'),(12,'WITHDRAW_APPROVE','Withdraw - Approved','Withdraw Request has been Processed and your money is sent',NULL,'<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>','Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}',NULL,'{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-03-20 20:50:16'),(13,'WITHDRAW_REJECT','Withdraw - Rejected','Withdraw Request has been Rejected and your money is refunded to your account',NULL,'<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>','Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}',NULL,'{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-03-20 20:57:46'),(14,'WITHDRAW_REQUEST','Withdraw - Requested','Withdraw Request Submitted Successfully',NULL,'<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>','{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}',NULL,'{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}',1,NULL,NULL,1,NULL,0,'2021-11-03 12:00:00','2022-03-21 04:39:03'),(15,'DEFAULT','Default Template','{{subject}}','{{subject}}','{{message}}','{{message}}','{{message}}','{\"subject\":\"Subject\",\"message\":\"Message\"}',1,NULL,NULL,1,NULL,1,'2019-09-14 13:14:22','2024-05-19 03:32:00'),(16,'KYC_APPROVE','KYC Approved','KYC has been approved',NULL,'<div><br></div><div><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">We are pleased to inform you that your Know Your Customer (KYC) verification has been approved! Thank you for providing all the necessary documents and information for the verification process.</span><br></div><div><br></div><div>This means that you are now fully verified to use our platform and take advantage of all its features. You can now start trading with confidence, knowing that your account is fully compliant with our regulatory requirements.</div><div><br></div><div>If you have any questions or concerns, please don\'t hesitate to contact our customer support team. We are always here to help you.</div><div><br></div><div>Thank you for choosing our platform for your trading needs. We look forward to serving you.</div><div><br></div>','We are pleased to inform you that your Know Your Customer (KYC) verification has been approved! Thank you for providing all the necessary documents and information for the verification process.',NULL,'[]',1,NULL,NULL,1,NULL,0,NULL,NULL),(17,'KYC_REJECT','KYC Rejected','KYC has been rejected',NULL,'<div>We regret to inform you that your Know Your Customer (KYC) verification has been rejected. We appreciate your effort to provide us with the necessary documents and information for the verification process, but unfortunately, we were unable to approve your application.</div><div><br></div><div>We understand that this may be disappointing news, but we encourage you to reapply for KYC verification by submitting all the required documents and information accurately and completely. Our team will review your application again as soon as possible.</div><div><br></div><div>If you have any questions or need further assistance, please don\'t hesitate to contact our customer support team. We are always ready to help you.</div><div><br></div><div>Thank you for your understanding and cooperation.</div><div><br></div>','We regret to inform you that your Know Your Customer (KYC) verification has been rejected. We appreciate your effort to provide us with the necessary documents and information for the verification process, but unfortunately, we were unable to approve your application.',NULL,'{\"reason\":\"Rejection Reason\"}',1,NULL,NULL,1,NULL,0,NULL,NULL),(18,'BAL_SEND','Balance Send','Balance Transfer Successfully',NULL,'<div>Balance transferred successfully complete. You send  {{amount}} {{currency}}  to  {{username}}  And charge to transfer  {{charge}}  {{currency}} .</div><div><br></div><div>Transaction number {{trx}} .<br></div><div><br></div><div> Your Current Balance is {{balance_now}}  {{currency}}.</div>','Balance transferred successfully complete. You send {{amount}} {{currency}} to {{username}} And charge to transfer {{charge}} {{currency}} .\r\n\r\nTransaction number {{trx}} .\r\n\r\nYour Current Balance is {{balance_now}} {{currency}}.',NULL,'{\"amount\":\"Send Amount\", \"username\":\"Receiver Username\",\"charge\":\"Transfer charge\" ,\"balance_now\":\" After Balance\", \"currency\":\"currency\",\"trx\":\"Transaction number\"}',1,NULL,NULL,1,NULL,0,NULL,NULL),(19,'BAL_RECEIVE',' Balance Received','Balance Received Successfully',NULL,'Balance received successfully. You got {{amount}} \r\n{{currency}} from&nbsp; {{username}}  And charge to transfer  {{charge}}  \r\n{{currency}} .<div><div><br></div><div>Transaction number {{trx}} .<br></div><div><br></div><div> Your Current Balance is {{balance_now}}  {{currency}}.</div></div>','Balance received successfully. You got {{amount}} {{currency}} from  {{username}} And charge to transfer {{charge}} {{currency}} .\r\n\r\nTransaction number {{trx}} .\r\n\r\nYour Current Balance is {{balance_now}} {{currency}}.',NULL,'{\"amount\":\"Received Amount\", \"username\":\"Sender Username\",\"charge\":\"Transfer charge\" ,\"balance_now\":\" After Balance\", \"currency\":\"currency\",\"trx\":\"Transaction number\"}',1,NULL,NULL,1,NULL,0,NULL,NULL),(20,'PLAN_PURCHASED','Plan Purchased','Plan Purchased successfully',NULL,'Congratulation, you successfully&nbsp;Purchased {{plan}},&nbsp; {{amount}} {{currency}}&nbsp; And your current balance is {{post_balance}}&nbsp;<span style=\"color: rgb(33, 37, 41);\">&nbsp;{{site_currency}}</span>. Transaction number {{trx}}','Congratulation, you successfully Purchased {{plan}},  {{amount}} {{currency}}  And your current balance is {{post_balance}}  {{site_currency}}. Transaction number {{trx}}',NULL,' {\r\n                    \"plan\":\"Plan name\",\r\n                    \"amount\":\"Plan price\",\r\n                \"post_balance\":\" After Balance\",\r\n\"trx\":\"Transaction number\"\r\n            \r\n}',1,NULL,NULL,1,NULL,0,NULL,NULL),(21,'MATCHING_BONUS','Balance Send','Balance Transfer Successfully',NULL,'Your balance transfer information is Username:&nbsp;{{username}}, Amount:&nbsp;{{amount}}&nbsp;{{site_currency}}, Charge:&nbsp;{{charge}}&nbsp;{{site_currency}}, Current Balance:&nbsp;{{post_balance}}&nbsp;{{site_currency}}','Your balance transfer information is Username: {{username}}, Amount: {{amount}} {{site_currency}}, Charge: {{charge}} {{site_currency}}, Current Balance: {{post_balance}} {{site_currency}}',NULL,'{\r\n\"username\":\"Target username\",\r\n\"amount\":\"Total amount\",\r\n\"charge\":\"Transfer charge\",\r\n\"post_balance\":\"After balance\"\r\n} ',1,NULL,NULL,1,NULL,0,NULL,NULL),(22,'BALANCE_SEND','Balance Send','Balance Transfer Successfully',NULL,'Your balance transfer information is Username:&nbsp;{{username}}, Amount:&nbsp;{{amount}}&nbsp;{{site_currency}}, Charge:&nbsp;{{charge}}&nbsp;{{site_currency}}, Current Balance:&nbsp;{{post_balance}}&nbsp;{{site_currency}}','Your balance transfer information is Username: {{username}}, Amount: {{amount}} {{site_currency}}, Charge: {{charge}} {{site_currency}}, Current Balance: {{post_balance}} {{site_currency}}',NULL,'{\r\n\"username\":\"Target username\",\r\n\"amount\":\"Total amount\",\r\n\"charge\":\"Transfer charge\",\r\n\"post_balance\":\"After balance\"\r\n} ',1,NULL,NULL,1,NULL,0,NULL,NULL),(23,'BALANCE_RECEIVE','Balance Receive','You Receive New Balance',NULL,'<span style=\"color: rgb(33, 37, 41);\">Your balance receive information is Username:&nbsp;{{username}}, Amount:&nbsp;{{amount}}&nbsp;{{site_currency}}, Current Balance:&nbsp;{{post_balance}}&nbsp;{{site_currency}}</span><br>','Your balance receive information is Username: {{username}}, Amount: {{amount}} {{site_currency}}, Current Balance: {{post_balance}} {{site_currency}}',NULL,'{\r\n\"username\":\"Sender username\",\r\n\"amount\":\"Total amount\",\r\n\"post_balance\":\"After balance\"\r\n} ',1,NULL,NULL,1,NULL,0,NULL,NULL),(24,'TREE_COMMISSION','Tree Commission','You got tree commission',NULL,'Congratulations! You got tree commission. Amount:&nbsp;{{amount}}&nbsp;{{site_currency}}, Current Balance:&nbsp;{{post_balance}}&nbsp;{{site_currency}}','Congratulations! You got tree commission. Amount: {{amount}} {{site_currency}}, Current Balance: {{post_balance}} {{site_currency}}',NULL,'{\r\n\"amount\":\"Commission amount\",\r\n\"post_balance\":\"After balance\"\r\n}',1,NULL,NULL,1,NULL,0,NULL,NULL),(25,'REFERRAL_COMMISSION','Referral Commission','You got referral commission',NULL,'Congratulations! You got referral commission. Amount:&nbsp;{{amount}}&nbsp;{{site_currency}}, Current Balance:&nbsp;{{post_balance}}&nbsp;{{site_currency}} from {{username}}. ','Congratulations! You got referral commission. Amount:&nbsp;{{amount}}&nbsp;{{site_currency}}, Current Balance:&nbsp;{{post_balance}}&nbsp;{{site_currency}} from {{username}}. ',NULL,'{\r\n\"amount\":\"Commission amount\",\r\n\"post_balance\":\"After balance\",\r\n\"username\":\"Username\"\r\n}',1,NULL,NULL,1,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'HOME','/','templates.basic.','[\"about\",\"service\",\"how_work\",\"plan\",\"team\",\"testimonial\",\"counter\",\"blog\",\"transaction\",\"subscribe\",\"payment\"]',NULL,1,'2020-07-11 06:23:58','2023-02-15 07:03:08'),(4,'Blog','blog','templates.basic.','[\"faq\"]',NULL,1,'2020-10-22 01:14:43','2022-11-22 03:29:01'),(5,'Contact','contact','templates.basic.',NULL,NULL,1,'2020-10-22 01:14:53','2020-10-22 01:14:53'),(20,'About','about','templates.basic.','[\"about\",\"counter\",\"testimonial\",\"team\"]',NULL,0,'2022-11-26 09:33:29','2022-12-19 07:14:00'),(21,'FAQ','faq','templates.basic.','[\"faq\",\"counter\",\"team\"]',NULL,0,'2022-12-19 07:14:41','2022-12-19 07:16:28'),(23,'Plan','plan/index','templates.basic.','',NULL,1,'2022-12-19 07:14:41','2022-12-19 07:16:28');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `bv` int DEFAULT '0',
  `ref_com` decimal(28,8) DEFAULT '0.00000000',
  `tree_com` decimal(28,8) DEFAULT '0.00000000',
  `daily_ad_limit` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:disable 1:enable',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ptc_views`
--

DROP TABLE IF EXISTS `ptc_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ptc_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptc_id` int unsigned DEFAULT '0',
  `user_id` int unsigned DEFAULT '0',
  `vdt` date DEFAULT NULL,
  `amount` decimal(28,8) DEFAULT '0.00000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ptc_views`
--

LOCK TABLES `ptc_views` WRITE;
/*!40000 ALTER TABLE `ptc_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `ptc_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ptcs`
--

DROP TABLE IF EXISTS `ptcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ptcs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ads_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = link | 2 = image | 3 = script',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `duration` int NOT NULL DEFAULT '0',
  `max_show` int NOT NULL DEFAULT '0',
  `showed` int NOT NULL DEFAULT '0',
  `remain` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Status 0 = ptc inactive, 1 = ptc active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ptcs`
--

LOCK TABLES `ptcs` WRITE;
/*!40000 ALTER TABLE `ptcs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ptcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_attachments`
--

DROP TABLE IF EXISTS `support_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_message_id` int unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_attachments`
--

LOCK TABLES `support_attachments` WRITE;
/*!40000 ALTER TABLE `support_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_messages`
--

DROP TABLE IF EXISTS `support_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_ticket_id` int unsigned NOT NULL DEFAULT '0',
  `admin_id` int unsigned NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_messages`
--

LOCK TABLES `support_messages` WRITE;
/*!40000 ALTER TABLE `support_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_logs`
--

DROP TABLE IF EXISTS `update_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `update_logs` (
  `id` bigint unsigned NOT NULL,
  `version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_logs`
--

LOCK TABLES `update_logs` WRITE;
/*!40000 ALTER TABLE `update_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_extras`
--

DROP TABLE IF EXISTS `user_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_extras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `paid_left` int NOT NULL DEFAULT '0',
  `paid_right` int NOT NULL DEFAULT '0',
  `free_left` int NOT NULL DEFAULT '0',
  `free_right` int NOT NULL DEFAULT '0',
  `bv_left` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `bv_right` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_extras`
--

LOCK TABLES `user_extras` WRITE;
/*!40000 ALTER TABLE `user_extras` DISABLE KEYS */;
INSERT INTO `user_extras` VALUES (1,1,6,1,6,1,0.00000000,0.00000000,'2022-12-19 02:38:48','2023-02-25 02:40:32');
/*!40000 ALTER TABLE `user_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logins`
--

DROP TABLE IF EXISTS `user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logins`
--

LOCK TABLES `user_logins` WRITE;
/*!40000 ALTER TABLE `user_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pos_id` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `plan_id` int unsigned NOT NULL DEFAULT '0',
  `total_invest` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `total_binary_com` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `total_ref_com` decimal(28,8) NOT NULL,
  `daily_ad_limit` int NOT NULL DEFAULT '0',
  `firstname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dial_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int unsigned NOT NULL DEFAULT '0',
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kyc_rejection_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,1,2,0.00000000,0.00000000,0.00000000,0,'test','test','revptc','user@site.com','880','BD','8809024357399',0,0.00000000,'$2y$10$zejl7Rw34tC35w.WAWR7IemUZXceYLX8YRDyKTXBaNUynXPJDTdXm','Bangladesh','test','test','123',NULL,'63f9b184e9ae41677308292.jpg',1,NULL,NULL,1,1,1,1,'556149','2024-05-28 10:30:21',0,1,NULL,NULL,NULL,NULL,NULL,'2022-12-19 02:38:48','2024-05-28 04:30:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_methods`
--

DROP TABLE IF EXISTS `withdraw_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT '0.00000000',
  `max_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge` decimal(28,8) DEFAULT '0.00000000',
  `rate` decimal(28,8) DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_methods`
--

LOCK TABLES `withdraw_methods` WRITE;
/*!40000 ALTER TABLE `withdraw_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method_id` int unsigned NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `after_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawals`
--

LOCK TABLES `withdrawals` WRITE;
/*!40000 ALTER TABLE `withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'revptc_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-11  1:53:44
