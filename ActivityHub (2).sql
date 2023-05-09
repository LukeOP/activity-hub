-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 01, 2023 at 02:30 AM
-- Server version: 5.7.32
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ActivityHub`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `allDay` tinyint(1) DEFAULT NULL,
  `className` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calendar_events`
--

INSERT INTO `calendar_events` (`id`, `school_id`, `user_id`, `title`, `start`, `end`, `allDay`, `className`, `reference_type`, `reference_type_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'An Event', '2023-03-22 06:09:03', '2023-03-22 07:09:03', NULL, NULL, 'lesson', 1, '2023-03-15 11:00:00', NULL),
(2, 1, 2, 'Second Event', '2023-03-21 19:53:26', '2023-03-21 21:53:26', NULL, NULL, 'lesson', 2, NULL, NULL),
(3, 1, 2, 'Lesson', '2023-03-20 07:56:35', NULL, NULL, NULL, 'lesson', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `instrument` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `funding_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` double(8,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `user_id`, `student_id`, `school_id`, `instrument`, `start`, `end`, `day`, `start_date`, `end_date`, `funding_type`, `fee`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 'Piano', '15:40:00', '16:40:00', 'Monday', '2023-03-20', '2023-04-30', 'Private', NULL, 'Pending', NULL, NULL),
(2, 2, 2, 1, 'Guitar', '17:40:00', '18:40:00', 'Monday', '2023-03-27', NULL, 'Funded', NULL, 'Pending', NULL, NULL),
(3, 2, 1, 1, 'Flute', '10:50:00', '11:20:00', 'Monday', '2023-03-20', NULL, 'Funded', NULL, 'Pending', NULL, NULL),
(4, 2, 1, 1, 'Piano', '15:40:00', '16:40:00', 'Monday', '2023-03-20', '2023-04-30', 'Private', NULL, 'Pending', NULL, NULL),
(5, 2, 2, 1, 'Guitar', '17:40:00', '18:40:00', 'Monday', '2023-03-27', NULL, 'Funded', NULL, 'Pending', NULL, NULL),
(6, 2, 1, 1, 'Flute', '10:50:00', '11:20:00', 'Monday', '2023-03-20', NULL, 'Funded', NULL, 'Pending', NULL, NULL),
(7, 2, 1, 1, 'Piano', '15:40:00', '16:40:00', 'Monday', '2023-03-20', '2023-04-30', 'Private', NULL, 'Pending', NULL, NULL),
(8, 2, 2, 1, 'Guitar', '17:40:00', '18:40:00', 'Monday', '2023-03-27', NULL, 'Funded', NULL, 'Pending', NULL, NULL),
(9, 2, 1, 1, 'Flute', '10:50:00', '11:20:00', 'Monday', '2023-03-20', NULL, 'Funded', NULL, 'Pending', NULL, NULL),
(10, 2, 1, 1, 'Piano', '15:40:00', '16:40:00', 'Monday', '2023-03-20', '2023-04-30', 'Private', NULL, 'Pending', NULL, NULL),
(11, 2, 2, 1, 'Guitar', '17:40:00', '18:40:00', 'Monday', '2023-03-27', NULL, 'Funded', NULL, 'Pending', NULL, NULL),
(12, 2, 1, 1, 'Flute', '10:50:00', '11:20:00', 'Monday', '2023-03-20', NULL, 'Funded', NULL, 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_notes`
--

CREATE TABLE `lesson_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_notes`
--

INSERT INTO `lesson_notes` (`id`, `lesson_id`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Delete Me!', '2023-03-25 03:24:11', '2023-03-30 12:10:13', '2023-03-30 12:10:13'),
(2, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:08:20', '2023-03-30 12:08:20'),
(3, 1, 'Went through some fundamentals, practising scales.', '2023-03-25 03:24:11', '2023-03-30 12:14:22', '2023-03-30 12:14:22'),
(4, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:12:25', '2023-03-30 12:12:25'),
(5, 1, 'Went through some fundamentals, practising scales.', '2023-03-25 03:24:11', '2023-03-30 12:13:20', '2023-03-30 12:13:20'),
(6, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:12:19', '2023-03-30 12:12:19'),
(7, 1, 'Went through some fundamentals, practising scales.', '2023-03-25 03:24:11', '2023-03-30 12:14:16', '2023-03-30 12:14:16'),
(8, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:12:11', '2023-03-30 12:12:11'),
(9, 1, 'Went through some fundamentals, practising scales.', '2023-03-25 03:24:11', '2023-03-30 12:14:18', '2023-03-30 12:14:18'),
(10, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:12:05', '2023-03-30 12:12:05'),
(11, 1, 'Went through some fundamentals, practising scales.', '2023-03-25 03:24:11', '2023-03-30 12:14:14', '2023-03-30 12:14:14'),
(12, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:11:35', '2023-03-30 12:11:35'),
(13, 1, 'Went through some fundamentals, practising scales.', '2023-03-25 03:24:11', '2023-03-30 12:13:09', '2023-03-30 12:13:09'),
(14, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:11:31', '2023-03-30 12:11:31'),
(15, 1, 'Went through some fundamentals, practising scales.', '2023-03-25 03:24:11', '2023-03-30 12:13:06', '2023-03-30 12:13:06'),
(16, 1, 'Went through basics again as they hadn\'t done any practice at home...', '2023-03-25 03:29:23', '2023-03-30 12:09:29', '2023-03-30 12:09:29'),
(17, 12, 'This is a postman note', '2023-03-30 09:46:34', '2023-03-30 12:31:44', '2023-03-30 12:31:44'),
(18, 12, 'The first note from the web application.', '2023-03-30 09:50:39', '2023-03-30 12:15:48', '2023-03-30 12:15:48'),
(19, 12, 'A Fresh Note', '2023-03-30 09:52:19', '2023-03-30 12:15:58', '2023-03-30 12:15:58'),
(20, 12, 'Here is a note', '2023-03-30 12:26:15', '2023-03-30 12:26:19', '2023-03-30 12:26:19'),
(21, 12, 'A new note', '2023-03-30 12:29:04', '2023-03-30 12:29:13', '2023-03-30 12:29:13'),
(22, 1, 'Here is a note', '2023-03-30 12:32:27', '2023-03-30 12:33:48', '2023-03-30 12:33:48'),
(23, 1, 'Here is a note', '2023-03-30 12:32:56', '2023-03-30 12:33:25', '2023-03-30 12:33:25'),
(24, 1, 'A first note', '2023-03-30 12:35:31', '2023-03-30 12:38:14', '2023-03-30 12:38:14'),
(25, 1, 'A second Note', '2023-03-30 12:35:39', '2023-03-30 12:35:42', '2023-03-30 12:35:42'),
(26, 1, 'Here is a note', '2023-03-30 12:38:57', '2023-03-30 12:38:57', NULL),
(27, 1, 'and another note', '2023-03-30 12:39:05', '2023-03-30 12:39:08', '2023-03-30 12:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(9, '2016_06_01_000004_create_oauth_clients_table', 2),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(11, '2023_03_11_033721_create_tasks_table', 3),
(12, '2023_03_11_231308_create_schools_table', 3),
(13, '2023_03_12_023108_add_new_column_to_table', 4),
(14, '2023_03_16_054338_create_calendar_events_table', 5),
(15, '2023_03_16_063013_add_reference_to__event_calendar', 6),
(16, '2023_03_19_022737_create_students_table', 7),
(17, '2023_03_19_021754_create_lessons_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'main', 'a3bdac589a2c63d586530743610f01f4369a805c9ada49745d69944d38fbd50f', '[\"*\"]', NULL, NULL, '2023-03-08 11:55:04', '2023-03-08 11:55:04'),
(2, 'App\\Models\\User', 1, 'main', 'b749a78762b460d2e67a595cbae12201816d6d55c819349a4b1e0ba193ba7c6a', '[\"*\"]', NULL, NULL, '2023-03-08 11:55:41', '2023-03-08 11:55:41'),
(3, 'App\\Models\\User', 1, 'main', '5391a8255d861776838977138e9d9967666900b9113a9b83817f6cd2095233bd', '[\"*\"]', NULL, NULL, '2023-03-08 11:56:47', '2023-03-08 11:56:47'),
(4, 'App\\Models\\User', 1, 'main', 'bb4a3e9decbd69ecace8730e51e6482a9b1256c18e7780549799d3399d57705f', '[\"*\"]', NULL, NULL, '2023-03-08 11:57:40', '2023-03-08 11:57:40'),
(5, 'App\\Models\\User', 1, 'main', 'b1401c9d923987450b878473397893fb56ff47a91f0748fe49e8d20a76458e8d', '[\"*\"]', NULL, NULL, '2023-03-08 11:58:18', '2023-03-08 11:58:18'),
(6, 'App\\Models\\User', 1, 'main', '10759f35cf7190087ff99e67370bd950ff31df323cb5d5eabb77bb9baed917f1', '[\"*\"]', NULL, NULL, '2023-03-08 12:00:20', '2023-03-08 12:00:20'),
(7, 'App\\Models\\User', 1, 'main', 'f62b4fa481a12c9b5c308b39abdf89ca5667d7998856a47db553cb30a81fc7fb', '[\"*\"]', NULL, NULL, '2023-03-08 12:02:04', '2023-03-08 12:02:04'),
(8, 'App\\Models\\User', 1, 'main', '97d2c53dddc56c93581fc97bee661dd5a6f856905aa0744abf06fd1f36546b23', '[\"*\"]', NULL, NULL, '2023-03-08 12:05:17', '2023-03-08 12:05:17'),
(9, 'App\\Models\\User', 1, 'main', 'dd73c16cadf78b1223339c7b2ab0a4f1755b750b3ffcdd5e66b404b3d06176f9', '[\"*\"]', NULL, NULL, '2023-03-08 12:10:46', '2023-03-08 12:10:46'),
(10, 'App\\Models\\User', 1, 'main', '84b02aa99672fd2fc847a027a69f329aef941b676e983dde0325f1264b2ea4ed', '[\"*\"]', NULL, NULL, '2023-03-08 12:11:02', '2023-03-08 12:11:02'),
(11, 'App\\Models\\User', 1, 'main', 'e41b1a86b4104909b767895cf4728fbd1d9fc0a1d589bcdb3174173a2f8ad9d1', '[\"*\"]', NULL, NULL, '2023-03-08 12:11:25', '2023-03-08 12:11:25'),
(12, 'App\\Models\\User', 1, 'main', '7ecdf15a846c9307103953c88875af727fab40706a05f05141cae2eee464ee58', '[\"*\"]', NULL, NULL, '2023-03-08 12:29:10', '2023-03-08 12:29:10'),
(13, 'App\\Models\\User', 1, 'main', '534160edf28b3557f3cbe20149afc2dce335f4c5cce2af0d2a34d9f6a4c58267', '[\"*\"]', NULL, NULL, '2023-03-08 12:29:18', '2023-03-08 12:29:18'),
(14, 'App\\Models\\User', 1, 'main', 'e136caabda67c90bb8b1952308298273f5524743886f41f19564b7e8142bc352', '[\"*\"]', NULL, NULL, '2023-03-08 12:48:13', '2023-03-08 12:48:13'),
(15, 'App\\Models\\User', 2, 'API Token of John Smith', 'a3ec64acef4da2f9f6dce277bc534d89d9efb8b939449d523f427a8a58a48230', '[\"*\"]', NULL, NULL, '2023-03-11 16:10:56', '2023-03-11 16:10:56'),
(16, 'App\\Models\\User', 2, 'API Token of John Smith', '0d4f5861db01a82754044df480f340f7aeacda2c364dfa2815adc3d817e0b5bf', '[\"*\"]', NULL, NULL, '2023-03-11 16:13:37', '2023-03-11 16:13:37'),
(18, 'App\\Models\\User', 2, 'API Token of John Smith', '9a0c77720366d788daa2bd7cc03eb536f4d65d00b603499720ddcd90f1b13fcd', '[\"*\"]', NULL, NULL, '2023-03-11 16:14:51', '2023-03-11 16:14:51'),
(19, 'App\\Models\\User', 2, 'API Token of John Smith', '2af0c4b1919472fb1a47a60c90c9c1f443f97ebd746028387fe2fc54c5cfbe92', '[\"*\"]', NULL, NULL, '2023-03-11 16:14:51', '2023-03-11 16:14:51'),
(20, 'App\\Models\\User', 2, 'API Token of John Smith', 'acc58d556da6541cfa579eaac32c15b097a7930161812432f5e784e2cd3410d6', '[\"*\"]', NULL, NULL, '2023-03-11 17:21:56', '2023-03-11 17:21:56'),
(21, 'App\\Models\\User', 2, 'API Token of John Smith', 'c436b64b72028f60f5fea076c8be94f92b60c2cd52eee115d3a32c0e41677bd6', '[\"*\"]', NULL, NULL, '2023-03-11 17:21:56', '2023-03-11 17:21:56'),
(22, 'App\\Models\\User', 2, 'API Token of John Smith', '454a79ee12a0f25aa8cf35085fc0f7a1a8759a1babd4d8f31bdc21ec30ea2b19', '[\"*\"]', NULL, NULL, '2023-03-11 17:57:36', '2023-03-11 17:57:36'),
(23, 'App\\Models\\User', 2, 'API Token of John Smith', '120c27ba345b0f41320bf676b9927b93b5e7407ae5a83bf7d7ef430ee280e5d4', '[\"*\"]', NULL, NULL, '2023-03-11 17:57:36', '2023-03-11 17:57:36'),
(24, 'App\\Models\\User', 2, 'API Token of John Smith', 'f202a8a8ab37cf62ee355d4a2b0b53bf66b746f6c2bdc8a391478a72e7c36f6f', '[\"*\"]', NULL, NULL, '2023-03-11 18:03:26', '2023-03-11 18:03:26'),
(26, 'App\\Models\\User', 2, 'API Token of John Smith', 'cac7c98f7842df67deaf35ac815fbc62a084e162c68aa141172756f201d5147e', '[\"*\"]', NULL, NULL, '2023-03-11 18:05:33', '2023-03-11 18:05:33'),
(27, 'App\\Models\\User', 2, 'API Token of John Smith', '1c917f0b1cb1a0bad42f2869a453cf4b1e2609183ba456c15f12c35cacae5e79', '[\"*\"]', NULL, NULL, '2023-03-11 18:05:33', '2023-03-11 18:05:33'),
(28, 'App\\Models\\User', 2, 'API Token of John Smith', '3fc80384689e79cca64cddedc3c4cad8d067a5eb6dfe4f0ba8ea14788f8dceee', '[\"*\"]', NULL, NULL, '2023-03-11 18:19:52', '2023-03-11 18:19:52'),
(29, 'App\\Models\\User', 2, 'API Token of John Smith', '148c5a16aed54bc353ad83c4798468bf09c0a5dea6ab020896b99ec48dd3b3ed', '[\"*\"]', NULL, NULL, '2023-03-11 18:19:52', '2023-03-11 18:19:52'),
(30, 'App\\Models\\User', 2, 'API Token of John Smith', '903075b9430d7760d01397e09ca33a940c65eb665cc0483453d38e58c3c317e0', '[\"*\"]', NULL, NULL, '2023-03-12 10:55:00', '2023-03-12 10:55:00'),
(31, 'App\\Models\\User', 2, 'API Token of John Smith', 'e010305bbebaabce78fee9b6ff9144d1428ba7e36d54c0f5fe3d70939273019f', '[\"*\"]', NULL, NULL, '2023-03-12 10:55:00', '2023-03-12 10:55:00'),
(32, 'App\\Models\\User', 2, 'API Token of John Smith', 'f1a53afa01e0345be14bac653e2f96f7d77bb4b6e534cab3460524f3146a94d2', '[\"*\"]', NULL, NULL, '2023-03-12 11:17:03', '2023-03-12 11:17:03'),
(33, 'App\\Models\\User', 2, 'API Token of John Smith', '9692ff9474e5dddfaaf266fe9d2bf51bcd8a8d678c8ee5b296514cd85892f682', '[\"*\"]', NULL, NULL, '2023-03-12 11:17:03', '2023-03-12 11:17:03'),
(34, 'App\\Models\\User', 2, 'API Token of John Smith', '5a2be116635d24c5e39aca5191a5577453c1dad4b7fa7eea6cea65e87e32505e', '[\"*\"]', NULL, NULL, '2023-03-13 05:37:34', '2023-03-13 05:37:34'),
(35, 'App\\Models\\User', 2, 'API Token of John Smith', 'ae6df15b3a3430a5d36c20df889cbbde1c4ae991e4ddd19ce6b4d6c83776a7eb', '[\"*\"]', NULL, NULL, '2023-03-13 05:37:35', '2023-03-13 05:37:35'),
(36, 'App\\Models\\User', 2, 'API Token of John Smith', '900e2ba86fe94fa0126bf3bd4e8f86676156facb409805e48325c732300d4996', '[\"*\"]', NULL, NULL, '2023-03-13 16:16:31', '2023-03-13 16:16:31'),
(38, 'App\\Models\\User', 2, 'API Token of John Smith', 'a03f2c0be64f05b2ccf2b66f5666b465c216c378270d44ae2733d8df7d042d79', '[\"*\"]', '2023-03-30 12:45:51', NULL, '2023-03-15 18:23:59', '2023-03-30 12:45:51'),
(39, 'App\\Models\\User', 2, 'API Token of John Smith', '9fda5316c5b9601e1af965cb75bd2e2e6955537c3a84f37c03fddfbd05101d4c', '[\"*\"]', '2023-03-16 11:07:13', NULL, '2023-03-16 11:07:13', '2023-03-16 11:07:13'),
(40, 'App\\Models\\User', 2, 'API Token of John Smith', '9ef4438eebd5debd6c98dbd300f7905a0a2e14115c9826761dc4e3bcaab245ef', '[\"*\"]', NULL, NULL, '2023-03-16 11:07:13', '2023-03-16 11:07:13'),
(41, 'App\\Models\\User', 2, 'API Token of John Smith', 'e2bcce5ae1a83ccaa77784e0c8a338d2f9a1082d607f7c15890c1fa6a7a19840', '[\"*\"]', '2023-03-16 11:08:13', NULL, '2023-03-16 11:08:13', '2023-03-16 11:08:13'),
(42, 'App\\Models\\User', 2, 'API Token of John Smith', '6a279dbee51787bd5e429c19f048715f18c11e12b1b05627df165d737d6cdc3d', '[\"*\"]', NULL, NULL, '2023-03-16 11:08:13', '2023-03-16 11:08:13'),
(43, 'App\\Models\\User', 2, 'API Token of John Smith', '2fdde8ec1023b0b3836c69577b22dca47dab0406b879531e66d1644cb3ab80ab', '[\"*\"]', '2023-03-16 11:09:11', NULL, '2023-03-16 11:09:11', '2023-03-16 11:09:11'),
(44, 'App\\Models\\User', 2, 'API Token of John Smith', 'ac35d9abd5b6bd17555954c02b8851e0c670e5221f484e155db8fb935512aca2', '[\"*\"]', NULL, NULL, '2023-03-16 11:09:11', '2023-03-16 11:09:11'),
(45, 'App\\Models\\User', 2, 'API Token of John Smith', '17e5a2cd4fda67aecccf532c9aed790efcd314d84b2594f72889af54a5920452', '[\"*\"]', '2023-03-16 11:09:58', NULL, '2023-03-16 11:09:58', '2023-03-16 11:09:58'),
(46, 'App\\Models\\User', 2, 'API Token of John Smith', '12fe576011e962324da5d0e2fdc2e53ed9e0f6bb90898a49cb1d6bb168402096', '[\"*\"]', '2023-03-16 11:10:16', NULL, '2023-03-16 11:09:58', '2023-03-16 11:10:16'),
(47, 'App\\Models\\User', 2, 'API Token of John Smith', 'a9f6cd1aac897bfbc970f4a7f8cf6fad1ee8bcc19549774d7a4dda44575fcb8f', '[\"*\"]', '2023-03-17 08:29:56', NULL, '2023-03-17 08:29:56', '2023-03-17 08:29:56'),
(49, 'App\\Models\\User', 2, 'API Token of John Smith', '5766f2f48ebe44ca2376b37ba7af4fc08b1c854038fe9433726c189bcc9a533b', '[\"*\"]', NULL, NULL, '2023-03-17 09:49:08', '2023-03-17 09:49:08'),
(50, 'App\\Models\\User', 2, 'API Token of John Smith', 'f7194e2d22fe8d06d38fcb4259b7791dd563cdd770eaaafb387c14c9fb0493d5', '[\"*\"]', NULL, NULL, '2023-03-17 09:49:08', '2023-03-17 09:49:08'),
(51, 'App\\Models\\User', 2, 'API Token of John Smith', 'e786b758003da29e2cf98f5b8a1f6b3e7e8cacc700c2f79eb262ab633886e8ae', '[\"*\"]', NULL, NULL, '2023-03-17 15:44:54', '2023-03-17 15:44:54'),
(52, 'App\\Models\\User', 2, 'API Token of John Smith', 'b9bd65f493e3b574bc2f28877d87ff59ee5a8bc79e7872f4d427d92d77df1249', '[\"*\"]', NULL, NULL, '2023-03-17 15:44:55', '2023-03-17 15:44:55'),
(53, 'App\\Models\\User', 2, 'API Token of John Smith', '7527a764fbf8db03a5d60986a01bc800e2161c9965bd9bdecc1870cbc27338ea', '[\"*\"]', NULL, NULL, '2023-03-17 16:05:04', '2023-03-17 16:05:04'),
(55, 'App\\Models\\User', 2, 'API Token of John Smith', '83039a14dce9f364621ab543d6609f24a97d4ae5dc0f922a2c1140f092e5d0ee', '[\"*\"]', NULL, NULL, '2023-03-17 16:05:50', '2023-03-17 16:05:50'),
(57, 'App\\Models\\User', 2, 'API Token of John Smith', '54e008716f164f8e48654b7b702e876c6f727a02fbb7c3eeda463444c0d80bdb', '[\"*\"]', NULL, NULL, '2023-03-17 16:07:01', '2023-03-17 16:07:01'),
(58, 'App\\Models\\User', 2, 'API Token of John Smith', '2a699604ff03da82e4dfd20ec3d4d323186163d2786d461e400ba4a1cd2861ed', '[\"*\"]', NULL, NULL, '2023-03-17 16:07:01', '2023-03-17 16:07:01'),
(59, 'App\\Models\\User', 2, 'API Token of John Smith', 'bfc79adadbd63a2f7c3d605a28d641117aca8308181e5eb3e9dd9bb261657f7d', '[\"*\"]', NULL, NULL, '2023-03-17 16:07:36', '2023-03-17 16:07:36'),
(61, 'App\\Models\\User', 2, 'API Token of John Smith', '05f6f0570c4211310d445f6efba7e3f63c40f7af18a17e2a715fbbf916cc11e7', '[\"*\"]', NULL, NULL, '2023-03-17 16:08:28', '2023-03-17 16:08:28'),
(63, 'App\\Models\\User', 2, 'API Token of John Smith', '2bb40213ead3519124052f0f73d3b2a32bac2c590f80a347077cf3b03094188a', '[\"*\"]', NULL, NULL, '2023-03-17 16:10:24', '2023-03-17 16:10:24'),
(64, 'App\\Models\\User', 2, 'API Token of John Smith', 'aee1994b9d1532f3f15311be7c9db448654012cd94185b0e67c2701179c2e057', '[\"*\"]', NULL, NULL, '2023-03-17 16:10:24', '2023-03-17 16:10:24'),
(65, 'App\\Models\\User', 2, 'API Token of John Smith', '58f402dd2a336dbb57360dbf7e8939c0d4596e4bd86e5c93152f73af22746ca4', '[\"*\"]', NULL, NULL, '2023-03-17 16:11:27', '2023-03-17 16:11:27'),
(67, 'App\\Models\\User', 2, 'API Token of John Smith', 'fea5f9ce19227405932978d6aaeb6c04af23263d98a58d514a03cf4eef9dae2c', '[\"*\"]', NULL, NULL, '2023-03-17 16:12:44', '2023-03-17 16:12:44'),
(68, 'App\\Models\\User', 2, 'API Token of John Smith', '3de88737f193198f92838fcb59c7034690606b49fdfc22c362e9753093a98d03', '[\"*\"]', NULL, NULL, '2023-03-17 16:12:44', '2023-03-17 16:12:44'),
(69, 'App\\Models\\User', 2, 'API Token of John Smith', 'fd0db71b9e79b6b729762eed53dc7c7bc30fdda12f4541e6377fb8cd408baede', '[\"*\"]', NULL, NULL, '2023-03-17 16:13:30', '2023-03-17 16:13:30'),
(71, 'App\\Models\\User', 2, 'API Token of John Smith', '2ff280e88d83f42511af9566f6fe66cc100a1ebcd4558b299e4b564bd991a18f', '[\"*\"]', NULL, NULL, '2023-03-17 16:13:55', '2023-03-17 16:13:55'),
(73, 'App\\Models\\User', 2, 'API Token of John Smith', '8c109a99783973d632f0b1211e27d30c6138eb24605ab6b6231fcccfdeac793c', '[\"*\"]', NULL, NULL, '2023-03-17 16:14:21', '2023-03-17 16:14:21'),
(74, 'App\\Models\\User', 2, 'API Token of John Smith', '6d37ede0f387bdfdba5c208d5a6e1de55826f4fdaa38161c4ebe8f5f8df73acc', '[\"*\"]', NULL, NULL, '2023-03-17 16:14:21', '2023-03-17 16:14:21'),
(75, 'App\\Models\\User', 2, 'API Token of John Smith', '4d2ef00a7b516523849757734e93f3ae3fde40f62122ae697e45b230dcfb69e4', '[\"*\"]', NULL, NULL, '2023-03-17 16:25:12', '2023-03-17 16:25:12'),
(76, 'App\\Models\\User', 2, 'API Token of John Smith', 'acdd4d09d0a623600f37bc3dd43d1fa5458930e7aeef83663df819ddf6b8ff6e', '[\"*\"]', NULL, NULL, '2023-03-17 16:25:13', '2023-03-17 16:25:13'),
(77, 'App\\Models\\User', 2, 'API Token of John Smith', 'a2f5d2485434fbcc777cab7f503c24d26b2db2de4cf8c60bccb0bdc08e124f78', '[\"*\"]', NULL, NULL, '2023-03-17 16:25:45', '2023-03-17 16:25:45'),
(79, 'App\\Models\\User', 2, 'API Token of John Smith', '6c029c06f61c54a64fdf54bd154664ed946d835aa31123f8c4fde8b65e72386f', '[\"*\"]', NULL, NULL, '2023-03-17 17:17:00', '2023-03-17 17:17:00'),
(81, 'App\\Models\\User', 2, 'API Token of John Smith', 'ec0d6ea708b3e0ee9b4926379e1e07ccbde06d2c5b1c6cd9d43c5249adc56054', '[\"*\"]', NULL, NULL, '2023-03-18 10:51:13', '2023-03-18 10:51:13'),
(83, 'App\\Models\\User', 2, 'API Token of John Smith', '21f4ac5b1e1f8a9be68c0dddf3ca5b9f16ee55d4cc44dcf92008ecdc1db138ff', '[\"*\"]', NULL, NULL, '2023-03-18 12:43:31', '2023-03-18 12:43:31'),
(84, 'App\\Models\\User', 2, 'API Token of John Smith', 'a766ab9f904f025e19d9db83f4b75e83f634f3fe5afd7c0aac53ba29da4faaf0', '[\"*\"]', NULL, NULL, '2023-03-18 12:43:31', '2023-03-18 12:43:31'),
(85, 'App\\Models\\User', 2, 'API Token of John Smith', 'fa84a946c574babe8d0e4ea217eb7bd7c7281aeffbaa0575dcca79b0c8363e53', '[\"*\"]', NULL, NULL, '2023-03-18 12:55:43', '2023-03-18 12:55:43'),
(86, 'App\\Models\\User', 2, 'API Token of John Smith', '5cc01f9e357f318d626e6bb689bf1511a25ee86a1372eef68a0d83b2ae3769c6', '[\"*\"]', NULL, NULL, '2023-03-18 12:55:44', '2023-03-18 12:55:44'),
(87, 'App\\Models\\User', 2, 'API Token of John Smith', '566ec1c704d9a2ad27126bbcc4faa3fe8bfcf6a99398229d09444152a7aa616a', '[\"*\"]', NULL, NULL, '2023-03-18 12:56:28', '2023-03-18 12:56:28'),
(89, 'App\\Models\\User', 2, 'API Token of John Smith', 'bee9899c965af6c32532bd5842ed842f9c212b54387cb0ef809da587f6d23c93', '[\"*\"]', NULL, NULL, '2023-03-18 13:00:19', '2023-03-18 13:00:19'),
(90, 'App\\Models\\User', 2, 'API Token of John Smith', '102af07e1236a7e51bfcffacbf77f5ba31d20fe5462f4b3e04e252c47baf0c0f', '[\"*\"]', NULL, NULL, '2023-03-18 13:00:19', '2023-03-18 13:00:19'),
(91, 'App\\Models\\User', 2, 'API Token of John Smith', '93db26d6dafd5c7c9b336dfc40f93d8000ff756b5e15994f2564bacb7eb56379', '[\"*\"]', NULL, NULL, '2023-03-18 13:06:39', '2023-03-18 13:06:39'),
(92, 'App\\Models\\User', 2, 'API Token of John Smith', '8fd9133dbf5b8f04cb49b6e015657f271c01f55eed3a0de62b13a48886cf5e1f', '[\"*\"]', NULL, NULL, '2023-03-18 13:06:39', '2023-03-18 13:06:39'),
(93, 'App\\Models\\User', 2, 'API Token of John Smith', 'a56d25ff17b9564fac0e101faca0348e27f07e3b460eedf9a0f6a48eea690f06', '[\"*\"]', NULL, NULL, '2023-03-18 17:53:01', '2023-03-18 17:53:01'),
(94, 'App\\Models\\User', 2, 'API Token of John Smith', 'f7f258daf1cf17e68e5aceb875cdafaf4da5412c0844c8aa2ad2587db6eb8867', '[\"*\"]', '2023-03-19 07:43:16', NULL, '2023-03-19 07:43:15', '2023-03-19 07:43:16'),
(95, 'App\\Models\\User', 2, 'API Token of John Smith', 'fb8d6d3528b970b16c672631233d5a903726a13b644483dba6b333ae11a32c06', '[\"*\"]', '2023-03-19 08:07:26', NULL, '2023-03-19 07:44:12', '2023-03-19 08:07:26'),
(96, 'App\\Models\\User', 2, 'API Token of John Smith', '06756b9c239678506e7fb6cf02c127b3da77953b6e41b6c2bb288f578b0bebe5', '[\"*\"]', '2023-03-19 09:48:12', NULL, '2023-03-19 09:25:16', '2023-03-19 09:48:12'),
(97, 'App\\Models\\User', 2, 'API Token of John Smith', '912d7adbec47531891208ef9adbd99713b2d16fcf852ca01509e978975a8c7af', '[\"*\"]', '2023-03-19 11:01:39', NULL, '2023-03-19 10:56:08', '2023-03-19 11:01:39'),
(98, 'App\\Models\\User', 2, 'API Token of John Smith', '778fd7393f9133231bd6d67d6d70459b302b5585e73333cf87584a7502e09778', '[\"*\"]', '2023-03-19 11:02:38', NULL, '2023-03-19 11:02:26', '2023-03-19 11:02:38'),
(99, 'App\\Models\\User', 2, 'API Token of John Smith', '887f7dde404d75556f138c007168037dcea37d4ae2a8c3c0f5675849b9581943', '[\"*\"]', '2023-03-19 11:05:53', NULL, '2023-03-19 11:04:30', '2023-03-19 11:05:53'),
(101, 'App\\Models\\User', 2, 'API Token of John Smith', 'bbe4d765cbc5a8ddd3b0688538d55fff00d99f2d034fd146f5bcb2abab850a73', '[\"*\"]', '2023-03-19 14:49:53', NULL, '2023-03-19 14:49:10', '2023-03-19 14:49:53'),
(102, 'App\\Models\\User', 2, 'API Token of John Smith', '180f590727dd470e95bf0bc7fedab6d89ffb60a68e14d54f92f263ba2ffe936c', '[\"*\"]', '2023-03-19 15:15:47', NULL, '2023-03-19 15:07:40', '2023-03-19 15:15:47'),
(103, 'App\\Models\\User', 2, 'API Token of John Smith', '7aad900f7cd9f4aa99a602735a725ccf0256cb210b58847c83453359abf1ce2a', '[\"*\"]', '2023-03-19 15:17:43', NULL, '2023-03-19 15:17:43', '2023-03-19 15:17:43'),
(104, 'App\\Models\\User', 2, 'API Token of John Smith', '76fa4ff10511772e3d68f9bb4a06f2c87658ffc9ad54ded32710e36d57dd09e2', '[\"*\"]', '2023-03-19 15:18:52', NULL, '2023-03-19 15:18:52', '2023-03-19 15:18:52'),
(105, 'App\\Models\\User', 2, 'API Token of John Smith', 'c14241ea5a14d56f3218d1d5c62bb07a2b05501855dca1c936822d312e4e37e5', '[\"*\"]', '2023-03-19 15:22:24', NULL, '2023-03-19 15:19:21', '2023-03-19 15:22:24'),
(106, 'App\\Models\\User', 2, 'API Token of John Smith', '90b24658680dc3677dcfbb73a22861b4ccb26b1890df0df357a5ff483be7703c', '[\"*\"]', '2023-03-19 15:22:30', NULL, '2023-03-19 15:22:30', '2023-03-19 15:22:30'),
(107, 'App\\Models\\User', 2, 'API Token of John Smith', 'ffc12b652369aa12b8f2eb0842d0f6cc22d436ecf0c6ff25fdbd1949237e567b', '[\"*\"]', '2023-03-19 15:23:36', NULL, '2023-03-19 15:22:55', '2023-03-19 15:23:36'),
(108, 'App\\Models\\User', 2, 'API Token of John Smith', '4914482ee3f2ab6a1404900cf5b4cfa648b8b86d32334e14092b50ffa4d24440', '[\"*\"]', '2023-03-19 15:41:02', NULL, '2023-03-19 15:23:41', '2023-03-19 15:41:02'),
(109, 'App\\Models\\User', 2, 'API Token of John Smith', 'dab8a3ecbf62614ef79edf3df8f54987d285551c3dc2470b8caf2898546d3047', '[\"*\"]', '2023-03-19 15:45:09', NULL, '2023-03-19 15:41:08', '2023-03-19 15:45:09'),
(110, 'App\\Models\\User', 2, 'API Token of John Smith', 'f3e666365df6faf4ca68d9dafec5abffa374169111e3c65c366272728c6a7705', '[\"*\"]', '2023-03-19 15:45:41', NULL, '2023-03-19 15:45:16', '2023-03-19 15:45:41'),
(111, 'App\\Models\\User', 2, 'API Token of John Smith', 'f12b677e8f902e7b314e0b8f75717df19bd28c859ccd2fff30dfd7727dbee39c', '[\"*\"]', '2023-03-19 16:29:35', NULL, '2023-03-19 15:45:49', '2023-03-19 16:29:35'),
(112, 'App\\Models\\User', 2, 'API Token of John Smith', '74715d0169d6bdd9e90a1cf4e6108da47fbdbace194aaed03428bb413844f4b7', '[\"*\"]', '2023-03-19 17:32:40', NULL, '2023-03-19 16:29:45', '2023-03-19 17:32:40'),
(114, 'App\\Models\\User', 2, 'API Token of John Smith', '41fb7d023b5bc7268d85d85c2ae1eebe2ecb1d1c395f24cb00f3a0104b11ab15', '[\"*\"]', '2023-03-19 18:58:30', NULL, '2023-03-19 18:43:51', '2023-03-19 18:58:30'),
(115, 'App\\Models\\User', 2, 'API Token of John Smith', 'b88c96ec8da21c5dff9dda788d4c9b23ce268b9a5fd29953a9fe45eb9d3b3bda', '[\"*\"]', '2023-03-19 19:04:27', NULL, '2023-03-19 19:04:25', '2023-03-19 19:04:27'),
(116, 'App\\Models\\User', 2, 'API Token of John Smith', 'aa272da685c67d15476f81c28ede36f20c348a175c9e75b34a7b77f9cecfeb54', '[\"*\"]', '2023-03-19 19:11:32', NULL, '2023-03-19 19:04:35', '2023-03-19 19:11:32'),
(117, 'App\\Models\\User', 2, 'API Token of John Smith', 'fd5f7534160e34d4fb5270b31ced09a12c8b732a3643a21c3d5a4eba8ce787f3', '[\"*\"]', '2023-03-19 19:17:05', NULL, '2023-03-19 19:15:02', '2023-03-19 19:17:05'),
(118, 'App\\Models\\User', 2, 'API Token of John Smith', 'd935ee8fcb11c93833bd7df2ea9af5e66be28bfae70e09f54d565a82f5612044', '[\"*\"]', '2023-03-20 06:22:52', NULL, '2023-03-20 06:21:20', '2023-03-20 06:22:52'),
(122, 'App\\Models\\User', 2, 'API Token of John Smith', 'c09d39bf7b8be10c7bd9a72fd71fe9bfd3313472825820578e4717b7d3a7cbc4', '[\"*\"]', '2023-03-20 09:31:21', NULL, '2023-03-20 09:30:28', '2023-03-20 09:31:21'),
(124, 'App\\Models\\User', 2, 'API Token of John Smith', '641c35402235317282665e21297da32d977b4adb68edf0573edbaa65b937eaf3', '[\"*\"]', '2023-03-20 09:42:54', NULL, '2023-03-20 09:31:51', '2023-03-20 09:42:54'),
(127, 'App\\Models\\User', 2, 'API Token of John Smith', 'e7a73c8a21230468da2296c98dbf5d0998fcf670e4dac2f0721c173eaa15f2e7', '[\"*\"]', '2023-03-20 09:55:57', NULL, '2023-03-20 09:45:46', '2023-03-20 09:55:57'),
(129, 'App\\Models\\User', 2, 'API Token of John Smith', '83fd563c62489efc804e9a5c94130ebb3d667c94909f05d81a9c504d88aa1f22', '[\"*\"]', '2023-03-20 10:04:40', NULL, '2023-03-20 10:04:38', '2023-03-20 10:04:40'),
(131, 'App\\Models\\User', 2, 'API Token of John Smith', '6345eca1dcf9ed571751a4aaee4c2419b9ad00d2aaa69bcfd82dec1d6196ccc2', '[\"*\"]', '2023-03-20 10:06:11', NULL, '2023-03-20 10:06:10', '2023-03-20 10:06:11'),
(132, 'App\\Models\\User', 2, 'API Token of John Smith', '3ceb10c119a9b082c349a5f60a22af42130631866946104ab55493f65d1e9b09', '[\"*\"]', '2023-03-21 11:45:49', NULL, '2023-03-21 11:45:46', '2023-03-21 11:45:49'),
(133, 'App\\Models\\User', 2, 'API Token of John Smith', '7a263fd3498a33e21bfe2a9dad05f8bb80d674444f98249e435d44172c8488e4', '[\"*\"]', '2023-03-21 12:15:40', NULL, '2023-03-21 12:01:02', '2023-03-21 12:15:40'),
(134, 'App\\Models\\User', 2, 'API Token of John Smith', '8bbb24bf95772a4760d3cd5c077c91c296bd5d4a882f10d3a8682c1ffc80973d', '[\"*\"]', '2023-03-21 15:05:53', NULL, '2023-03-21 15:05:51', '2023-03-21 15:05:53'),
(135, 'App\\Models\\User', 2, 'API Token of John Smith', '831f082667411775f347e0b29a31b317e8f3678223d6946c3680b58fa817c9ea', '[\"*\"]', '2023-03-21 15:40:51', NULL, '2023-03-21 15:40:48', '2023-03-21 15:40:51'),
(136, 'App\\Models\\User', 2, 'API Token of John Smith', 'b751600e24dc649cd02b1814603204ee27be40d50eeb5f2f3a4b8d464fc033e5', '[\"*\"]', '2023-03-21 16:58:29', NULL, '2023-03-21 15:48:33', '2023-03-21 16:58:29'),
(139, 'App\\Models\\User', 2, 'API Token of John Smith', '5e46e0eb34f443420c215f3fd758331cc73723c72e930189f285fbae54904a90', '[\"*\"]', '2023-03-21 17:42:35', NULL, '2023-03-21 17:42:31', '2023-03-21 17:42:35'),
(140, 'App\\Models\\User', 2, 'API Token of John Smith', 'fcab1bbdae675ca15c6e754717f3e0d7d50cf0ef15bdad34964292e41876c626', '[\"*\"]', '2023-03-22 17:28:29', NULL, '2023-03-22 17:28:19', '2023-03-22 17:28:29'),
(143, 'App\\Models\\User', 2, 'API Token of John Smith', 'e2f765558fb3819a4445ddc7ede01b11a350c7784411859387f927861eca6a08', '[\"*\"]', NULL, NULL, '2023-03-22 17:49:18', '2023-03-22 17:49:18'),
(144, 'App\\Models\\User', 2, 'API Token of John Smith', 'b43c9e4b59b06eba271f5ebf541397703190fbb2ceed2a8b16d88c9b3499c452', '[\"*\"]', '2023-03-22 18:03:29', NULL, '2023-03-22 17:49:35', '2023-03-22 18:03:29'),
(145, 'App\\Models\\User', 2, 'API Token of John Smith', '85faad04344c7c6798b56e78a370c2d7100da0253351a3c03c15a7e51ca1da38', '[\"*\"]', '2023-03-22 18:08:11', NULL, '2023-03-22 18:08:01', '2023-03-22 18:08:11'),
(146, 'App\\Models\\User', 2, 'API Token of John Smith', '0eedd737abaf893cb2d741e36ed2bf041171a1d7aec3c0f5074b0b98c2dff55e', '[\"*\"]', NULL, NULL, '2023-03-22 18:14:53', '2023-03-22 18:14:53'),
(148, 'App\\Models\\User', 2, 'API Token of John Smith', '1d107c0c3f7eb641288d658851ef5fec8b39d23eed95931783deb77c41d782aa', '[\"*\"]', '2023-03-22 18:23:12', NULL, '2023-03-22 18:17:46', '2023-03-22 18:23:12'),
(149, 'App\\Models\\User', 2, 'API Token of John Smith', '9d6f9cb79b00f73884cf793ac3f19d815037f4de678b89cf512d980acb42917d', '[\"*\"]', '2023-03-22 18:39:43', NULL, '2023-03-22 18:24:52', '2023-03-22 18:39:43'),
(150, 'App\\Models\\User', 2, 'API Token of John Smith', '6980de26545d1a002e2f83f3e23740b74e15d57673cd637d7d6bcd87538eb639', '[\"*\"]', '2023-03-22 18:48:30', NULL, '2023-03-22 18:48:28', '2023-03-22 18:48:30'),
(151, 'App\\Models\\User', 2, 'API Token of John Smith', '0492ecec31e0fe66f5febfceb335e8ba0903a3d28158ce3cf48ec5823f5116f6', '[\"*\"]', '2023-03-23 06:59:13', NULL, '2023-03-23 06:58:51', '2023-03-23 06:59:13'),
(152, 'App\\Models\\User', 2, 'API Token of John Smith', 'ef50c2c76b3e9cf767fab2ed13216ca11932e729b2e2db8fae1ce2e4c9ac2b15', '[\"*\"]', '2023-03-23 15:19:58', NULL, '2023-03-23 15:19:37', '2023-03-23 15:19:58'),
(154, 'App\\Models\\User', 2, 'API Token of John Smith', '0ce18c614c06dfdf2f23d2c90881f042467463547b597a9d8108352eecc4081b', '[\"*\"]', '2023-03-23 15:42:48', NULL, '2023-03-23 15:26:04', '2023-03-23 15:42:48'),
(155, 'App\\Models\\User', 2, 'API Token of John Smith', '0f00d6859ba58f1774b25fe4c4adb7feb291896ff671a9ed0c052022c21c5a92', '[\"*\"]', '2023-03-23 15:47:28', NULL, '2023-03-23 15:47:28', '2023-03-23 15:47:28'),
(156, 'App\\Models\\User', 2, 'API Token of John Smith', '3c4f574748c45eda9dc529f22a1590e1285f205c89b234abe8ee6f14ef1ca7e1', '[\"*\"]', '2023-03-23 15:54:19', NULL, '2023-03-23 15:48:38', '2023-03-23 15:54:19'),
(158, 'App\\Models\\User', 2, 'API Token of John Smith', '95c0ccd9f0df2d312174f5ca7c56abc0570049636ba246d0bbe02c0bfe1379ea', '[\"*\"]', '2023-03-23 16:09:47', NULL, '2023-03-23 16:08:34', '2023-03-23 16:09:47'),
(159, 'App\\Models\\User', 2, 'API Token of John Smith', '9c3bb95ea32993f83cfc89b6f0790758c2c8e6ea0a537f396525cc210730f8fb', '[\"*\"]', '2023-03-23 18:31:50', NULL, '2023-03-23 18:31:26', '2023-03-23 18:31:50'),
(160, 'App\\Models\\User', 2, 'API Token of John Smith', '0a9a7ce03b492dd588bb425f83a6368886fa0e69972199c2dba5d7744f5a9c5a', '[\"*\"]', '2023-03-23 19:41:04', NULL, '2023-03-23 19:38:20', '2023-03-23 19:41:04'),
(161, 'App\\Models\\User', 2, 'API Token of John Smith', 'bedb10b7419050bea7e2053a49addef4e4a8db89423aecf156d221a44a141396', '[\"*\"]', '2023-03-24 09:29:39', NULL, '2023-03-24 08:54:41', '2023-03-24 09:29:39'),
(162, 'App\\Models\\User', 2, 'API Token of John Smith', 'be21e7576074a9a17e89a7cfdbfbf20aa8bfc6eefc4225f698d24feffe08f494', '[\"*\"]', '2023-03-24 09:31:53', NULL, '2023-03-24 09:29:43', '2023-03-24 09:31:53'),
(163, 'App\\Models\\User', 2, 'API Token of John Smith', '1eefc555a82da6c2ee9d278f368b140f7b86fcbf6f66d936d5cd398a40567c7d', '[\"*\"]', '2023-03-24 12:16:29', NULL, '2023-03-24 12:16:22', '2023-03-24 12:16:29'),
(165, 'App\\Models\\User', 2, 'API Token of John Smith', 'e50dfd728b3540defe51b091250bb78c29d3ac752680fa68ad1b9675db54e223', '[\"*\"]', '2023-03-24 16:15:24', NULL, '2023-03-24 16:10:07', '2023-03-24 16:15:24'),
(166, 'App\\Models\\User', 2, 'API Token of John Smith', '9aab2df4c538e1c4eb14e28e8b84308bf7dec5ad7e2cdfa85a3a48f28c424c70', '[\"*\"]', '2023-03-24 16:38:01', NULL, '2023-03-24 16:37:58', '2023-03-24 16:38:01'),
(167, 'App\\Models\\User', 2, 'API Token of John Smith', '22d2d075b040e72795b4715262e2d971b63a51ccd3e5b3e2c05669e13a548fe8', '[\"*\"]', '2023-03-24 16:56:42', NULL, '2023-03-24 16:40:58', '2023-03-24 16:56:42'),
(170, 'App\\Models\\User', 2, 'API Token of John Smith', 'e39bfa624814396d67e26d9e48c39c2a8626b09b15fb8960c197084122748cfb', '[\"*\"]', '2023-03-28 10:42:51', NULL, '2023-03-28 10:42:48', '2023-03-28 10:42:51'),
(171, 'App\\Models\\User', 2, 'API Token of John Smith', '536d0dece205620a27e119ef682778e265983eeee53f1934b20e9495b98c9a15', '[\"*\"]', '2023-03-29 16:28:03', NULL, '2023-03-29 16:27:22', '2023-03-29 16:28:03'),
(172, 'App\\Models\\User', 2, 'API Token of John Smith', '1ee2f83d1be2f7fb28db6aaedd747d828608c595bfdd791e70ae0624589021ff', '[\"*\"]', '2023-03-29 19:05:24', NULL, '2023-03-29 19:05:03', '2023-03-29 19:05:24'),
(173, 'App\\Models\\User', 2, 'API Token of John Smith', '2cb841e7d3097b42d858112027d40f72b720076b8c86da9fe625a1d13eea7fff', '[\"*\"]', '2023-03-29 19:09:10', NULL, '2023-03-29 19:05:49', '2023-03-29 19:09:10'),
(174, 'App\\Models\\User', 2, 'API Token of John Smith', 'e4247ba0fcc5a3a7e243238943e1d9b536f30cd47535bc0879572a1956eec4d7', '[\"*\"]', '2023-03-29 20:18:45', NULL, '2023-03-29 19:54:54', '2023-03-29 20:18:45'),
(175, 'App\\Models\\User', 2, 'API Token of John Smith', 'c5c6fc23312e9eed996184c93d70b2ee0631f6f301b5750644e83d34866f0de1', '[\"*\"]', '2023-03-29 20:28:33', NULL, '2023-03-29 20:23:56', '2023-03-29 20:28:33'),
(176, 'App\\Models\\User', 2, 'API Token of John Smith', '6dbd326f6ddd4a33b8808f3531849042af018d5f7ffac92ed61affa62a1e9dae', '[\"*\"]', '2023-03-30 08:50:33', NULL, '2023-03-30 08:50:23', '2023-03-30 08:50:33'),
(177, 'App\\Models\\User', 2, 'API Token of John Smith', 'f0f3cf0e70c766ad59094dd5c47ee23d5c660c774fd38c371c97a84818e69fbf', '[\"*\"]', '2023-03-30 08:58:00', NULL, '2023-03-30 08:55:14', '2023-03-30 08:58:00'),
(178, 'App\\Models\\User', 2, 'API Token of John Smith', '506c8d28df5dcaba7847f51c7b8d64aad3d91420ee8a39aea27aaeb297dbe7c0', '[\"*\"]', '2023-03-30 09:13:46', NULL, '2023-03-30 08:58:17', '2023-03-30 09:13:46'),
(179, 'App\\Models\\User', 2, 'API Token of John Smith', '4493e0d7cbe079ecb1230ba9fcfe4fbbb276a097ff4c6d857f858618c97b5eb2', '[\"*\"]', '2023-03-30 10:18:31', NULL, '2023-03-30 09:44:19', '2023-03-30 10:18:31'),
(180, 'App\\Models\\User', 2, 'API Token of John Smith', 'a3316f4a9fcbd67f0039233fe10f4d06a33b823122ddaf10a4a60d789d902cca', '[\"*\"]', '2023-03-30 10:24:24', NULL, '2023-03-30 10:24:13', '2023-03-30 10:24:24'),
(181, 'App\\Models\\User', 2, 'API Token of John Smith', '97bf4913accceedce22c375dca64c5c3c812fd04729e4bf32f682575512d4700', '[\"*\"]', '2023-03-30 12:11:51', NULL, '2023-03-30 12:08:44', '2023-03-30 12:11:51'),
(182, 'App\\Models\\User', 2, 'API Token of John Smith', 'fae00698062a96cf9f3fa6de76facda1664be89e91f62378b732e0dae3d3d30c', '[\"*\"]', '2023-03-30 12:33:48', NULL, '2023-03-30 12:11:58', '2023-03-30 12:33:48'),
(183, 'App\\Models\\User', 2, 'API Token of John Smith', '4c4dc5ec5a823f715afecd47efbbbe16e341919217d557b65aa9816acf539b55', '[\"*\"]', '2023-03-30 12:50:45', NULL, '2023-03-30 12:35:23', '2023-03-30 12:50:45'),
(184, 'App\\Models\\User', 2, 'API Token of John Smith', '8068b2ecca74b4ecb105984cd83096c85a12422ff843e2040fe8b371c5eeea16', '[\"*\"]', '2023-03-30 13:06:15', NULL, '2023-03-30 13:06:12', '2023-03-30 13:06:15'),
(185, 'App\\Models\\User', 2, 'API Token of John Smith', '5e76ddbd0fc6377d0e7ef4a061ec848e05041e1f731869a999cffcb08512a42f', '[\"*\"]', '2023-03-30 13:10:37', NULL, '2023-03-30 13:09:30', '2023-03-30 13:10:37'),
(186, 'App\\Models\\User', 2, 'API Token of John Smith', '0ae8de82dfbcfe3fc052cf31c80b5d7cbf0bf430508e731fa195292d75a16235', '[\"*\"]', '2023-03-30 13:11:13', NULL, '2023-03-30 13:11:13', '2023-03-30 13:11:13'),
(187, 'App\\Models\\User', 2, 'API Token of John Smith', '433723163bf475d6a89b4e8a756f7e4692d025bec99bd1f6c24ed8e109752411', '[\"*\"]', '2023-03-30 13:16:32', NULL, '2023-03-30 13:12:05', '2023-03-30 13:16:32'),
(188, 'App\\Models\\User', 2, 'API Token of John Smith', 'b5d96d4c14455768e1b75cbbc7473fe7ff2013f0070043c468e87c541895b372', '[\"*\"]', '2023-03-31 08:32:54', NULL, '2023-03-31 08:32:54', '2023-03-31 08:32:54'),
(189, 'App\\Models\\User', 2, 'API Token of John Smith', 'a16cff6c304b5375864da884986ac7931d039df0124580a9be052d9d38baeb61', '[\"*\"]', '2023-03-31 09:01:39', NULL, '2023-03-31 09:01:19', '2023-03-31 09:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `subscription`, `number`, `address`, `public_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Middleton Grange School', 'Basic', NULL, NULL, '30628763582249456539', NULL, NULL, NULL),
(2, 'Demo school High', 'Basic', NULL, NULL, NULL, NULL, '2023-03-30 10:23:32', '2023-03-30 10:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tutor_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolled_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `tutor_group`, `year_level`, `gender`, `enrolled_status`, `sms_identifier`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Billy', 'Jones', 'SKNB', '12', 'M', '1', NULL, 1, NULL, NULL),
(2, 'Suzie', 'Wallace', NULL, '11', 'F', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_contacts`
--

CREATE TABLE `student_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `student_mobile` varchar(20) DEFAULT NULL,
  `student_email` varchar(50) DEFAULT NULL,
  `pc_name` varchar(100) DEFAULT NULL,
  `pc_relationship` varchar(50) DEFAULT NULL,
  `pc_mobile` varchar(20) DEFAULT NULL,
  `pc_email` varchar(50) DEFAULT NULL,
  `sc_name` varchar(100) DEFAULT NULL,
  `sc_relationship` varchar(50) DEFAULT NULL,
  `sc_mobile` varchar(20) DEFAULT NULL,
  `sc_email` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_contacts`
--

INSERT INTO `student_contacts` (`id`, `student_id`, `student_mobile`, `student_email`, `pc_name`, `pc_relationship`, `pc_mobile`, `pc_email`, `sc_name`, `sc_relationship`, `sc_mobile`, `sc_email`, `updated_at`, `created_at`) VALUES
(1, 1, '0210212123', 'billy@school.com', 'Margaret Jones', 'Mother', '0221233242', 'marg.jones@family.com', 'Drake Jones', 'Father', '0271233231', 'd.jones@family.com', '2023-03-24 08:17:56', '2023-03-24 07:43:25'),
(2, 2, '02102342313', 'Suzie@school.ac.nz', 'Jasmine Wallace', 'Aunt', '02217483927', 'jasmine@xtra.co.nz', NULL, '', NULL, NULL, '2023-03-25 02:39:53', '2023-03-25 02:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `name`, `description`, `priority`, `created_at`, `updated_at`) VALUES
(1, 2, 'New task', 'Task Description', 'low', '2023-03-18 18:00:32', '2023-03-18 18:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `school_id`) VALUES
(1, 'Luke', 'Noble', 'l.noble@middleton.school.nz', NULL, '$2y$10$jyPEXyJwCXoQCwyjPqK33OTr/1CVTkjw1nd5Eeoyj5nz4W89oVP8.', 'M2Bk6KCp7Deq4LhUpIlCQuE1bhEgaYctcmUuEdCDfkzD5Gl4s5Akdo3EtfhX', '2023-03-08 11:55:03', '2023-03-08 11:55:03', 1),
(2, 'John', 'Smith', 'J.smith@this.com', NULL, '$2y$10$m338UxxWXxc1miegFEWRUuuOtvEgDllRDv.GfNOOYgQ0suy/00OkS', NULL, '2023-03-11 16:10:56', '2023-03-11 16:10:56', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendar_events_school_id_foreign` (`school_id`),
  ADD KEY `calendar_events_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_user_id_foreign` (`user_id`),
  ADD KEY `lessons_student_id_foreign` (`student_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `lesson_notes`
--
ALTER TABLE `lesson_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `student_contacts`
--
ALTER TABLE `student_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lesson_notes`
--
ALTER TABLE `lesson_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_contacts`
--
ALTER TABLE `student_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD CONSTRAINT `calendar_events_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `calendar_events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `lessons_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lesson_notes`
--
ALTER TABLE `lesson_notes`
  ADD CONSTRAINT `lesson_notes_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `student_contacts`
--
ALTER TABLE `student_contacts`
  ADD CONSTRAINT `student_contacts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
