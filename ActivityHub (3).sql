-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 13, 2023 at 07:38 PM
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
  `school_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
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
(11, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '2023-07-04', NULL, NULL, NULL, 'lesson', 15, '2023-07-03 17:17:00', '2023-07-03 17:17:00'),
(19, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '2023-07-04', NULL, NULL, NULL, 'lesson', 37, '2023-07-03 17:17:00', '2023-07-03 17:17:00'),
(20, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '2023-07-04', NULL, NULL, NULL, 'lesson', 38, '2023-07-03 17:17:00', '2023-07-03 17:17:00'),
(21, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, '2023-11-15', NULL, NULL, NULL, 'lesson', 41, '2023-11-14 10:41:32', '2023-11-14 10:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text NOT NULL,
  `notes` text,
  `location` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `school_id`, `description`, `notes`, `location`, `date`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1b599c53-4cb4-4ff9-b799-86e1f9ba979a', 'A first', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'First Event for Sampsonwood', NULL, 'At School', '2024-03-08', '10:10:00', '2023-11-30 07:09:41', '2023-11-30 07:09:41', NULL),
('301007a1-014f-4f77-9781-ca8d2a49cac2', 'Trial Event', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'afdsdad', NULL, 'asdsadsd', '2024-03-20', '15:19:00', '2023-11-28 13:16:04', '2023-11-30 07:43:14', '2023-11-30 07:43:14'),
('45150dd2-3b68-489a-a73e-717ba1dfcc91', 'A New Event', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'sdfafsgfds', NULL, 'sdgsfdgds', '2024-02-05', '10:20:00', '2023-11-28 09:42:34', '2023-11-30 07:42:53', '2023-11-30 07:42:53'),
('4de46b5f-0003-4581-adca-0d56a518ed6e', 'Trial Ice-cream event', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Buying something for Luke', NULL, 'School', '2024-03-14', '14:00:00', '2023-11-29 09:58:46', '2023-11-30 07:51:54', '2023-11-30 07:51:54'),
('d5fef3f8-a6cd-4354-bec2-63c84871dc81', 'Trial11111', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'sdfdfsf', NULL, 'sfdssfsf', '2023-12-19', '17:39:00', '2023-11-29 11:37:37', '2023-11-30 07:40:26', '2023-11-30 07:40:26'),
('de1e1fba-990b-4b43-9791-176d658d4cac', 'A Trial Event', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'A Trial event to see if it is setup correctly', NULL, 'Here at school', '2023-12-15', '14:00:00', '2023-11-28 09:09:17', '2023-11-28 09:09:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events_jobs`
--

CREATE TABLE `events_jobs` (
  `id` varchar(36) NOT NULL,
  `event_id` varchar(36) NOT NULL,
  `description` varchar(150) NOT NULL,
  `due_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events_jobs`
--

INSERT INTO `events_jobs` (`id`, `event_id`, `description`, `due_date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0736fd20-f836-4dbb-acd3-c6002040f1fa', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'Confirm Performance repertoire', '2023-11-17', 1, '2023-11-28 09:09:17', '2023-11-28 09:41:14', NULL),
('087fe5d5-4bf2-445d-a156-a15bd406ce9a', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'Confirm Performance repertoire', '2024-02-21', 0, '2023-11-28 13:16:04', '2023-11-28 13:16:04', NULL),
('14aa6a2d-259b-42e4-8062-99a3bebe18b0', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Confirm Performance repertoire', '2024-01-08', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('3db998c9-75ba-4903-bb52-358478cc4ea8', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'Inform performer\'s parents and whanau', '2023-11-17', 1, '2023-11-28 09:09:17', '2023-11-28 09:41:13', NULL),
('471ea739-4256-4373-b1c1-02ee03624259', 'd5fef3f8-a6cd-4354-bec2-63c84871dc81', 'A New Job', '2023-10-24', 1, '2023-11-29 11:37:37', '2023-11-29 11:37:41', NULL),
('55c357ef-0f4e-4b4a-a602-cc738be341b1', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'On The Day', '2024-03-14', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('59885305-73f6-4c25-bab6-d3222c095c68', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Confirm technical requirements, instruments, and personnel', '2024-02-29', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('6b2196b5-21ba-4fda-85e3-f9d997a75e17', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Confirm Performance repertoire', '2024-01-18', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('7761d9bf-b775-4443-86da-b568259e020b', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Confirm technical requirements, instruments, and personnel', '2024-01-22', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('82296915-fc2b-4527-8b46-34ff448f2350', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Inform performer\'s parents and whanau', '2024-01-08', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('8c9c1356-136c-4f58-9a0b-adf3e6fb417e', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Secure School Calendar Booking', '2023-11-29', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('8dc2b3c4-a601-46ff-8f94-9391587052ce', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Secure School Calendar Booking', '2023-11-28', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('9556d4c3-e3bd-473b-bc7f-b4c80d3a0b1b', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Inform performer\'s parents and whanau', '2024-02-22', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('99bebd86-23b1-475d-ae4d-d5b9fab9973f', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'Inform performer\'s parents and whanau', '2024-02-21', 1, '2023-11-28 13:16:04', '2023-11-28 13:17:10', NULL),
('9d00c26a-07ef-4f11-927d-7fd4a486bfe1', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'On The Day', '2024-03-20', 0, '2023-11-28 13:16:04', '2023-11-28 13:16:04', NULL),
('a4af451d-4b29-4591-a605-d1bb674440a5', '1b599c53-4cb4-4ff9-b799-86e1f9ba979a', 'New Job', '2023-12-28', 0, '2023-11-30 10:02:16', '2023-11-30 10:02:16', NULL),
('ad52797e-4a8a-475f-b472-f700719d3d43', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'On The Day', '2024-02-05', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('b07a59bc-3533-4061-a2da-da800648a1a6', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'Confirm technical requirements, instruments, and personnel', '2023-12-01', 1, '2023-11-28 09:09:17', '2023-11-28 09:41:02', NULL),
('ba49a2d5-f2b9-41ca-9249-c351ebdb4398', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'Secure School Calendar Booking', '2023-11-28', 1, '2023-11-28 09:09:17', '2023-11-28 09:41:13', NULL),
('bb68c485-09c9-438b-ae0b-ab897de2b80e', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Buy Luke an Ice-cream', '2023-11-29', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('ccfad60e-a773-4d68-a5f2-5cccbcdf7dc0', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'On The Day', '2023-12-15', 5, '2023-11-28 09:09:17', '2023-11-28 09:40:07', NULL),
('d4ad1a76-07db-4370-a146-22d69f2c5a8d', '1b599c53-4cb4-4ff9-b799-86e1f9ba979a', 'A first job to be completed straight away.', '2023-11-30', 0, '2023-11-30 07:09:41', '2023-11-30 07:09:41', NULL),
('d792f94e-0f89-4012-8bd6-53b25f0041e9', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'Confirm technical requirements, instruments, and personnel', '2024-03-06', 1, '2023-11-28 13:16:04', '2023-11-28 13:17:10', NULL),
('de84b3f7-1a1b-4e7f-9fb2-9094ce0894a2', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'Secure School Calendar Booking', '2023-11-29', 1, '2023-11-28 13:16:04', '2023-11-28 13:17:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events_school_jobs`
--

CREATE TABLE `events_school_jobs` (
  `id` varchar(36) NOT NULL,
  `description` varchar(150) NOT NULL,
  `template_id` varchar(36) NOT NULL,
  `priority` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events_school_jobs`
--

INSERT INTO `events_school_jobs` (`id`, `description`, `template_id`, `priority`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0d1885b0-28b7-45af-8d56-6fc2b0a13214', 'On The Day', '025faf74-ae16-4c4b-997f-732624860e42', 13, '2023-11-28 20:31:14', '2023-11-29 07:00:14', NULL),
('0d1885b0-28b7-45af-8d56-6fc2b0a13219', 'Confirm Performance repertoire', '025faf74-ae16-4c4b-997f-732624860e42', 3, '2023-11-03 01:43:47', '2023-11-29 09:54:55', NULL),
('1dd99fae-64dd-428b-8732-fc835d9307f2', 'An initial Job', 'f51ce2f2-d59f-4920-83f8-79a522c9fb9f', 1, '2023-11-30 10:04:39', '2023-11-30 10:16:33', '2023-11-30 10:16:33'),
('434558b3-2f33-4d0b-87ea-d656c311c639', 'A New Job', '6a8cd833-ce9e-4660-b206-2c9fe3ae1a0b', 3, '2023-11-29 11:36:58', '2023-11-29 11:36:58', NULL),
('5cf55707-ef4f-48d2-a3df-e59df64c410e', 'New job', 'f240f750-62be-432c-9c1b-6732e846735e', 7, '2023-11-30 10:24:29', '2023-11-30 10:24:29', NULL),
('7e102974-693e-4f43-bcbd-4f57dd1e3cec', 'A New Template Job', '025faf74-ae16-4c4b-997f-732624860e42', 6, '2023-11-29 09:34:22', '2023-11-29 09:40:20', '2023-11-29 09:40:20'),
('888e9bcd-481f-4292-8e47-e53ff77c7e59', 'Another New Template Job', '025faf74-ae16-4c4b-997f-732624860e42', 14, '2023-11-29 09:36:07', '2023-11-29 09:40:23', '2023-11-29 09:40:23'),
('8a72ef9e-de0e-47e8-8919-20334aa9d1b7', 'Buy Luke an Ice-cream', '025faf74-ae16-4c4b-997f-732624860e42', 1, '2023-11-29 09:58:04', '2023-11-29 09:58:04', NULL),
('9eadf5b9-4506-4773-a1f8-0ec14165de23', 'Inform performer\'s parents and whanau', '025faf74-ae16-4c4b-997f-732624860e42', 5, '2023-11-03 01:44:39', '2023-11-29 09:57:42', NULL),
('a13a9a74-e935-478f-ace4-2fb0d8d7a2b9', 'asdfsafs', '025faf74-ae16-4c4b-997f-732624860e42', 5, '2023-11-29 09:38:49', '2023-11-29 09:39:18', '2023-11-29 09:39:18'),
('a4cfecb5-f4ae-4388-b713-71ca8b3e8446', 'A first job to be completed straight away.', '3d9f5a1a-997b-40f6-acf9-aca42c6d2e78', 1, '2023-11-30 07:08:44', '2023-11-30 07:08:44', NULL),
('a9a373f6-2bbc-41e0-bfa8-a45db70579c4', 'Confirm technical requirements, instruments, and personnel', '025faf74-ae16-4c4b-997f-732624860e42', 6, '2023-11-03 01:45:21', '2023-11-29 01:50:28', NULL),
('bbc032f5-fd52-467f-a466-c8bb29f7d84d', 'Secure School Calendar Booking', '025faf74-ae16-4c4b-997f-732624860e42', 1, '2023-11-03 01:42:03', '2023-11-29 09:51:16', NULL),
('f3e36f40-713a-4947-86b8-ee218d02bb85', 'Something in the middle', '025faf74-ae16-4c4b-997f-732624860e42', 5, '2023-11-29 09:36:33', '2023-11-29 09:40:17', '2023-11-29 09:40:17'),
('ff7a7f03-4652-416c-a12f-517a33167a3d', 'New Job', 'f51ce2f2-d59f-4920-83f8-79a522c9fb9f', 11, '2023-11-30 10:24:48', '2023-11-30 10:24:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events_school_jobs_templates`
--

CREATE TABLE `events_school_jobs_templates` (
  `id` varchar(36) NOT NULL,
  `heading` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `notes` text,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events_school_jobs_templates`
--

INSERT INTO `events_school_jobs_templates` (`id`, `heading`, `description`, `notes`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('025faf74-ae16-4c4b-997f-732624860e42', 'School Performance During School Hours', 'This is an example description for an event job template', 'Here is a space for notes that can accompany a template. When is this template used and what does it include?', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-29 01:39:25', '2023-11-29 09:07:06', NULL),
('331091c4-ebe8-4f43-9afb-7d7032563484', 'Term 3 Events', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-29 11:27:35', '2023-11-29 11:27:35', NULL),
('3d9f5a1a-997b-40f6-acf9-aca42c6d2e78', 'A First Template', 'Here is the first template for Sampsonwood', NULL, '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', '2023-11-30 07:08:03', '2023-11-30 07:08:26', NULL),
('6a8cd833-ce9e-4660-b206-2c9fe3ae1a0b', 'Another Template', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-29 11:36:33', '2023-11-29 11:36:33', NULL),
('8446d3be-d656-4f42-861d-9907114c909d', 'Evening Concerts', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-30 08:34:40', '2023-11-30 08:34:40', NULL),
('f240f750-62be-432c-9c1b-6732e846735e', 'External Events', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-30 09:58:17', '2023-11-30 09:58:17', NULL),
('f51ce2f2-d59f-4920-83f8-79a522c9fb9f', 'Trial Template', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-30 10:03:45', '2023-11-30 10:03:45', NULL);

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
-- Table structure for table `instruments`
--

CREATE TABLE `instruments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `family` varchar(20) DEFAULT NULL,
  `notes` text,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `fee` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`id`, `name`, `type`, `family`, `notes`, `school_id`, `state_id`, `fee`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Guitar 1', 'Guitar', 'Strings', 'Some Notes', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 60, '2023-09-16 20:56:29', '2023-10-31 10:35:53', NULL),
(2, 'Flute 1', 'flute', 'Woodwind', '-', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 4, NULL, '2023-10-02 16:43:22', '2023-10-04 01:07:08', NULL),
(3, 'Flute 2', 'flute', 'Woodwind', '-', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 2, NULL, '2023-10-02 16:52:10', '2023-10-25 08:12:15', NULL),
(4, 'Flute 3', 'flute', 'Woodwind', '-', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 2, NULL, '2023-10-02 16:52:40', '2023-10-25 10:39:04', NULL),
(5, 'Flute 4', 'flute', 'Woodwind', '-', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 2, 80, '2023-10-02 16:53:24', '2023-10-25 10:44:49', NULL),
(6, 'Cello', 'Cello', 'Strings', '-', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 2, 60, '2023-10-03 11:53:19', '2023-10-25 08:02:50', NULL),
(7, 'Cello 2', 'Cello', 'Strings', '-', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 3, 60, '2023-10-03 11:54:32', '2023-10-04 01:07:21', NULL),
(8, 'Guitar 2', 'Guitar', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 20, '2023-10-17 07:13:54', '2023-10-17 07:13:54', NULL),
(9, 'Recorder 1', 'Recorder', 'Woodwind', NULL, '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 2, 10, '2023-10-24 07:59:27', '2023-11-05 12:50:18', NULL),
(10, 'Recorder 2', 'Recorder', 'Woodwind', NULL, '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 2, 10, '2023-10-24 08:02:02', '2023-11-05 12:52:04', NULL),
(11, 'Recorder 3', 'Recorder', 'Woodwind', NULL, '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 2, 10, '2023-10-24 08:04:37', '2023-11-05 12:52:55', NULL),
(12, 'Violin 1', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:09', '2023-12-04 09:02:01', NULL),
(13, 'Violin 2', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:15', '2023-10-25 08:14:15', NULL),
(14, 'Violin 3', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:18', '2023-10-25 08:14:18', NULL),
(15, 'Violin 4', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:21', '2023-10-25 08:14:21', NULL),
(16, 'Violin 5', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:24', '2023-10-25 08:14:24', NULL),
(17, 'Violin 6', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:26', '2023-10-25 08:14:26', NULL),
(18, 'Violin 7', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:29', '2023-10-25 08:14:29', NULL),
(19, 'Violin 8', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:31', '2023-10-25 08:14:31', NULL),
(20, 'Violin 9', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 2, 100, '2023-10-25 08:14:34', '2023-10-25 10:53:32', NULL),
(21, 'Violin 10', 'Violin', 'Strings', NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 100, '2023-10-25 08:14:37', '2023-10-31 10:41:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instrument_hires`
--

CREATE TABLE `instrument_hires` (
  `id` bigint(20) NOT NULL,
  `instrument_id` bigint(20) NOT NULL,
  `student_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `return_date` timestamp NULL DEFAULT NULL,
  `returned_date` timestamp NULL DEFAULT NULL,
  `form_signed` tinyint(1) NOT NULL DEFAULT '0',
  `upload_id` int(10) DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instrument_hires`
--

INSERT INTO `instrument_hires` (`id`, `instrument_id`, `student_id`, `start_date`, `return_date`, `returned_date`, `form_signed`, `upload_id`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 12, '9727112b-e526-4684-839c-631ac6d52c6b', '2023-12-04 22:02:38', '2023-12-04 11:00:00', NULL, 0, NULL, NULL, '2023-12-04 09:01:46', '2023-12-04 22:02:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instrument_states`
--

CREATE TABLE `instrument_states` (
  `id` bigint(20) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instrument_states`
--

INSERT INTO `instrument_states` (`id`, `description`) VALUES
(1, 'Available'),
(2, 'Hired Out'),
(3, 'Needing Repairs'),
(4, 'Being Repaired'),
(5, 'Borrowed'),
(6, 'Unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instrument` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `funding_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` double(8,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `experience` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `user_id`, `student_id`, `instrument`, `start`, `end`, `day`, `start_date`, `end_date`, `funding_type`, `fee`, `status`, `experience`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '51f5f2fe-78ea-4fae-9f22-7dcadc4ec5a8', 'Guitar', '10:15:00', '10:45:00', 'Monday', '2023-07-04', '2023-11-19', 'Private', NULL, 'Active', NULL, '2023-07-03 17:13:44', '2023-09-29 20:03:43', NULL),
(37, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '51f5f2fe-78ea-4fae-9f22-7dcadc4ec5a8', 'Piano', '10:15:00', '10:45:00', 'Tuesday', '2023-07-04', NULL, 'Private', NULL, 'Active', NULL, '2023-07-03 17:13:44', '2023-09-12 15:42:45', NULL),
(38, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '1e84c3d0-c29d-404f-9c99-f2b521a10866', 'Flute', '12:00:00', '12:25:00', 'Friday', '2023-09-10', NULL, 'Funded', NULL, 'Active', NULL, NULL, '2023-11-15 08:15:29', NULL),
(39, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '1e84c3d0-c29d-404f-9c99-f2b521a10866', 'Flute', '12:00:00', '12:30:00', 'Thursday', '2023-09-10', NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL),
(40, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '1e84c3d0-c29d-404f-9c99-f2b521a10866', 'Flute', '12:00:00', '12:30:00', 'Wednesday', '2023-10-30', NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL),
(41, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '1e84c3d0-c29d-404f-9c99-f2b521a10866', 'Piano', '15:40:00', '15:55:00', 'Wednesday', '2023-11-15', NULL, 'Private', NULL, 'Active', NULL, '2023-11-14 10:40:34', '2023-11-21 13:10:37', '2023-11-21 13:10:37'),
(48, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '919ba8b8-b565-479b-871b-a81208c2ffd9', 'Piano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', NULL, '2023-12-03 07:51:12', '2023-12-03 07:51:12', NULL),
(49, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '9d4e22e1-3f4e-482e-8b6f-166a0030e8ab', 'Guitar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', NULL, '2023-12-05 09:35:12', '2023-12-05 09:35:12', NULL),
(50, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '9d4e22e1-3f4e-482e-8b6f-166a0030e8ab', 'Guitar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', NULL, '2023-12-05 09:36:07', '2023-12-05 09:36:07', NULL),
(51, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '9d4e22e1-3f4e-482e-8b6f-166a0030e8ab', 'Guitar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', 'None', '2023-12-05 09:37:06', '2023-12-05 09:37:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_attendance`
--

CREATE TABLE `lesson_attendance` (
  `id` bigint(20) NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `attendance` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_attendance`
--

INSERT INTO `lesson_attendance` (`id`, `lesson_id`, `attendance`, `date`, `time`, `user_id`, `created_at`, `updated_at`) VALUES
(95, 37, 'present', '2023-11-14', '12:23:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2023-11-14 10:23:50', '2023-11-14 10:23:50'),
(96, 37, 'custom', '2023-11-07', '12:24:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2023-11-14 10:24:37', '2023-11-22 08:45:46'),
(97, 15, 'present', '2023-11-13', '12:28:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2023-11-14 10:28:27', '2023-11-15 12:36:24'),
(98, 38, 'present', '2023-11-10', '12:29:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2023-11-14 10:29:34', '2023-11-14 10:29:34'),
(99, 15, 'custom', '2023-11-06', '12:31:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2023-11-14 10:31:58', '2023-11-15 13:18:25'),
(100, 40, 'custom', '2023-11-15', '11:40:00', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '2023-11-15 09:37:29', '2023-11-15 13:01:53'),
(101, 40, 'present', '2023-11-08', '01:41:00', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '2023-11-15 11:44:56', '2023-11-15 12:11:45'),
(102, 40, 'present', '2023-11-01', '01:41:00', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '2023-11-15 11:46:41', '2023-11-15 12:11:56'),
(103, 39, 'absent', '2023-11-23', '10:46:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2023-11-22 08:46:28', '2023-11-22 09:06:26'),
(104, 40, 'present', '2023-11-22', '11:35:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2023-11-22 09:35:26', '2023-11-22 09:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_notes`
--

CREATE TABLE `lesson_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_notes`
--

INSERT INTO `lesson_notes` (`id`, `lesson_id`, `user_id`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 15, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'dsafdsfsdfds', '2023-09-29 19:17:28', '2023-09-29 19:17:28', NULL),
(12, 38, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'adsdsfdafdfds', '2023-09-29 19:42:17', '2023-09-29 19:42:22', '2023-09-29 19:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_requests`
--

CREATE TABLE `lesson_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_name` varchar(200) NOT NULL,
  `student_email` varchar(50) DEFAULT NULL,
  `student_phone` varchar(20) DEFAULT NULL,
  `student_age` int(3) DEFAULT NULL,
  `student_year` varchar(10) DEFAULT NULL,
  `parent_name` varchar(200) DEFAULT NULL,
  `parent_phone` varchar(25) DEFAULT NULL,
  `parent_email` varchar(50) DEFAULT NULL,
  `requested_instrument` varchar(50) NOT NULL,
  `experience` text,
  `requested_tutor` varchar(50) DEFAULT NULL,
  `funding_type` varchar(20) DEFAULT 'Private',
  `status` varchar(20) NOT NULL DEFAULT 'Awaiting Review',
  `school_id` varchar(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_requests`
--

INSERT INTO `lesson_requests` (`id`, `student_name`, `student_email`, `student_phone`, `student_age`, `student_year`, `parent_name`, `parent_phone`, `parent_email`, `requested_instrument`, `experience`, `requested_tutor`, `funding_type`, `status`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 'Luke Noble', 'luke.noble91@hotmail.com', NULL, 32, '12', 'Luke Noble', '+642102323137', 'luke.noble@outlook.co.nz', 'Guitar', 'None', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-04 09:58:53', '2023-12-05 09:37:06', '2023-12-05 09:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_request_forms`
--

CREATE TABLE `lesson_request_forms` (
  `id` varchar(36) NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `logo_cb` tinyint(1) DEFAULT '0',
  `logo` varchar(150) DEFAULT NULL,
  `school_name_cb` tinyint(1) DEFAULT '0',
  `header_content_cb` tinyint(1) DEFAULT '0',
  `header_content` text,
  `heading_cb` tinyint(1) DEFAULT '0',
  `heading` varchar(150) DEFAULT NULL,
  `contact_content_cb` tinyint(1) DEFAULT '0',
  `contact_content` text,
  `student_name_cb` tinyint(1) DEFAULT '0',
  `student_name` varchar(150) DEFAULT NULL,
  `student_email_cb` tinyint(1) DEFAULT '0',
  `student_email` varchar(150) DEFAULT NULL,
  `student_phone_cb` tinyint(1) DEFAULT '0',
  `student_phone` varchar(150) DEFAULT NULL,
  `student_year_cb` tinyint(1) DEFAULT '0',
  `student_year` varchar(150) DEFAULT NULL,
  `student_age_cb` tinyint(1) DEFAULT '0',
  `student_age` varchar(150) DEFAULT NULL,
  `pc_name_cb` tinyint(1) DEFAULT '0',
  `pc_name` varchar(150) DEFAULT NULL,
  `pc_phone_cb` tinyint(1) DEFAULT '0',
  `pc_phone` varchar(150) DEFAULT NULL,
  `pc_email_cb` tinyint(1) DEFAULT '0',
  `pc_email` varchar(150) DEFAULT NULL,
  `lesson_content_cb` tinyint(1) DEFAULT '0',
  `lesson_content` text,
  `instrument_cb` tinyint(1) DEFAULT '0',
  `instrument` varchar(50) DEFAULT NULL,
  `tutor_cb` tinyint(1) DEFAULT '0',
  `tutor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funding_type_cb` tinyint(1) DEFAULT '0',
  `funding_type` varchar(150) DEFAULT NULL,
  `experience_cb` tinyint(1) DEFAULT '0',
  `experience` text,
  `footer_content_cb` tinyint(1) DEFAULT '0',
  `footer_content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_request_forms`
--

INSERT INTO `lesson_request_forms` (`id`, `school_id`, `description`, `year`, `logo_cb`, `logo`, `school_name_cb`, `header_content_cb`, `header_content`, `heading_cb`, `heading`, `contact_content_cb`, `contact_content`, `student_name_cb`, `student_name`, `student_email_cb`, `student_email`, `student_phone_cb`, `student_phone`, `student_year_cb`, `student_year`, `student_age_cb`, `student_age`, `pc_name_cb`, `pc_name`, `pc_phone_cb`, `pc_phone`, `pc_email_cb`, `pc_email`, `lesson_content_cb`, `lesson_content`, `instrument_cb`, `instrument`, `tutor_cb`, `tutor`, `funding_type_cb`, `funding_type`, `experience_cb`, `experience`, `footer_content_cb`, `footer_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
('6da9c688-7614-4c49-98ca-1b0606f2ac68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'A Testing Form', 2023, 1, '/images/school_logos/pinecrest_school.jpg', 1, 0, NULL, 1, 'Lesson Signups for 2029', 0, NULL, 1, 'Pupil Name', 1, 'Student Email', 1, 'Student Phone', 1, 'Student Year Level in 2023', 1, 'Student Age', 1, 'Parent/Caregiver Name', 1, 'Parent/Caregiver Phone', 1, 'Parent/Caregiver Email', 0, NULL, 1, 'Instrument', 1, 'Tutor Preference', 0, 'Funding Type', 1, 'Previous Experience', 0, NULL, '2023-11-07 22:28:09', '2023-12-04 09:26:37', NULL),
('ee56d9cb-868f-40e3-9274-64f871a1e6b3', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'A Trial Form', 2023, 0, '/images/school_logos/pinecrest_school.jpg', 1, 0, NULL, 0, 'Lesson Signups for 2023', 0, NULL, 0, 'Student Name', 0, 'Student Email', 0, 'Student Phone', 0, 'Student Year Level', 1, 'Student Age', 1, 'Parent / Caregiver Name', 1, 'Parent / Caregiver Phone', 1, 'Parent / Caregiver Email', 0, NULL, 0, 'Instrument', 1, 'Tutor', 0, 'Funding Type', 1, 'Previous Experience', 0, NULL, '2023-11-07 22:28:09', '2023-11-21 20:04:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_request_forms_inputs`
--

CREATE TABLE `lesson_request_forms_inputs` (
  `id` varchar(36) NOT NULL,
  `lesson_request_form_id` varchar(36) NOT NULL,
  `school_name` tinyint(1) NOT NULL DEFAULT '0',
  `logo` tinyint(1) NOT NULL DEFAULT '0',
  `student_name` tinyint(1) NOT NULL DEFAULT '0',
  `student_email` tinyint(1) NOT NULL DEFAULT '0',
  `student_phone` tinyint(1) DEFAULT '0',
  `student_year` tinyint(1) NOT NULL DEFAULT '0',
  `student_age` tinyint(1) NOT NULL DEFAULT '0',
  `pc_name` tinyint(1) NOT NULL DEFAULT '0',
  `pc_phone` tinyint(1) NOT NULL DEFAULT '0',
  `pc_email` tinyint(1) NOT NULL DEFAULT '0',
  `instrument` tinyint(1) NOT NULL DEFAULT '0',
  `tutor` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `experience` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_request_forms_inputs`
--

INSERT INTO `lesson_request_forms_inputs` (`id`, `lesson_request_form_id`, `school_name`, `logo`, `student_name`, `student_email`, `student_phone`, `student_year`, `student_age`, `pc_name`, `pc_phone`, `pc_email`, `instrument`, `tutor`, `type`, `experience`) VALUES
('fd9bc514-a14f-46dc-9b30-57653b324aed', '6da9c688-7614-4c49-98ca-1b0606f2ac68', 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1),
('fd9bc514-a14f-46dc-9b30-57653b324aef', 'ee56d9cb-868f-40e3-9274-64f871a1e6b3', 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1);

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
(17, '2023_03_19_021754_create_lessons_table', 8),
(18, '2023_04_01_023803_create_user_school_table', 9),
(19, '2023_04_04_003857_create_school_administrators_table', 9);

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
  `tokenable_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1836, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '33cde62210e1f4ed9a81374d04b15189d4860263a941d8663c893c970480f017', '[\"*\"]', '2023-11-29 11:43:22', NULL, '2023-11-29 11:23:56', '2023-11-29 11:43:22'),
(1837, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'dd16722078fbba212db0e85639dcb8d5fdd817a88c77f4d0932ee0b8beced3fe', '[\"*\"]', '2023-11-30 07:54:00', NULL, '2023-11-29 20:21:07', '2023-11-30 07:54:00'),
(1838, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'de5e2c4d03872ea7be7961e54e4d08db0d3b302d68c25e0888e0db821926f35d', '[\"*\"]', NULL, NULL, '2023-11-30 07:59:16', '2023-11-30 07:59:16'),
(1839, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '7930608ce32a1986b2dd5cc38794cfea465cca7c18321b1b08e8836767920059', '[\"*\"]', '2023-11-30 07:59:24', NULL, '2023-11-30 07:59:22', '2023-11-30 07:59:24'),
(1840, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '26af6917dff005be91c86abee93360cc3fbb459404ace673acb5d42eba85de2c', '[\"*\"]', '2023-11-30 08:04:38', NULL, '2023-11-30 08:03:17', '2023-11-30 08:04:38'),
(1841, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'c55a9964f7f65c3469cb5656521ab2630959d109a265e4a24d94d7821e49c5c0', '[\"*\"]', '2023-11-30 08:20:43', NULL, '2023-11-30 08:16:31', '2023-11-30 08:20:43'),
(1842, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '7c40b4d47e7e49b5a8d3ecd337369c8894cf01c46957bc5e30ac367ac1e8a2e5', '[\"*\"]', '2023-11-30 08:34:40', NULL, '2023-11-30 08:34:24', '2023-11-30 08:34:40'),
(1843, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '57117af7eb8280f8008c2749908157b40e58aad5a929f7eecf08d1309449368e', '[\"*\"]', '2023-11-30 09:58:33', NULL, '2023-11-30 09:56:23', '2023-11-30 09:58:33'),
(1845, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'a0e01a80d8e8034d16516e35d9645627718f58a396440b6286bb7f005a92ef18', '[\"*\"]', '2023-11-30 10:39:58', NULL, '2023-11-30 10:23:45', '2023-11-30 10:39:58'),
(1846, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'df5b1cc517b44c43be3612e2ca196058c06983f3f43752dd7cb2077df0b669a4', '[\"*\"]', '2023-12-03 08:53:39', NULL, '2023-11-30 10:51:36', '2023-12-03 08:53:39'),
(1847, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '516329223838f79a6138699f5dbfc7a00074c07238fa9a54d6fe5adcebee57ae', '[\"*\"]', '2023-12-03 11:05:17', NULL, '2023-12-01 17:17:00', '2023-12-03 11:05:17'),
(1848, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '6a8b709eac094c11c6b2d9c163598bceebad4d16ecb2fc9bae37b9c00c748a70', '[\"*\"]', '2023-12-04 11:09:48', NULL, '2023-12-03 08:57:58', '2023-12-04 11:09:48'),
(1849, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '25535dc540c544af4adad9e32a816a9666fd122e3c1d576e39da1a301f83cd8c', '[\"*\"]', '2023-12-04 10:04:11', NULL, '2023-12-04 10:03:59', '2023-12-04 10:04:11'),
(1850, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'e340364cf0826a574e821893f6b06a8603c395f23c4755cc3c637b6d48483804', '[\"*\"]', '2023-12-05 09:52:25', NULL, '2023-12-04 12:11:11', '2023-12-05 09:52:25'),
(1851, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'adafc84b57319fec3e86c8a5f6d4683cd67f496ce699b116a1cf466a651c7967', '[\"*\"]', '2023-12-05 10:04:09', NULL, '2023-12-05 09:57:19', '2023-12-05 10:04:09'),
(1852, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '368f3bb892cefa81466c776b598d8fda11cf854996e2db839efc6efd0b05088d', '[\"*\"]', '2023-12-06 17:47:42', NULL, '2023-12-06 07:10:46', '2023-12-06 17:47:42'),
(1853, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'a6987eabe8642dc9087acaf51602735f95f2493a78e24051adebeef2c26041b3', '[\"*\"]', '2023-12-12 06:44:59', NULL, '2023-12-11 11:26:00', '2023-12-12 06:44:59'),
(1854, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '9716d9fd25de01f5490a6d827e02c499a70d9c8fd9119433553244bde7d16087', '[\"*\"]', '2023-12-12 06:40:32', NULL, '2023-12-12 06:40:32', '2023-12-12 06:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`name`, `id`, `subscription`, `number`, `address`, `logo`, `primary_color`, `secondary_color`, `created_at`, `updated_at`, `deleted_at`) VALUES
('Sampsonwood Primary', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Basic', NULL, NULL, NULL, NULL, NULL, '2023-08-18 11:51:13', '2023-08-18 11:51:13', NULL),
('Pinecrest School', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Basic', NULL, NULL, '/images/school_logos/pinecrest_school.jpg', '#336666', NULL, NULL, NULL, NULL),
('Demo School High', 'f6f99a38-925f-486a-a0bc-a80d4d610181', 'Basic', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 10:23:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tutor_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` timestamp NULL DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolled_status` tinyint(1) DEFAULT '1',
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Hayes', 'Ruth', '0009d2a2-d1bb-4a76-a678-f5cbff5423a1', '6r15', '6', NULL, 'F', 1, '17278', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Alcock', 'Esther', '003b82b0-0846-4028-817d-2bb4729fae2f', '7PM', '7', NULL, 'F', 1, '23441', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Shelton', 'Zac', '00416341-5781-412b-9aa6-081f26dbf3d8', '10GA', '10', NULL, 'M', 1, '14189', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Orcajada', 'Andrea', '00c935b3-c77b-4286-945e-18375f2d7d5a', '8JF', '8', NULL, 'F', 1, '20275', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Campbell', 'Brody', '00ccd19c-bfed-4403-a855-de375da53e35', 'SCBY', '12', NULL, 'M', 1, '20022', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Teremanuia', 'Teleni', '00e35897-bf5f-4bf7-a487-8b5e7d9e8d85', '7PM', '7', NULL, 'F', 1, '17279', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Haultain', 'Boston', '00ec28b8-f628-4ec7-8234-b1d160138a4e', 'BNGT', '11', NULL, 'M', 1, '23119', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wilson', 'Ashley', '00eee127-4afa-474b-8083-1098e36a96f4', '8CR', '8', NULL, 'F', 1, '15342', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ko', 'Timothy', '0107cadc-e765-4a58-8ff5-b8c029f668df', 'SKCG', '13', NULL, 'M', 1, '19059', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gerber', 'Tristan', '010bac02-a005-438d-a367-7406ff343c7a', '10GO', '10', NULL, 'M', 1, '21063', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tau-Manuel', 'Jarrah', '011aa031-d381-45b6-b5bd-77f1093e296f', 'WNCI', '12', NULL, 'F', 1, '18054', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Manson', 'Grace', '013a8a70-7d17-44a7-a968-2568cfc97694', '10GO', '10', NULL, 'F', 1, '20087', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lynch', 'Ruby', '0154ef36-fc75-4c3e-8970-9a1e9b38ef4d', '6r14', '6', NULL, 'F', 1, '19191', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Saruwaka', 'Tawanashe', '017468ac-d480-4eaa-81c4-fe5a1e0da1fe', 'BNWN', '11', NULL, 'F', 1, '23048', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Xie', 'Richard', '01876ccd-bd8b-4ce3-9820-e897e24959c9', '5r12', '5', NULL, 'M', 1, '18381', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Yorke', 'Lavinia', '01c9ed34-2f4c-4822-9dc2-748c1ed42ad7', 'WNWT', '13', NULL, 'F', 1, '33502723', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Tavai', 'Lynnette', '01fc48f1-945c-487f-bfc8-a0c1d857481d', 'WNCI', '12', NULL, 'F', 1, '22027', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Campbell', 'Millie', '023bef57-3321-44b0-b062-4c12af6a35f8', 'SCED', '13', NULL, 'F', 1, '33502798', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Milne', 'Maddie', '025a71d4-7c86-49ae-8d11-859f5a2a892f', '8RS', '8', NULL, 'F', 1, '22062', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Li', 'Tom', '02820078-7c63-4d10-ba13-8e527a58ee62', '10LE', '10', NULL, 'M', 1, '23178', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Markham', 'Faye', '02cd6369-8e91-4b64-b3b6-b211f1be77fb', '9SC', '9', NULL, 'F', 1, '23085', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Buckley', 'Sara', '02f2801d-5475-4cc2-a29a-fe75409d2b42', '10LI', '10', NULL, 'F', 1, '131337', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Profit', 'Maiyah', '034af5a9-3cb4-40f9-93d3-1448cde4ab1e', '7PM', '7', NULL, 'F', 1, '23084', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Rao', 'Vedika', '036d451d-3342-48bd-a6bd-1053d9f10e73', 'SCJH', '12', NULL, 'F', 1, '22043', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Croker', 'Caleb', '036f6712-489d-485a-854a-afb1d3d82467', 'WNBH', '12', NULL, 'M', 1, '22127', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Faalogo', 'Madison', '03b5e62b-6a55-4a26-87fa-30eb2594cb14', '1r3', '1', NULL, 'F', 1, '23220', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Thomson', 'Caitlyn', '03d36d30-560d-490e-a10a-7ebff1164b7f', 'SCJH', '11', NULL, 'F', 1, '15198', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Yang', 'Elan', '0411af93-5039-44be-91ec-4a907f06d4da', 'SKME', '12', NULL, 'M', 1, '22004', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Major', 'Ruby', '04188c47-be5c-4a0c-93d9-b22d54a33502', 'SKNB', '12', NULL, 'F', 1, '18038', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Shen', 'Ezra', '04233a33-cc3b-4e04-8b24-ed1b71b6ff86', '4r11', '4', NULL, 'M', 1, '20250', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Eyre-Churcher', 'Brayden', '043a3071-c243-4cba-8545-3f5e13daf2fe', '2r5', '2', NULL, 'M', 1, '21190', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ramsay', 'Blake', '046942ad-4852-4745-b1f7-bf6cebb6820e', '6r14', '6', NULL, 'M', 1, '18318', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Irvine', 'David', '04931ce3-bdcc-421f-842f-115142ad136e', 'SKHG', '13', NULL, 'M', 1, '33502607', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cao', 'Rui', '049c8379-3853-4d2b-aad8-81f68b02b710', '10GA', '10', NULL, 'M', 1, '23476', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Kan', 'Sarah', '04c1b0ce-7bb1-49e7-84a9-23ac94e45e2e', 'SCJH', '13', NULL, 'F', 1, '33502718', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Dos Santos', 'Kaleb', '04eb56ef-a015-4cbe-b995-f4b0fe5ca3d2', '4r10', '4', NULL, 'M', 1, '20217', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Barb', 'Emmy', '051ae51e-ea06-4a0c-8eeb-cb66f0c4b772', '2r5', '2', NULL, 'F', 1, '22286', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Silivale', 'Debbie', '0528eab9-7caa-46c3-a93a-22a832aac83c', '5r12', '5', NULL, 'F', 1, '20252', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Bennetts', 'Georgia', '053f0b71-61a3-42ea-bcbe-997284ce2fc4', '9FR', '9', NULL, 'F', 1, '14234', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lammerding', 'Katelyn', '057a50b9-d55a-4d50-b9a2-a89cb9ea608e', 'BNBT', '12', NULL, 'F', 1, '22082', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Clark', 'Paige', '059a963b-e701-4e5f-8d01-c8d25a1eba21', '9MD', '9', NULL, 'F', 1, '23151', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Omondiagbe', 'Pascal', '059f0ce9-4b84-4208-8d3e-8a6c1de79011', '9SC', '9', NULL, 'M', 1, '14253', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Eskander', 'Marina', '05d015a4-119a-40b4-8cf9-8f3360d14671', '7PM', '7', NULL, 'F', 1, '20220', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Walsh', 'Gwyneth', '0619df2d-55bf-4807-87d9-ddd39cce3e56', '9BR', '9', NULL, 'F', 1, '23024', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Griffith', 'Luke', '0634d415-9cbc-4512-b9e7-228fe5131e96', '8RS', '8', NULL, 'M', 1, '22106', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Xu', 'Yining', '06793c69-16c4-4e96-8dfd-a24bf8093ac5', '7BL', '7', NULL, 'F', 1, '16313', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Konishi', 'Reiji', '06c7a91f-e19c-44f1-95cd-bd385e530fa4', 'SCBY', '11', NULL, 'M', 1, '23477', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cho', 'Joshua', '06ff1e62-977e-4c78-8ed3-9bf0d96da39c', '5r13', '5', NULL, 'M', 1, '18297', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wang', 'Qingxiao', '078297a3-ebcb-4984-acde-26d8d3f0ebbb', '10LI', '10', NULL, 'M', 1, '23526', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Wilson', 'Dominic', '07847226-8f42-4e2a-b4cd-7b1c3130a40d', '1R4', '1', NULL, 'M', 1, '22342', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Zhang', 'Isabella', '0798ab85-5616-4e3e-80f3-51d88f4864a2', '7PM', '7', NULL, 'F', 1, '17275', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Coulbeck', 'Levi', '07b52da7-783b-4c4f-b9c1-564910505a93', '1r3', '1', NULL, 'M', 1, '23226', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Rodwell', 'Aysha', '07d0b23b-f747-4929-9fed-723adec89f4c', '6r15', '6', NULL, 'F', 1, '18275', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Mun', 'Daniel', '080e2d54-424c-4190-86b3-7b7d14f812e9', '10SN', '10', NULL, 'M', 1, '14199', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Pellow', 'Samuel', '08374c01-d7aa-45e1-8e31-3f46e12cd61b', '6r15', '6', NULL, 'M', 1, '17285', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Indrawan', 'Nicholas', '085f6f12-6d4d-4b68-9b98-f2f85d860bbc', 'SCVT', '12', NULL, 'M', 1, '22092', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Galaz Duarte', 'Valeria', '086a7770-60c6-4cba-ac44-0170abb07eba', '9CN', '9', NULL, 'F', 1, '22110', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Collier', 'James', '087d9e15-b5a4-4196-b97d-592a77cbe08b', 'WNBH', '13', NULL, 'M', 1, '19051', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Qiao', 'Sarah', '0894fc2d-c2de-41e7-8fc2-0c409a9a7b1d', 'SCJH', '11', NULL, 'F', 1, '33503472', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Mullen', 'Lucy', '09187418-a97c-4aa0-9aa6-a43a17aeb0e1', '10GA', '10', NULL, 'F', 1, '22060', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Braam', 'Mila', '091f450c-1450-4411-8b85-dff350660d1c', '1R4', '1', NULL, 'F', 1, '22288', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Malcolm', 'Gracie', '09715f4f-7ec7-4397-90de-0a50db4a97fb', '4r10', '4', NULL, 'F', 1, '19231', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Malcolm', 'David', '0995a0ac-e64f-4007-b8f7-bf3c85c62fa2', '10LI', '10', NULL, 'M', 1, '131370', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Hansen', 'Kelsy', '09a547ff-c8eb-4e10-b326-3460345f8d60', '10LI', '10', NULL, 'F', 1, '22103', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Joseph', 'Lily', '09a7d534-e138-4e98-a01f-c605a422931f', 'WNWT', '12', NULL, 'F', 1, '18029', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cadigan', 'Tessa', '09adab31-2f7f-406b-a1af-0368e4be696a', 'SCSO', '12', NULL, 'F', 1, '20021', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Jamieson', 'Isla', '09b40be4-6deb-4ebb-9534-2984d67ed004', 'BNLH', '13', NULL, 'F', 1, '23109', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Vlasin', 'Gloria', '09c0a580-007b-4451-ae46-e88acd4afd92', 'SKCG', '13', NULL, 'F', 1, '17150', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Sibley', 'Bryce', '09f4e310-d18d-4d92-9962-58b40fe7d3d6', 'SKON', '12', NULL, 'M', 1, '20126', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Mo', 'Jinhong', '0a58931c-57f9-492d-9476-9eebc121a7c7', 'WNCI', '13', NULL, 'M', 1, '20196', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Currie-Cook', 'Josh', '0a69d265-9286-4421-8f82-27664bc4ba98', 'BNHK', '12', NULL, 'M', 1, '22126', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Sainsbury', 'Sophie', '0a88d1fe-c128-4a20-9c6a-ebe67473e635', 'SKON', '11', NULL, 'F', 1, '33503415', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Stuart', 'Benjamin', '0ac53df0-9fef-4386-b98e-c6f9bf99e5ea', '8JF', '8', NULL, 'M', 1, '16188', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Zhao', 'Ruth', '0acd20ed-da68-4c1e-ac55-b7ddc372c410', '10GA', '10', NULL, 'F', 1, '131383', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Hendry', 'Mia', '0acf3a1b-d12d-4e8f-bd57-5cfd440e5369', '3r8', '3', NULL, 'F', 1, '20226', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Padiernos', 'Daniel', '0af46819-58a6-4d1a-83d4-af13c04b9c80', '6r14', '6', NULL, 'M', 1, '17295', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Lal', 'Nikhil', '0b0b3092-f851-4804-9201-748284c0970b', '9CN', '9', NULL, 'M', 1, '17306', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ikeda', 'Mei', '0b40bd07-ef54-44ad-abb3-8bab05afba0b', '10LE', '10', NULL, 'F', 1, '23001', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Parker', 'Lois', '0b69d72e-a6fd-41d9-9a48-4f109c7a6924', 'SKON', '12', NULL, 'F', 1, '22054', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Trieu', 'Jennifer', '0ba660f2-ff59-4cf7-9c92-d3993d59353c', 'BNBT', '13', NULL, 'F', 1, '14176', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Siddall', 'Kiera', '0bb268c3-be2b-4490-a1f6-8c3210054995', 'BNGT', '13', NULL, 'F', 1, '19071', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Andales', 'Kareem', '0bed9730-9c4e-495c-9632-6dbd86b4a57d', '10GA', '10', NULL, 'M', 1, '22159', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ballinger', 'Cody', '0c01c2d5-441e-4885-ad5e-d1d7cd40235f', '8EL', '8', NULL, 'M', 1, '23166', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tuiloma', 'Sakalia', '0c3f0ea8-027e-45d6-a88d-602f75dfec4b', 'BNLH', '12', NULL, 'M', 1, '22090', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Stevenson', 'George', '0c890705-5e1e-4672-a126-4d219800081c', '1r3', '1', NULL, 'M', 1, '23189', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Turner', 'Violet', '0c91db29-a1d3-4f2f-bdb6-b84ef8b35b67', 'WNNL', '11', NULL, 'F', 1, '21155', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ju', 'Jay', '0ca6825d-7757-40bc-908e-062e83dccb63', '10GO', '10', NULL, 'M', 1, '20072', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Chiu', 'Julie', '0d0aa56c-4dbf-4eed-b0d9-7475a472d7e2', 'WNWT', '11', NULL, 'F', 1, '13006', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Rashbrook-Field', 'James', '0d6cce47-df43-4a98-a16f-886bc465698d', 'SKMA', '12', NULL, 'M', 1, '18046', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Gee', 'Katelyn', '0d816285-c69b-46ac-8419-fb3f1987cf77', 'WNNL', '12', NULL, 'F', 1, '20160', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cherry', 'Paige', '0dc19844-86a8-46e1-8e35-58bcad5782f8', '10LN', '10', NULL, 'F', 1, '21033', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Green', 'Emma', '0df418e4-25f8-49fb-94a6-ff246762d329', 'BNLH', '13', NULL, 'F', 1, '33502719', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lu', 'Mia', '0df5d3fb-d189-4d73-8c27-c78fa79cfa8f', '8RS', '8', NULL, 'F', 1, '16233', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Greig', 'Micah', '0df7d83c-03a4-4c59-875d-15ca19d29d80', '10LI', '10', NULL, 'M', 1, '15193', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hung', 'Abigail', '0e8594c9-5077-4eb0-b01a-c077620eeef5', '5r12', '5', NULL, 'F', 1, '18305', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Le Roux', 'Maia', '0ea08702-c3e2-4b2c-bf08-80a116edc06d', 'SCVT', '12', NULL, 'F', 1, '22354', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kim', 'Keonwoo', '0ec2f264-9ac6-4cf4-b099-0ac43c1bc5a6', '1r1', '1', NULL, 'M', 1, '23212', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lawrence', 'Anniek', '0ee45d58-73ce-4ed1-b83d-2f42d816791c', '1r3', '1', NULL, 'F', 1, '23411', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lu', 'Tracy', '0f39a2a9-664d-40dc-868c-8e92ac5967de', '7BL', '7', NULL, 'F', 1, '20437', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Broekman', 'Lee', '0f5c9a2e-8063-42ea-a63d-2f94515ee306', 'BNHK', '12', NULL, 'F', 1, '23162', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Crocker', 'Elise', '0f7712d6-28e8-4ed0-95d5-8e085a1d4ff9', '7PM', '7', NULL, 'F', 1, '16270', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Han', 'YiZiXuan', '0f8f556e-7123-4456-8baf-690051d5171f', '6r14', '6', NULL, 'M', 1, '18274', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ji', 'Jiale', '0fa9d40c-f8d9-4f28-b592-0acc3ee45c34', 'SCVT', '11', NULL, 'M', 1, '23489', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Prakhongthanaphan', 'Rakkhun', '0fd94bb9-4439-4b1d-973c-1ff807c8b868', '8EL', '8', NULL, 'M', 1, '23241', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Villaseca Chacon', 'Izzy', '0fe5ef18-e755-431d-a71d-57f021cb8b91', '9CN', '9', NULL, 'F', 1, '23025', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Si', 'Zoie', '104817cc-9e88-4fba-af51-bef62a0af41f', '3r8', '3', NULL, 'F', 1, '20251', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Wong', 'Joseph', '105cc601-f3f4-4111-bbe9-3fc40e48e891', 'BNWN', '13', NULL, 'M', 1, '33502450', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Higgins', 'Angelique', '1069a97d-318c-461b-9e9b-d7b405f3859b', '3r8', '3', NULL, 'F', 1, '21206', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Mattingley', 'Abigail', '108927bc-1a2b-4de2-891e-051f3af0c576', '1r3', '1', NULL, 'F', 1, '23201', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Rodwell', 'Huxley', '108eb603-0030-44bf-b910-0400e5189eb0', '4r11', '4', NULL, 'M', 1, '19453', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Yip', 'Nathaniel', '10977ad1-3789-48d9-ae34-5669a3696d49', '3r9', '3', NULL, 'M', 1, '21241', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Nashed', 'David', '10be34e0-fc5c-45b3-a0c2-0fc280261bc6', '10GA', '10', NULL, 'M', 1, '20105', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Yiannett', 'Saskia', '10cdc345-3879-4eee-8cf2-170df7d44ac2', 'SCMR', '11', NULL, 'F', 1, '23438', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Huijsamer', 'Kaylin', '1124a861-69a7-4b2f-88d3-d4e9fa93be44', 'SKMA', '11', NULL, 'F', 1, '19021', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Basiuk', 'Mikhail', '11383766-027c-44a6-93e0-42da0b8dca51', 'SKNB', '12', NULL, 'M', 1, '22153', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wang', 'Shinlan', '11facf32-fd19-4687-9c4e-ecb4c4172b80', 'SCMR', '13', NULL, 'F', 1, '14188', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Gomez', 'Leo', '12341073-e58a-49a3-9510-b1c8aae3ecd3', '1r1', '1', NULL, 'M', 1, '23217', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ma', 'Thomas', '12810eda-361c-45c1-beb0-d099a2a7396d', '3r8', '3', NULL, 'M', 1, '21216', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Chan', 'Ryan', '12860522-b4e1-4a57-9c7c-1b938141998c', '10GA', '10', NULL, 'M', 1, '20026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Read', 'Jasper', '129c814c-ea7f-4c31-9743-3a4ce7356e3e', '6r14', '6', NULL, 'M', 1, '17289', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Hurren', 'William', '12b42e72-d4a0-434d-8686-9a4261f3b813', '6r15', '6', NULL, 'M', 1, '18306', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Falconer', 'Hannah', '12b9d4a8-e87c-4140-a846-167638b994ee', '9CN', '9', NULL, 'F', 1, '18286', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Robinson', 'Caleb', '12e3d1fd-381f-40c8-84b7-23ec19d3fdc7', '10GA', '10', NULL, 'M', 1, '20164', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Wang', 'Cooper', '1360c5c4-211d-4ed8-8d43-2e8827871863', '7PM', '7', NULL, 'M', 1, '23020', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Seo-As', 'Faith', '1396a76b-24e0-4b32-a79b-e94568711cf8', '2r7', '2', NULL, 'F', 1, '22333', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Trethowan', 'Tahlia', '13aa7d1b-2092-4867-bc9b-5627fda1d048', '6r15', '6', NULL, 'F', 1, '18324', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Kim', 'Oliver', '13b536ca-6eb4-4b1b-8188-e2a9724ef778', '8JF', '8', NULL, 'M', 1, '15370', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Montenegro', 'Kirby', '13cc5f0f-ab45-43be-b159-516e2de13206', 'BNLH', '12', NULL, 'M', 1, '17314', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lee', 'Donggeon', '13f690cc-24ea-4f37-882d-24377dc97e57', '4r10', '4', NULL, 'M', 1, '23003', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Jun', 'Esther', '1410f730-081d-4182-8cd8-45af736fc08a', '9MD', '9', NULL, 'F', 1, '18287', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Huang', 'Maddison', '14ac7e4c-f85e-4a95-bd28-11b7bda52e88', '3r9', '3', NULL, 'F', 1, '20227', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Molina', 'Aliyah', '14cfbf54-a834-4971-a221-0edcb1e15610', '2r5', '2', NULL, 'F', 1, '22323', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Yassa', 'John', '153ffb47-70b1-43ba-8d1a-70fd34ddc5b6', 'WNAN', '12', NULL, 'M', 1, '21054', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Smith', 'Ethan', '1614f270-c8b2-4738-9ded-d6dc269bc12e', '10SN', '10', NULL, 'M', 1, '22033', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Cooper', 'Levi', '1615442f-752f-4acc-b78f-49e2d8212f06', '1R4', '1', NULL, 'M', 1, '22297', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Urban', 'Aidan', '16585908-80bd-4518-805e-0e71b869b735', 'SKMA', '11', NULL, 'M', 1, '19040', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Drake', 'Sophia', '169114a8-6094-4b77-a1a1-ddd1571c2cbf', '9FR', '9', NULL, 'F', 1, '21047', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cowan', 'Tiare', '16b1d742-4e17-4ad4-b924-cc9330fcb56e', 'SKCG', '11', NULL, 'M', 1, '23144', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gou', 'Stephen', '16de8877-86bd-45fc-9595-af572a079679', '1r3', '1', NULL, 'M', 1, '23216', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gilroy', 'Zara', '17004168-695d-4542-a4b1-f759ebaa64d6', 'SCSO', '12', NULL, 'F', 1, '18023', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Boaru', 'Estera-Daniela', '17128439-b4d9-41d9-83fa-78c188f3a7c4', '9CN', '9', NULL, 'F', 1, '19203', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Fujikawa', 'Haruto', '1725559f-c630-4134-b377-518b3f355c3f', 'SKNB', '11', NULL, 'M', 1, '23253', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Carter', 'Zofeya', '173f2e36-a47c-4f31-8e7c-51501f397dc0', 'SKMA', '11', NULL, 'F', 1, '21030', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Antoun', 'Sandra', '175e0c78-5bdf-41c1-83d0-002a0aac9362', 'SKME', '11', NULL, 'F', 1, '19166', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hung', 'Lucas', '175e2d62-0a53-4488-ac76-52fd9c47aaab', '8RS', '8', NULL, 'M', 1, '15359', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ramirez', 'Audrey', '1768578a-1412-4cbf-a760-7269572b718e', '5r12', '5', NULL, 'F', 1, '20246', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Palmer', 'Lauren', '177b7022-7943-4666-ad28-82c122383313', 'BNGT', '12', NULL, 'F', 1, '22164', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Turner', 'Alex', '17abbd82-746c-4127-bab4-3c397ebbbb0e', 'SCSO', '12', NULL, 'M', 1, '18057', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Sankey', 'Molly', '17b1a240-454e-48b4-9e19-41290ae113d4', 'WNWT', '12', NULL, 'F', 1, '20122', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Siose', 'Tyrus', '17bad50c-685a-4419-a3a1-646a41a46278', '3r8', '3', NULL, 'M', 1, '21231', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Chase', 'Connor', '17eae14b-c783-4454-9396-b779df043df3', 'WNCI', '13', NULL, 'M', 1, '17033', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wirattanachaimongkol', 'Keira', '180021c5-76fc-4e61-88c4-853a34be4d89', 'BNHK', '13', NULL, 'F', 1, '22363', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Stewart', 'Finn', '18651dad-9263-4a20-a2cc-81fad695a9ca', '9BR', '9', NULL, 'M', 1, '21143', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Scott', 'Hannah', '18c1cbfb-b01b-4249-bf9c-4e92a4cf41a0', 'BNHK', '12', NULL, 'F', 1, '18049', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Dhlakama', 'Divine', '18c62dfc-258f-43ff-9e8a-9add4e363aea', '9MD', '9', NULL, 'F', 1, '23440', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bi', 'Joycey', '18c96f63-a608-49ef-9550-d51e51f72742', '8EL', '8', NULL, 'F', 1, '22149', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Shin', 'Isaac', '18df63a7-6cd8-49d7-b8a1-067f752eeb8a', 'WNNL', '11', NULL, 'M', 1, '18051', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Ngu', 'Cherry', '190f897d-babe-4d80-b38c-4cc90eec97b5', '8JF', '8', NULL, 'F', 1, '15330', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Stephen', 'Adina', '19522f72-8e62-4f1a-80b7-1a563117683a', '9SC', '9', NULL, 'F', 1, '23042', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ayers', 'Seb', '1963e930-d681-4886-8d04-2003aa9cb996', 'WNNL', '12', NULL, 'M', 1, '22156', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yeo', 'Sarah', '196bf95e-28fb-4842-afe9-b106319ea553', 'SKME', '12', NULL, 'F', 1, '33503115', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Regnault', 'Susannah', '19a00f90-77f8-427a-8737-12ece607dc83', 'SKMA', '11', NULL, 'F', 1, '23056', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Xu', 'Angela', '19bf2f75-b85c-4131-be89-6821006021e2', '4r11', '4', NULL, 'F', 1, '19245', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Taylor', 'Jonty', '19dd01bd-ac4a-440d-9e07-ca627e6617c2', 'WNWT', '12', NULL, 'M', 1, '18055', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Deighton', 'Olivia', '1a2ff48b-c59e-4b81-9c9a-b9ac79375f18', '6r15', '6', NULL, 'F', 1, '22301', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bi', 'Joylyn', '1a429a2d-894b-4141-87fe-7270a53c0ada', '10GO', '10', NULL, 'F', 1, '22150', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ho', 'Alicia', '1aaf7075-761b-49e5-8986-9e620595cef3', '7BL', '7', NULL, 'F', 1, '16259', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hunt', 'Mieke', '1acb1fbf-f5f6-435e-8124-a702f67b43da', 'BNGT', '13', NULL, 'F', 1, '19057', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Pomare', 'Neve', '1aea566b-b5e4-4a94-afc9-47b65b26a2d2', '6r14', '6', NULL, 'F', 1, '18317', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Rin', 'Lydia', '1aebc0ae-9191-42bf-8d77-ce49e888f167', '1r1', '1', NULL, 'F', 1, '23193', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Harrington', 'Samuel', '1b06a128-5dcb-47e9-a2f2-a05fe9775b6d', '9FR', '9', NULL, 'M', 1, '15260', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lowe', 'Harry', '1bba9f68-cb41-455f-889b-9057655af4fe', '9FR', '9', NULL, 'M', 1, '21098', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Yappa', 'Naomi', '1c3a461f-22a8-47ff-97ff-51ba870f137a', 'SKHG', '11', NULL, 'F', 1, '23014', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Read', 'Theo', '1cfdb8eb-a412-4979-87bd-077a0b3af175', 'SKMA', '11', NULL, 'M', 1, '16176', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Smith', 'Conor', '1d002ce7-3158-431b-83cf-e5c24a58db00', 'SKHG', '13', NULL, 'M', 1, '18335', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lester', 'Stephanie', '1d2389d0-58cd-4e0a-9c3c-65c7c2e4792a', '9MD', '9', NULL, 'F', 1, '21095', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Birse', 'Amira', '1d31d739-4b4d-4e6a-991c-2ad6a636d19d', 'WNAN', '11', NULL, 'F', 1, '21017', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Schrier', 'Rachel', '1d6eb0d9-67e2-4237-aa08-b6b059c61cc2', 'WNBH', '11', NULL, 'F', 1, '21131', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Faalogo', 'Josh', '1d879913-001b-4429-8271-5da47fffa318', '7CO', '7', NULL, 'M', 1, '16315', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Li', 'Alfred', '1d8e027d-3e63-452d-9c88-d3a56af69c2f', '4r10', '4', NULL, 'M', 1, '19228', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Dodd', 'Anastasia', '1d9a0bcb-e29b-4947-9f11-9cf48ded85a3', '9BR', '9', NULL, 'F', 1, '14544', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Elliffe', 'Benjamin', '1df132d1-267a-4e46-9e6c-dc9b305b3313', 'SCSO', '11', NULL, 'M', 1, '23132', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Halliday', 'Nate', '1e316402-bf89-46cb-85de-aa8f3c742ddc', 'SCED', '12', NULL, 'M', 1, '33503149', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Foster', 'Xavier', '1e4a3a99-f3c1-4907-a76b-e3357dd3b5ea', '6r14', '6', NULL, 'M', 1, '17300', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Aldridge', 'Ben', '1e7b7c64-77cf-4022-8e74-6f7e24b7d3ce', 'SCSO', '12', NULL, 'M', 1, '22160', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Watson', 'Xavier', '1eb1deb5-1097-4c8c-8dcd-39efabdb2ae1', 'SCBY', '13', NULL, 'M', 1, '20146', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Omondiagbe', 'Joanna', '1ecc8fc9-37db-4c7c-a43b-872153443b1b', '6r15', '6', NULL, 'F', 1, '21336', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('O\'Brien', 'Hunter', '1f00ddf2-edef-424c-9cb4-fbd67459dceb', 'SKON', '12', NULL, 'M', 1, '22059', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Giddings', 'Ryan', '1f3b4051-cbfd-4c8d-8da0-f02441b398d3', 'BNHK', '11', NULL, 'M', 1, '33503204', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Denne', 'Andrew', '1f4ec02b-37d9-421e-86a2-dca5109e45f0', 'WNNL', '12', NULL, 'M', 1, '22121', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Jiang', 'Aidan', '1f511736-8995-42a2-885b-12a55d974482', '9MD', '9', NULL, 'M', 1, '16180', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Brown', 'Zoe', '1f833472-d8a7-466d-ba0f-43dadc342c17', '9SC', '9', NULL, 'F', 1, '18288', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Harris', 'Jade', '1fe19b3c-f9c6-4582-866e-2c998b767993', 'WNMK', '11', NULL, 'F', 1, '21069', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Shi', 'Emmett', '1ff3b108-eb11-408f-b320-006263785519', '5r13', '5', NULL, 'M', 1, '18319', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Waines', 'Caleb', '2072abdc-4672-465e-aa12-26f8bb340a2d', '5r13', '5', NULL, 'M', 1, '19242', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lee', 'Ethan', '2075e369-ab74-4086-9db9-87227cd5691c', 'WNAN', '12', NULL, 'M', 1, '23248', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ho', 'Hannah', '208c5fc8-9383-4d28-be3c-b4eaef91ceaa', '6r15', '6', NULL, 'F', 1, '18281', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gu', 'Gabby', '209c207e-d991-4f9c-9baf-526a008bb0ae', 'SKME', '11', NULL, 'F', 1, '33503469', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('George', 'Chaeus', '20ff169c-48da-4526-b6dc-8de4f5cc2e67', '3r9', '3', NULL, 'M', 1, '21204', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('So-Beer', 'Miya', '2106b16a-5747-467a-9a11-deb6f63cc7b9', 'SKNB', '12', NULL, 'M', 1, '33503147', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ivar', 'Gabe', '213f626f-6cb7-4f4f-84e0-d764cabd624b', 'SCVT', '11', NULL, 'M', 1, '23111', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Waubke', 'Amelie Viktoria', '21714c10-6a09-403d-b34b-0616f287379b', 'SKMA', '12', NULL, 'F', 1, '23250', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Mitchell', 'Edward', '21a1d87b-53b7-454f-b5ca-1910a390536e', '1r3', '1', NULL, 'M', 1, '23432', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Cotter', 'Emerson', '220db46d-fb72-4757-8bba-27198557a27e', '4r10', '4', NULL, 'M', 1, '19215', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Roberts', 'Abi', '2248f6a9-1f08-4f83-90f8-9ce8c50fe30a', 'BNBT', '11', NULL, 'F', 1, '21125', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Jack', 'Asha', '227a99d7-d19e-415b-af66-b44abfb87b4e', '4r10', '4', NULL, 'F', 1, '19224', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('van Biljon', 'Pieter', '22972998-5af6-496c-9ef4-57f287f0a308', '10LN', '10', NULL, 'M', 1, '20139', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Boyd', 'Lewis', '229e4419-1a68-45b4-a36e-50cfbe1bff85', '3r9', '3', NULL, 'M', 1, '20212', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Jennings', 'Anja', '22adae30-1561-4302-a7b3-9993e828a60c', '6r14', '6', NULL, 'F', 1, '19466', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Surrey', 'Joseph', '2301096b-5f7f-4b95-b0f5-59792390b6b4', 'BNWN', '11', NULL, 'M', 1, '21148', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('O\'Connor', 'Mollie', '23056c9c-7ce4-4e93-ab73-d3c503289fbd', 'BNLH', '11', NULL, 'F', 1, '23066', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Alexander', 'George', '235a8008-4ff5-47df-8fde-cf02bfe32734', '10SN', '10', NULL, 'M', 1, '131381', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Carter', 'Tom', '2367f8aa-433f-42d4-97a8-68d54904efbc', '10SN', '10', NULL, 'M', 1, '22138', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Choi', 'Issac', '23ae28b1-1212-4d6d-9996-0458e4f3291e', '4r10', '4', NULL, 'M', 1, '19214', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bracefield', 'Joshua', '23e65ebc-09f2-43fe-8f24-102a64a55503', 'BNBT', '12', NULL, 'M', 1, '22146', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Griffith', 'Jordan', '244299f6-3f03-46aa-a42c-1a0e5d4d5fca', '10LN', '10', NULL, 'F', 1, '20047', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wilson', 'Carter', '244adb38-298d-40cb-904a-51fbf5cda6f5', 'BNWN', '11', NULL, 'M', 1, '33503470', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Roberts', 'Josh', '2461f41f-fc9b-4990-b5a2-3725eb743a40', '9CN', '9', NULL, 'M', 1, '23053', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Goddard', 'Zoe', '253e557b-0715-4854-9dce-e9bd4886400e', '7BL', '7', NULL, 'F', 1, '16314', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Jones', 'Johnny', '2546b4a2-5fc9-4910-9615-cd96a63efe16', '9SC', '9', NULL, 'M', 1, '23107', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Pijpker', 'Stephanie', '2572f1a8-446a-46d2-8d0a-7cdd0bb070ae', '5r12', '5', NULL, 'F', 1, '20442', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Capill', 'Caleb', '25ad11a6-076b-4e5b-90c4-519d0eea86ea', '9SC', '9', NULL, 'M', 1, '22140', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cooper', 'Zion', '260cfc8d-801e-4157-b473-3f874a72da5a', 'BNHK', '11', NULL, 'M', 1, '18416', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gui', 'Lailai', '266c98ca-bc90-494c-aab5-2f3361a40789', '8RS', '8', NULL, 'M', 1, '23436', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('McKie', 'James', '2678a723-c2a9-4f5f-a1e4-37d5a682473a', 'SCMR', '12', NULL, 'M', 1, '22069', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Ofa', 'Faiva', '269cb758-d736-40c3-8202-4aea5d9d467b', 'BNLH', '11', NULL, 'F', 1, '19032', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Qin', 'David', '26d3b93a-ce1a-4b2a-a1cc-079d7e2834ec', '8EL', '8', NULL, 'M', 1, '23560', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Stander', 'Yoné', '26ef1c94-a293-4442-a253-638b05e64463', 'SCJH', '11', NULL, 'F', 1, '15197', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Reynolds', 'Mya', '27703e8d-0641-4f0e-9331-d9f6214d1a21', '3r8', '3', NULL, 'F', 1, '20248', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Townshend', 'Cassidy', '2777389c-7bf7-41f0-9584-6f20b7f634ec', 'WNMK', '13', NULL, 'F', 1, '33502593', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Song', 'Haram', '27809ca0-936b-4ce9-8589-5572e78c1b3b', '7PM', '7', NULL, 'M', 1, '19193', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Itofele', 'Marcel', '2797195d-da02-4cc2-8517-a52fbd2e81d3', '1R4', '1', NULL, 'M', 1, '22385', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Chan', 'Ethan', '27ae0e4b-836c-48d0-a9c5-22167ec1d2a3', '7BL', '7', NULL, 'M', 1, '23156', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Nadarajah', 'Jeni', '27bb6866-3722-417c-a066-3b634813e35b', '7BL', '7', NULL, 'F', 1, '16305', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Faalogo', 'Christian', '27fb6e8c-4c0b-489b-a441-5450607effed', '10LE', '10', NULL, 'M', 1, '131380', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lee', 'Yejun', '281745a9-b854-4a4a-a3d0-7b1e19516c2f', 'WNNL', '13', NULL, 'F', 1, '20173', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Savage', 'Cairo', '283747c1-ea8e-4d49-b227-ae3009ee3550', '9CN', '9', NULL, 'M', 1, '21178', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Goto', 'Elisha', '284abda9-6b9f-47e4-ab1f-27b84a6dc877', '7BL', '7', NULL, 'M', 1, '17277', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('McKenzie', 'Olivia', '28662e8f-c172-4127-b743-2f6aa13c7fa2', '9BR', '9', NULL, 'F', 1, '23080', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Thwaites', 'Cypress', '28feec77-3944-4e6c-8044-af5362e60267', 'BNHK', '12', NULL, 'M', 1, '22025', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Anderson', 'Leila', '2936c5db-9bbe-4225-a64e-f82227cbb152', 'SCED', '11', NULL, 'F', 1, '23171', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gort', 'Riley', '293890f6-f2d2-4b9f-8751-4887de6fa405', 'BNGE', '11', NULL, 'M', 1, '33503162', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Verd', 'Daniel', '29413b7e-1843-4653-9173-c8566ab81a7f', 'SKON', '11', NULL, 'M', 1, '21156', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lawrence', 'Harper', '2954889a-d183-49ab-a083-fb5a1bcce9ae', '3r8', '3', NULL, 'F', 1, '23412', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Penno', 'Thomas', '296feb90-1426-4057-824c-76e5d60a7503', 'SCJH', '11', NULL, 'M', 1, '19170', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Smith', 'Adin', '29953b51-f03e-46dc-9e87-f9a4bd5872b9', '1r3', '1', NULL, 'M', 1, '23191', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Li', 'Pumo', '2995845b-61f8-426f-b8ad-33607c6676a2', '1r4', '1', NULL, 'M', 1, '23232', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Trengrove', 'Mary', '29f50130-af4e-4254-886e-b14ecd6d2c1b', '8CR', '8', NULL, 'F', 1, '22021', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Anderson', 'Aria', '2a3b6659-3a51-4025-82d6-ceaebe6953a2', '1R4', '1', NULL, 'F', 1, '22285', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lovell', 'Benjamin', '2a49c15a-7713-4817-a81a-daf669dd8221', '9CN', '9', NULL, 'M', 1, '23092', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lester', 'Imogen', '2a76427f-11e9-48e4-a867-c0d4f893aafd', 'SKHG', '12', NULL, 'F', 1, '18032', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wilson', 'Joel', '2ac23133-b9d4-4820-9c83-da46e8224dcd', '6r14', '6', NULL, 'M', 1, '17284', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Cornish', 'Jasmine', '2ac60774-1366-475a-9754-ce5ca34fb904', '3r9', '3', NULL, 'F', 1, '21192', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lee', 'John', '2ae617cd-a283-40d5-adea-fd1e6ad4b022', '6r14', '6', NULL, 'M', 1, '23451', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Farrar-Lind', 'Ben', '2af8ef8b-4a9d-4a0d-b7b0-1fe549311e04', 'BNBT', '13', NULL, 'M', 1, '33502738', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Andrews', 'Neve', '2b3c1412-220b-4eed-ba0c-c25bc3f7e5b0', 'SKME', '13', NULL, 'F', 1, '19048', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Stocks', 'Marita', '2b89ed1b-d528-4888-bce8-fde130ee0425', 'SCMR', '13', NULL, 'F', 1, '21146', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Poulsen', 'Ella', '2b924566-11e4-41a6-946b-4d25377b8aef', '8EL', '8', NULL, 'F', 1, '22049', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Mullen', 'Phoebe', '2bbe9c4a-7714-4b05-819c-b0314aeb4214', '7PM', '7', NULL, 'F', 1, '23073', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Dendle', 'Quinn', '2bfa8bb8-6aa8-4883-b72e-17ec60e3145d', '8CR', '8', NULL, 'M', 1, '22122', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Na', 'Tim', '2c19f0a1-3d4d-4ee7-bbd0-7cf3695875fb', 'BNHK', '12', NULL, 'M', 1, '18044', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Goodall', 'Caitlin', '2c7c359e-31a3-4d93-afaa-3c1f4c683180', '1R4', '1', NULL, 'F', 1, '22312', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Zhang', 'Tiantian', '2cc136e5-d9f1-462a-a799-d47dbac8ea85', '8RS', '8', NULL, 'M', 1, '22003', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Du', 'Avery', '2cfdbc0a-5a17-4443-9299-a34283e02518', '2r5', '2', NULL, 'F', 1, '22305', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Millington', 'Jack', '2d06c2a6-c1a0-4142-b535-6bcac74e02b5', '10LE', '10', NULL, 'M', 1, '20240', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Si', 'Zechariah', '2d150065-be5b-4ac7-b4bb-af77fe6aede4', '5r12', '5', NULL, 'M', 1, '18320', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Shiferaw', 'Alem', '2d4d9eab-860c-42d1-8912-3330a36333dd', 'SKNB', '12', NULL, 'M', 1, '22034', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Varghese Iyjo', 'Aaron', '2d7b619b-5355-49f6-9b1d-d589bf929534', '9BR', '9', NULL, 'M', 1, '14241', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Deighton', 'Emily', '2dc3232e-6db9-49ab-be40-b503663b380c', '9CN', '9', NULL, 'F', 1, '22123', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bayford', 'Jaz', '2dd496cc-c623-4f4a-be28-0e0add3f5beb', 'WNNL', '12', NULL, 'F', 1, '22151', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tinga', 'Antonia', '2de923e8-89bd-4510-af21-f5e9f13e20bf', 'SCED', '12', NULL, 'F', 1, '22024', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Nathan', 'Elisha', '2e23db27-588b-4f29-aabf-62ddf94d3b59', '5r13', '5', NULL, 'F', 1, '18315', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Harris', 'Zach', '2e38a14e-e9a9-48bc-be89-a9fafdb0345c', '4r10', '4', NULL, 'M', 1, '20222', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Cooper', 'Phoebe', '2e506c3c-5fce-4ce8-a544-a34cc0ae399f', 'WNAN', '12', NULL, 'F', 1, '20032', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('McLintock', 'Breana', '2e6166d2-3d78-4cee-9f57-e3d4a970b41d', '10GA', '10', NULL, 'F', 1, '20094', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Wei', 'Lucas', '2e6444c4-20c3-4d9f-a444-70034a47ebd4', '2r5', '2', NULL, 'M', 1, '21239', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Thompson', 'Elli', '2e716734-d3cd-4d8e-8367-74625359bd02', 'SKHG', '13', NULL, 'F', 1, '19076', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lui', 'Kimberly', '2e81eab6-4ba3-4c85-809a-982ba9de6fb2', '10LE', '10', NULL, 'F', 1, '20082', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Wain', 'Sam', '2f581890-6f3e-4d91-bf80-1b85fd95a4b7', '10LE', '10', NULL, 'M', 1, '20145', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Caldwell', 'Ella', '2f77999a-add8-4443-98da-972ee85ba067', 'WNNL', '12', NULL, 'F', 1, '22143', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yuan', 'Timothy', '30025641-43a1-4059-addc-1a82641a03ad', '9MD', '9', NULL, 'M', 1, '23429', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Tau', 'Kupa', '305efa99-fce1-417e-9fb5-cd38bcfd6230', '7MZ', '7', NULL, 'M', 1, '23037', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Mattheus', 'Jocelyn', '30711b9d-a945-49a4-bc5e-e2b75e8a9efa', 'SCSO', '12', NULL, 'F', 1, '22071', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Edminstin', 'Lily', '30ba86ab-1f99-4ac4-99e4-13a681e8b835', '3r9', '3', NULL, 'F', 1, '21198', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hikuroa', 'Tiaho Maia', '30ccea53-130f-49c7-ae81-a48c18100d5c', '2r5', '2', NULL, 'F', 1, '22314', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('McKinnon', 'Caleb', '30da7648-2235-4db1-9d51-9eec9f6b3601', '10LN', '10', NULL, 'M', 1, '14013', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Jordan', 'Libby', '30e4ca92-1378-47e9-bcf0-7618fb71147d', 'WNMK', '12', NULL, 'F', 1, '33503163', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Aratani', 'Koei', '31998d0e-e784-4605-a034-0b1285a02034', 'SCED', '12', NULL, 'M', 1, '19416', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pomare', 'Ollie', '31c46e1a-da86-43a8-af62-161307d086f9', '8CR', '8', NULL, 'M', 1, '16205', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Kim', 'Taerim', '31d5ab6d-4eec-4a0c-bc58-67d6d3e8afa1', '5r13', '5', NULL, 'F', 1, '18308', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Saruchera', 'Sarah', '32bae767-e656-41cc-b644-a5536abd2fa0', 'BNBT', '11', NULL, 'F', 1, '33503483', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Sloane', 'Isabella', '32caccb0-207e-4946-9ff2-8716ddbc46a0', 'SKON', '11', NULL, 'F', 1, '21137', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Dick', 'Keeleigh', '32df3a30-c0c5-484b-99f0-690f8a13463c', '10LI', '10', NULL, 'F', 1, '22120', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tang', 'Xiaotong', '333f8957-1598-4903-a08d-33f90bdca272', 'BNLH', '12', NULL, 'F', 1, '22367', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Xie', 'Jasmine', '3371139f-4aa0-408b-a92b-27f6d9a8ee73', '1r1', '1', NULL, 'F', 1, '23181', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Couperus', 'Caleb', '33bbb62e-ffbf-4e9b-9e69-1592097ead16', 'WNBH', '11', NULL, 'M', 1, '33503416', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Dos Santos', 'Lily', '33e01599-5b9f-4967-ae8e-73e6eb436895', '2r5', '2', NULL, 'F', 1, '21195', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Zhao', 'Nina', '33ff3f02-0ceb-4ebc-b690-4d77d705601e', '9MD', '9', NULL, 'F', 1, '22002', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Jaquiery', 'Hannah', '34108e22-772d-49f2-92c9-12908a46cff7', 'BNWN', '11', NULL, 'F', 1, '23497', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kim', 'Andrea', '3489a8e8-642b-445c-b70b-c7e3708866a8', '5r13', '5', NULL, 'F', 1, '20230', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Li', 'Zhejun', '34b8eaae-6b6d-4d39-969c-ba1621a23cde', 'WNAN', '12', NULL, 'M', 1, '23264', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Ball', 'Lily', '34e638e0-fc88-4f3d-9f22-296e980cfccd', '9SC', '9', NULL, 'F', 1, '23499', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hall', 'Lily-Rose', '355a2597-3da2-463f-a14b-db773f8db0a7', '3r9', '3', NULL, 'F', 1, '20221', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Buckley', 'Rhys', '358fb1c9-3e9f-4dd4-a713-49b77dbe719f', '9FR', '9', NULL, 'M', 1, '15261', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Brown', 'Evie', '35d53c21-7978-453b-bc9c-e9b91fbefb60', '6r15', '6', NULL, 'F', 1, '21189', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Song', 'Yeram', '35f3b077-e4ee-4cdf-869c-d02e65cc601a', '9SC', '9', NULL, 'F', 1, '19201', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Trotter', 'Eli', '360d697e-b7be-45cc-90db-7b60b22fc314', 'SKMA', '11', NULL, 'M', 1, '23031', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Azer', 'Monica', '3667c8ee-4eaf-4916-b656-7cb0e4068124', '7CO', '7', NULL, 'F', 1, '23168', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Eggers', 'Isabelle', '366b40a1-33e1-40c4-a2f6-4f87ddd667e4', '2r5', '2', NULL, 'F', 1, '22306', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hentschel', 'Matthew', '36a1891f-668f-47ed-9e2d-4374af1301b7', '8JF', '8', NULL, 'M', 1, '22100', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gutsell', 'Olivia', '36a8210e-30d5-4a60-b53e-f6868b6fec24', '9CN', '9', NULL, 'F', 1, '23126', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lau', 'Annika', '36d00747-f623-4a99-986e-99ef1f5b6e4f', '10GA', '10', NULL, 'F', 1, '131410', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Xu', 'Jessie', '36d6ce5c-a891-4ce6-8e4c-e1d035a2c731', '4r11', '4', NULL, 'F', 1, '19246', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Gibbs', 'Georgia', '373fde88-c6f4-4127-9c19-bad142178383', '4r10', '4', NULL, 'F', 1, '20182', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wallis', 'Maddie', '37425254-9725-4d6d-8673-97fa3c5fc752', '10LN', '10', NULL, 'F', 1, '131369', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Anggawijaya', 'Rafael', '37448f3d-a361-4e8c-81ef-1bcf34c300c7', 'BNGE', '11', NULL, 'M', 1, '23169', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Li', 'Alina', '3749b62f-54bb-4167-aa18-f353ed3ef415', '10LE', '10', NULL, 'F', 1, '14228', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Garcia', 'Markus', '374ab726-3c50-4374-a25d-b5f6387a55c7', '2r7', '2', NULL, 'M', 1, '22310', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Laufiso', 'Caleb', '37e835be-29d8-4fff-956e-457c5b1a2bec', '7PM', '7', NULL, 'M', 1, '23097', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Rodwell', 'Finley', '37eb8c7f-24a9-4388-94fb-e802decad177', '2r7', '2', NULL, 'F', 1, '21228', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Endo', 'Kanoko', '38a1471b-d79d-407c-85ae-2ba836bd2458', '10LE', '10', NULL, 'F', 1, '23349', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Smith', 'Nathan', '38be9b3c-090c-4989-ab6d-1f323ab7a1b1', 'SKHG', '13', NULL, 'M', 1, '21140', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Maples', 'Amelia', '38e6e00f-f7e1-4f23-9a55-9ad3172bd066', '2r7', '2', NULL, 'F', 1, '21220', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Campbell', 'Vincent', '3906ac52-f4b6-4c63-af09-149ae1334148', '2r5', '2', NULL, 'M', 1, '22291', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bouman', 'Emilee', '394490b4-3ce6-4fd0-9f9f-bb2196aea6d1', '8JF', '8', NULL, 'F', 1, '22147', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Carter', 'Chloe', '397c7b8e-d9f2-4101-a803-99b2bc658a57', 'SCJH', '11', NULL, 'F', 1, '23157', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Palmer', 'Laura', '39ae361f-d58b-4946-8853-5e986028af6c', 'SCVT', '13', NULL, 'F', 1, '15212', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Parr', 'Andrea', '39efd9f9-aef1-42eb-8cf6-f71429e2ccb6', 'WNWT', '11', NULL, 'F', 1, '19154', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Kim', 'Andrew', '3a2ddd2e-d8ab-437d-a591-68641fc406c7', 'BNBT', '12', NULL, 'M', 1, '19172', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lu', 'Symphony', '3a665b87-408f-4316-a719-8251123ebce8', '7MZ', '7', NULL, 'F', 1, '16303', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Pask', 'Ella', '3ace74f2-f343-48a7-9cb0-bb8346fd6983', 'BNWN', '12', NULL, 'F', 1, '14169', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Kuo', 'Joseph', '3adcad47-7a71-4b43-b45d-b1e31d2326a9', '1r3', '1', NULL, 'M', 1, '23434', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Chong', 'Jedidiah', '3ae187ef-e338-427f-9e6f-cfb2fe6ea67f', '9MD', '9', NULL, 'M', 1, '22132', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Konton', 'Yo', '3b06e74d-446a-4a6e-bde2-b9122294b1d1', 'BNGT', '12', NULL, 'M', 1, '19401', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lee', 'Jayden', '3b6f139d-1c5b-4df3-94f2-4389a8b44624', '10LI', '10', NULL, 'M', 1, '23249', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('McKay', 'Peter', '3c02730b-62ab-44bf-9f1d-ca91f4dbbd17', 'SCVT', '12', NULL, 'M', 1, '18042', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Juguilon', 'Yassi', '3c2c1ef7-5225-4249-8e44-762b3d489229', '1r3', '1', NULL, 'F', 1, '23213', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Dos Santos', 'Joshua', '3c5cf9cc-4065-4f52-9afd-a30f8e2892cb', '10LI', '10', NULL, 'M', 1, '16171', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Sikaleti', 'Moala', '3c75b887-d2a2-4d40-9ea0-e85799285544', '10LE', '10', NULL, 'M', 1, '14195', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Cooper', 'Isaac', '3d27d444-2c3b-4afa-a701-d44d9c9fe8be', '6r15', '6', NULL, 'M', 1, '18280', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lim', 'Jeremy', '3d5bdab3-9603-4ab6-8f45-a7e94856373b', '4r10', '4', NULL, 'M', 1, '19229', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Orr', 'Toby', '3d7a78f9-563e-4af7-929a-f7a37cef2c48', '10LN', '10', NULL, 'M', 1, '20109', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Stander', 'Yanke', '3d91b14e-a634-435c-8eb8-517fa03b22b0', '8JF', '8', NULL, 'F', 1, '15304', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Son', 'Aiden', '3db27f0c-ce68-4d9a-affd-71d8bb8a1297', '2r5', '2', NULL, 'M', 1, '21234', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Balakrishnan', 'Kavin', '3de4d3cf-cc9d-4624-a266-87dadc17eb32', 'SCMR', '11', NULL, 'M', 1, '23167', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Park', 'Joy', '3e7ce9f4-d7f0-4708-8209-797e2b7770e9', 'WNAN', '12', NULL, 'F', 1, '20110', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Brindley', 'Izzy', '3ec9def3-724a-4e29-b29d-31d391e830dc', 'WNAN', '13', NULL, 'F', 1, '17025', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mattingley', 'James', '3ee7f104-a13a-4844-985f-8b08c8c8c86e', '2r7', '2', NULL, 'M', 1, '21221', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Garratt', 'Louis', '3ef8708d-9267-46a5-9db9-d32feb40a715', '4r10', '4', NULL, 'M', 1, '19221', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Xu', 'Thomas', '3f89502e-e29f-4cd5-87f6-fea324384bd6', 'BNHK', '11', NULL, 'M', 1, '20189', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Garland', 'Chris', '3fac587d-f05e-4c1b-a32c-8fcba78ec0f1', 'BNGE', '13', NULL, 'M', 1, '21060', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Weston', 'Jo', '3fb17f03-a5c5-4cb4-a46d-f9fa0c9066e4', '7BL', '7', NULL, 'M', 1, '23016', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Head', 'Milli', '3fef8e49-bd2e-4cb3-82b9-5b22148474c9', '10GA', '10', NULL, 'F', 1, '22102', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wang', 'Chris', '3ffeb675-8744-4f6f-b0ca-4e0bff80feaf', '7MZ', '7', NULL, 'M', 1, '23022', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Tyler', 'Sam', '401ec210-1a2a-41bc-92de-845a7a670f53', 'SCJH', '12', NULL, 'M', 1, '22018', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Huang', 'Steven', '4033671c-2ed8-4cef-96d5-6230b379f168', 'WNWT', '13', NULL, 'M', 1, '19326', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Marchand', 'Avi', '40522a28-b484-4a36-bcac-1a1c47883838', '8CR', '8', NULL, 'F', 1, '15377', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Alcayde', 'Jed', '405998cf-80ae-4623-b198-8a9c0c0bf0d7', 'WNBH', '12', NULL, 'M', 1, '18012', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hackney', 'Olivia', '40b53ac7-0519-4a61-bdd3-7e81cc921031', '10SN', '10', NULL, 'F', 1, '20049', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Maumau', 'Lilo', '40b800e0-89c2-4f44-a586-1a4e1d569f7b', '1r1', '1', NULL, 'M', 1, '23413', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Hoffman', 'Julia', '40ded844-38ca-4474-b801-e14695153ae9', 'SCMR', '11', NULL, 'F', 1, '16175', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Irvine', 'Abbie', '410618e8-d2b6-4a1c-8f66-2e6037fcaa12', 'SKNB', '13', NULL, 'F', 1, '21076', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Luan', 'Briana', '4163f076-6637-420b-b485-4554e6065fce', 'BNBT', '13', NULL, 'F', 1, '21100', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Owen', 'Oliver', '417e2cb2-4e7b-418d-83ed-8a0c3e6c0877', '8EL', '8', NULL, 'M', 1, '22178', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Wongsiriphansopa', 'Karina', '418deffd-0d10-4f9d-b32f-53e6d25916db', 'BNGT', '12', NULL, 'F', 1, '22378', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Robson', 'Zoe', '41c30b00-9ac5-4b7c-a8d4-7d99f3b4e320', '4r10', '4', NULL, 'F', 1, '19234', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Cho', 'Nathan', '41d94276-0372-4a45-b9e2-69037c2589f6', '8EL', '8', NULL, 'M', 1, '16246', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Trengrove', 'Esther', '41d9f639-d8ee-42d5-8612-5fd49c9f3923', 'BNLH', '13', NULL, 'F', 1, '20388', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Fenton', 'Jess', '41e0f79f-b715-4be0-a8ec-97c1a2afb5e1', '9FR', '9', NULL, 'F', 1, '14501', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mackey', 'Eden', '421a1dfe-37a6-4a3e-be54-7fe62e0f2d37', '9FR', '9', NULL, 'F', 1, '15221', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Clarke', 'Maddi', '42b5eb52-303f-4859-afa4-170c1bb80402', '8EL', '8', NULL, 'F', 1, '19393', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lawry', 'Cameron', '4306744a-eb62-4885-b9a1-8d25812172b4', '3r8', '3', NULL, 'M', 1, '20232', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Tipple', 'Grace', '433a0abd-97e7-48ad-b81d-3e863ee49fa1', 'SKHG', '11', NULL, 'F', 1, '23033', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Tasker', 'Nathan', '437aac93-6eaa-4363-8a7d-ab7850360a66', 'BNGT', '11', NULL, 'M', 1, '33503155', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Dreadon', 'Aubrey', '4381f844-cd3d-4059-b64c-b608212f7bd7', '1R4', '1', NULL, 'F', 1, '22304', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Given', 'Tessa', '43a95a69-c15e-4513-ad2d-2f18397d2151', 'SCVT', '12', NULL, 'F', 1, '18024', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Malcolm', 'Zoe', '43b86616-02b1-4c75-b04e-07e24228abc8', '7MZ', '7', NULL, 'F', 1, '17273', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Tine Dourado', 'Bianca', '440ab8cb-723b-4443-ade8-440134f805f9', 'SKMA', '11', NULL, 'F', 1, '23265', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Torcuato', 'Francis', '4428415f-3de2-4871-9334-7843521bff85', 'WNNL', '13', NULL, 'M', 1, '21154', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Grieve', 'Isaac', '4493066d-02f0-48cb-9b25-1557c7996ee8', 'WNWT', '11', NULL, 'M', 1, '19145', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Duke', 'Charlotte', '449e4db6-cd4b-4bab-b9de-363e438cdd3c', '8CR', '8', NULL, 'F', 1, '15292', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Prima', 'Margaret', '44ad02d8-e102-41bf-86d5-8f71dacd5e90', 'WNBH', '12', NULL, 'F', 1, '20115', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Taring', 'E J', '44d61068-f132-4e48-b3c0-59401c5073b8', 'SKNB', '11', NULL, 'M', 1, '19039', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Fyfe', 'Nadia', '44e61400-8550-4f2b-9af6-512b3d2f22c8', '4r11', '4', NULL, 'F', 1, '19220', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hutchinson', 'Payton', '44e7f8c3-5076-44d8-8b8e-09db2b7b902d', '8RS', '8', NULL, 'F', 1, '22094', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Collier', 'Millie', '452a73cf-0438-404f-acd1-457457fd1765', '10GA', '10', NULL, 'F', 1, '20030', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('McKenzie', 'Josiah', '4534b83d-389c-4c8c-9774-a351e5c6826b', '10GO', '10', NULL, 'M', 1, '22070', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kench', 'Theo', '455699a6-c9af-47ee-aca9-6aadca49ea05', '2r5', '2', NULL, 'M', 1, '22319', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Minty', 'Jimmy', '4579edad-57d1-4578-a264-ec6e7e8ebbcd', '1r1', '1', NULL, 'M', 1, '23198', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Sankey', 'Poppy', '45dc1917-05e8-40c6-b746-e4cd0019788d', '9FR', '9', NULL, 'F', 1, '23049', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Zheng', 'Matthew', '45f35da0-6d72-4669-92c2-17cc34e74cb8', '9BR', '9', NULL, 'M', 1, '21173', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('van Tuinen', 'Gabriella', '4626dbd1-2e1c-47f0-92b8-4d54d9e2a066', 'SKHG', '12', NULL, 'F', 1, '33503022', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lee', 'Mila', '467108e1-be29-46a5-9b9a-1ec323fa467b', 'BNLH', '11', NULL, 'F', 1, '15251', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kim', 'Julia', '46eb1977-2263-485d-858c-dd76db5d913a', '7MZ', '7', NULL, 'F', 1, '23104', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Owen', 'Sara', '4716696a-a2c1-4466-9ff8-53690c9edece', '9FR', '9', NULL, 'F', 1, '22177', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Sureerattanan', 'Chatnaphak', '47339d2f-bded-4804-a54e-949ae43fc29f', 'BNLH', '11', NULL, 'F', 1, '23550', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Kawaguchi', 'Waka', '4787b050-7189-4632-ba05-c3df569332ba', '10LE', '10', NULL, 'F', 1, '23002', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Weston', 'Kira', '47aabaca-cf39-4cee-bcc0-22a0c0a8b398', '8JF', '8', NULL, 'F', 1, '22010', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hoffmann', 'Jayden', '47bbb4cc-8392-432b-83fe-7c02f47aca3e', 'BNBT', '13', NULL, 'M', 1, '21074', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Overcomer', 'Rejoice', '47d619a7-4eee-4e59-83b2-fccc103a9956', 'SKNB', '12', NULL, 'F', 1, '22165', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Li', 'Adela', '48795e35-fad3-4385-a6f4-9c2e18655d60', '1r1', '1', NULL, 'F', 1, '23207', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cleaver', 'Charli', '48f52c8c-081a-4aee-8b67-d25f08a3ffb9', '10LI', '10', NULL, 'F', 1, '19378', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Clancey', 'Ethan', '490cf40e-8747-4b03-b82d-4ebde4753d14', '3r8', '3', NULL, 'M', 1, '21249', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Capill', 'Asher', '492191af-0402-410b-90f9-f30636ad72db', '3r9', '3', NULL, 'M', 1, '22293', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Smith', 'Senka', '4976a58b-a344-4eba-86e9-ddf8f3ba3c47', '6r14', '6', NULL, 'F', 1, '21232', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Tuala', 'Samuel', '4976b7fa-8b53-4cc7-af05-a56575052c78', 'BNLH', '11', NULL, 'M', 1, '23030', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Yang', 'Bianka', '49a9f5cb-6629-4691-8d4a-a486fe8f490b', '8CR', '8', NULL, 'F', 1, '16207', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Park', 'Joon', '49adad9e-d9bd-40ae-a62d-f14f90b0b8e1', '9BR', '9', NULL, 'M', 1, '22377', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Churton', 'Luke', '49b1fecc-2550-4af6-b52e-04a37928fc62', '8EL', '8', NULL, 'M', 1, '22131', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Kendrew', 'Lily', '49b275b5-2380-4eaf-a533-185daff05080', '8EL', '8', NULL, 'F', 1, '22085', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Drummond', 'Matthew', '4a1a6a89-d722-498c-825b-1c6df13578c9', '3r9', '3', NULL, 'M', 1, '20218', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Walter', 'Ethan', '4a4950af-fd36-4064-8cb2-be6ca6476e9c', 'SCED', '12', NULL, 'M', 1, '22012', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Haywood', 'Chloe', '4a846a17-e974-4631-95df-3238c9bfef96', 'SKON', '11', NULL, 'F', 1, '20409', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Watt', 'Benji', '4afaef86-afdc-4d2e-9e39-8919d3b3ab13', '8RS', '8', NULL, 'M', 1, '21238', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Antoun', 'Peter', '4b29a428-9c76-47ad-87ee-f176be6f2ff2', '8CR', '8', NULL, 'M', 1, '20207', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pijpker', 'Mike', '4b2e93e5-d907-4242-8eb2-cee153928b41', '2r7', '2', NULL, 'M', 1, '21226', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Tseng', 'Jireh', '4b43d2a3-650f-4c11-b56e-f02c49a296a5', 'WNNL', '12', NULL, 'F', 1, '33503157', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Redhead', 'Ella', '4b67713a-b48f-47a0-a3bb-cf5646621511', '9CN', '9', NULL, 'F', 1, '21121', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Wilson', 'Eden', '4b95ad97-e265-4e9b-8da6-def5b935342b', '10LN', '10', NULL, 'F', 1, '131373', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Copland', 'Ella', '4b9f01c1-1622-4434-a902-fdb8e3fc1343', 'WNBH', '12', NULL, 'F', 1, '22128', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Zhang', 'Ella', '4ba2318a-d98a-4533-b7a3-5b7c2491361d', '8EL', '8', NULL, 'F', 1, '16252', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Donaldson', 'Sofia', '4bbbe269-1790-40d1-b6fd-d712e928abcc', '10GA', '10', NULL, 'F', 1, '22174', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Saunders', 'Hannah-Grace', '4bf6037b-f994-4ee3-a620-2361051adfb3', '5r13', '5', NULL, 'F', 1, '19189', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Owens', 'Isabella', '4c038287-ee52-4948-80ce-788600727da2', '7CO', '7', NULL, 'F', 1, '23063', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Shen', 'Isabella', '4c2bc1ef-e2d0-4444-8fbd-8dcf8f40c53c', '1R4', '1', NULL, 'F', 1, '22334', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Hill', 'Alan', '4c5a8432-eef4-4fb9-a36d-32014dca1e81', 'BNHK', '11', NULL, 'M', 1, '33503315', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Giddings', 'Chelsea', '4ccf4387-8099-4c78-a4b2-c0da1705fd15', 'BNWN', '13', NULL, 'F', 1, '33503129', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Javier', 'Arren', '4cdb275c-338b-46a1-8781-dcac1c80c969', 'SCBY', '11', NULL, 'F', 1, '23179', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wang', 'Bella', '4ceaa86b-a27b-479d-8a9d-a46d8d909741', '1r4', '1', NULL, 'F', 1, '23185', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Mattingley', 'Samuel', '4d156889-a1b6-4e48-aadf-e2131d3fde9f', '4r10', '4', NULL, 'M', 1, '20238', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Orr', 'Adelia', '4d31550f-1d80-442b-8eb3-96fe957d586a', '8CR', '8', NULL, 'F', 1, '22056', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Ngu', 'Abigail', '4d76cef7-bcb4-44ee-be39-38e23d03bd87', 'SKNB', '11', NULL, 'F', 1, '21111', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kaufuti', 'Ofa', '4da9d046-b584-4369-bbac-c07b6749ae61', '8JF', '8', NULL, 'F', 1, '22086', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lafituanai', 'Laura', '4dcbaef9-b309-4d05-a5f4-df3b8c31a75e', '10GA', '10', NULL, 'F', 1, '20077', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Daly', 'Jack', '4e1f11a7-fb6c-48e6-8b1b-33c68c8f37a8', 'WNAN', '11', NULL, 'M', 1, '21040', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Kennedy', 'Felicity', '4e50e4fd-741c-4c94-aa31-09c716273c10', '9SC', '9', NULL, 'F', 1, '23105', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Daff', 'Solomon', '4e57d248-fd91-4cbc-9f18-da96811f707c', 'BNGE', '12', NULL, 'M', 1, '22125', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Kim', 'Taelyn', '4ef3a8b6-3d35-483c-9441-b97ecf0c7674', 'SCJH', '11', NULL, 'F', 1, '22372', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hart', 'Amalie', '4f0bd908-9044-4a3b-b29b-74fc09d1899b', 'WNCI', '11', NULL, 'F', 1, '16179', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Maddala', 'Joshna', '4f365ffb-ab38-4345-b00d-89094ebf321d', '8EL', '8', NULL, 'F', 1, '18285', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Scott', 'Jackson', '4f456266-e1f2-4695-848c-a873686f038e', 'SCJH', '12', NULL, 'M', 1, '22036', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Li', 'Grace', '4fbb3f1b-49fe-4d09-bb98-9feb8c66e6c1', '1R4', '1', NULL, 'F', 1, '22322', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wallis', 'Levi', '4fee4737-6709-412a-a7ae-8e0e6725bcc6', '9FR', '9', NULL, 'M', 1, '15223', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Wu', 'Yanyiyi', '5002956c-1e9a-41d3-b0f4-04c1141e008f', '7CO', '7', NULL, 'F', 1, '23556', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Li', 'Xinyi', '50432dce-2dab-418c-b862-588d896afaf8', '1r3', '1', NULL, 'F', 1, '23448', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wainwright', 'Thomas', '50a20308-fa20-4efd-8c4c-845d2b4c22de', 'SKCG', '12', NULL, 'M', 1, '17315', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Chillingworth', 'Megan', '50b98ab8-4d61-4265-8ee5-832b63ac45df', 'WNMK', '13', NULL, 'F', 1, '21034', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gnade', 'Daniela', '50e50c1a-359b-4b7f-9032-db11d1bfbf1c', 'BNBT', '11', NULL, 'F', 1, '23543', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Walters', 'David', '51133d3c-162e-4afc-be5f-85c02be631fe', '7BL', '7', NULL, 'M', 1, '23023', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ramirez', 'Maria', '51357f67-aa85-487b-be07-7210926bcb81', '10SN', '10', NULL, 'F', 1, '20117', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Pratt', 'Jordie', '517ffb97-80f0-4b3d-a86c-d86baf77b7f3', '8CR', '8', NULL, 'M', 1, '22048', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Lin', 'Thomas', '51b5191f-f3da-4862-b847-2a7cff2462a0', 'SKMA', '13', NULL, 'M', 1, '22359', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kahiya', 'Blessing', '51d78922-a3a9-4890-bf6a-fd361903efa3', 'SKON', '13', NULL, 'M', 1, '21085', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Au', 'Lily', '52295d00-ac56-4188-92d0-0d94f55f5289', 'BNBT', '11', NULL, 'F', 1, '22158', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Purdie', 'Natalya', '52497faa-66ad-4918-bb40-b63fcead1167', 'SCMR', '13', NULL, 'F', 1, '17124', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Weeks', 'Jacqueline', '524b0025-7355-4566-9f4a-73bddd107d74', 'SCMR', '11', NULL, 'F', 1, '23017', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Choe', 'Sophia', '52753d24-a436-4d8b-af2c-dc2aac8bddce', 'BNBT', '13', NULL, 'F', 1, '33502728', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Rodger', 'Valentina', '529135fb-089b-4cb7-bcc5-e47ff21b9681', '5r13', '5', NULL, 'F', 1, '22330', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Dos Santos', 'Gabriel', '52ab9ce2-3d47-4903-9ea0-9850df28e9d4', '10GO', '10', NULL, 'M', 1, '16172', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tobing', 'Justin', '52d46c2f-37e8-4002-8aae-e057cdfb87e4', '7MZ', '7', NULL, 'M', 1, '23266', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Nipat', 'Pat', '531b2097-aec3-4b4d-b4db-4422fd473f55', 'SKMA', '12', NULL, 'M', 1, '22366', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kang', 'Seungjun', '5357be2b-66ab-4907-82c9-d2f328be4d18', '7CO', '7', NULL, 'M', 1, '23263', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Shen', 'William', '537ddfc5-567b-48da-b106-ca65e85b195e', '10LE', '10', NULL, 'M', 1, '14191', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Smith', 'Tamara', '540a7a70-5591-46b4-bfa5-834eed8bb6a6', 'SKME', '11', NULL, 'F', 1, '23045', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('McCrostie', 'Eve', '542d56aa-4f08-4f5c-a5a3-e7921a0a8fb3', '1r3', '1', NULL, 'F', 1, '23200', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Ye', 'Johnny', '5449d108-d603-47c6-b76d-b7980763e0d6', 'BNWN', '11', NULL, 'M', 1, '21340', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Kim', 'Sharon', '54857a29-e5d0-4e81-9ca3-452cdf6eb554', '8RS', '8', NULL, 'F', 1, '20379', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('McMahon', 'Isla', '54ea0211-7b72-45f9-9dad-76e44d03cba7', '7MZ', '7', NULL, 'F', 1, '23079', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Hunt', 'Phoebe', '54f5baab-2e82-4e06-b178-f601fffb0c47', '7PM', '7', NULL, 'F', 1, '23112', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Chalmers', 'Maddison', '5516cf63-f0c5-4ae5-88b8-f358bdf5862b', 'SCSO', '11', NULL, 'F', 1, '19007', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Fyfe', 'Jasmine', '55e03185-017a-4046-afe0-b85b88cccdba', '10LE', '10', NULL, 'F', 1, '15326', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tseng', 'Kaelan', '560af2e8-80e3-4996-80d4-ca5b89953138', '8RS', '8', NULL, 'M', 1, '15316', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Armstrong', 'Sol', '5618d58a-6a8d-49c7-86a8-2f07f0adf56f', '9MD', '9', NULL, 'M', 1, '21004', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ling', 'Gabriel', '562e6748-a8f8-4b1f-9f2a-5bac58c05a3a', '4r10', '4', NULL, 'M', 1, '20234', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Giddy', 'Josh', '56991dbe-9d70-4fb0-899a-9d2b201943ea', 'WNNL', '11', NULL, 'M', 1, '33503164', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hendry', 'Aylah', '569f4660-e647-4881-a26d-5cdb1f4b68a8', '1r1', '1', NULL, 'F', 1, '23561', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('d\'Auvergne', 'Zoe', '56a0d72a-3d3b-41be-93e3-b0c0695e08d4', '10LN', '10', NULL, 'F', 1, '20034', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Henderson', 'Maiah', '56b35f30-ce22-4785-8871-3202eac665f2', 'BNGT', '12', NULL, 'F', 1, '18331', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Zhang', 'Mofei', '56d536bf-3ad9-4b3d-8021-7fe0330ce109', '3r9', '3', NULL, 'F', 1, '23562', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Bowater', 'Jayden', '56f17475-ac63-4a2a-b21d-0c30d1560c1f', '2r7', '2', NULL, 'M', 1, '22344', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Read', 'Percy', '5733140b-a2ef-40c0-92c8-584e47a1bdf6', '2r7', '2', NULL, 'M', 1, '21227', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Prince', 'Zach', '574b9d6b-3505-4efa-8126-e9d773605ed9', 'WNWT', '11', NULL, 'M', 1, '19034', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('van Heerden', 'Mikal', '577e7ea5-01c4-41d2-af88-d4e1baed5809', 'BNLH', '13', NULL, 'F', 1, '23460', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ballingall', 'Rayana', '57d405f6-e6c5-403d-a91a-2cf6afa87353', '8EL', '8', NULL, 'F', 1, '15343', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Jensen', 'Ellie', '587f206a-7570-47f8-b0f4-77a99ff3ba6d', '4r11', '4', NULL, 'F', 1, '19225', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Morrison', 'Isabella', '58820138-c8d4-4ced-a596-b965a1c7376d', '8JF', '8', NULL, 'F', 1, '23503', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Ngu', 'Nathan', '58b00163-1684-4fbc-acdb-62da08b9e8ed', 'BNGE', '13', NULL, 'M', 1, '14186', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Havea', 'Melenaite', '58b82fb9-7f53-458e-b3e5-3b2ef59fa293', '10LI', '10', NULL, 'F', 1, '131384', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Varghese', 'Afrema', '58d8cba9-44e7-45e1-b8ec-e9b59dee0ad8', '10GO', '10', NULL, 'F', 1, '20143', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Myatt', 'Riley', '590235b3-8506-4c69-8b27-c7eb49a1817f', 'BNLH', '12', NULL, 'M', 1, '14170', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('George', 'Evie', '5961d652-d75a-43c9-96e4-b3ec09fc2bba', 'BNHK', '11', NULL, 'F', 1, '19015', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Jennings', 'Regan-Grace', '59700f78-4bbd-4c2b-8c5b-a405b56013c0', '3r9', '3', NULL, 'F', 1, '21211', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cooper', 'Tessa', '5972fb4b-3e16-4291-a868-bc9f36d44209', '8EL', '8', NULL, 'F', 1, '22129', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Griffith', 'Jade', '59c4dece-9c1d-4fdc-a694-b849932c6fd1', 'SCBY', '13', NULL, 'F', 1, '19054', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Liu', 'Kayson', '5a2bf299-ea38-41a6-9e51-541af1254e7a', '3r9', '3', NULL, 'M', 1, '21214', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Clarke', 'Harrison', '5adf1222-e78c-43e5-b20a-7117bedce3a6', 'SCVT', '11', NULL, 'M', 1, '23150', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Dirkze', 'Luke', '5b475fc0-d15f-45c7-ab37-45b37fadc8c0', '5r13', '5', NULL, 'M', 1, '18302', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Minty', 'Billy', '5b49548e-1c2c-4772-9e8f-071ebeea6f53', '3r8', '3', NULL, 'M', 1, '20241', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Limpassorn', 'Pream', '5badf496-7b60-4d6b-96bb-a8e7995c7e08', 'SCSO', '11', NULL, 'F', 1, '22368', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('McCluskey', 'Elric', '5bd9b924-93a4-457a-8559-9c628984f732', 'WNCI', '12', NULL, 'M', 1, '22015', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Boadilla', 'Andrew', '5bf3ef0a-271c-4a97-a5b2-13ec6c4fcf39', 'SCED', '13', NULL, 'M', 1, '21018', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Preston-Marshall', 'Anna', '5bfe45c5-1c50-4379-8d9f-aea994b6cfbb', 'WNNL', '13', NULL, 'F', 1, '21119', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Li', 'Leo', '5c40dca3-bbae-4647-9c95-5fb522738820', 'WNMK', '11', NULL, 'M', 1, '19025', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lubbers', 'Olie', '5c4aeab8-1672-40a3-9ec3-b65dc569f3ac', 'WNWT', '11', NULL, 'M', 1, '23090', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Jack', 'Isobel', '5c5d4cdd-e962-4b18-b59a-23b7062f1f3b', '9MD', '9', NULL, 'F', 1, '14254', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Morton', 'Polly', '5c96bb80-915d-4200-a444-e4e75901c614', '9MD', '9', NULL, 'F', 1, '23074', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Xiong', 'Joy', '5cb610bf-f71c-4877-a09a-dfa5a2bd2324', 'SCSO', '11', NULL, 'F', 1, '19043', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('McKellar', 'Michael', '5cd2437a-f18c-4d13-a330-74608dbd7285', 'WNMK', '13', NULL, 'M', 1, '17097', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Van Der Horst', 'Elijah', '5d051d1e-a5d1-4311-8f1d-be88d903184b', 'BNWN', '12', NULL, 'M', 1, '22017', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Richardson', 'Luke', '5d17e957-2359-4175-a483-0449a77412bd', 'SKHG', '12', NULL, 'M', 1, '33502815', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Peters', 'Jess', '5d4c3c2a-cede-4214-a5ed-452575e1dfab', '10LN', '10', NULL, 'F', 1, '21183', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Siose', 'Hosea', '5d7acc52-6079-4b0c-8da5-87a0929756d0', '5r12', '5', NULL, 'M', 1, '19235', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Gee', 'Ashton', '5dfce32e-addb-47e0-a17f-f29746d1632b', '7PM', '7', NULL, 'M', 1, '23130', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Murray', 'Ryder', '5e03a60a-bfb2-466e-8a99-3e3e852b0af4', '2r5', '2', NULL, 'M', 1, '22326', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Parsons', 'Zach', '5e059af0-6740-4062-a482-e175fad7d598', 'SCJH', '12', NULL, 'M', 1, '22053', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Roberts', 'Alysia', '5e06acf0-a33c-4d36-8285-c931e2edfa6c', 'WNCI', '11', NULL, 'F', 1, '23054', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Tseng', 'Gedeon', '5e0f0f9e-3667-4c46-acf4-7d9a998f3038', '3r8', '3', NULL, 'M', 1, '21247', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Xu', 'Jacob', '5e24359c-9ebc-4cf1-9019-bf28c50c592c', '7PM', '7', NULL, 'M', 1, '16261', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Cui', 'Daniel', '5e5d6b32-96b2-4069-a496-02cb98fdedbb', '7PM', '7', NULL, 'M', 1, '23143', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mara', 'Yara', '5e697353-2f8b-40fc-aa56-81db6293b1e5', '7BL', '7', NULL, 'F', 1, '23086', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Verd', 'Sarah', '5ea39898-c6ae-4ec7-a856-0ce9b4e7ffff', '9SC', '9', NULL, 'F', 1, '23027', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Reynolds', 'Wyatt', '5ea6e45b-b61e-4765-a973-30f5c73c07cf', '1r3', '1', NULL, 'F', 1, '23194', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Milmine', 'Hannah', '5eabf0e3-011a-4b27-b215-74833c4039ae', '8CR', '8', NULL, 'F', 1, '22064', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Le Roux', 'Ben', '5f356fba-e218-49f6-8aa4-85200929e79d', 'BNLH', '11', NULL, 'M', 1, '23096', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Frost', 'Sophie', '5f673654-b1a9-4c58-afe3-682b8fefa300', 'SCED', '13', NULL, 'F', 1, '21059', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wong', 'Eliana', '5f6e6012-db1d-459d-a987-800ff504a3ba', '5r13', '5', NULL, 'F', 1, '19243', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Garcia', 'Martha', '5f9608f5-042d-4848-8653-64270970e88f', '7CO', '7', NULL, 'F', 1, '17259', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Weng', 'Pat', '5f9f6fa7-cf71-42f6-9ce5-45c7093b0cf6', '9BR', '9', NULL, 'M', 1, '22361', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hardanava', 'Asia', '5fa78c54-af69-4a23-a864-d7eaccc68fb0', '9MD', '9', NULL, 'F', 1, '16182', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kench', 'Zoey', '60062107-4263-42f8-acb8-3344cb8c5831', '4r10', '4', NULL, 'F', 1, '20229', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('King', 'Logan', '60279e0e-3cc1-49a0-9d90-5df0f3e083ed', 'BNHK', '13', NULL, 'M', 1, '17081', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Campbell', 'Korbin', '6042b91e-b170-43b3-a508-0827ce594479', 'WNBH', '11', NULL, 'M', 1, '21101', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pieterse', 'Elme', '608de416-005a-4e26-8a58-b3a592df2d90', 'SKNB', '11', NULL, 'F', 1, '19033', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Reynolds', 'Callie', '60ac1ea8-cc7b-45de-a316-6959860f2109', 'SKME', '11', NULL, 'F', 1, '21123', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Conner', 'Toby', '60e2639f-9758-4e98-bac0-1bb9a50fa5ff', '5r13', '5', NULL, 'M', 1, '18298', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Spicer', 'Brianna', '611fb973-5a23-4421-bff5-2a7baa6671cd', 'WNNL', '12', NULL, 'F', 1, '22032', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Pellow', 'Sophie', '6214918a-b3c6-4bc8-ac44-085a6103e4a8', '10LN', '10', NULL, 'F', 1, '16174', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Zhou', 'Shichao', '622aa18c-8146-4330-9697-be46e9cf8853', '10LI', '10', NULL, 'M', 1, '23553', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:45', '2023-12-04 09:00:27'),
('Brown', 'Esther', '62689feb-8ace-41f4-821d-12eb85989d5a', '4r10', '4', NULL, 'F', 1, '21188', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Robinson', 'Nalanee', '62ce6657-d4ee-4079-a6a3-e870a0f2000b', '10LN', '10', NULL, 'F', 1, '22041', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Conner', 'Claire', '635ce048-1916-4ba3-8a35-9d14d2c135db', '2r5', '2', NULL, 'F', 1, '21191', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Stirling', 'Corban', '6370cc90-9734-4061-b96e-a23ec7c76f3c', 'SKCG', '13', NULL, 'M', 1, '14171', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Shirota', 'Haru', '638c9869-d3b2-4592-9670-6f78eaa3b658', 'SKME', '11', NULL, 'F', 1, '23005', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Harrison', 'Jasper', '639aae6b-0ad4-4776-b668-2d5082b8efee', 'SKMA', '13', NULL, 'M', 1, '21070', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Barlow', 'Rose', '639e486b-86a4-4eb6-bd61-05451e7a39fc', 'BNWN', '12', NULL, 'F', 1, '23165', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Villaseca Chacon', 'Paz', '641b8e45-7bb1-45a1-bc6e-a3a5b5b6c439', '7BL', '7', NULL, 'F', 1, '23026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Penno', 'Lucy', '64229d82-6f11-4e59-9a42-141a7feabe25', '9BR', '9', NULL, 'F', 1, '19199', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Cruz Croucher', 'Camila', '647595b2-9033-4bad-a34b-e60d89c9461e', '1R4', '1', NULL, 'F', 1, '22300', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Laufiso', 'Jeremiah', '64992a35-0085-489a-bce3-2084ad3a559b', '7CO', '7', NULL, 'M', 1, '23098', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Chen', 'Alana', '64acc044-6aef-40e8-8c85-b2635dd0b35f', 'WNNL', '12', NULL, 'F', 1, '19153', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Li', 'Melva', '64b79cb0-33fc-41e6-ad5d-c9fdc6e17a9d', 'SKME', '12', NULL, 'F', 1, '18033', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Yu', 'Teresa', '64e42ab6-c226-4493-9626-8d715f18fe53', 'SKME', '11', NULL, 'F', 1, '21181', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Falconer', 'Leah', '64f22ef7-99a5-4717-80cd-1bdfba25f6eb', 'WNWT', '11', NULL, 'F', 1, '19013', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Qiao', 'Lucas', '652dd840-8604-4987-8fa7-a25e276618c6', '4r11', '4', NULL, 'M', 1, '19233', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Tongamana', 'Tahilanu', '65301579-94b2-4531-ae4e-f1371e7bcf67', 'SCMR', '13', NULL, 'M', 1, '17145', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Muza', 'Tavonga', '655af818-b255-4cd6-a421-af88f428c4a9', '10GO', '10', NULL, 'M', 1, '13007', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Mulholland', 'Alex', '655f9f6e-201a-4792-816c-b8d025060533', 'WNBH', '12', NULL, 'M', 1, '33502807', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Prima', 'Riley', '657f21dd-2e9b-460b-9500-1861aa6fc843', '7MZ', '7', NULL, 'M', 1, '23059', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Lester', 'Annabelle', '658913d2-e6d6-4c45-8f2c-849c2f629f9b', '10GA', '10', NULL, 'F', 1, '20078', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Quayle', 'Nathan', '659e99f8-d040-4777-8bca-e74264ba220e', 'SCJH', '11', NULL, 'M', 1, '23058', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Padiernos', 'David', '66000815-96e8-4fe2-b91f-b38cec49fe83', '8JF', '8', NULL, 'M', 1, '16211', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Dirkze', 'Katherine', '666236c2-20f9-4694-9dc3-a64db2c6ed87', '1R4', '1', NULL, 'F', 1, '22302', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wescombe', 'Cole', '66bde014-4fb7-416a-be3f-26e2c94df408', 'WNNL', '12', NULL, 'M', 1, '22011', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Gough', 'Kyle', '66c45de2-8bb8-40aa-9aca-7fd328a2d0a9', 'SKHG', '11', NULL, 'M', 1, '23128', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ballingall', 'Arden', '66c6ccfd-82f1-4d91-bcb3-6794ef6df563', '5r12', '5', NULL, 'M', 1, '19211', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Boyce', 'Luke', '66d07284-2903-47fb-87b7-01c91143ac9f', 'BNHK', '12', NULL, 'M', 1, '21021', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Manson', 'Kendra', '67312b84-f6f0-41f7-ab59-7ff970b2c173', 'WNAN', '13', NULL, 'F', 1, '17093', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Prince', 'Christiana', '67a3eee8-0cca-4cce-8723-0a372e1b73b6', '10LN', '10', NULL, 'F', 1, '22044', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Scott', 'Sarah', '68274902-09fc-4ee0-a967-c0bb649ddd8f', 'SKNB', '11', NULL, 'F', 1, '19035', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Lee', 'Sarang', '684d80c2-b4b7-40b1-9d72-2ab22dd25dd9', 'SCBY', '11', NULL, 'F', 1, '19024', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Scoulding', 'Henry', '68525e59-316d-4225-815f-ec23632212f5', '7MZ', '7', NULL, 'M', 1, '23046', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Ooi', 'Chanel', '686fbc22-a570-4ae5-96e4-9ffae3c4d6e0', 'SKMA', '12', NULL, 'F', 1, '16194', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Butler', 'Robson', '68e57cb5-2635-4abb-8d36-ec1fadfc1741', 'SCSO', '11', NULL, 'M', 1, '23159', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Zhang', 'Ella', '690d9d9a-b5b7-4081-abcc-fc01b7d0d65d', 'SCMR', '12', NULL, 'F', 1, '20155', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Tang', 'Priscilla', '69252b1b-5ab4-47e8-991d-93df5f9e5257', '1r3', '1', NULL, 'F', 1, '23187', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Fenika', 'Kayla', '69359baa-e9e7-4f24-9867-04eb3d39962b', 'BNLH', '12', NULL, 'F', 1, '18021', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Nyamutswa', 'Ethan', '69940230-4a5f-4727-838f-e283068857f2', '5r13', '5', NULL, 'M', 1, '20411', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('McCann', 'Katie', '69eb3ad7-06aa-4506-8520-1afd9e2c7b3c', 'SCMR', '11', NULL, 'F', 1, '23082', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lal', 'Aman', '6a05f99f-d85f-4e81-ab20-c24fe29a1fa7', '6r15', '6', NULL, 'M', 1, '17301', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Drauna', 'Lucy', '6a0b5efa-2d22-42aa-9d5a-f33e29b31c7f', '10SN', '10', NULL, 'F', 1, '22173', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lee', 'Jaebeom', '6b1db307-d236-49a4-8f63-6290c1d61a9d', '5r12', '5', NULL, 'M', 1, '23004', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Yang', 'Jaegar', '6b32a901-3e7f-4feb-9483-3d4c130fbb32', '4r10', '4', NULL, 'M', 1, '20264', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Lin', 'Johnny', '6b3ec4d9-8c7c-4297-b7d1-9b5043ad22f5', '7MZ', '7', NULL, 'M', 1, '20432', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lorgelly', 'Ethan', '6b99976a-14bc-4c9a-bc7d-2fe7f22f8c6f', 'WNAN', '12', NULL, 'M', 1, '22079', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Goto', 'Sharon', '6bbccfce-0da7-46bb-bcc4-6258badbc6f9', 'SCSO', '13', NULL, 'F', 1, '33502447', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Williams', 'Evelyn', '6bd9bea5-e2e3-48a6-8647-405cf83cc2b5', '2r5', '2', NULL, 'F', 1, '22341', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Taane', 'Ebony', '6c8b268a-9061-4da6-99bc-90a7cb39a382', 'BNHK', '11', NULL, 'F', 1, '33503153', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Scoulding', 'Matilda', '6d6792b5-b37f-42e3-9dbb-f4514e867185', '9FR', '9', NULL, 'F', 1, '21132', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Cleave', 'Jayme', '6dac1fdd-d5ff-4273-b861-e5c15f0439ca', 'SKCG', '11', NULL, 'F', 1, '23146', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('McKenzie', 'Skye', '6dbe2634-0735-4565-aa95-52f5e8ac65a9', '7CO', '7', NULL, 'F', 1, '17265', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Manahi', 'Jethro', '6ddf3e3d-7cae-4295-92ce-34b8d625e6fc', 'BNGT', '11', NULL, 'M', 1, '23088', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Bader', 'Elsie', '6e098b9d-8422-4a3e-921b-66b27972e076', '9CN', '9', NULL, 'F', 1, '21008', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Drauna', 'Iliseva', '6e64f152-8769-433f-a210-fcb08266bb36', '4r10', '4', NULL, 'F', 1, '23222', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wong', 'Samuel', '6ea4884d-e7e7-4f62-aead-425056550f3d', '7CO', '7', NULL, 'M', 1, '16325', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Faalogo', 'Richard', '6eb25ca4-826f-438a-9a84-10372babbea1', '9FR', '9', NULL, 'M', 1, '15225', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Smith', 'Aston', '6f6e58db-44e4-4194-a85e-facf6cb83a0c', 'BNGT', '13', NULL, 'M', 1, '19412', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Henderson', 'Mia', '6f75873b-288c-4094-ab74-83801e36bb3a', '9MD', '9', NULL, 'F', 1, '21072', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Peters', 'Tyrone', '6f8a6d61-d5bf-45fb-b6ae-bdbcd29bb5c1', '8RS', '8', NULL, 'M', 1, '21351', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Ellena', 'Sienna', '6feb4835-0703-4b4f-aa50-1763658704ad', '6r15', '6', NULL, 'F', 1, '22308', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Liu', 'Cecilia', '706c6af2-589c-4f9c-900d-77b0a9d920b8', '9SC', '9', NULL, 'F', 1, '23095', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Gull', 'Ezekiel', '7076f967-c1e5-4ef7-be08-8238e75551b3', '1r1', '1', NULL, 'M', 1, '23215', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ewing', 'Willow', '707ac40e-ba2d-4df2-884c-ed199f9c8b24', '9MD', '9', NULL, 'F', 1, '21053', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cooper', 'Lucy', '707dbf69-7148-49bb-8bae-995f74bc79ac', '6r14', '6', NULL, 'F', 1, '22362', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wilson', 'George', '70ba98d2-ce08-4ac8-9f46-eb43c8b18d49', 'WNNL', '12', NULL, 'M', 1, '33502919', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lee', 'Liam', '710bd488-ce25-4452-8827-11d952371a75', '7MZ', '7', NULL, 'M', 1, '17263', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Mori', 'Nanami', '7117d455-4a02-4b20-9e0b-d0d62ca8a59f', '10SN', '10', NULL, 'F', 1, '22384', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Mohi', 'Li\'oa', '7182b663-6fc8-4bef-bccc-a7fac30dd8df', '9SC', '9', NULL, 'M', 1, '23077', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Wilford', 'Lily', '71be3a47-f7a0-47a3-a4dc-f99c30b51d23', 'BNGT', '13', NULL, 'F', 1, '33502398', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Havelaar', 'Irina', '71cae031-5a3a-4f98-b8b7-b3abcc16cfbb', 'SKNB', '13', NULL, 'F', 1, '20056', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Davis', 'Noah', '71f64776-17f2-44de-86e6-64167d59c2b1', 'WNAN', '13', NULL, 'M', 1, '21041', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Carter', 'Ava', '7213b846-dfd5-446d-8f26-ba91af512a65', '9BR', '9', NULL, 'F', 1, '23158', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Stuart', 'Skyler', '721ff7a7-8c6c-4ae3-9626-f890379eb901', '4r10', '4', NULL, 'M', 1, '19239', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Dos Santos', 'Lucas', '7247b54b-da09-4c10-be4f-f465b1a50c50', '2r5', '2', NULL, 'M', 1, '21196', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Stocks', 'Florence', '72e6569f-4680-470b-a2a0-0213c8869cf9', 'SKMA', '12', NULL, 'F', 1, '33503074', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Taring', 'Ailah', '730ffd23-1a32-4374-95c4-f9781be7f75b', 'SKON', '13', NULL, 'F', 1, '17142', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Price', 'Leah', '7355c694-6fd8-45ca-97ef-04d1760b1fb3', '8RS', '8', NULL, 'F', 1, '23267', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Black', 'Melanie', '735bd497-71d2-48b0-9aef-220a336fe598', 'WNBH', '13', NULL, 'F', 1, '33502796', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Proctor-McGregor', 'Alyssa', '7382fe55-dcef-47bf-bbaf-9cb8ab990e1c', '10GO', '10', NULL, 'F', 1, '20163', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Cui', 'Jason', '739b2ce8-63d3-40ac-b524-71f9dae947bc', '7CO', '7', NULL, 'M', 1, '23142', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Richards', 'Jesse', '741aadd8-7841-4d11-8983-0f09ce036be5', 'SKON', '12', NULL, 'M', 1, '33502829', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Manning', 'Peyton', '74610e11-31e3-4ae3-932c-69b0a291702a', '4r11', '4', NULL, 'F', 1, '21219', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Joseph', 'Isla', '7494eb45-484a-4dd0-9396-a3ecc7b1618d', 'WNWT', '11', NULL, 'F', 1, '19022', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Smith', 'Mack', '749f4eae-5dca-476f-9da9-750372f5368a', '6r14', '6', NULL, 'M', 1, '18321', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Yorke', 'Saryah', '74af9763-ba79-4379-9946-743ef8bfeaba', '7CO', '7', NULL, 'F', 1, '17267', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Te Hae', 'Evarn', '74c7a8b0-5ee1-40fc-a2c0-472797612af4', 'WNBH', '11', NULL, 'M', 1, '23036', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('On', 'Raksa', '75895a1d-d799-47a7-a813-bbfa5d336ec2', 'BNWN', '11', NULL, 'F', 1, '23064', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Anderson', 'Alexis', '759ed2c7-35e6-41fb-b947-0b392a998913', '3r9', '3', NULL, 'F', 1, '20206', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Chin Poy', 'Eden', '75f282e6-abb9-45a4-b1a5-c74c5cec4327', 'SKCG', '12', NULL, 'F', 1, '18016', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Andales', 'Shania', '75f29873-fd21-4bb4-81b6-3ee0e03c3047', '7PM', '7', NULL, 'F', 1, '23172', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Choi', 'Isaiah', '76006ad4-1854-4f06-a5f4-65af6936143f', '1R4', '1', NULL, 'M', 1, '22295', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Duddy', 'Fleur', '761eafd7-62b0-4908-9e08-ff2150a30a22', 'BNBT', '11', NULL, 'F', 1, '19012', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Van Rooyen', 'Zack', '762b159e-c589-4ec7-8fe4-a9fa25779f34', 'BNWN', '12', NULL, 'M', 1, '18060', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Haselden', 'Sophie', '763fece4-2ae9-4dda-b3e4-cc62f3f3ef71', '8CR', '8', NULL, 'F', 1, '19197', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Willemse', 'John', '7642094a-cda7-4baf-bea3-1c6351a428a5', 'WNBH', '12', NULL, 'M', 1, '33503073', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Capill', 'Abigail', '764bffe9-5045-422b-8596-4a25b152ed7d', '8RS', '8', NULL, 'F', 1, '22139', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Botherway', 'Calista', '76d93319-aa3f-4569-9dae-b05bccc16307', '7MZ', '7', NULL, 'F', 1, '23409', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('England', 'Joshua', '76f09437-e044-4483-9f3f-a0dab332bdce', '10SN', '10', NULL, 'M', 1, '20040', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Zhen', 'Alina', '77239b42-77da-4856-aecb-804f185dbf19', '7CO', '7', NULL, 'F', 1, '23007', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Popa', 'Stephanie', '776d3590-b490-4604-b92c-69cb43d9b35a', '2r5', '2', NULL, 'F', 1, '21350', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Harvey', 'Hazel', '77dcd0eb-b108-423c-b9d9-3ddd7e188309', 'SKHG', '12', NULL, 'F', 1, '20161', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gou', 'Cindy', '77e31e5f-b0ab-4e1a-8d0f-20cb0b6ea98f', '7CO', '7', NULL, 'F', 1, '17260', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Dong', 'Yvonne', '77f73b3f-012a-4e0e-a77a-04e7608153d9', '7MZ', '7', NULL, 'F', 1, '23139', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Haselden', 'Abbie', '78034549-3629-4881-9f59-c87dd94e08a6', 'BNGT', '12', NULL, 'F', 1, '18025', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hayton', 'Azaria', '781432c2-72ea-4e29-a7ee-f64db7161fa0', '4r11', '4', NULL, 'F', 1, '20225', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Tang', 'Joshua', '7820d525-cfa1-433e-b134-15d5d786bc40', 'SKME', '11', NULL, 'M', 1, '23038', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Campbell', 'Carla', '78574a0e-4194-4724-8354-829789c523d7', 'WNCI', '12', NULL, 'F', 1, '22142', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hikuroa', 'Ihaia', '786cd52e-81e7-40e2-be79-07deb68d70cb', '3r8', '3', NULL, 'M', 1, '21209', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Addison', 'Annabel', '7899215e-a3a6-409d-bb07-732297b5e1da', 'SKHG', '11', NULL, 'F', 1, '33503484', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Guirgis', 'Sam', '793a1fde-2e3a-4115-8373-e6c8338cf4a2', '10LN', '10', NULL, 'M', 1, '14237', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bawin', 'Thomas', '79583111-9a67-47ff-9305-70cf0a7ef78a', 'SKHG', '13', NULL, 'M', 1, '17017', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Horn', 'Keziah', '79b49c82-7aa3-4d67-b0a6-b0849393c294', '9BR', '9', NULL, 'F', 1, '21075', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lopez-Montofre', 'Elias', '79d9f086-dc8f-4328-a952-8dba91526804', 'SCJH', '11', NULL, 'M', 1, '21097', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Prince', 'Joel', '7a479eff-bd7c-4fc9-ba40-0443c263e502', 'WNNL', '13', NULL, 'M', 1, '19066', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Makin', 'Lily', '7a916082-17ca-4f11-bd4f-ece7ada7f93e', 'SCBY', '12', NULL, 'F', 1, '18039', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Hansen', 'Jess', '7aaeb0e4-3883-4855-93d9-1a7ca8d8b437', 'BNGE', '13', NULL, 'F', 1, '17059', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ngu', 'Ethan', '7af46c42-fa82-4215-9e28-8df6df3c0173', 'BNBT', '12', NULL, 'M', 1, '14187', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Turnbull', 'Charlotte', '7b99026d-1296-4f10-9b07-137765378aeb', '8RS', '8', NULL, 'F', 1, '22019', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Smith', 'Erin', '7bb12b91-9865-4a29-8128-501400250198', 'BNLH', '13', NULL, 'F', 1, '21180', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Li', 'Jesse', '7c1552d8-847b-4631-bc84-7ffa7caf9a2a', '3r8', '3', NULL, 'M', 1, '21212', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Horn', 'Joshua', '7c298ebb-8255-4973-834c-38159c46302b', 'SKON', '12', NULL, 'M', 1, '22097', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Phillips', 'Tim', '7c3fae8e-9340-4d55-8fcb-62ca9052423d', 'BNWN', '12', NULL, 'M', 1, '18045', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Marshall', 'Navajo', '7c81dace-10f9-4930-ba99-57fc6c2988d3', 'WNCI', '12', NULL, 'M', 1, '22073', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Szurpicka', 'Gabriela', '7c921f36-07a4-49ec-9f9c-60a6f8ca2839', 'BNHK', '11', NULL, 'F', 1, '21149', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Taylor', 'Holly', '7cb6afb3-bb8b-4f20-9076-fc7df0e7c46a', '9SC', '9', NULL, 'F', 1, '21152', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hartstonge', 'Levi', '7d393eab-2603-4efb-a7da-cb762b9ec6b0', '4r11', '4', NULL, 'M', 1, '20224', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Jack', 'Ella', '7d6c1fa7-68b1-450e-b792-975930f7f3b5', '7BL', '7', NULL, 'F', 1, '16298', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wang', 'Jasper', '7d74eda2-3e2d-4057-a967-9baf1ab10ef2', '1r1', '1', NULL, 'M', 1, '23184', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Shyle', 'Ernst', '7d82eed7-1cfb-4c39-bb0c-f4908dd58b42', '8RS', '8', NULL, 'M', 1, '23443', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Trengrove', 'Oliver', '7d83e3ff-28f7-4120-8a01-fa6e595fc3c9', 'BNBT', '12', NULL, 'M', 1, '22022', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Tobing', 'Jonathan', '7dc48307-8ba2-4135-a582-a2ad6e4bf5bb', '4r11', '4', NULL, 'M', 1, '23431', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Dhlakama', 'Anne', '7deaaf01-fae0-430f-b5f7-b885d067915c', '3r9', '3', NULL, 'F', 1, '23439', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Miller', 'Aliana', '7e0adece-7324-469f-958e-9e2a14463be0', 'BNHK', '13', NULL, 'F', 1, '23078', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Verd', 'Jacob', '7e5bf4ef-8f51-443c-9541-6b17e2e79404', 'SKME', '12', NULL, 'M', 1, '20144', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Frazer', 'Poppy', '7e885e54-be74-47b5-ab66-6ffe0e1ca765', '5r13', '5', NULL, 'F', 1, '21202', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Coleman', 'Emily', '7edfce80-4aaf-4b4f-a48d-70f8a2f6833f', 'WNMK', '13', NULL, 'F', 1, '17040', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Loughnan', 'Arlie', '7ef4cdd1-35e9-484a-9d23-a4aa5482aa2d', '10LE', '10', NULL, 'M', 1, '22078', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Dreadon', 'Falcon', '7f679f41-31eb-48e4-9858-57d180dd0cc7', '4r11', '4', NULL, 'M', 1, '19448', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Su', 'Grant', '7fc6c220-cbc9-46f2-ad92-d6336159a918', '3r8', '3', NULL, 'M', 1, '23188', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Grieve', 'Josiah', '7fcd592b-f0fd-4371-a782-c95f8e8fa3a9', '8RS', '8', NULL, 'M', 1, '18284', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gutsell', 'Nicholas', '80182611-f01d-4aa2-8077-251279fc8141', '7BL', '7', NULL, 'M', 1, '23125', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hayton', 'Neriah', '80229de3-ce7b-4f15-8d92-2364d9c07e3f', '3r8', '3', NULL, 'F', 1, '21207', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bowater', 'Zaiah', '803ae16a-3bb6-4e15-b3ff-a2295d2d9348', '4r11', '4', NULL, 'M', 1, '19213', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Diggs', 'Christian', '80450b98-5c94-4f16-bf11-0c3548e77f4a', '3r9', '3', NULL, 'M', 1, '21248', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Venter', 'Jacob', '80517584-54d4-4f76-8bc4-f89b087eca2f', '1r3', '1', NULL, 'M', 1, '23430', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lopez-Montofre', 'Isabella', '8055760b-ff0a-4e42-ad8f-b975f0d45031', '8CR', '8', NULL, 'F', 1, '23094', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Harty-Eugster', 'Coco', '809032b3-38e9-4fc1-a544-51a37f35922a', 'SCMR', '11', NULL, 'F', 1, '23120', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Alcock', 'Nathan', '8096df40-5e50-4ca8-a6f4-5b5d81ec945b', 'WNWT', '12', NULL, 'M', 1, '22161', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pheng', 'Sotheara', '80cb452a-0fb1-41b5-9d31-868937bf3e3b', '10SN', '10', NULL, 'F', 1, '20112', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Bennetts', 'Bree', '8139feb7-6c17-41aa-9b1d-dc0684ec9bfa', '8CR', '8', NULL, 'F', 1, '15328', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yew', 'Nathan', '81d1b91e-d1e4-49c3-8e61-db11b9d8a652', 'WNBH', '11', NULL, 'M', 1, '23011', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Ferguson', 'Joshua', '8215ac7d-b86b-4b42-a5fe-05cbe6ebb7fe', '8CR', '8', NULL, 'M', 1, '15358', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lopez-Montofre', 'Antonia', '82ec2855-7d70-4079-a209-98b7fbcf6e7c', '8JF', '8', NULL, 'F', 1, '23093', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Jensen', 'Jesse', '82f0f7f4-1fcb-402a-a8ea-02ab040a81a9', '1R4', '1', NULL, 'M', 1, '22318', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wiegersma', 'Levi', '82fb71b9-3daf-495d-ab5a-a21622ccd641', '8CR', '8', NULL, 'M', 1, '20439', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('George', 'Alex', '831b8ad3-8f9c-4103-824a-9e5d09f61a62', '9FR', '9', NULL, 'M', 1, '21061', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ramsay', 'Sloane', '832783ef-ce49-4b90-b8d6-151e9deba2cd', '8RS', '8', NULL, 'F', 1, '15357', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Mara', 'Maya', '83385866-0fcc-4330-aa7d-a4035332e096', '4r11', '4', NULL, 'F', 1, '23202', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Landers', 'Zachary', '83ca8a95-473e-4570-b33d-71e9bda31a07', 'SKCG', '13', NULL, 'M', 1, '21090', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Brooks', 'Adi', '8476b17a-9ad5-4f83-9ca4-1168279bad88', '7BL', '7', NULL, 'F', 1, '23161', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Harnett', 'Louie', '848648d7-5f7d-438f-a937-1a6b4dc3aebb', '7PM', '7', NULL, 'M', 1, '23123', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lu', 'Chloe', '84a067a1-2aa8-4a35-b362-bc1fa8adb903', '3r8', '3', NULL, 'F', 1, '21215', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lok', 'Nelstein', '84b9f72a-cc89-4a34-8da5-814d31ff3d9b', '3r9', '3', NULL, 'M', 1, '20236', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Geldard', 'Adelaide', '84bd7a93-d68c-4e6c-9b8d-617c527b3180', 'SCVT', '11', NULL, 'F', 1, '19014', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Anderson', 'Liam', '84dba300-e51a-4c49-9dd2-0a024554fd62', '7CO', '7', NULL, 'M', 1, '23170', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Schroeder', 'Sarah', '8503e8f8-ce45-461a-9af8-219556633d7a', 'SCSO', '13', NULL, 'F', 1, '15191', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Schubach', 'Mel', '85163217-1fab-4b7f-830b-25740ec07eb2', 'BNGE', '13', NULL, 'F', 1, '18231', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Szurpicka', 'Emily', '858012b2-bb19-4cb8-880b-5450eb61e7e2', 'BNWN', '13', NULL, 'F', 1, '20420', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Juguilon', 'Krsnaji', '85c2c445-37b2-4814-831d-d37fedf88334', '6r15', '6', NULL, 'M', 1, '18277', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Allison', 'Reid', '860038cf-1eb1-4244-af14-5f1bdbb097da', 'SCSO', '11', NULL, 'M', 1, '23173', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Garratt', 'Lydia', '863d0585-366c-40b6-822f-981cffa6c2c8', 'BNGT', '11', NULL, 'F', 1, '14167', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Read', 'Freddie', '86639ccb-279f-4770-9e7b-fb7e20fb0533', '9MD', '9', NULL, 'M', 1, '16177', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Carlile-Smith', 'Olivia', '86d06963-3138-45aa-a1cd-3c9f2e73447a', 'SKNB', '13', NULL, 'F', 1, '19050', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Thompson', 'Joel', '86df7e6d-ec2b-4ded-9014-07eea7876a1b', '10SN', '10', NULL, 'M', 1, '20134', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Fenika', 'Ka-Yne', '8708e541-cff2-41dd-9662-05dae02585a9', '8JF', '8', NULL, 'M', 1, '22112', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ta\'ala', 'Anzac', '870fe3c3-0cfb-43a3-a93e-63a7c236ce27', '6r14', '6', NULL, 'M', 1, '21235', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lubbers', 'Jesse', '87ee2982-c5db-40a9-a2c8-bbb10d93c59f', 'WNBH', '12', NULL, 'M', 1, '22077', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lee', 'Michael', '8814b72e-15c1-4b09-b749-4f788d1a54e9', '2r7', '2', NULL, 'M', 1, '23452', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wu', 'Sianna', '882b18a1-737b-4c5e-ace1-a922526e9aae', '6r14', '6', NULL, 'F', 1, '17287', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('McKay', 'Georgia', '884e174c-9b20-41a5-9549-7de982f0b443', '7MZ', '7', NULL, 'F', 1, '23081', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Neyra', 'Marcus', '885059eb-7660-45cf-b688-490e92e199c0', '7MZ', '7', NULL, 'M', 1, '23068', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Au', 'Alice', '885a35bb-7687-40c8-90e7-39edd79910a2', '3r8', '3', NULL, 'F', 1, '20208', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ivar', 'Noah', '88a749db-54dc-43d3-97f8-1d01e41513f2', 'SCVT', '13', NULL, 'M', 1, '21078', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Anderson', 'Petra', '88bd29d2-c0f9-4daa-bed9-50ec2f743061', 'BNGE', '12', NULL, 'F', 1, '19210', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wong', 'Gabriel', '891ffefc-5d3e-46b1-948c-fb59f18e83a3', '9BR', '9', NULL, 'M', 1, '15222', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Zheng', 'Maggie', '89322a1e-fe94-4773-818b-845d2cb19794', 'SKNB', '11', NULL, 'F', 1, '19045', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Clark', 'Isla', '89397d56-7c82-4604-b088-83db7a8c6ba0', '6r15', '6', NULL, 'F', 1, '23531', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yao', 'Zechen', '89518d02-414e-440e-addd-80bf351c7235', '10GO', '10', NULL, 'M', 1, '22389', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Millington', 'Holly', '89600813-9c30-411d-b769-2bdffa5f57be', 'SCED', '12', NULL, 'F', 1, '20098', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Chiu', 'Michael', '8967d863-1743-4311-ad2e-0f65ef6e0532', '9MD', '9', NULL, 'M', 1, '14548', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Baker', 'Chloe', '89986b0a-02b3-435e-a789-d31645cd0a07', 'BNWN', '12', NULL, 'F', 1, '20010', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bower', 'Christopher', '89c6c6e3-9d86-4ee0-b87d-a4a7d0dbf551', 'BNBT', '11', NULL, 'M', 1, '21020', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lok', 'Neeton', '8a22f328-bf3f-4b06-8f6d-3cfa142c6d7d', '5r12', '5', NULL, 'M', 1, '19351', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Overcomer', 'Mercy', '8a2430c2-53be-4220-9759-59f9bffe78ff', '10LI', '10', NULL, 'F', 1, '22166', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Liken', 'Lottie', '8a4054ef-226e-4bce-bd21-f2cd0893f646', '10GO', '10', NULL, 'F', 1, '20079', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Garratt', 'Peter', '8a4c20b1-9ede-462a-83aa-e546e4a4e91a', '7BL', '7', NULL, 'M', 1, '16304', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pearson', 'Jireh', '8a5e5d3b-cbdb-47f2-b8bf-e5526bcfc661', 'BNGT', '11', NULL, 'M', 1, '33503379', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Cruz Croucher', 'Sebastian', '8af5be97-e0d8-413a-8d6e-706b2f14332a', '3r9', '3', NULL, 'M', 1, '20215', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Chan', 'Elijah', '8b034e27-c900-419c-b7a4-c6b472b2b8b4', '2r5', '2', NULL, 'M', 1, '22294', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Reyneke', 'Daniel', '8b08ca4c-e82b-42b5-907e-16c6fe0beb56', '4r11', '4', NULL, 'M', 1, '20247', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Cleine-Beaman', 'Joe', '8b143f41-46c5-4344-abf4-00189ff2260f', '8RS', '8', NULL, 'M', 1, '23145', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Edwards', 'Gianeth', '8b206ee0-8eed-43ad-a99a-a5babc4d007f', 'SCSO', '11', NULL, 'F', 1, '23134', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yamada', 'Mysti', '8b74d858-3c3e-4a9c-b5e6-f455e566e3b3', 'SCED', '12', NULL, 'F', 1, '22005', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Zhang', 'Lea', '8c34b1c9-bb42-4d7c-aee2-8ff733d7d1a3', '5r13', '5', NULL, 'F', 1, '20269', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Chung', 'Hyeyoon', '8c5499f6-8921-455d-ac65-a43bc7324ed5', 'SKME', '11', NULL, 'F', 1, '23468', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Vergara', 'Maven', '8c565685-8fae-4d7c-a941-490b21b8ae6d', '7CO', '7', NULL, 'F', 1, '17270', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Schulze', 'Richard', '8c7e32f9-af78-4cb7-ac6e-b15bb10e6df9', 'SCMR', '11', NULL, 'M', 1, '23458', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Rin', 'Natalie', '8d1fe78c-0afc-4c73-bbf3-7a5356138879', '4r10', '4', NULL, 'F', 1, '20249', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Stevenson', 'Noah', '8d4f83fa-8e04-41b7-afa3-96ebc467ccfa', '3r8', '3', NULL, 'M', 1, '23445', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lonsdale', 'Penelope', '8d5aaa26-f87b-458f-8074-ae774776a32a', 'WNBH', '13', NULL, 'F', 1, '19060', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kan', 'Olivia', '8d6d1458-af38-4077-a48e-7b86f2a2bb02', '8EL', '8', NULL, 'F', 1, '15313', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Yang', 'Timothy', '8d6d1631-2427-4dcc-ac6f-fbbdb73f6199', '10LN', '10', NULL, 'M', 1, '20154', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Togiaso', 'Ana', '8d89effa-da12-456d-b769-97bd4cafab4a', 'WNCI', '13', NULL, 'F', 1, '33502722', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ye', 'Houxi', '8d9dc1d2-e95b-42a2-88fc-d866ffe9fa92', 'WNNL', '11', NULL, 'M', 1, '22383', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Jones', 'Isaac', '8da2736c-6951-4e59-a5cf-559a99472b4f', '9BR', '9', NULL, 'M', 1, '23108', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Pope', 'Cohen', '8dda2309-f96b-4823-8de9-39c9fef900d1', '9CN', '9', NULL, 'M', 1, '14511', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Li', 'Alvin', '8defbc1a-945c-484e-8de2-fbc13b3370ad', 'SKMA', '13', NULL, 'M', 1, '18066', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cooper', 'Eli', '8e158b25-f335-4747-9af9-04b94c466858', '4r11', '4', NULL, 'M', 1, '20214', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gui', 'Fatima', '8e551b6b-07fb-46a8-b467-bd119494cf18', '1r3', '1', NULL, 'F', 1, '23437', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Morrison', 'Miriam', '8eaeb7fe-287c-4d67-a97c-1007a4695cdf', 'WNWT', '11', NULL, 'F', 1, '23076', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Pope', 'Austen', '8f1c2884-5567-477d-9df0-4e0ff3099065', '7CO', '7', NULL, 'M', 1, '17271', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Ward', 'Abigael', '8f90a440-350b-4865-8dc9-fd400dfb9ee6', 'WNNL', '13', NULL, 'F', 1, '33502713', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('France', 'Bennett', '8fa5b6ce-7102-4ed4-82e3-86aa33d2e5ec', '1r3', '1', NULL, 'F', 1, '23219', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Dong', 'Zoe', '8fafdad6-8f03-4d56-ba4e-e7ca7a65b6fd', '7CO', '7', NULL, 'F', 1, '23138', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lim', 'Joe', '9050da48-cf3e-4d60-b985-a3992ada20d6', '9SC', '9', NULL, 'M', 1, '21096', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Xie', 'Jason', '907aecf5-8ed4-46e2-9da5-425f5a8269de', '8JF', '8', NULL, 'M', 1, '16218', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('He', 'Alice', '9083ca6a-4ca7-4753-a679-baf345c153d9', '7BL', '7', NULL, 'F', 1, '23118', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Neville', 'Madeleine', '90ff5a1e-763c-4cab-9c3c-c457f6207b2a', 'SKCG', '12', NULL, 'F', 1, '33503116', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lo', 'Ivana', '912bf5f3-e0b5-4fc1-99d4-d5fb49471333', 'SKHG', '13', NULL, 'F', 1, '14213', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Baxter', 'Dylan', '913111a4-be45-4ae3-8e6e-1b4c4eda97f1', '7PM', '7', NULL, 'M', 1, '20210', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Chindove', 'Tamuka', '91377ad6-0dd2-4eca-961e-7b757da85dce', '10GA', '10', NULL, 'M', 1, '14221', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tait', 'C-Jay', '916b9c4d-a7e1-4636-85be-8e48a7ef04a1', '10GA', '10', NULL, 'M', 1, '23529', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Harris', 'Caleb', '917c108b-912b-480f-90cc-d46137a67f74', 'SKHG', '11', NULL, 'M', 1, '23122', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wilson', 'Thomas', '91944845-b9cd-47ae-9aae-6720ef66755f', 'WNWT', '12', NULL, 'M', 1, '33502920', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Chin', 'Val', '91972886-b7c3-401c-91f5-fd47ee252616', '5r13', '5', NULL, 'F', 1, '19388', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mam', 'Bill', '922fcd16-7acc-40f6-aaff-7952f30f3788', '1r1', '1', NULL, 'M', 1, '23203', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kan', 'Isabella', '92531012-7275-4183-bbdb-f466794c58b1', 'SCMR', '11', NULL, 'F', 1, '33503486', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bal', 'Ranvir', '9282469f-9a01-4358-94f8-36513736c259', '6r15', '6', NULL, 'M', 1, '17298', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bradley', 'Zoe', '93013231-8493-4048-a25f-9f2264e5f87f', '2r5', '2', NULL, 'F', 1, '22289', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pomare', 'Micah', '9313fa63-fc34-4bda-b0d4-c2095de0d90b', 'SCMR', '11', NULL, 'M', 1, '33503208', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Doak', 'Aislinn', '93189408-6dd4-4d7a-bb59-d8cf8b20d408', '8CR', '8', NULL, 'F', 1, '22117', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hurren', 'Samuel', '931ba988-941a-41ff-9799-42c3869984c2', '2r7', '2', NULL, 'M', 1, '22317', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Talafu', 'Jordan', '9389691c-6fec-4e51-9345-19dea4476fc3', '7PM', '7', NULL, 'M', 1, '23040', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hill', 'Robert', '9390d90a-edd2-4a9c-a459-e02b40afd992', '9BR', '9', NULL, 'M', 1, '14249', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wong', 'Ethan', '939a1f8c-504b-4c49-8a5d-14c423dd0bf3', 'SCVT', '12', NULL, 'M', 1, '22008', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Eskander', 'David', '93b80d8d-4bba-41f5-80c0-180bcf341eca', 'SKCG', '11', NULL, 'M', 1, '21052', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Chikura', 'Tim', '93d6c0ad-c81b-42e4-a956-93c370265360', 'BNGE', '12', NULL, 'M', 1, '22136', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Rootman', 'Andrea', '941d0f31-e88f-4af0-9735-f621716e2900', 'WNWT', '11', NULL, 'F', 1, '23051', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Wu', 'Daniel', '942eddf9-714b-41d3-a943-7e9ba4f55f1a', 'WNWT', '11', NULL, 'M', 1, '19042', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Yee', 'William', '9436b5a3-25a9-4535-9f75-98cee1b1cd9c', '7BL', '7', NULL, 'M', 1, '23013', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Williams', 'Stanley', '94bcd20b-f991-4816-b059-3efdf724ce79', '3r9', '3', NULL, 'M', 1, '20262', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Smit', 'Matthew', '94e4e696-6564-4497-80e7-5c7024173db0', '4r11', '4', NULL, 'M', 1, '19236', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Kadowaki', 'Tomomi', '94e530e4-aa62-472f-9201-cbe9a83393ff', '9MD', '9', NULL, 'F', 1, '23251', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Utting', 'Rach', '94e9bc51-234d-49a1-8f60-617be1567ba2', 'SCED', '11', NULL, 'F', 1, '18328', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Chavani', 'Lorraine', '95266353-b1c1-4e8a-adaa-5c32193ab599', 'WNAN', '11', NULL, 'F', 1, '23153', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('van Eekelen', 'Caleb', '9530266d-81de-4724-8c93-f27b2d960e29', 'BNGE', '13', NULL, 'M', 1, '15216', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Duffield', 'Kate', '955c92cc-b62b-43d5-a443-cd1f922008e8', 'BNWN', '12', NULL, 'F', 1, '18019', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Williams', 'Dylan', '95d16b74-e542-4fc2-b2c5-09579ece2796', '7CO', '7', NULL, 'M', 1, '20263', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Watson', 'Isabella', '96cbf865-1b0b-4e7c-83d3-7079217994a9', '7BL', '7', NULL, 'F', 1, '23018', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Moe', 'Ayala', '96e55ff5-ac94-4289-8074-12a92d413181', '9BR', '9', NULL, 'F', 1, '21108', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Adamson', 'Flynn', '9727112b-e526-4684-839c-631ac6d52c6b', 'BNWN', '13', NULL, 'M', 1, '17008', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Young', 'Millie', '9740924c-d74b-4cad-a4b1-0c45e68a5173', 'SCED', '11', NULL, 'F', 1, '23009', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Jansen', 'Briarley', '977b7b58-1afb-4498-aa9f-ccf713ac26b8', 'SCBY', '11', NULL, 'F', 1, '21081', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Clerkin', 'Erinn', '97cf64f5-8b6d-481e-9d5a-9843da662159', 'WNAN', '11', NULL, 'F', 1, '19009', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cho', 'Emily', '982d0406-3960-4672-9554-e729d9ddf6ba', 'WNWT', '12', NULL, 'F', 1, '23254', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ryde', 'Gabriel', '982e830c-c71d-4efe-bfb7-5e24f5db6e7b', '9CN', '9', NULL, 'M', 1, '23050', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Smith', 'Mason', '9859af3c-6a6b-44b3-816a-bc8bc2a6e76b', '7MZ', '7', NULL, 'M', 1, '20253', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Gilmore', 'Alexandra', '987b849e-c73c-4e97-84a4-13c719a5d694', '8EL', '8', NULL, 'F', 1, '22107', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Winder', 'Michael', '98a953b7-347c-40e8-a2b0-03650bbbdef7', 'SCMR', '12', NULL, 'M', 1, '22009', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Wang', 'Soaring', '98c772d5-013c-4819-bc4e-114487910e44', 'SKME', '11', NULL, 'M', 1, '22371', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Haselden', 'Aspen', '98dc288c-1a7e-4dc7-98b6-518dcc21d67b', 'BNGE', '12', NULL, 'F', 1, '15207', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hu', 'Gloria', '99122905-6e42-46e7-bb90-a00bd0c63770', 'SCJH', '12', NULL, 'F', 1, '15200', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('de Nysschen', 'Elmar', '991c4698-d18a-494f-bb2b-4e84301930c1', 'SCJH', '11', NULL, 'M', 1, '23446', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Prince', 'Alex', '99814dab-f059-4cfd-8a31-ea7a7f7c7fd8', 'WNMK', '13', NULL, 'F', 1, '17123', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Murray', 'Nova', '9a649d0e-509e-4bf2-8f5f-92a08e0118ac', '4r11', '4', NULL, 'F', 1, '19232', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Marrion', 'Faith', '9a87cef8-c2a3-4c90-bb3c-f9c7ea2f62af', '10LE', '10', NULL, 'F', 1, '20088', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Holah', 'Grace', '9ac346cc-59ed-43ab-9298-a7da4d13c4c1', '6r14', '6', NULL, 'F', 1, '19449', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Norton', 'Lily', '9ae5513e-3ede-4e57-99d1-c58dabd1b587', 'WNMK', '11', NULL, 'F', 1, '23067', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Duarte', 'Victoria', '9afb6e47-4f4e-4b08-90e9-9d985d03a932', 'BNLH', '13', NULL, 'F', 1, '21049', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Drake', 'Asher', '9b2fe830-7a7e-43b7-9272-ab7d94eba282', '4r10', '4', NULL, 'M', 1, '23224', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Peters', 'Abi', '9b55c7f3-e816-4ce6-953f-f3b6f475f842', 'SKME', '11', NULL, 'F', 1, '23062', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Van Kekem', 'Annabelle', '9b7373df-87da-4275-a484-e578267c4b4e', 'BNHK', '12', NULL, 'F', 1, '20172', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Barker', 'Ava', '9b738824-f9e6-4614-9a22-48e4dcab528d', 'SCSO', '12', NULL, 'F', 1, '22155', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Venter', 'Annabelle', '9bb968ee-8271-4895-974b-3bf123f0825a', '7CO', '7', NULL, 'F', 1, '23028', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Duriyapraphan', 'Prod', '9beba7d3-08cc-435f-ba8b-50dea0a49c17', 'WNAN', '12', NULL, 'M', 1, '20177', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Choi', 'Courtney', '9c639f92-0e0b-46ae-8bd9-2dc754cb2fda', '10SN', '10', NULL, 'F', 1, '20028', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Souza Godoy Moreira', 'Paige', '9ca6c181-0a9a-4da0-a90b-a3f05daa7b91', '10LI', '10', NULL, 'F', 1, '14194', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Broughton', 'Boaz', '9cb27de3-990a-4006-9e7c-32a03000af61', '9SC', '9', NULL, 'M', 1, '21023', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Marrion', 'Feona', '9cea985c-c68b-4abc-8482-7753d020e50e', '8RS', '8', NULL, 'F', 1, '22074', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Conner', 'Larissa', '9cecf107-3786-408d-940a-cc7c7bfef9b0', 'WNNL', '11', NULL, 'F', 1, '131328', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Muza', 'Levi', '9d349afd-a820-4255-9292-81b362b8d651', '7CO', '7', NULL, 'M', 1, '17274', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Adams', 'Kaitlyn', '9d4e22e1-3f4e-482e-8b6f-166a0030e8ab', 'SKCG', '13', NULL, 'F', 1, '19047', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Smith', 'Lily', '9d93bbf9-dc22-4bbe-b11b-64567586b703', '9BR', '9', NULL, 'F', 1, '18289', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Monk', 'Amara', '9e04865b-2029-458d-8a5a-b3820f307dc2', '4r10', '4', NULL, 'F', 1, '22324', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Gibbs', 'Cam', '9e0c670e-3c6a-44a6-bcee-11fb6dd36910', '8JF', '8', NULL, 'M', 1, '15290', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Kim', 'Eric', '9e31fcb6-573d-4d5e-bebb-53a7bc672309', 'BNHK', '11', NULL, 'M', 1, '19023', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Harema', 'Anika', '9e6df9f0-2d17-4ff2-bace-9d7134fdb96f', '9FR', '9', NULL, 'F', 1, '23124', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Reid', 'Zealia', '9eb21794-220e-4aea-9f59-8bd71cd0e01b', 'BNGT', '11', NULL, 'F', 1, '23055', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Siose', 'Hanalei', '9ebe9f21-55b5-4193-9d1f-ada8c8e6734b', '9FR', '9', NULL, 'F', 1, '14247', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Williams', 'Toby', '9ee85b49-0d8f-446f-ac87-65d48de221f0', 'SKCG', '11', NULL, 'M', 1, '19041', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Sheng', 'Vincent', '9f2d58f2-bef2-48b5-bca1-3f53c96e392f', '9MD', '9', NULL, 'M', 1, '14243', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Gerretsen', 'Josh', '9f3730b3-843f-4a18-94ea-4c186e1f4b0a', '9FR', '9', NULL, 'M', 1, '21064', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ellena', 'Rocco', '9f3ee0a0-8952-4145-b926-5d83a42668ae', '9FR', '9', NULL, 'M', 1, '22171', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gordon', 'Mia', '9fa4b901-1a7a-4860-9a0c-3c2d6240a21c', '4r11', '4', NULL, 'F', 1, '19350', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ambundo', 'Lel', '9fdd7d97-cf77-4ee9-ad87-262d600f0758', '1R4', '1', NULL, 'M', 1, '22284', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Woods', 'Nate', 'a0a7a00f-080f-414e-b2c6-e2fc77750d19', 'BNGE', '11', NULL, 'M', 1, '23015', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Spicer', 'Olivia', 'a0e8dcc0-f6f0-4b1e-bbe3-1b48bbb406f3', 'WNWT', '13', NULL, 'F', 1, '21142', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Togiaso', 'Arona', 'a0facbb7-07f7-4d13-b65f-f5629bc2fdf5', '10LN', '10', NULL, 'M', 1, '22023', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Huang', 'Jacky', 'a14a9426-5709-4a1b-b407-f32caffaea03', 'WNNL', '11', NULL, 'M', 1, '33503473', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Chavani', 'Ariana', 'a1d7fbdb-683d-43c0-b42c-93d680a09bf2', '1r3', '1', NULL, 'F', 1, '23227', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Campbell', 'Isabella', 'a207fa1a-bcc6-4d64-b24f-06b46a19578e', '6r14', '6', NULL, 'F', 1, '23491', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hayes', 'Samuel', 'a21e084e-1b50-4bd9-8182-854c73ad66b0', '9CN', '9', NULL, 'M', 1, '15224', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Young', 'Toby', 'a2449e8d-6b82-4932-9b81-1f914f6bd94d', 'BNGT', '12', NULL, 'M', 1, '22116', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Henderson', 'Brooke', 'a258a07a-3bab-4ea5-b81c-cca091d59b8f', '7CO', '7', NULL, 'F', 1, '23116', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kapa', 'Hamuera', 'a2aab561-92a3-41e5-9994-9a2658953e9b', 'SKMA', '11', NULL, 'M', 1, '23261', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wong', 'Sophie', 'a2ab1c75-1ca6-46c9-8762-4a4d490639dd', '7PM', '7', NULL, 'F', 1, '16296', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Wilson', 'Blake', 'a2b90942-9702-4681-9373-3df6297153af', '3r8', '3', NULL, 'M', 1, '22343', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Robb', 'Daisy', 'a3322245-341b-400a-b526-b7f7a39cfff8', '10LI', '10', NULL, 'F', 1, '131340', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Smith', 'Brooke', 'a34d633e-6fa9-4d81-8ab8-bf9aabc1b565', 'BNWN', '11', NULL, 'F', 1, '19413', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Posthuma', 'Ella', 'a362ad2c-c40c-4630-bb1f-e832c6bf3bd2', '1r3', '1', NULL, 'F', 1, '23195', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Maddala', 'Anusha', 'a3e88f40-a7bd-4fba-afdf-311c79738756', '10GO', '10', NULL, 'F', 1, '17309', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Guirgis', 'Daniel', 'a437f7e6-61ad-44fa-8de6-4f82e9f6468a', 'BNLH', '11', NULL, 'M', 1, '33503176', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ha', 'Jeffrey', 'a4935654-7502-4a0f-9c30-a22c08642e5e', 'SKON', '12', NULL, 'M', 1, '22105', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Marshall', 'Zasha', 'a49ea89e-d3da-4b3e-8d4e-9a5f2818cc02', 'WNAN', '13', NULL, 'M', 1, '21104', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Minty', 'Eva-Rose', 'a4bb9363-0e22-4112-9c41-5122896a1b28', '9FR', '9', NULL, 'F', 1, '21043', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('McLeod', 'Alexander', 'a4d179ca-07bb-48ee-9b5d-3517b2dd0589', '7PM', '7', NULL, 'M', 1, '17261', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lui', 'Kayla', 'a57c7bc6-a106-41c4-b7e5-c3d9b856843b', '8JF', '8', NULL, 'F', 1, '22076', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Drummond', 'Arlo', 'a58b0b17-e39d-44f6-9f02-a4dca5555da6', '2r5', '2', NULL, 'M', 1, '21197', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cotter', 'Caleb', 'a5974471-27cb-4909-8d29-d3489113ed24', '5r13', '5', NULL, 'M', 1, '18299', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mumford', 'Savanna', 'a5af9466-2f27-4671-9419-b8c04df04717', 'SKON', '12', NULL, 'F', 1, '20414', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Pellow', 'Tahlia', 'a5afa996-814c-44d0-858c-e02756e35130', 'SKCG', '11', NULL, 'F', 1, '16173', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Ho', 'Janelle', 'a5b8c705-8ca2-4577-a738-b0d6f9f3fa0c', '6r14', '6', NULL, 'F', 1, '18282', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bakker', 'Isobelle', 'a5f720ba-4436-4a49-8d88-3dad6c2e40d7', '8JF', '8', NULL, 'F', 1, '16251', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Clark', 'Beau', 'a6187caf-2ab2-4147-a309-1cb29cbdf3a6', '2r7', '2', NULL, 'M', 1, '23530', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Matthews', 'Jordyn', 'a64064e2-2bef-4f5d-b0a8-8b8ff87ecc1b', 'BNLH', '11', NULL, 'M', 1, '23083', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Yu', 'Amelia', 'a65c4bf3-9b6f-4b65-857e-9a5067777cea', '3r9', '3', NULL, 'F', 1, '20267', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Pagaduan', 'Daniella', 'a67932c6-6c88-4859-b0cb-e82285143e70', '6r15', '6', NULL, 'F', 1, '17296', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Jackman', 'Gemma', 'a67cf1e1-8e39-4ee4-afda-c6d539d8c257', 'WNAN', '13', NULL, 'F', 1, '17069', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Couperus', 'Israel', 'a690ab4a-9ba1-4828-bd3e-4152898bc943', '6r15', '6', NULL, 'M', 1, '17297', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Perry', 'Gabriel', 'a6a0f665-1776-4f26-9103-69b3d5357026', '2r5', '2', NULL, 'M', 1, '22328', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Jones', 'Leona', 'a6a56e5b-6fc6-4c19-8b5f-c0ad6d810ea1', 'BNGE', '12', NULL, 'F', 1, '22088', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wiegersma', 'Yuliana', 'a6e8e87d-beda-498a-b939-6fa8b8ed37cf', '9BR', '9', NULL, 'F', 1, '20440', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Yu', 'Jaydon', 'a7084b78-5ad8-45e2-9cf4-98ca69b02b3b', '6r15', '6', NULL, 'M', 1, '18327', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Li', 'Aldrich', 'a75545cd-f794-4fb3-9abc-6688bc870511', '5r13', '5', NULL, 'M', 1, '18310', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wong', 'Daniel', 'a77f1807-3acb-46a1-a961-56ac93d3edc6', '9SC', '9', NULL, 'M', 1, '14551', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Manning', 'Samuel', 'a782070f-a882-4472-b27c-9fc6a0ab634e', 'SKMA', '12', NULL, 'M', 1, '22075', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Bennetts', 'Madi', 'a7a1735b-0b34-4a1f-919f-53c7c44a81e2', 'WNWT', '11', NULL, 'F', 1, '33503150', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Uhm', 'Daniel', 'a7bdc347-0e20-406b-83bd-0873bd7de380', 'WNMK', '12', NULL, 'M', 1, '18058', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Holah', 'Abby', 'a7f4b520-2b27-4e2f-9423-7e48a691b21d', '3r9', '3', NULL, 'F', 1, '21210', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Irvine', 'Ollie', 'a8016ee3-db34-495b-ba0d-9675750fabdf', 'SKMA', '12', NULL, 'M', 1, '22091', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Saunders', 'Kimberley', 'a81e5518-d115-44fd-a29d-20cafd4337c6', '9MD', '9', NULL, 'F', 1, '14250', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Zhao', 'Elim', 'a82b5fea-3d1f-41e6-b1af-007c2bec2e18', 'BNHK', '13', NULL, 'F', 1, '33502806', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Hentschel', 'Josh', 'a8cdbd3f-8ef1-4660-9912-f67bfdbd1596', '10LI', '10', NULL, 'M', 1, '20061', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Schubach', 'Matthew', 'a90e138d-24ae-430b-9d04-ad81d939fddd', '1r1', '1', NULL, 'M', 1, '23534', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Cree', 'Kaitlynn', 'a9367411-6aaa-49ea-9f0e-9f66725e4a19', '5r13', '5', NULL, 'F', 1, '18300', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Misa', 'Leaongo', 'a93c19b6-ec8e-45cc-acde-313fbce074b2', '3r8', '3', NULL, 'M', 1, '20242', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Aveeseina', 'Irae', 'a9620f8b-f214-44bd-a1a3-60f1a6d6f169', '8JF', '8', NULL, 'F', 1, '22157', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yip', 'Ezekiel', 'aa3466d1-76dc-488a-90f9-b0ff7ae6e564', '6r15', '6', NULL, 'M', 1, '18279', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Jansen', 'Hannah', 'aabb3cf8-1ee3-4602-bbc1-6384f434c76b', 'SCVT', '12', NULL, 'F', 1, '20067', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Peez', 'Katy', 'aae8379a-ee16-4fc2-be37-9183a704f5ae', 'SKCG', '12', NULL, 'F', 1, '16195', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Payag', 'Rj', 'aae94319-6d17-4596-81fa-34e449be64ee', 'SCSO', '11', NULL, 'M', 1, '21117', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Thomson', 'Esther', 'aaf6b9cf-8c9a-4188-aef7-a47bdfd2b8d9', '8EL', '8', NULL, 'F', 1, '15303', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Renner', 'James', 'aafcef2b-bce5-47f6-8ddd-2c15900c64bc', 'SCED', '11', NULL, 'M', 1, '16186', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Park', 'Sam', 'ab2388d2-9033-4226-99da-194ea798f9e5', 'SKNB', '13', NULL, 'M', 1, '17117', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Le Roux', 'Marne', 'ab75fae6-8c44-4ffd-a3e8-f1ae3fae84f6', '10LE', '10', NULL, 'F', 1, '16187', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('King', 'Maia', 'abc2cb33-552e-4ba7-9363-f402c9af46c5', '1r1', '1', NULL, 'F', 1, '23211', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Fyfe', 'Evander', 'abc71cc1-b0d3-4b68-9ca1-235ad000bd10', '1r1', '1', NULL, 'M', 1, '23218', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Campbell', 'Ethan', 'abd4e647-5441-4b8b-a38f-a958a89196cc', '9FR', '9', NULL, 'M', 1, '21029', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ellena', 'Rafael', 'abf95c2b-74e8-4942-b002-75558843f319', '3r9', '3', NULL, 'M', 1, '22307', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mitchell', 'Liam', 'ac11cc21-c31c-4be4-943e-e6c81b219782', 'SKMA', '13', NULL, 'M', 1, '21107', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Scott', 'Peter', 'ac2d499a-1d7d-437b-9d39-163d45cfc2da', '9BR', '9', NULL, 'M', 1, '23047', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Crocker', 'Caleb', 'ac4b3a43-dd56-4fdb-acab-7629a0aa3771', '10GA', '10', NULL, 'M', 1, '131330', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Misa', 'Nicodemus', 'ac62ede8-2abd-40d5-b7f4-6924cf6c9ffa', '6r14', '6', NULL, 'M', 1, '18314', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Park', 'Roy', 'aca0c8da-b4dd-43cd-9874-e449893ccc30', '5r12', '5', NULL, 'M', 1, '18316', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Jordan', 'Alice', 'acd5b633-214c-4844-a3ff-9e3545332230', 'WNCI', '13', NULL, 'F', 1, '33502615', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Joseph', 'Caspar', 'acf489e1-858e-49ba-8e49-97f513688a26', 'WNWT', '13', NULL, 'M', 1, '18064', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Davis', 'Eli', 'ad6d8160-eeed-4574-919e-fb385a3827c3', 'SKON', '12', NULL, 'M', 1, '22179', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lau', 'Alex', 'ad826b85-82de-4106-9811-2aac6e91dfaa', 'WNMK', '11', NULL, 'M', 1, '23099', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Barr', 'Aspen', 'ad9b28a3-4318-4d3a-8ca0-c562d6136eb7', '8RS', '8', NULL, 'F', 1, '16208', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wang', 'Michael', 'adbf6d33-f626-4fc3-aaca-8ee2404dcf1b', '7CO', '7', NULL, 'M', 1, '23540', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Saruchera', 'Tapfuma', 'ade20f3b-1319-41f7-a381-aedef11b16c6', '8EL', '8', NULL, 'M', 1, '16238', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Faulkner', 'Lucy', 'ae01413e-a804-44e5-98b4-fd0e990489e2', 'SCSO', '13', NULL, 'F', 1, '21056', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Xu', 'Jess', 'ae3cb8e7-bab9-42d7-b0c9-90db101e2e16', '8CR', '8', NULL, 'F', 1, '16192', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('van Tonder', 'Jake', 'ae4d8a79-ec9f-47f5-9424-510880a007ac', '1R4', '1', NULL, 'M', 1, '22340', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Giddings', 'Anna', 'ae7c3a83-9e88-41de-9faf-fce3e719f287', 'BNHK', '13', NULL, 'F', 1, '33503130', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Han', 'Sunkyu', 'ae80a00b-e4f3-40b3-8716-cef68abdda29', '8JF', '8', NULL, 'M', 1, '23425', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cooper', 'Sonny', 'aeb60daf-1b66-4796-b030-679c73e36a24', '1R4', '1', NULL, 'M', 1, '22298', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Young', 'Lexi', 'aec4c0fc-b84a-4a54-a62b-3633313d8fef', 'SCJH', '13', NULL, 'F', 1, '21168', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Henderson', 'Emily', 'af0a9015-6938-4b35-a142-1a8d704f6333', 'SKCG', '11', NULL, 'F', 1, '19018', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Urata', 'Wataru', 'af2c80c3-c889-4a31-9140-8c4656ed7a4d', '10GO', '10', NULL, 'M', 1, '23559', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Scarlet', 'Hollie', 'af2d30e8-13f6-4b31-a305-6f944a9eef1a', '10GO', '10', NULL, 'F', 1, '22038', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Chin Poy', 'Judah', 'aff34ddb-a4ae-406c-a091-ba6282dc7628', '8EL', '8', NULL, 'M', 1, '19196', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Guo', 'Will', 'aff86669-4d65-4ef7-9a51-3c8202739613', 'WNAN', '13', NULL, 'M', 1, '18062', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hannen', 'Catherine', 'b01ea5b3-97cb-43d6-a380-f001ace589aa', 'WNWT', '13', NULL, 'F', 1, '33502448', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Uy', 'Jack', 'b0268f0a-6cb6-4a44-a03b-0234ae728b6b', '4r10', '4', NULL, 'M', 1, '19240', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Atienza', 'Zeph', 'b028ce57-4398-4041-b2d2-5442b7520de4', 'SKME', '11', NULL, 'M', 1, '21006', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Faulkner', 'Charlie', 'b030c839-2931-4dba-a3f8-bc90b4148e15', '10SN', '10', NULL, 'M', 1, '21055', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ennor', 'Lucy', 'b0fb3291-bd20-488e-bd33-6b2122a836af', '2r7', '2', NULL, 'F', 1, '21199', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Woodfield', 'Nadia', 'b10b88fd-05f0-41b2-8bc7-788971c33b55', 'WNMK', '12', NULL, 'F', 1, '22007', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Jin', 'John', 'b10d6011-8888-4a62-a6fc-22be711e2b20', '9MD', '9', NULL, 'M', 1, '23488', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wagteveld', 'Elina', 'b15c770f-83b5-4a28-807c-f0038c367ead', 'SKCG', '13', NULL, 'F', 1, '21157', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Bal', 'Preet', 'b2424814-d7bc-43c3-8652-c892cd190e67', 'SCBY', '12', NULL, 'F', 1, '15199', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wu', 'Jessica', 'b244ee76-d7c4-40dd-b1b4-be99eb2e7fc7', '4r11', '4', NULL, 'F', 1, '19244', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Morgenstern', 'Anna', 'b2fc700d-f861-487d-9917-bbe7d31acbfc', 'SCJH', '12', NULL, 'F', 1, '20100', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lim', 'Ethan', 'b3501946-1088-4d46-a601-3619c86f0641', '1r1', '1', NULL, 'M', 1, '23206', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Stolzenberger', 'Mason', 'b350abc9-68b4-49fc-b24b-99f94c32d2af', 'WNAN', '12', NULL, 'M', 1, '33503449', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Wallis', 'Asher', 'b36e3e49-9fe5-4886-b58d-26a4a361be6d', '6r15', '6', NULL, 'M', 1, '17299', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Smith', 'Leric', 'b3841cc1-2cbc-4af3-b088-01ec8e0c5d5a', 'BNGT', '12', NULL, 'M', 1, '21179', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Sutaschuto', 'Sudha', 'b3cc493e-fb4a-45be-a128-79f490675f50', 'BNLH', '12', NULL, 'M', 1, '20178', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Trouten', 'Eli', 'b3fd4c5d-6dbf-487c-b809-e6053f6226d7', 'SCED', '11', NULL, 'M', 1, '23461', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hentschel', 'Ben', 'b3ffbf3d-aca1-4b6d-a359-e6556cfd8a07', 'SKCG', '11', NULL, 'M', 1, '19019', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lowe', 'Jack', 'b40f96bc-1480-4992-9650-8faeeee23b72', 'SCBY', '11', NULL, 'M', 1, '21099', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Ballingall', 'Harvey', 'b4126f8a-81a1-434c-bbd1-074cc39b5d80', '6r14', '6', NULL, 'M', 1, '17281', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gomez', 'Honour', 'b4883e10-830e-44f4-a917-bb5dc101a223', '2r7', '2', NULL, 'F', 1, '21205', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Thorpe', 'Amelie', 'b4d57fee-4d6d-40ee-a9a0-f82cb810ba3b', 'SKHG', '11', NULL, 'F', 1, '23034', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hughes', 'Allie', 'b4dc1809-6c7e-49de-a98d-e420f0c86161', 'SKME', '11', NULL, 'F', 1, '33503161', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gibbs', 'Mila', 'b52b77d5-d969-4c7a-932f-3a5930c9c99e', '6r15', '6', NULL, 'F', 1, '17282', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Robson', 'Tom', 'b5914236-2231-4a3b-850b-f9cc89315f24', '9SC', '9', NULL, 'M', 1, '23052', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Burnell', 'Alyssa', 'b5e9d56d-0022-4223-9860-cb222f0944b4', '7BL', '7', NULL, 'F', 1, '23160', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wang', 'Lucas', 'b5ebb64a-378c-4073-a31b-54b710a8b338', '1r1', '1', NULL, 'M', 1, '23186', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Jones', 'Cody', 'b5f595fd-198f-4f5b-ac7c-4b97c50461b2', '10GO', '10', NULL, 'M', 1, '22168', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wiegersma', 'Phoenix', 'b608ce9d-e9e7-44ca-8743-190c6658a8c5', '6r14', '6', NULL, 'M', 1, '20261', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Manning', 'Braxton', 'b679f18f-6eab-44b2-93a0-f645253daade', '6r14', '6', NULL, 'M', 1, '21217', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Choi', 'Caleb', 'b6b7fd4b-b9e4-46ae-affd-01c198044bb8', '7CO', '7', NULL, 'M', 1, '17268', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hoyt', 'Marica', 'b6bef534-933f-4531-8581-5336d7550e46', 'SCBY', '12', NULL, 'F', 1, '22095', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hansen', 'Amelia', 'b6ca6a67-992e-4c20-b945-a898b4315ef1', 'BNLH', '11', NULL, 'F', 1, '19016', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Shi', 'Karl', 'b6d986e9-9738-435e-8f82-6ce3192be3b2', '8EL', '8', NULL, 'M', 1, '17325', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Yeo Hui Ernn', 'Claire', 'b7298a84-293d-4337-b085-2e52358921f1', '9SC', '9', NULL, 'F', 1, '23012', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Lewis', 'Will', 'b73b1af5-f1bf-4403-a6c3-91cab7637788', 'SCVT', '11', NULL, 'M', 1, '14168', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Nguyen', 'Vy', 'b74d4de1-8d33-4295-967d-eb5e513785e1', 'SCBY', '12', NULL, 'F', 1, '22365', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Misa', 'Sisilia', 'b78fffdf-31f6-4202-bb24-df63e2f712aa', '10SN', '10', NULL, 'F', 1, '14227', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Falconer', 'Alicia', 'b7a4dc3f-1a95-4a50-98fb-7390e22a11e0', '5r12', '5', NULL, 'F', 1, '18303', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cooper', 'Alethia', 'b7e19935-c3c7-4582-9045-438fb0aa6c04', '9CN', '9', NULL, 'F', 1, '18330', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Orcajada', 'Franchesca', 'b81068b0-fab9-437a-a3ef-5c112ddc21da', 'WNAN', '13', NULL, 'F', 1, '17115', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Chan', 'Elisabeth', 'b88bbdec-3211-4f70-ad19-3e47b9a8e014', '9CN', '9', NULL, 'F', 1, '23154', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pearson', 'Emily', 'b8a33496-109d-4b82-a0aa-adcce488952e', 'BNWN', '13', NULL, 'F', 1, '33503100', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Kim', 'Kevin', 'b90fbbb2-9254-4818-a8cd-804ed140a130', 'SKME', '11', NULL, 'M', 1, '20186', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ellena', 'Eva', 'b93c8b7c-78dc-49c0-b032-ea9539a911df', 'SCBY', '11', NULL, 'F', 1, '22170', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Romero', 'Gabbie', 'b948d4bd-03a1-45e5-b4d9-4f2c6775217e', '7BL', '7', NULL, 'F', 1, '16258', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Chang Jimenez', 'Emma', 'b983f6e1-e779-4862-bf8a-32cc4f3b99d7', '1r1', '1', NULL, 'F', 1, '23228', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Maumau', 'Marieta', 'b991baea-9909-4f21-a5f4-af7d5db58207', '7MZ', '7', NULL, 'F', 1, '16326', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Sudo', 'Rei', 'b99ecc38-f779-4fbd-8bfb-bb7771567d85', 'Enrol', '11', NULL, 'F', 1, '23570', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Shaw', 'Ethan', 'b9c68a2b-da32-4503-abd8-79627189f8d0', '8JF', '8', NULL, 'M', 1, '22035', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Landon-Lane', 'Lucy', 'ba1c200a-d09b-444a-83bf-11a74e9c4c12', '7MZ', '7', NULL, 'F', 1, '23102', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wu', 'Canaan', 'ba6809de-0251-4b90-a451-b947154cf421', '7BL', '7', NULL, 'M', 1, '17269', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hyde', 'Amy', 'ba6f2714-3731-474a-8205-af0a37eade15', 'SCMR', '13', NULL, 'F', 1, '17066', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Muchena', 'Hannah', 'bb02d27a-cbe6-444e-bc0e-054ae8c72021', 'BNBT', '12', NULL, 'F', 1, '20102', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Eggers', 'Isaac', 'bb1339b7-3c8b-499b-a5f7-1bc4176600ef', '4r10', '4', NULL, 'M', 1, '20219', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Li', 'Yichan', 'bb2b44b2-46b7-421c-b22d-4fe69bd21e2b', '10GO', '10', NULL, 'F', 1, '23447', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Stark', 'Finlay', 'bb461575-0189-4b1c-8f30-d337f0e83c9a', 'SCMR', '11', NULL, 'M', 1, '23043', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Morton', 'Henrietta', 'bb5b342e-fc8a-409d-b199-9c53e243fd30', 'WNAN', '12', NULL, 'F', 1, '23075', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('de Belen', 'Mac', 'bb694771-df97-43ed-b068-416160c06437', 'SKHG', '11', NULL, 'M', 1, '19161', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('van der Colff', 'Jonty', 'bb7625b8-b829-4c89-b886-7ffce332ea35', 'BNGE', '12', NULL, 'M', 1, '18059', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Drauna', 'Simeli', 'bb857d8f-2fc4-40f3-868d-f837628854fb', '9CN', '9', NULL, 'M', 1, '22172', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Liu', 'Kyan', 'bb91d7b8-1540-4071-af8a-b83e1431cd7b', '1r1', '1', NULL, 'M', 1, '23205', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Smith', 'Alexis', 'bb97ce96-a4b8-40a0-8191-3a0faeef86da', '2r7', '2', NULL, 'F', 1, '22337', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Tan', 'Lucas', 'bbecda76-a953-4b9f-a29b-a1a118f42a27', 'WNCI', '12', NULL, 'M', 1, '19004', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Pagaduan', 'Jadon', 'bc23425c-69df-41a2-918d-4d5c465a2a2c', '9SC', '9', NULL, 'M', 1, '14527', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Ling', 'Esther', 'bc4d0ab0-af0f-478b-8919-a44fff2f7f00', '10GA', '10', NULL, 'F', 1, '131376', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Jansen', 'Luke', 'bc7904c7-95f3-41ca-9dc2-b0972238bf66', '10LI', '10', NULL, 'M', 1, '21082', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Clarke', 'Nico', 'bcb5a843-ab36-44d6-86c6-8226d87176c1', '8JF', '8', NULL, 'M', 1, '23149', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Choe', 'Daniel', 'bcf25a04-618b-4fe3-98e7-945c8ed30ac9', '10GA', '10', NULL, 'M', 1, '14192', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('George', 'Cardazki', 'bd054505-a30c-4d88-86e7-499cf649ac06', '6r14', '6', NULL, 'M', 1, '21203', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Sainsbury', 'Abbey', 'bd4dc396-c3fc-4908-83f1-f6bb1c1bb54a', 'SKNB', '12', NULL, 'F', 1, '33502830', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('George', 'Ben', 'bd4f8e7a-be0c-4cbc-a3d1-0feeb7a19271', 'BNLH', '13', NULL, 'M', 1, '17049', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bedggood', 'Isabella', 'bd5565d6-a5d1-498d-8320-53353f5dc2e0', '10LN', '10', NULL, 'F', 1, '131389', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tan', 'Andrew', 'bd5a8ac2-d38e-48e2-a5b4-a88eca819a12', 'SCMR', '11', NULL, 'M', 1, '23039', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Kim', 'Roy', 'bd96a9ba-e64b-4fd2-9083-fc26377f42cb', '7PM', '7', NULL, 'M', 1, '20231', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Yu', 'Joel', 'bdbcd671-8298-418f-87f7-2fd96883ffa1', 'SCBY', '11', NULL, 'M', 1, '21169', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Woods', 'Rachel', 'bdc81114-362b-48bb-a7ed-ef819da1c7fe', 'BNBT', '13', NULL, 'F', 1, '21166', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Wei', 'Ella', 'bdfb1494-f478-4446-8874-2e8e56864a4d', '6r14', '6', NULL, 'F', 1, '17293', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Pretty', 'Isaac', 'be126304-5186-45a3-a272-d914e935dffb', '8CR', '8', NULL, 'M', 1, '22045', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Pagaduan', 'Jumig', 'be4c2d48-978c-43ee-8c20-2cb9807fdd82', 'SCSO', '13', NULL, 'M', 1, '33503099', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Bussararungsi', 'Pai', 'bf05a658-7455-4322-962a-8d654e4f0672', 'SCED', '11', NULL, 'M', 1, '23231', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Joseph', 'Deegan', 'bf097838-8f89-41c4-8c5a-29e8574c07c7', '8CR', '8', NULL, 'M', 1, '19195', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kim', 'Esther', 'bf68145a-2f98-4ec1-9d68-3bb116243c14', '10SN', '10', NULL, 'F', 1, '22084', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Henderson', 'Libby', 'bfeed451-fa91-4e2d-96e1-42f47f00a694', '7PM', '7', NULL, 'F', 1, '23115', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Davis', 'Tessa', 'bff1fe20-f9cb-484c-bd88-0d3520a1b34e', 'WNMK', '11', NULL, 'F', 1, '23140', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Dowall', 'Maia', 'c00730b3-9adc-4bcc-9935-e33452814881', 'BNGE', '11', NULL, 'F', 1, '23137', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Poulsen', 'Logan', 'c041a278-7b3c-4d16-894c-d9840a659336', '5r12', '5', NULL, 'M', 1, '21243', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Shi', 'Ethan', 'c07436aa-dc15-4256-8f6f-71706f58977e', '8EL', '8', NULL, 'M', 1, '16248', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Wang', 'Coco', 'c07b2425-86ef-40e6-b0d0-da5999671a08', '8EL', '8', NULL, 'F', 1, '21237', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Blewett', 'Marica', 'c0984418-f43c-4c2d-8272-38349b41188e', '8CR', '8', NULL, 'F', 1, '22148', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Shyle', 'Ethan', 'c0b07098-4f87-4dd9-8ef3-bf1510b6177a', '8CR', '8', NULL, 'M', 1, '23444', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Zhen', 'Terry', 'c0c0be85-bfd8-4b9b-b46d-5789307ef6ac', 'SCVT', '11', NULL, 'M', 1, '19044', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Jaquiery', 'Christiana', 'c17804c3-b567-48a4-9fbc-80bd07354314', '9BR', '9', NULL, 'F', 1, '23496', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('McConnell', 'Ethan', 'c1a07322-54ee-4245-af74-8daf9f024e44', '9BR', '9', NULL, 'M', 1, '14535', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Chai', 'Gabriel', 'c1bc2d18-8a74-4ac7-a329-a098317ddd42', 'BNGE', '12', NULL, 'M', 1, '20025', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Trenuela-Chan', 'Ayden', 'c20f2c92-1196-47dd-9ae6-61cb4623a5b3', '9MD', '9', NULL, 'M', 1, '23032', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lawry', 'Caitlin', 'c210d400-8c12-4f11-a983-edb805bc14f7', '5r12', '5', NULL, 'F', 1, '18309', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Judkins', 'Joshua', 'c216719f-6c64-40b4-97ed-884846c426df', '8EL', '8', NULL, 'M', 1, '16229', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Coulbeck', 'Brooke', 'c26f300f-76a3-44bd-b02a-99a242283576', 'WNWT', '13', NULL, 'F', 1, '21038', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lau', 'Raphael', 'c277f90c-89b3-48ee-b795-517c69e8f641', '2r7', '2', NULL, 'M', 1, '22320', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('van Garderen', 'Saskia', 'c28726e5-08d4-45c8-a821-da47b5a51eab', 'BNGE', '13', NULL, 'F', 1, '33502724', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Karati', 'Moriya', 'c2a77afb-b150-4e8f-9af4-df833d01248b', 'BNHK', '13', NULL, 'F', 1, '33502810', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Docherty', 'Charlotte', 'c2b0f829-d713-406b-8244-d76a6194d0b1', '10SN', '10', NULL, 'F', 1, '21045', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Milne', 'Jesse', 'c3639946-182f-45c2-bdff-be43e68b2c70', 'BNGT', '12', NULL, 'M', 1, '18043', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Scarrott', 'Joshua', 'c370b5df-3c7a-49e4-aa26-6802757996d3', '9CN', '9', NULL, 'M', 1, '21130', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('France', 'Henry', 'c38c0eb0-addc-46e7-8349-6b2e251bf2fd', '2r5', '2', NULL, 'M', 1, '22309', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Williams', 'Emily', 'c394f338-1fce-451e-ac57-cb768f390c52', 'BNWN', '13', NULL, 'F', 1, '21164', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Davis', 'Lilly', 'c39d45bb-81af-49d2-af8c-c699d7a4efb3', 'SKNB', '11', NULL, 'F', 1, '23141', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Stocks', 'Elsie', 'c3d25c84-bac0-46d5-9cc5-8b101dc8a9d3', '9CN', '9', NULL, 'F', 1, '21145', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ramos', 'Wade', 'c3f32673-428f-47ad-a1a3-802e9e8eecdf', '7MZ', '7', NULL, 'M', 1, '23057', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Plew', 'Lara', 'c407b89a-9af8-4eed-a876-c2395924855e', 'BNGE', '12', NULL, 'F', 1, '16215', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Buena', 'Lorraine', 'c416c887-79be-4749-a9ff-8e77bdb7b118', 'WNMK', '11', NULL, 'F', 1, '21026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wu', 'Elisha', 'c41adbce-7bbd-4fb1-8463-c001e48ef45e', '8EL', '8', NULL, 'F', 1, '19194', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Prince', 'Grace', 'c43688a0-1cb1-4155-afc0-56161e94f6f2', '9BR', '9', NULL, 'F', 1, '21120', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Boag', 'Matthew', 'c437899b-ae91-421b-8d13-ccfbd7c395f0', '9MD', '9', NULL, 'M', 1, '21019', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Opsima', 'Jared', 'c43c52b8-f915-49c2-9368-6c016d7985b8', '10LI', '10', NULL, 'M', 1, '20108', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('McCrostie', 'Theo', 'c445599d-6a6f-4a25-b275-636c6627c147', '3r8', '3', NULL, 'M', 1, '21222', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Azer', 'Veronica', 'c4665466-8aef-41a1-99f6-0d6bb2fc219c', '8RS', '8', NULL, 'F', 1, '22175', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gerardo', 'Irvin', 'c476ac07-f8fd-43bc-93c1-212d4fb6d99d', 'SCVT', '13', NULL, 'M', 1, '20408', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Conner', 'Bethany', 'c47cf514-f664-49f2-a614-76d3e331984c', 'WNNL', '13', NULL, 'F', 1, '33502403', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Clarkson', 'Felix', 'c53634c1-5ea6-4ef4-b811-37e4e4f9178f', 'SKCG', '11', NULL, 'M', 1, '23147', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ha', 'Ji Hoon', 'c586ca29-bfd4-4e76-97d2-76eae044281c', 'WNAN', '11', NULL, 'M', 1, '22104', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Zhang', 'Doris', 'c58a089d-d6fc-4408-97aa-50ffa94db25e', '9BR', '9', NULL, 'F', 1, '14555', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Gillies', 'Isaiah', 'c59e2fbd-c6af-4c4b-9bd1-3bb439e88f07', 'WNAN', '11', NULL, 'M', 1, '23417', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Han', 'YiZiYu', 'c5ae4df7-3912-41bd-b7a1-4744beed5cab', '9MD', '9', NULL, 'M', 1, '17307', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bennetts', 'Lucas', 'c5f9ba40-50d2-49e8-8950-13161dcbe5a3', 'BNGE', '11', NULL, 'M', 1, '33503331', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Li', 'Audrey', 'c617c06d-56db-4e04-8d15-5cf4b8250aa2', '8JF', '8', NULL, 'F', 1, '16230', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kumagae', 'Kaynan', 'c642f1a9-ae4f-409f-80e8-4f0a54689066', 'SKME', '13', NULL, 'M', 1, '21088', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Siitia Te Awhe', 'West', 'c649e384-1649-448c-ba35-c5e4ed354479', 'WNCI', '13', NULL, 'M', 1, '23257', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Kurochkin', 'Oleg', 'c6d077f8-ab26-45bf-a99d-a34f8ab6962a', 'SKON', '13', NULL, 'M', 1, '21089', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Rodger', 'William', 'c702bd88-974f-4b3b-a4b3-019216e92378', '8CR', '8', NULL, 'M', 1, '22040', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Hu', 'Jerry', 'c76784f9-ecaa-4457-b7e7-e2d65d2b4090', '7BL', '7', NULL, 'M', 1, '23113', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Mackey', 'Lily', 'c77cd636-56b6-41a4-a399-93689de1982d', '5r13', '5', NULL, 'F', 1, '19230', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Wong', 'Gideon', 'c78da063-305d-4b6c-940e-4c9ddd51e36c', 'WNBH', '11', NULL, 'M', 1, '33503207', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Gerretsen', 'Rosie', 'c7aad898-09a3-4a79-9559-43fe9a4194a5', '7CO', '7', NULL, 'F', 1, '23129', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Colvin', 'Anna', 'c7e618fd-7e42-4a10-924c-051acd99c91d', 'SCVT', '13', NULL, 'F', 1, '19052', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Andrews', 'Jack', 'c81184f0-1174-4e1c-9f90-88bc54b2535d', 'SKHG', '13', NULL, 'M', 1, '21003', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Kay', 'Eden', 'c81f7c0b-83f7-4a78-b856-26bdfccba807', 'SCED', '11', NULL, 'F', 1, '17312', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Brown', 'Gloria', 'c824a582-2ada-47e6-8ff3-1bc7f5bdc676', '5r12', '5', NULL, 'F', 1, '18296', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Drake', 'Ella', 'c8284407-719f-4537-a3fb-f5eb70c1b767', '7BL', '7', NULL, 'F', 1, '23136', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Li', 'Annabelle', 'c86d6d5e-3b49-40f9-8e2c-0a51a3160eff', '1r3', '1', NULL, 'F', 1, '23208', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Prakhongthanaphan', 'Taofah', 'c877457a-e6fc-4971-b4f2-3eeb2e28ee88', '5r13', '5', NULL, 'F', 1, '23236', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Manson', 'Tom', 'c8a11418-d6ae-4a1b-b9c9-0e5d14a3fdab', '9FR', '9', NULL, 'M', 1, '21103', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('King', 'Charlie', 'c8da0668-ae48-4879-ade7-9366de99fe8e', 'SCVT', '11', NULL, 'F', 1, '23103', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hayton', 'Benjamin', 'c9004cbb-1958-4afa-9ce1-6e62cc990bf4', 'SKHG', '12', NULL, 'M', 1, '20057', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Munnings', 'Rebecca', 'c9153ddd-58ac-48ba-a4b5-59fef61c279a', '4r10', '4', NULL, 'F', 1, '20438', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Nakashima', 'Yuu', 'c96764bb-ed12-4539-a264-37b74b0b5b28', 'BNBT', '11', NULL, 'M', 1, '23069', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Skilling', 'Maddie', 'c971225e-342b-4330-9a57-ac2a8f53d075', '3r8', '3', NULL, 'F', 1, '20446', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Harnett', 'Emily', 'c9b772f4-b532-4c90-aeed-91a17552319c', '10LI', '10', NULL, 'F', 1, '20053', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bruce', 'Esther', 'ca0ca1f4-da8e-4fa9-a934-037955fb2a23', 'WNMK', '13', NULL, 'F', 1, '21025', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Munnings', 'Daniel', 'ca168e24-a596-4b87-9b35-9c615dff3417', '1r3', '1', NULL, 'M', 1, '23197', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Bishop', 'James', 'ca19690d-67f1-41d2-bd46-ccf7f95c9fc2', '7BL', '7', NULL, 'M', 1, '23163', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Anderson', 'Jay', 'ca286c60-b760-4254-88da-54397876ebcb', 'BNLH', '11', NULL, 'M', 1, '19209', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('van Nieff', 'Alina', 'ca34242a-0fd1-4f20-83be-b56f35b81ac1', '10LN', '10', NULL, 'F', 1, '15195', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Chan', 'Isaac', 'cad55c5d-ef91-4972-9d26-076f01dca9ba', 'SKNB', '12', NULL, 'M', 1, '20387', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Huang', 'Ally', 'cafe4d6e-01cd-40d4-937d-eb737bb14c08', '8JF', '8', NULL, 'F', 1, '15362', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bird', 'Emma', 'cb2243a6-9288-480b-91e2-5be01c047ab9', 'SKME', '12', NULL, 'F', 1, '33502850', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Nyamutswa', 'Muneni', 'cb615870-f91e-4eb4-b093-c2cd35c6cc1e', '1R4', '1', NULL, 'M', 1, '22327', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Posthuma', 'Austin', 'cb9e34b1-b218-4c55-8537-c9812ce6f3ec', '8CR', '8', NULL, 'M', 1, '22050', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Cadigan', 'Ruby', 'cbbbb941-207b-4f83-bed9-3f10c0efc0ef', '10GO', '10', NULL, 'F', 1, '22144', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Marsden', 'Larissa', 'cc23301a-5cac-4104-a150-f758bb3f57e3', 'WNBH', '11', NULL, 'F', 1, '23110', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Winters', 'Levi', 'cc2bf23a-a822-4c5f-ab93-42c1f2a2e876', 'BNGE', '13', NULL, 'M', 1, '21165', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lawry', 'Emily', 'cc4cd4e1-3eaa-4f1f-8cca-8243e1987fc8', '1r3', '1', NULL, 'F', 1, '23209', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Aylward', 'Devon', 'cc663688-d49f-4071-8959-a8d649691e76', 'SCED', '12', NULL, 'F', 1, '20009', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yang', 'Aria', 'cc66a8d1-92f0-4426-bb38-4ef6cc6f0b67', '6r14', '6', NULL, 'F', 1, '18326', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Botherway', 'Preston', 'cc9984f1-dccf-4fdc-a233-57af529c2fb8', '9SC', '9', NULL, 'M', 1, '23410', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Choi', 'Aiden', 'cca7d363-b09d-45bf-ba2f-c9a18b824df4', '8JF', '8', NULL, 'M', 1, '22133', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Milmine', 'Jessica', 'ccc0b035-aa2f-4d18-9fe7-d62107c133b2', '8JF', '8', NULL, 'F', 1, '22063', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Rin', 'Emily', 'cccca1ab-2523-4c75-a6fa-1b5d9c480a9d', '6r15', '6', NULL, 'F', 1, '18278', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Immanuel', 'Jedi', 'cce90d10-56c8-49f7-b2ae-6eb3e18bf530', 'SKME', '12', NULL, 'F', 1, '22093', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Qian', 'Tina', 'cd06d63a-fe7b-40fb-b972-060a48719465', 'WNNL', '13', NULL, 'F', 1, '17340', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Wylie', 'Hunter', 'cd2c5a7d-8d36-4631-a211-74f1225163db', 'WNWT', '12', NULL, 'M', 1, '22006', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lofredo', 'Andy', 'cd35b0ce-e85f-4938-a2e2-e461c61e1d44', '9CN', '9', NULL, 'M', 1, '15286', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Couperus', 'Ephraim', 'cd5c7504-855a-4d19-9761-954ebad8eed4', '8EL', '8', NULL, 'M', 1, '15315', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Zheng', 'Yi', 'cd6a490a-48ca-486f-9304-fe408e2fdc89', 'SKME', '11', NULL, 'F', 1, '21339', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Goodall', 'Amelia', 'cdc367b7-b3ce-430e-8de1-96a91d0c3d5c', '4r11', '4', NULL, 'F', 1, '19223', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ainsworth', 'Isabella', 'cdca289e-6a08-43f8-98a3-ded7ec034f0d', 'SCBY', '13', NULL, 'F', 1, '17009', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('du Bruyn', 'Daniel', 'ce091225-23dc-4e8f-9b4f-c7b28696199b', 'BNBT', '13', NULL, 'M', 1, '21048', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Little', 'Mia', 'ce14472b-67aa-417d-b006-c88a2c3033bf', '4r10', '4', NULL, 'F', 1, '20235', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Soper', 'Isabel', 'ce454863-e893-4bb3-bc99-010a600ec49e', 'SKCG', '12', NULL, 'F', 1, '18052', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Manning', 'Jake', 'ce4f43a1-391a-4a01-a005-dd72615a9985', 'BNGE', '11', NULL, 'M', 1, '23087', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Suarez', 'Zed', 'ce66a0a3-7d97-4703-bad8-43a03084a237', '8CR', '8', NULL, 'F', 1, '22029', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Li', 'Peiyun', 'cea8c5d0-17d7-4a68-bfc3-1f4542802cd3', 'SKCG', '12', NULL, 'F', 1, '23433', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Baker', 'Grace', 'cec17589-9506-4d0f-bbe5-03665442f8b4', 'BNGT', '11', NULL, 'F', 1, '21010', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Boaru', 'Grace-Naomi', 'cec22737-44fb-4990-aee8-0e15f9d49108', '7PM', '7', NULL, 'F', 1, '19204', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('McKenzie', 'Naomi', 'cf5e0353-0163-43d5-9d5a-3bbd615ec421', '1r3', '1', NULL, 'F', 1, '23199', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Cummins', 'Emily', 'cfcc680a-78ac-41e7-9619-74796643fc44', 'BNWN', '11', NULL, 'F', 1, '33503501', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ho', 'Chloe', 'cfe2936e-79ab-4061-8721-83c11471f666', '2r7', '2', NULL, 'F', 1, '22315', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ofa', 'Tupou', 'd049c4ec-683e-452c-8b0b-a5d0463662d7', 'BNLH', '11', NULL, 'F', 1, '23065', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Jiang', 'Rochelle', 'd04bfe96-c6d8-4e26-86aa-fc6a10045986', '7BL', '7', NULL, 'F', 1, '16306', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Dinnissen', 'Kees', 'd05aa45d-5c61-44f6-af0f-b44bae17c6e6', '9SC', '9', NULL, 'M', 1, '21044', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('McConnell', 'Ella-Rose', 'd07e651a-28ec-4a1e-a4fd-def61a48c914', '7PM', '7', NULL, 'F', 1, '16317', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Sibi', 'Afrayim', 'd080a2cf-6070-429e-ae1f-b25d49f2fc1d', 'WNNL', '12', NULL, 'M', 1, '18385', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('van Mechgelen', 'Maaike', 'd0bd1f1a-04fb-4b8c-8777-4d6605f119dc', 'SKON', '12', NULL, 'F', 1, '22014', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Meecham', 'Tobias', 'd0d57b9b-fbb4-44db-9062-e4fc7812df80', 'WNCI', '12', NULL, 'M', 1, '22068', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Bader', 'Eva', 'd12651fe-cd87-4b4e-93f3-eb4d9924c9f9', 'SKNB', '13', NULL, 'F', 1, '21009', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Jordan', 'Caleb', 'd153a243-3140-4f9f-af44-672abac32bcb', '8EL', '8', NULL, 'M', 1, '16209', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Gee', 'Toby', 'd1b2e4a5-edb1-46de-9b48-598c8be54cbd', '10GO', '10', NULL, 'M', 1, '22108', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Clerkin', 'Sofia', 'd1c9f59d-2f1c-4100-85f1-74744e06f7ec', 'WNCI', '13', NULL, 'F', 1, '17039', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Boyd Pettitt', 'Lecia', 'd1cc1f9d-071b-43d7-b4cc-5071a94feabe', '5r12', '5', NULL, 'F', 1, '19349', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Given', 'Monty', 'd2208c04-f30d-42de-98a6-a1417b9a98f3', '9FR', '9', NULL, 'M', 1, '21065', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lineham', 'Louis', 'd23fe247-06c5-4164-9afd-4e4a03b933c0', '5r13', '5', NULL, 'M', 1, '21213', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Annan', 'Katie', 'd2535000-837c-437c-8a39-c59c913be0d5', 'BNBT', '12', NULL, 'F', 1, '33503120', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Newton', 'Max', 'd290169a-1ab5-4969-94c4-65875aa84fa1', '10GO', '10', NULL, 'M', 1, '14200', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Owen', 'William', 'd2934e44-1077-46c7-bab2-18448803ad35', 'WNBH', '12', NULL, 'M', 1, '22176', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Bartlett', 'Zoe', 'd29f69e9-5555-4c20-bf93-954a03c46901', 'SCED', '11', NULL, 'F', 1, '33503329', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hitchens', 'Tahlia', 'd2a4634c-a0d9-4958-91e5-90fe54ab0340', 'SCED', '11', NULL, 'F', 1, '21073', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Monk', 'Arden', 'd2df0bc4-d613-40e8-8da2-0375741264ab', '5r12', '5', NULL, 'M', 1, '22325', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Dodd', 'Alexandria', 'd30495e7-fb1a-41e8-9742-ec8b5698f381', 'WNMK', '12', NULL, 'F', 1, '33503154', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Buckley', 'Reuben', 'd308d6e0-e6ae-4ade-bd88-9d199664433a', 'SKCG', '13', NULL, 'M', 1, '33503096', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Chan', 'Lowanna', 'd382d282-3f3f-447b-b1bf-46e89940a7e7', '10LE', '10', NULL, 'F', 1, '22137', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Son', 'Deborah', 'd3846b21-e0be-45b2-9a82-08539198278f', '5r12', '5', NULL, 'F', 1, '18322', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Fraser', 'Kaitlyn', 'd399f299-c135-492e-8621-1718ee03787f', '9SC', '9', NULL, 'F', 1, '14550', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Drauna', 'Ratu', 'd39c3d79-5653-455e-a79a-5106f78458b4', '2r5', '2', NULL, 'M', 1, '23223', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Santiago Oliveira', 'Daniel', 'd39da54c-ec4a-49e0-8056-83d6f92c90a7', '10LN', '10', NULL, 'M', 1, '22039', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Romero', 'Kianna', 'd3ad62aa-8cd5-4e1c-8fe1-5eecbd7e7b15', 'BNWN', '12', NULL, 'F', 1, '33503400', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Harvey', 'Trinity', 'd3d33c03-a4ce-4a2d-a73a-7fc32ac31324', 'SCED', '13', NULL, 'F', 1, '23435', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Harris', 'Mackenzie', 'd3f83039-18e3-49ed-8a3b-d5b5e017d8e6', '5r13', '5', NULL, 'F', 1, '18304', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Manson', 'Sam', 'd4a46de6-8665-4d1d-a0d9-636d472977e9', 'SCVT', '11', NULL, 'M', 1, '19026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Van Kekem', 'Brooklyn', 'd4af0cc1-4aff-4e0d-8523-d43cd1474acd', '10LE', '10', NULL, 'M', 1, '22016', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Milmine', 'Liam', 'd51181dc-0146-4f5b-8695-28642ab2df73', '10SN', '10', NULL, 'M', 1, '22065', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Drummond', 'Harvey', 'd51e83e4-7ec9-4451-888d-493d6511550f', '4r11', '4', NULL, 'M', 1, '19217', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Carter', 'Ollie', 'd5bf4ad1-3847-4a44-bc12-4a4c0532a97b', 'WNCI', '12', NULL, 'M', 1, '20023', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Carpenter', 'Emily', 'd5dd57f2-2684-4d0d-a949-9462053528a6', 'SKMA', '11', NULL, 'F', 1, '23176', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Si', 'Zuriel', 'd5e3dffb-7191-4f7a-a17f-df6dba79b55f', '1R4', '1', NULL, 'M', 1, '22335', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Jeong', 'Kenny', 'd5edb3d3-f923-47d3-88fc-6d386213bf91', 'SKME', '12', NULL, 'M', 1, '18027', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Sainsbury', 'Ella', 'd5f30707-db72-463a-87dd-b05b78c13450', '9FR', '9', NULL, 'F', 1, '15180', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Cummins', 'Reuben', 'd6330b50-7812-4d12-86e9-c89ac564d402', 'BNBT', '11', NULL, 'M', 1, '33503502', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mein', 'Renee', 'd67fa04e-3d60-4013-a148-89846d0d638c', 'SKCG', '12', NULL, 'F', 1, '22067', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Sung', 'David', 'd6cb32b4-95e3-4efa-9594-58fb1ed64a71', 'SKHG', '11', NULL, 'M', 1, '21147', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Dick', 'Harrison', 'd71aa184-dbe7-4430-aa3e-d5ec4e4ff996', 'SCBY', '12', NULL, 'M', 1, '22119', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Harvey', 'Molly', 'd71bd0b8-eecb-4236-bf01-237a3c128351', '10LI', '10', NULL, 'F', 1, '20054', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Harris', 'Eliya', 'd778def6-452f-401a-bd26-dddea5c990c1', 'WNCI', '13', NULL, 'F', 1, '21068', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Duarte', 'Isabella', 'd81063a1-dca1-401f-84ee-0f74e225c7d6', 'BNLH', '11', NULL, 'F', 1, '23135', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Evans', 'Luca', 'd8191eb7-6582-463e-bbc3-166e4b003896', '10LN', '10', NULL, 'M', 1, '131372', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Park', 'Lime', 'd87f86c1-3d67-4f41-aba6-d70d8ea9b7ae', '3r9', '3', NULL, 'F', 1, '20245', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Kwan', 'Isabella', 'd8df179c-532a-40e4-8ec9-28871c8ad3e8', '7CO', '7', NULL, 'F', 1, '17272', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cooper', 'India', 'd8fbe83a-4bad-405c-bffa-72d0672d2f5b', '7MZ', '7', NULL, 'F', 1, '18283', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Cameron', 'Phoebe', 'd956a6a9-4469-4370-8c8a-95dc3e984bcf', 'SCJH', '13', NULL, 'F', 1, '33502720', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ishizaki', 'Ghen', 'd9ab0581-2088-4e0a-94e1-7acd139c4e89', 'BNLH', '13', NULL, 'M', 1, '21077', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Beshara', 'George', 'd9e6cf86-0256-4529-8451-b14e847c7ac0', 'SCBY', '13', NULL, 'M', 1, '20381', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Campbell', 'Luke', 'd9eb0a4f-feba-42d7-992f-e4d1dda2fc70', '4r11', '4', NULL, 'M', 1, '23492', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Bisseker', 'Toby', 'd9f02c10-fd50-4179-b0d1-31452913e87b', '5r13', '5', NULL, 'M', 1, '19212', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lu', 'Olivia', 'da0a6fcb-aed7-4056-a0b3-e42335d319ec', '5r12', '5', NULL, 'F', 1, '20276', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Ramirez', 'Sophia', 'da27b8b2-bd3b-4d87-a45b-7736495cbab0', 'WNWT', '13', NULL, 'F', 1, '19067', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Wallace', 'Zac', 'da9a9af9-142a-4f28-a760-7403553c2852', 'SCMR', '12', NULL, 'M', 1, '33502813', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Trethowan', 'Neeva', 'db4b7426-20df-4fae-a10a-10cde7a743ee', '3r9', '3', NULL, 'F', 1, '20256', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Skilling', 'Izzy', 'dbe819a7-27ae-4ef9-b5aa-4e71abf01edf', '2r7', '2', NULL, 'F', 1, '22336', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Santiago Oliveira', 'Samara', 'dc12f098-1d0a-499f-b730-31543db6f9a1', '2r7', '2', NULL, 'F', 1, '22331', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Binu', 'Kenus', 'dc233b80-d374-47f0-adc2-a843b9c1e343', 'WNMK', '11', NULL, 'M', 1, '23164', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ramsay', 'Solomon', 'dc792ec2-4463-4b3c-9629-58de13085fd3', '1R4', '1', NULL, 'M', 1, '22329', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Mulholland', 'James', 'dc809fd8-251c-4eae-9f3f-fdd89fc48dee', 'WNBH', '11', NULL, 'M', 1, '33503174', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Taveesak', 'Mio', 'dca84201-62ae-4ba9-b36d-2bda4727694a', '10SN', '10', NULL, 'F', 1, '22369', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Smith', 'Jared', 'dce2c70f-927c-40ed-a6c0-63f0179a0223', 'SCED', '13', NULL, 'M', 1, '21138', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Smith', 'Jemma', 'dd56486d-b90d-4ccf-848d-0102b5244bb9', '9SC', '9', NULL, 'F', 1, '23044', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Gibbs', 'Reuben', 'dd71ac97-8f02-4307-9cd4-e2cd78b920a4', '2r7', '2', NULL, 'M', 1, '22311', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Clancey', 'Samuel', 'dd72db3f-630d-4c7b-a92d-258817aa9ef4', '1R4', '1', NULL, 'M', 1, '22296', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Judkins', 'Amber', 'dd9bc456-8355-48ab-adf7-61f7a175f4bd', '9FR', '9', NULL, 'F', 1, '15192', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Yi', 'Sun Woo', 'ddce202f-dcc9-4c5a-bd9f-02f7ff1bbf6e', 'SKNB', '13', NULL, 'M', 1, '15262', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Irvine', 'John', 'dde3b797-3dc1-4d1c-9def-5e74418f85a4', '5r13', '5', NULL, 'M', 1, '18307', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lee', 'John', 'ddec52ae-3217-4eba-bbed-39118a7382a0', 'SKME', '13', NULL, 'M', 1, '21092', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Sefo-McGregor', 'Daniel', 'ddf6a3e1-d242-4be1-976f-ecf1b527bb51', '5r12', '5', NULL, 'M', 1, '22332', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Chong', 'Emmanuel', 'de11873c-2b10-4875-93fc-abe77eef3dad', 'SKME', '12', NULL, 'M', 1, '21335', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Jiang', 'Rachel', 'de170351-3e89-49ce-84b3-28f5cf55e65d', 'SKHG', '11', NULL, 'F', 1, '16181', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Percy', 'Jack', 'de2f9d22-379c-402c-b3f0-9e08cc2e81ab', 'SCBY', '12', NULL, 'M', 1, '15206', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Muraya', 'Alice', 'deaf458c-06c9-44d3-ac06-24e9c1ac0ffd', 'SCSO', '11', NULL, 'F', 1, '23072', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Harrington', 'Rebecca', 'ded69986-cffe-4681-916e-6080f91d5554', 'BNGT', '11', NULL, 'F', 1, '33503467', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Edwards', 'Ezra', 'df091ce6-4147-4910-af84-ae4e6bf77607', '9BR', '9', NULL, 'M', 1, '23133', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Diggs', 'Lincoln', 'df2116b8-6dcf-4c2d-b228-7340244431b9', '4r11', '4', NULL, 'M', 1, '19216', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Waretini', 'Lewis', 'df63e2dd-daa8-4744-ae69-1d4eeca91bdb', '9SC', '9', NULL, 'M', 1, '21159', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Brooks', 'Amelia', 'df6494f9-5ca1-4ba3-b578-ddc9c6d95194', '9MD', '9', NULL, 'F', 1, '21022', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Watson', 'Georgia', 'dfb1b226-42cc-4b7d-ba51-a6ad5f6e49da', '7PM', '7', NULL, 'F', 1, '23019', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Smith', 'Jonah', 'dffccdb8-4bf7-4b41-b1be-30a7b6b80d06', 'BNGE', '11', NULL, 'M', 1, '21139', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Roentgen', 'Jason', 'e00b9cc9-6d36-47a5-aabd-c0ce4a57457f', '6r15', '6', NULL, 'M', 1, '17294', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Xu', 'Kay', 'e013c0ab-225b-4196-bb34-af47bca00a13', '2r7', '2', NULL, 'F', 1, '21240', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Duke', 'Ryan', 'e0598d88-78d1-4c5f-909a-70ad157d7a6f', 'WNBH', '13', NULL, 'M', 1, '14174', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lowe', 'Wilf', 'e085ac79-7a70-4db0-a936-741b9f55d049', '7MZ', '7', NULL, 'M', 1, '23091', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kang', 'Esther', 'e0982f3b-8591-47f7-a7cf-a76e81534a69', 'WNCI', '13', NULL, 'F', 1, '19469', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Joubert', 'Miah', 'e0a3bd3c-8233-450e-8760-d60254888bd8', '7CO', '7', NULL, 'F', 1, '23106', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lu', 'Archie', 'e0efaac8-eb60-48e2-a083-3586a8defb78', '5r12', '5', NULL, 'M', 1, '18312', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Podolian', 'Illia', 'e157173b-90d7-4cc2-b637-caa96ebcc3fd', '10GA', '10', NULL, 'M', 1, '20114', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Thomson', 'Sarah', 'e15fc91a-8e89-4d34-8c7e-72b41ccc2c2f', 'WNCI', '11', NULL, 'F', 1, '33503177', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Moe', 'Shanna', 'e171e47a-5f98-479e-aac5-9b04f71b9a59', 'WNBH', '11', NULL, 'F', 1, '19031', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Tey', 'Vanna', 'e19f34e7-3d94-4511-94b0-19e5079f04b2', 'WNBH', '11', NULL, 'F', 1, '23035', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Mam', 'Peter', 'e233eecb-3622-46d3-a910-e610ead56790', '7CO', '7', NULL, 'M', 1, '17258', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Yee', 'Kenneth', 'e263253f-5b9c-4371-b00d-79856d5640e0', '8EL', '8', NULL, 'M', 1, '22163', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Diggs', 'Liberty', 'e266f826-347c-4cff-b32b-ab047fbdb25d', '1r1', '1', NULL, 'F', 1, '23225', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('France', 'Elliot', 'e26cfe62-e0b8-4a9d-8fbf-05b9ba3b9dec', '4r11', '4', NULL, 'M', 1, '19219', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yao', 'Zehong', 'e2706abd-d6ab-4998-a922-b6e31c3e639d', '10LN', '10', NULL, 'M', 1, '23415', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Stuart', 'Raya', 'e2745f85-bd26-4aca-a4b8-0408b3611885', '4r11', '4', NULL, 'F', 1, '19238', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Fukofuka', 'Santino', 'e289c76c-19a7-4492-8a77-cd3fdf1ed2ca', 'WNMK', '11', NULL, 'M', 1, '23462', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Au', 'Jordan', 'e2f62501-81a0-41cf-87f6-857ec2ccec2d', '1r3', '1', NULL, 'M', 1, '23230', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Lee', 'Yani', 'e2fe7a38-5c33-4209-9148-91c499929eed', 'SCVT', '12', NULL, 'M', 1, '23252', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Manson', 'Ben', 'e31940be-3e4e-48ab-8a11-3bb47704eaed', 'SCED', '12', NULL, 'M', 1, '20086', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Mafua', 'Salote', 'e39d66cb-6052-4b45-aecd-cd00783f5553', '10GO', '10', NULL, 'F', 1, '17311', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Masara', 'Sainiana', 'e3b71f0c-e828-4b3b-b7be-807c04238b67', 'SKME', '12', NULL, 'F', 1, '23259', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Longduriyang', 'Win', 'e4093874-20b1-40b0-b795-9e73d5182ff7', 'WNCI', '11', NULL, 'M', 1, '23256', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Wong', 'Sarah', 'e43638ea-321c-4cfb-8e76-39a2a9f81c87', '1r3', '1', NULL, 'F', 1, '23183', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Lopez-Montofre', 'Isaac', 'e489eb7f-eb2d-4ba9-8d65-95143225d249', '10LN', '10', NULL, 'M', 1, '22080', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Frazer', 'Isabella', 'e4b216bd-e5a8-4604-bca4-88f92169a101', '7MZ', '7', NULL, 'F', 1, '21201', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Shaw', 'Kayla', 'e4bab06b-2f44-4f09-a270-23ccbba6c4bc', '5r12', '5', NULL, 'F', 1, '23192', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Burgess', 'Samuel', 'e4bd70da-a418-4f3f-a988-8e02e4dca16e', 'SKCG', '12', NULL, 'M', 1, '18015', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Manson', 'Zoe', 'e4c7e414-539f-4040-ac3e-4c660f7860cf', 'WNNL', '11', NULL, 'F', 1, '20166', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Stavrou', 'Judah', 'e524cc9c-1801-4a02-b15e-effc9228a19b', '10LE', '10', NULL, 'M', 1, '15194', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Sheng', 'Levi', 'e5427e60-ea77-492b-b934-fa293d77e9d0', '7MZ', '7', NULL, 'M', 1, '16239', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Choi', 'David', 'e5660c00-5d8f-4741-adce-179cf5edcddc', '9MD', '9', NULL, 'M', 1, '23152', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Luiters', 'Tashmari', 'e59b1d92-b30a-4a92-9f39-94b35117d2cd', '9FR', '9', NULL, 'F', 1, '23089', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Donaldson', 'Jake', 'e5afb784-494c-4c44-af22-618d14b08925', 'SCVT', '12', NULL, 'M', 1, '15208', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Tasker', 'Isaac', 'e5c5d0ce-262b-4879-82fe-8079ef2769ca', '9MD', '9', NULL, 'M', 1, '14534', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Liu', 'Elaine', 'e5c88652-403a-4d5a-842c-a5222bdaf3c0', '6r14', '6', NULL, 'F', 1, '18311', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lee', 'Dongeun', 'e5d8d186-d7f9-44f2-9b92-fde2774c5321', '8CR', '8', NULL, 'M', 1, '23240', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Smith', 'Luke', 'e5d8d754-7307-48fc-a8d9-42f27e9a7b32', '5r13', '5', NULL, 'M', 1, '22338', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Scheib', 'Bradley', 'e6481151-52f8-4286-9034-a1ba93b03c49', '10GO', '10', NULL, 'M', 1, '22037', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Foster', 'Saxon', 'e6d9fc03-2237-434a-87e7-1e13cc81b914', '4r11', '4', NULL, 'M', 1, '19218', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ennor', 'Mordecai', 'e6f4064d-242c-459a-a59b-9a96547fca66', '1r3', '1', NULL, 'M', 1, '23221', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Saunders', 'Shenaye', 'e74768f6-766a-49f4-a17b-b215b4a4b7b3', 'SCMR', '12', NULL, 'F', 1, '20121', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('McLintock', 'Shylah', 'e7c22deb-9d9f-4820-977f-cd5215831f38', 'SCVT', '13', NULL, 'F', 1, '17099', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Fu', 'Tongxi', 'e7ce9bb0-420e-43ed-bc71-8758e39ae5f5', '10GA', '10', NULL, 'F', 1, '20377', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Liu', 'Noah', 'e81cc6d0-544b-4bbc-9f79-5ffe55ea63e4', 'BNWN', '12', NULL, 'M', 1, '33503156', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Ko', 'Phoebe', 'e8a0d2f0-2c23-44e5-980e-4068e594ecae', '1r1', '1', NULL, 'F', 1, '23210', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Ellis', 'Abbie', 'e8c137fe-83db-4f3d-87bd-30dcf84fdf7c', 'SKNB', '11', NULL, 'F', 1, '21050', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Fenika', 'Fetu', 'e8c5dd5d-e376-4f94-a8c8-81bad7642b9f', '8RS', '8', NULL, 'M', 1, '22113', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hartstonge', 'Elysia', 'e8e06f24-5962-4cd7-861c-7078236a4dad', '8RS', '8', NULL, 'F', 1, '20223', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Pope', 'Francesca', 'e8e144a5-cf79-4dfe-a4f7-5a31e4189b1e', 'SKON', '12', NULL, 'F', 1, '33503118', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Brown', 'Charlotte', 'e92b4177-5b23-45ea-876e-a548f37ed405', 'BNHK', '13', NULL, 'F', 1, '21024', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Campbell', 'Tristan', 'e9573bd5-160e-4f67-b3a4-ab3f43ff6134', 'SCMR', '13', NULL, 'M', 1, '19049', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yeo', 'Daniel', 'e96f8ac9-ac89-4f43-a291-0bac6a6a98ba', '9FR', '9', NULL, 'M', 1, '15272', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Capill', 'Mariah', 'e9962a24-057c-4031-9365-d460826b2b0f', '1R4', '1', NULL, 'F', 1, '22292', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Chan', 'Eleasha', 'e9aacdc1-b1b5-4e50-9ccd-c9befe476b35', 'SCJH', '11', NULL, 'F', 1, '23155', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Wensley', 'Michela', 'e9b65399-1e3b-424e-bbaa-232ce7eb12e9', 'SCVT', '11', NULL, 'F', 1, '21162', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Santos', 'Aldrin', 'e9bdda89-ac85-447d-94cd-c9aaece91fc4', 'SCJH', '13', NULL, 'M', 1, '21129', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:25'),
('Lee', 'Steve', 'e9d0d1da-3950-4935-9378-08e0c95a5092', '9CN', '9', NULL, 'M', 1, '21093', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Jun', 'Sam', 'ea406468-f291-4802-ac2b-6cbf2255c21f', 'BNHK', '12', NULL, 'M', 1, '18030', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Kim', 'Hannah', 'eaae9744-3b8b-4646-81ed-3a01c19ee62f', '9MD', '9', NULL, 'F', 1, '18290', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Greig', 'Naomi', 'ead9e247-58d4-42f4-8433-4f704ef75a0a', '8EL', '8', NULL, 'F', 1, '16247', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Mumford', 'Mark', 'eadb5d20-c678-417b-acfc-788c46be86e9', '9SC', '9', NULL, 'M', 1, '21246', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Dos Santos', 'Mateus', 'eaf3f87d-d479-43e3-a677-de7f17efe672', '7PM', '7', NULL, 'M', 1, '16297', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Uy', 'Bryan', 'eb1762f9-386c-463c-b8a9-49ae41fea375', '5r12', '5', NULL, 'M', 1, '18325', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Oakley', 'Isaac', 'eb781ee6-9e40-4768-bf8b-a7bb606b5b97', 'SCED', '12', NULL, 'M', 1, '15209', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Duke', 'Tom', 'eb9b3104-a718-477a-900d-6f1ce7d917c8', '8RS', '8', NULL, 'M', 1, '15291', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Oosthuizen', 'Josh', 'ebcc9714-9800-4d9f-910a-26e06756bd6b', '8RS', '8', NULL, 'M', 1, '22057', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Jaftha', 'Romeo', 'ebe342e6-ef41-4071-ab02-b0ee673a74ef', 'SKON', '12', NULL, 'M', 1, '22135', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Newbury', 'Lexie', 'ec56d4c5-13c1-4d6d-a5e7-bbb0f7f71cbc', '2r5', '2', NULL, 'F', 1, '21225', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Brand', 'Kirsten', 'ecacffdd-2b46-4f1a-9225-6133768fb8e5', 'SKON', '12', NULL, 'F', 1, '22145', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('O\'Dell', 'Abbie', 'ecce15ab-96f6-4c7c-8ff9-cebc4afb0ef1', 'SKCG', '13', NULL, 'F', 1, '21115', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Pheng', 'Zoe', 'ed240982-d698-46ba-9fa7-5e44cdac7d75', '7MZ', '7', NULL, 'F', 1, '23061', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Wu', 'Emma', 'ed783cb8-0f13-4935-b4c3-7d422c982624', '1r1', '1', NULL, 'F', 1, '23182', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Pattison', 'Annie', 'edce73c6-7d1d-4485-8115-d3c0e8982dd4', '10LE', '10', NULL, 'F', 1, '22052', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Crawford', 'Stella', 'eddb16ee-7a5f-4ea6-bc84-f1d1854b0f95', 'WNWT', '11', NULL, 'F', 1, '21039', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Spring', 'Theresa', 'edfc4c18-2ec0-40cb-87fa-81770c63133f', '10LN', '10', NULL, 'F', 1, '22031', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Atienza', 'Sophie', 'ef1fb56e-c889-4ecd-ac2d-b64f36f75bb4', 'SKON', '13', NULL, 'F', 1, '21005', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Hoskins', 'Asher', 'ef3237b0-225d-4a43-b742-108e63cd9692', 'SCJH', '11', NULL, 'M', 1, '19020', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Millington', 'Ethan', 'efa53547-426e-4b24-a838-c78e07f9345d', '9CN', '9', NULL, 'M', 1, '21106', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Jantaramaneewong', 'Kwang', 'f030cba8-f9aa-460e-a2d9-e73bf13b8353', '10SN', '10', NULL, 'F', 1, '23535', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wang', 'Danny', 'f0535da0-2ebb-4455-8618-73ec3b6832fc', '3r8', '3', NULL, 'M', 1, '23539', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Yee', 'Kai Ying', 'f09e1a36-40af-4418-849c-484defbe8105', 'WNAN', '11', NULL, 'F', 1, '19165', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Gerber', 'Keegan', 'f0c77c5c-bff8-4e7a-8891-f1b7bb3dec75', '9BR', '9', NULL, 'M', 1, '21062', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Mohi', '\'Ana', 'f0d3b749-b571-46be-ad6a-8d5293ee6657', 'SKHG', '11', NULL, 'F', 1, '21176', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Huang', 'Richard', 'f0e633a7-d5d6-4515-8619-74aa124f99a4', '6r15', '6', NULL, 'M', 1, '17283', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lau', 'Rena', 'f1353e59-a2c9-420d-b51f-4876061a4cb2', '5r12', '5', NULL, 'F', 1, '22321', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Hansen', 'Danielle', 'f1b90250-c71f-414b-8b4f-574a47e1b465', '10GA', '10', NULL, 'F', 1, '20052', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('d\'Auvergne', 'Gabriella', 'f1e96256-ac13-4e07-8ac3-4da48b53a5da', '10LE', '10', NULL, 'F', 1, '20033', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gracey', 'Annabelle', 'f1ee8b6e-fc5b-4f10-9740-072eaef22932', 'WNMK', '11', NULL, 'F', 1, '33503167', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Harrison', 'Micah', 'f1ef1750-630e-4a41-a1e6-50f13477901c', '9SC', '9', NULL, 'M', 1, '23121', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Clements', 'Heidi', 'f22707f4-aa30-40c6-bfe1-96c745f89a2a', 'SKME', '12', NULL, 'F', 1, '22130', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Yu', 'Dahel', 'f23816c3-e19c-4c89-ae64-1eb7a0bf3a4b', '9BR', '9', NULL, 'F', 1, '23008', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Ngu', 'Eunice', 'f2661d4b-3cee-45d5-b632-f3c66d6a8305', '10LE', '10', NULL, 'F', 1, '22376', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('McEwan', 'Eilish', 'f26f8bcc-df52-462d-ab63-440af4728c1b', 'SCBY', '11', NULL, 'F', 1, '19029', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Yang', 'Zachary', 'f281dca0-55d4-44a2-968b-21116e1fd33c', '3r9', '3', NULL, 'M', 1, '20266', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Han', 'Jiah', 'f32015ff-d3bb-460a-a25f-911ab8924705', '5r13', '5', NULL, 'F', 1, '23424', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Mwedzo', 'Ryan', 'f36dff71-d8ee-4f04-b273-d11f53a31508', 'SKMA', '11', NULL, 'M', 1, '23071', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Villa', 'Mel', 'f39029c9-5d76-42de-9481-249e324b7cb0', 'WNCI', '12', NULL, 'F', 1, '15205', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Turnbull', 'Sophia', 'f3ff91c8-231e-4be3-abb4-bfb3099119d8', '10SN', '10', NULL, 'F', 1, '22020', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Manning', 'Hunter', 'f4954984-98f3-4c2b-b6bd-0ee677775cc6', '7BL', '7', NULL, 'M', 1, '21218', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Garland', 'Amber', 'f4a609f9-fdca-4134-9f06-c66103c52689', 'BNGE', '11', NULL, 'F', 1, '23131', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Pelotin', 'Charlotte', 'f4b76e29-6146-4cce-9344-8f7af8cce05d', '7MZ', '7', NULL, 'F', 1, '17280', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Ta\'ala', 'Poppy', 'f4fb6049-0ba0-46d0-a6fc-94a07b1c96ed', '3r8', '3', NULL, 'F', 1, '20255', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Chitena', 'Ted', 'f50a356d-68e2-4acf-bd51-a10469e02679', 'SCMR', '12', NULL, 'M', 1, '22134', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Nadarajah', 'Jesica', 'f5ca8d95-943f-406f-90f0-f42993215427', '4r10', '4', NULL, 'F', 1, '20243', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kim', 'Byoungwoo', 'f5e3607e-b723-42dc-8c48-ee81443b00de', 'SKON', '13', NULL, 'M', 1, '20185', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Bennetts', 'Samuel', 'f61e9f5e-ded0-4971-ae2b-40120376c1d9', '5r12', '5', NULL, 'M', 1, '18295', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Molina', 'Anica', 'f695853c-bbac-40eb-acf5-9e29115165a5', '10LN', '10', NULL, 'F', 1, '21109', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Bartlett', 'Sophia', 'f6c0c718-a5d2-4c93-bbc3-d9b989744f81', '6r15', '6', NULL, 'F', 1, '17291', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Joseph', 'Nathan', 'f6de45a5-1ec3-4e7c-b9d5-0f74bd3697b4', 'WNMK', '12', NULL, 'M', 1, '22087', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cooper', 'Olivia', 'f761ccfa-dc0b-4e9d-ab14-4b768bae0c63', 'BNGE', '11', NULL, 'F', 1, '19456', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Diggs', 'Judah', 'f779320e-2f93-4273-ba5c-93ffb2953804', '6r15', '6', NULL, 'M', 1, '17288', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Thompson', 'Noah', 'f7879ad1-01ed-49b1-94c2-ab574fa0826c', '8JF', '8', NULL, 'M', 1, '22026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Hosking', 'Matthew', 'f808e21e-b8e9-4b40-b61d-1a1dba4ce4bf', 'SCBY', '12', NULL, 'M', 1, '22096', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Souza Godoy Moreira', 'Zoe', 'f8544f1b-8cbf-46d0-b0b8-c3427f2663b8', '1r3', '1', NULL, 'F', 1, '23190', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Regnault', 'Meg', 'f8c8fab5-f14d-4519-a47f-6329545130e3', 'SKNB', '13', NULL, 'F', 1, '21122', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Beckingsale', 'Ryan', 'f8ec0741-7b5e-4d98-9075-8809f7a38213', '10LI', '10', NULL, 'M', 1, '18292', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Brindley', 'Harry', 'f916ffd8-fcea-42ce-a5e9-1a3ad56b2dca', 'WNMK', '11', NULL, 'M', 1, '19006', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Fyfe', 'Zoe', 'f91d90a1-039e-4f7a-a1df-575ae5679452', '7MZ', '7', NULL, 'F', 1, '16318', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gillies', 'Malachi', 'f9431d7c-99c6-44cd-92f5-12f1d0b97463', '7MZ', '7', NULL, 'M', 1, '23418', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Stuart', 'Luca', 'f9484a3d-6ba7-4e34-98cb-7e3b6ade2357', '6r14', '6', NULL, 'M', 1, '20254', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Ma', 'Max', 'f9749c4d-1e2b-4772-b895-b0fdcb65b5dc', 'SCBY', '13', NULL, 'M', 1, '19299', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Lu', 'Issachar', 'f98564b1-7c04-47dd-8c1b-3f5ccceab81b', '6r15', '6', NULL, 'M', 1, '18313', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Cree', 'John', 'f9d39e43-cad2-4707-9a0a-2d3faa91ed1e', '2r7', '2', NULL, 'M', 1, '22299', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Holliday', 'Jess', 'f9f0325c-9035-47e9-a9e4-e8de44d3a5f6', 'SCED', '12', NULL, 'F', 1, '22098', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Wilson', 'Keira', 'fa0a20f8-ea0b-4aa4-9a06-a037cacf9a48', 'SKHG', '12', NULL, 'F', 1, '33502804', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Spring', 'Judith', 'fa1dfca9-244b-4fb4-b58d-b78a4ecd940c', 'BNHK', '13', NULL, 'F', 1, '19074', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Spoelstra', 'Levi', 'fa394021-a7c1-4728-abf8-192034c74630', 'SCSO', '12', NULL, 'M', 1, '18053', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Johnston', 'Hugh', 'fa4988c1-2fe4-4b2e-ba7a-3016d5e1a5fa', 'SKCG', '12', NULL, 'M', 1, '18028', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Chalmers', 'Gianna', 'fa592d4b-147b-4a9c-a03c-fbb1792e2930', '9BR', '9', NULL, 'F', 1, '21032', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Thamthiankul', 'Phoom', 'fa67cc23-4ee3-436f-aff2-21ff77e158a4', 'SCSO', '12', NULL, 'M', 1, '22370', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('England', 'Isabel', 'fa790d0a-68cc-4729-adc9-6070387c8357', '8CR', '8', NULL, 'F', 1, '22115', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('McKellar', 'Rachel', 'fa91fd45-99fc-4e48-96c6-387fdb1c06c1', 'WNMK', '11', NULL, 'F', 1, '17313', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Hoffmann', 'Jné', 'fab1af8b-a53f-47a0-b61e-d70c502591de', 'BNBT', '12', NULL, 'F', 1, '22099', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Foster', 'Hazel', 'fb070a11-d2ad-4fef-80d3-b47f33855f7a', '8RS', '8', NULL, 'F', 1, '16234', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Ma', 'Daniel', 'fb11e68a-7f5e-4ef4-aa71-06ed7a9902f1', '8CR', '8', NULL, 'M', 1, '22167', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Monk', 'Cohen', 'fb32c39d-831a-46d9-8b72-95426b1fd74b', '8JF', '8', NULL, 'M', 1, '22061', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Naktuean', 'Keng', 'fbcfa247-5c4f-4b31-b889-343aead72619', 'SCJH', '11', NULL, 'M', 1, '23551', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Yang', 'Jamie', 'fbd83d65-3fa0-4c5f-8f83-ba411b5c2be8', 'SKMA', '13', NULL, 'M', 1, '14177', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:27'),
('Mohi', 'Sifa', 'fc550809-283f-4e85-aa7f-68e0ce7a1e8d', 'SKNB', '13', NULL, 'M', 1, '18368', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Le Roux', 'Eli', 'fc949deb-132b-4bfa-bf7f-3046dc124be8', 'WNCI', '13', NULL, 'M', 1, '21091', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Lynch', 'Anna', 'fcaf7481-4670-412b-9aa2-42eea9eed809', '5r12', '5', NULL, 'F', 1, '19186', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Li', 'Jiayi', 'fcb20b54-cf13-4869-97e2-76d67af5f45c', '10SN', '10', NULL, 'F', 1, '23536', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Highsted', 'Samuel', 'fcbab9c1-579b-4324-ba27-ddfd9ca95341', '10SN', '10', NULL, 'M', 1, '20062', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Markham', 'Ivy', 'fcc0e01e-72e5-4720-a4bb-d1cea8d14bf0', 'BNBT', '13', NULL, 'F', 1, '19061', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Stavrou', 'Mabel', 'fd11de0e-5f8e-4997-bc08-4ddf1ddccd94', '6r14', '6', NULL, 'F', 1, '17292', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Thomson', 'Joel', 'fd1425a2-193d-40cb-be36-54f4ac8fc1f7', 'SCJH', '12', NULL, 'M', 1, '15211', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:44', '2023-12-04 09:00:26'),
('Pelotin', 'Mark', 'fd365c56-003a-4352-85f3-bb4c7d514c54', '1r3', '1', NULL, 'M', 1, '23196', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Docherty', 'Iona', 'fd611803-57ca-4dba-8466-d9ef0909cb4a', '10GO', '10', NULL, 'F', 1, '21046', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Garratt', 'Hudson', 'fde228bd-568e-4290-886b-18a9c5b9187f', '10LI', '10', NULL, 'M', 1, '14196', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Plew', 'Karena', 'fe3bc8fb-270a-44c0-b6bd-f72aa52db6ed', '10LE', '10', NULL, 'F', 1, '16183', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:25'),
('Nacion', 'Juleana', 'fe87f1dd-7d30-4c49-990d-81decef5e3bf', 'SCBY', '11', NULL, 'F', 1, '23070', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Oelofse', 'Conner', 'fe939f0d-35be-4459-839e-6fc3c66d585c', 'BNGT', '12', NULL, 'M', 1, '22058', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:24'),
('Kim', 'James', 'feac6d1f-97cf-4567-8927-47d90e15b1e8', '10LI', '10', NULL, 'M', 1, '131350', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cotter', 'Mackenzie', 'ff708e0d-226d-4595-9214-9de3d910fee7', '8RS', '8', NULL, 'F', 1, '15329', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22'),
('Gilpin', 'Poppy', 'ff831608-0ed8-4010-8254-39ac2b6de897', 'BNBT', '12', NULL, 'F', 1, '18022', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:23'),
('Cooper', 'Anne', 'ffe6862f-97c9-4326-a74a-654294ab1bc5', '6r15', '6', NULL, 'F', 1, '20382', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-03 10:52:43', '2023-12-04 09:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `student_contacts`
--

CREATE TABLE `student_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(4, '51f5f2fe-78ea-4fae-9f22-7dcadc4ec5a8', '02102323137', 'james@school.com', 'Phillip Henderson', 'Father', '0221233242', 'phillip@henderson.com', 'Loraine Henderson', 'Mother', '0271233231', 'loraine@hotmail.com', '2023-12-01 20:58:03', '2023-09-13 01:07:04'),
(5, 'b657ee85-64c7-4c1e-ada3-f415eb5735f6', '02102323137', 'luke@this.co.nz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-01 20:02:36', '2023-12-01 19:28:36'),
(6, '919ba8b8-b565-479b-871b-a81208c2ffd9', NULL, 'clive.wolners@this.com', 'Relus', 'Sister', NULL, 'luke.noble91@hotmail.com', NULL, NULL, NULL, NULL, '2023-12-03 07:50:42', '2023-12-01 20:34:31'),
(7, '9727112b-e526-4684-839c-631ac6d52c6b', NULL, NULL, 'Luke Noble', 'Mother', '+642102323137', 'luke.noble91@hotmail.com', NULL, NULL, NULL, NULL, '2023-12-05 00:09:43', '2023-12-04 10:12:36'),
(8, '9d4e22e1-3f4e-482e-8b6f-166a0030e8ab', NULL, NULL, 'Luke Noble', NULL, '+642102323137', 'luke.noble@outlook.co.nz', 'Luke Noble', NULL, '+642102323137', 'luke.noble@outlook.co.nz', '2023-12-05 09:37:06', '2023-12-05 09:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `title`) VALUES
(1, 'Piano'),
(2, 'Guitar');

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
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'user.png',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`first_name`, `last_name`, `id`, `image`, `email`, `email_verified_at`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('John', 'Smith', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'avatars/Dc1dv4UeuAFCOEOJpIZTojkCk9Z2XtnrbnWe5AUw.jpg', 'J.smith@this.com', NULL, '02102323135', '$2y$10$m338UxxWXxc1miegFEWRUuuOtvEgDllRDv.GfNOOYgQ0suy/00OkS', NULL, '2023-03-11 16:10:56', '2023-03-11 16:10:56', NULL),
('Luke', 'Noble', '2c3c74d8-bd45-47d8-8333-15d76b76e286', 'user.png', 'luke@this.com', NULL, NULL, '$2y$10$lpITEHy/MpKL/SBOdlsEA.VzwCzrO7gWCDkUYK6VjFsw2E61UMjd6', NULL, '2023-08-28 22:13:44', '2023-08-28 22:13:44', NULL),
('Jane', 'Henderson', '35cd5940-7d32-4752-8f30-667a76c6e0e7', 'user.png', 'jhenderson@this.com', NULL, NULL, '$2y$10$xVjUFuqkJjjHSGH.U8hcP.nTu8gNzT6H3tRoZwcjJ9qW5K5b2HHDK', NULL, '2023-08-29 09:19:10', '2023-08-29 09:19:10', NULL),
('Emma', 'Willson', '434044cf-24f2-4720-815e-4061635b00c2', 'user.png', 'e.willson@this.com', NULL, NULL, '$2y$10$crG446jOXmrOoqFC45a9A.Pbt4Wr3DW3YjGnF5wMFi3yzYnwejFV6', NULL, '2023-08-25 21:42:36', '2023-08-25 21:42:36', NULL),
('Phillip', 'Smith', '57b0ce43-dbb9-4214-81ca-4842e5ce481d', 'user.png', 'p.smith@this.com', NULL, NULL, '$2y$10$pjzigcZUM5J.ZAmoHcX5TekUVW4eIkgyH5WHguuGLzoSqpmprsW7K', NULL, '2023-08-29 09:23:44', '2023-08-29 09:23:44', NULL),
('Lucy', 'Williams', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', 'user.png', 'l.williams@this.com', NULL, NULL, '$2y$10$zvRhfGZconwvw/8VowZ1TOPvITAuKgABt3OnSLVzCv7bYZSYclD2G', NULL, '2023-04-03 12:44:44', '2023-04-03 12:44:44', NULL),
('Luke', 'Noble', '97e6a7d4-927c-4e89-9eab-539eb1f58912', 'user.png', 'l.noble@middleton.school.nz', NULL, NULL, '$2y$10$jyPEXyJwCXoQCwyjPqK33OTr/1CVTkjw1nd5Eeoyj5nz4W89oVP8.', 'M2Bk6KCp7Deq4LhUpIlCQuE1bhEgaYctcmUuEdCDfkzD5Gl4s5Akdo3EtfhX', '2023-03-08 11:55:03', '2023-03-08 11:55:03', NULL),
('Tom', 'Tutor', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'user.png', 't.tutor@this.com', NULL, NULL, '$2y$10$EIH5Rm0/IZZRvQF9h8i8TOszG1yhoJFaneYIe5.9cc3X9IO91it5u', NULL, '2023-04-07 14:32:29', '2023-04-07 14:32:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_type` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `school_id`, `permission_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(92, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'administrator', '2023-08-23 15:57:13', '2023-08-23 15:57:13', NULL),
(93, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'administrator', '2023-08-24 04:01:02', '2023-08-24 04:01:02', NULL),
(105, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Access', '2023-08-26 20:41:05', '2023-08-26 20:41:05', NULL),
(109, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Access', '2023-08-27 22:48:45', '2023-08-27 22:48:45', NULL),
(110, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Access', '2023-08-27 22:48:45', '2023-08-27 22:48:45', NULL),
(111, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'LESSONS_R', '2023-08-27 10:54:07', '2023-08-27 10:54:07', NULL),
(112, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Access', '2023-08-27 15:31:59', '2023-08-27 15:31:59', NULL),
(113, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'STAFF_V', '2023-08-27 15:32:21', '2023-08-27 15:32:21', NULL),
(158, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'administrator', '2023-08-23 15:57:13', '2023-08-23 15:57:13', NULL),
(160, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'INSTRUMENTS_V', '2023-10-25 08:28:29', '2023-10-25 08:28:29', NULL),
(161, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'ATTENDANCE_R', '2023-11-15 10:04:11', '2023-11-15 10:04:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_positions`
--

CREATE TABLE `user_positions` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) NOT NULL DEFAULT 'Basic User',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_positions`
--

INSERT INTO `user_positions` (`id`, `user_id`, `school_id`, `position`, `created_at`, `updated_at`) VALUES
(1, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Performing Arts Coordinator', '2023-08-22 01:35:44', '2023-08-27 22:50:10'),
(9, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Tutor', '2023-08-26 20:41:05', '2023-08-27 10:05:01'),
(10, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Performing Arts Coordinator', '2023-08-22 01:35:44', '2023-08-27 22:47:11'),
(11, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Tutor', '2023-08-27 15:31:59', '2023-08-27 15:32:33'),
(12, '57b0ce43-dbb9-4214-81ca-4842e5ce481d', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Basic User', '2023-08-30 18:55:46', '2023-08-30 18:55:46'),
(14, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Performing Arts Coordinator', '2023-08-22 01:35:44', '2023-08-27 22:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_schools`
--

CREATE TABLE `user_schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_schools`
--

INSERT INTO `user_schools` (`id`, `user_id`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', NULL, NULL, NULL),
(8, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', NULL, NULL, NULL),
(13, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-08-26 20:41:05', '2023-08-26 20:41:05', NULL),
(14, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-08-27 15:31:59', '2023-08-27 15:31:59', NULL),
(17, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_school_invitations`
--

CREATE TABLE `user_school_invitations` (
  `id` bigint(20) NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` varchar(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_school_invitations`
--

INSERT INTO `user_school_invitations` (`id`, `school_id`, `reference`, `email`, `code`, `created_at`, `updated_at`) VALUES
(15, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Luke Noble', 'luke@this.com', '5c6b9a', '2023-11-20 14:55:32', '2023-11-20 14:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_subjects`
--

CREATE TABLE `user_subjects` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(250) NOT NULL,
  `signup_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_subjects`
--

INSERT INTO `user_subjects` (`id`, `user_id`, `school_id`, `subject`, `signup_enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Guitar', 1, '2023-07-01 04:33:08', '2023-11-09 23:23:11', NULL),
(3, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'f6f99a38-925f-486a-a0bc-a80d4d610181', 'Piano', 1, '2023-07-01 06:52:26', '2023-08-20 14:04:44', '2023-08-20 14:04:44'),
(4, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Piano', 1, '2023-07-02 01:30:31', '2023-08-20 09:02:27', NULL),
(9, '97e6a7d4-927c-4e89-9eab-539eb1f58912', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Flute', 1, '2023-08-20 14:36:00', '2023-08-20 14:36:00', NULL),
(11, '434044cf-24f2-4720-815e-4061635b00c2', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Piano', 1, '2023-08-26 20:42:33', '2023-08-26 20:42:33', NULL),
(12, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Piano', 0, '2023-08-27 15:32:36', '2023-11-11 07:18:48', NULL),
(13, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Guitar', 0, '2023-08-27 15:32:39', '2023-11-09 23:23:13', NULL),
(14, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Flute', 1, '2023-08-27 15:33:05', '2023-08-27 15:33:05', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendar_events_user_id_foreign` (`user_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `events_jobs`
--
ALTER TABLE `events_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_jobs_ibfk_1` (`event_id`);

--
-- Indexes for table `events_school_jobs`
--
ALTER TABLE `events_school_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_school_jobs_ibfk_2` (`template_id`);

--
-- Indexes for table `events_school_jobs_templates`
--
ALTER TABLE `events_school_jobs_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `state` (`state_id`);

--
-- Indexes for table `instrument_hires`
--
ALTER TABLE `instrument_hires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instrument_id` (`instrument_id`),
  ADD KEY `instrument_hires_ibfk_2` (`student_id`);

--
-- Indexes for table `instrument_states`
--
ALTER TABLE `instrument_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `lesson_attendance`
--
ALTER TABLE `lesson_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lesson_notes`
--
ALTER TABLE `lesson_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lesson_requests`
--
ALTER TABLE `lesson_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson_request_forms`
--
ALTER TABLE `lesson_request_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `tutor` (`tutor`);

--
-- Indexes for table `lesson_request_forms_inputs`
--
ALTER TABLE `lesson_request_forms_inputs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_positions`
--
ALTER TABLE `user_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `user_schools`
--
ALTER TABLE `user_schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_school_invitations`
--
ALTER TABLE `user_school_invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `user_subjects`
--
ALTER TABLE `user_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `school_id` (`school_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `instrument_hires`
--
ALTER TABLE `instrument_hires`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `instrument_states`
--
ALTER TABLE `instrument_states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `lesson_attendance`
--
ALTER TABLE `lesson_attendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `lesson_notes`
--
ALTER TABLE `lesson_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lesson_requests`
--
ALTER TABLE `lesson_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1855;

--
-- AUTO_INCREMENT for table `student_contacts`
--
ALTER TABLE `student_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `user_positions`
--
ALTER TABLE `user_positions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_schools`
--
ALTER TABLE `user_schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_school_invitations`
--
ALTER TABLE `user_school_invitations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_subjects`
--
ALTER TABLE `user_subjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD CONSTRAINT `calendar_events_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `calendar_events_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `events_jobs`
--
ALTER TABLE `events_jobs`
  ADD CONSTRAINT `events_jobs_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events_school_jobs`
--
ALTER TABLE `events_school_jobs`
  ADD CONSTRAINT `events_school_jobs_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `events_school_jobs_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events_school_jobs_templates`
--
ALTER TABLE `events_school_jobs_templates`
  ADD CONSTRAINT `events_school_jobs_templates_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `instruments`
--
ALTER TABLE `instruments`
  ADD CONSTRAINT `instruments_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `instruments_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `instrument_states` (`id`);

--
-- Constraints for table `instrument_hires`
--
ALTER TABLE `instrument_hires`
  ADD CONSTRAINT `instrument_hires_ibfk_1` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instrument_hires_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lessons_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `lesson_attendance`
--
ALTER TABLE `lesson_attendance`
  ADD CONSTRAINT `lesson_attendance_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `lesson_attendance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lesson_notes`
--
ALTER TABLE `lesson_notes`
  ADD CONSTRAINT `lesson_notes_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `lesson_request_forms`
--
ALTER TABLE `lesson_request_forms`
  ADD CONSTRAINT `lesson_request_forms_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

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
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `user_permissions_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_positions`
--
ALTER TABLE `user_positions`
  ADD CONSTRAINT `user_positions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_positions_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `user_schools`
--
ALTER TABLE `user_schools`
  ADD CONSTRAINT `user_schools_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `user_schools_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_school_invitations`
--
ALTER TABLE `user_school_invitations`
  ADD CONSTRAINT `user_school_invitations_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `user_subjects`
--
ALTER TABLE `user_subjects`
  ADD CONSTRAINT `user_subjects_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_subjects_ibfk_4` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
