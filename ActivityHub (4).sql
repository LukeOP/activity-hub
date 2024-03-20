-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 14, 2024 at 08:50 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

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
(21, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, '2023-11-15', NULL, NULL, NULL, 'lesson', 41, '2023-11-14 10:41:32', '2023-11-14 10:41:32'),
(22, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '2024-01-08', NULL, NULL, NULL, 'lesson', 49, '2024-01-08 17:07:34', '2024-01-08 17:07:34'),
(24, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '2024-01-06', NULL, NULL, NULL, 'lesson', 50, '2024-01-10 19:31:10', '2024-01-10 19:31:10'),
(25, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', NULL, '2024-01-22', NULL, NULL, NULL, 'lesson', 52, '2024-01-22 08:27:28', '2024-01-22 08:27:28'),
(26, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', NULL, '2024-01-22', NULL, NULL, NULL, 'lesson', 52, '2024-01-22 08:46:36', '2024-01-22 08:46:36'),
(27, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', NULL, '2024-01-22', NULL, NULL, NULL, 'lesson', 52, '2024-01-22 08:50:18', '2024-01-22 08:50:18'),
(28, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', NULL, '2024-01-22', NULL, NULL, NULL, 'lesson', 53, '2024-01-22 09:28:43', '2024-01-22 09:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `path`, `school_id`, `created_at`, `updated_at`) VALUES
('153b64b1-5ab6-433d-b46a-681ce97006b4', '1708578857_Traceability_Matrix.pdf', 'documents/HireAgreements/1708578857_Traceability_Matrix.pdf', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-21 16:14:17', '2024-02-21 16:14:17'),
('88f98cd5-68b0-436f-ae46-575ef75a9e6d', '1707698305_1_SetList.pdf', 'documents/HireAgreements/1707698305_1_SetList.pdf', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-11 11:38:25', '2024-02-11 11:38:25'),
('ac292a0b-3b32-4ddd-98e9-573d7fa3aa0f', '1708307165_All_Hail_King_Jesus_(1).pdf', 'documents/HireAgreements/1708307165_All_Hail_King_Jesus_(1).pdf', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-18 12:46:05', '2024-02-18 12:46:05'),
('eb8e83cf-4986-4ab9-8d04-9387d0eeba3a', '1710403387_Agnus_Dei_Simplified_Version_(Numbers).pdf', 'documents/HireAgreements/1710403387_Agnus_Dei_Simplified_Version_(Numbers).pdf', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-03-13 19:03:07', '2024-03-13 19:03:07');

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
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `school_id`, `description`, `notes`, `location`, `date`, `time`, `archived`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1b599c53-4cb4-4ff9-b799-86e1f9ba979a', 'A first', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'First Event for Sampsonwood', NULL, 'At School', '2024-03-08', '10:10:00', 0, '2023-11-30 07:09:41', '2024-02-14 10:38:43', '2024-02-14 10:38:43'),
('301007a1-014f-4f77-9781-ca8d2a49cac2', 'Trial Event', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'afdsdad', NULL, 'asdsadsd', '2024-03-20', '15:19:00', 0, '2023-11-28 13:16:04', '2023-11-30 07:43:14', '2023-11-30 07:43:14'),
('42d3a365-c174-43d5-81a3-4e397c13be69', 'adfadsf', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'asdfadsfas', NULL, 'adsfadsf', '2024-10-24', '12:06:00', 0, '2024-02-14 10:06:56', '2024-02-14 10:38:50', '2024-02-14 10:38:50'),
('45150dd2-3b68-489a-a73e-717ba1dfcc91', 'A New Event', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'sdfafsgfds', NULL, 'sdgsfdgds', '2024-02-05', '10:20:00', 0, '2023-11-28 09:42:34', '2023-11-30 07:42:53', '2023-11-30 07:42:53'),
('490c3560-a8ed-496e-861f-c408dc5faa33', 'A trial event', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'Trial', NULL, 'Here', '2024-02-08', '18:50:00', 0, '2024-01-27 12:51:03', '2024-01-27 12:51:03', NULL),
('4de46b5f-0003-4581-adca-0d56a518ed6e', 'Trial Ice-cream event', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Buying something for Luke', NULL, 'School', '2024-03-14', '14:00:00', 0, '2023-11-29 09:58:46', '2023-11-30 07:51:54', '2023-11-30 07:51:54'),
('7fda1c0c-dee3-4ef6-b54b-f54be7bd1cab', 'sdfasf', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'dfasf', NULL, 'dsfadsfasf', '2024-06-12', '19:25:00', 1, '2024-02-05 14:24:29', '2024-03-14 01:17:49', NULL),
('86344d9c-43ce-43f5-9dac-249836819f6d', 'asdfdas', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'adsfads', NULL, 'adsfas', '2024-07-31', '12:40:00', 0, '2024-02-14 10:40:19', '2024-02-14 10:40:19', NULL),
('d5fef3f8-a6cd-4354-bec2-63c84871dc81', 'Trial11111', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'sdfdfsf', NULL, 'sfdssfsf', '2023-12-19', '17:39:00', 0, '2023-11-29 11:37:37', '2023-11-30 07:40:26', '2023-11-30 07:40:26'),
('de1e1fba-990b-4b43-9791-176d658d4cac', 'A Trial Event 2', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'A Trial event to see if it is setup correctly', NULL, 'Here at school', '2023-12-15', '14:00:00', 0, '2023-11-28 09:09:17', '2024-02-14 10:39:04', '2024-02-14 10:39:04'),
('deb25f10-c16e-447d-a8de-e7289bc769d7', 'asfsdasdsafadfsf', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'asdfdsfdsfadsfadsfadsf', NULL, 'adsfdsfadsfadsfadsf', '0001-02-01', '01:02:00', 0, '2024-02-18 11:28:14', '2024-02-18 11:30:02', '2024-02-18 11:30:02');

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
('0d3e3e70-96ad-4e32-84cc-e0793c3fc81f', '86344d9c-43ce-43f5-9dac-249836819f6d', 'Do something early', '2024-05-08', 1, '2024-02-14 10:40:19', '2024-03-13 12:15:45', NULL),
('0ffc8da3-e82b-4cac-8018-f32966866594', '42d3a365-c174-43d5-81a3-4e397c13be69', 'New Job', '2024-10-22', 0, '2024-02-14 10:06:56', '2024-02-14 10:06:56', NULL),
('14aa6a2d-259b-42e4-8062-99a3bebe18b0', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Confirm Performance repertoire', '2024-01-08', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('1d8fe171-428a-4026-b63c-0ba0731be229', '86344d9c-43ce-43f5-9dac-249836819f6d', 'Do something middle', '2024-07-10', 0, '2024-02-14 10:40:19', '2024-03-13 12:15:46', NULL),
('3db998c9-75ba-4903-bb52-358478cc4ea8', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'Inform performer\'s parents and whanau', '2023-11-17', 1, '2023-11-28 09:09:17', '2023-11-28 09:41:13', NULL),
('471ea739-4256-4373-b1c1-02ee03624259', 'd5fef3f8-a6cd-4354-bec2-63c84871dc81', 'A New Job', '2023-10-24', 1, '2023-11-29 11:37:37', '2023-11-29 11:37:41', NULL),
('55c357ef-0f4e-4b4a-a602-cc738be341b1', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'On The Day', '2024-03-14', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('59885305-73f6-4c25-bab6-d3222c095c68', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Confirm technical requirements, instruments, and personnel', '2024-02-29', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('5a45980e-c876-473a-a872-557bdbbecee2', '86344d9c-43ce-43f5-9dac-249836819f6d', 'A Job', '2024-04-11', 1, '2024-02-20 06:59:52', '2024-03-13 12:08:59', NULL),
('6b2196b5-21ba-4fda-85e3-f9d997a75e17', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Confirm Performance repertoire', '2024-01-18', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('7761d9bf-b775-4443-86da-b568259e020b', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Confirm technical requirements, instruments, and personnel', '2024-01-22', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('82296915-fc2b-4527-8b46-34ff448f2350', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Inform performer\'s parents and whanau', '2024-01-08', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('859d90b3-7577-404a-ac29-f8159fdccf03', '7fda1c0c-dee3-4ef6-b54b-f54be7bd1cab', 'Confirm technical requirements, instruments, and personnel', '2024-05-29', 0, '2024-02-05 14:24:29', '2024-02-05 14:24:29', NULL),
('8c9c1356-136c-4f58-9a0b-adf3e6fb417e', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Secure School Calendar Booking', '2023-11-29', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('8dc2b3c4-a601-46ff-8f94-9391587052ce', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'Secure School Calendar Booking', '2023-11-28', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('9556d4c3-e3bd-473b-bc7f-b4c80d3a0b1b', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Inform performer\'s parents and whanau', '2024-02-22', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('99bebd86-23b1-475d-ae4d-d5b9fab9973f', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'Inform performer\'s parents and whanau', '2024-02-21', 1, '2023-11-28 13:16:04', '2023-11-28 13:17:10', NULL),
('9d00c26a-07ef-4f11-927d-7fd4a486bfe1', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'On The Day', '2024-03-20', 0, '2023-11-28 13:16:04', '2023-11-28 13:16:04', NULL),
('a4af451d-4b29-4591-a605-d1bb674440a5', '1b599c53-4cb4-4ff9-b799-86e1f9ba979a', 'New Job', '2023-12-28', 0, '2023-11-30 10:02:16', '2023-11-30 10:02:16', NULL),
('a5a1d4c4-57b1-4055-a853-1f28e2c09455', '86344d9c-43ce-43f5-9dac-249836819f6d', 'Do something on the day', '2024-07-31', 1, '2024-02-14 10:40:19', '2024-03-13 12:15:45', NULL),
('ad52797e-4a8a-475f-b472-f700719d3d43', '45150dd2-3b68-489a-a73e-717ba1dfcc91', 'On The Day', '2024-02-05', 0, '2023-11-28 09:42:35', '2023-11-28 09:42:35', NULL),
('b07a59bc-3533-4061-a2da-da800648a1a6', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'Confirm technical requirements, instruments, and personnel', '2023-12-01', 1, '2023-11-28 09:09:17', '2023-11-28 09:41:02', NULL),
('b241f5fe-042b-413e-9483-ff551c8765d9', '7fda1c0c-dee3-4ef6-b54b-f54be7bd1cab', 'Inform performer\'s parents and whanau', '2024-05-22', 0, '2024-02-05 14:24:29', '2024-02-05 14:24:29', NULL),
('ba49a2d5-f2b9-41ca-9249-c351ebdb4398', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'Secure School Calendar Booking', '2023-11-28', 1, '2023-11-28 09:09:17', '2023-11-28 09:41:13', NULL),
('ba66ec38-c415-41c3-b4e6-13c19d96d238', '7fda1c0c-dee3-4ef6-b54b-f54be7bd1cab', 'On The Day', '2024-06-12', 0, '2024-02-05 14:24:29', '2024-02-05 14:24:29', NULL),
('bb68c485-09c9-438b-ae0b-ab897de2b80e', '4de46b5f-0003-4581-adca-0d56a518ed6e', 'Buy Luke an Ice-cream', '2023-11-29', 0, '2023-11-29 09:58:46', '2023-11-29 09:58:46', NULL),
('c76d7108-1208-4475-8609-b52862f51a2a', '7fda1c0c-dee3-4ef6-b54b-f54be7bd1cab', 'Secure School Calendar Booking', '2024-02-06', 1, '2024-02-05 14:24:29', '2024-02-05 14:24:44', NULL),
('ccfad60e-a773-4d68-a5f2-5cccbcdf7dc0', 'de1e1fba-990b-4b43-9791-176d658d4cac', 'On The Day', '2023-12-15', 5, '2023-11-28 09:09:17', '2023-11-28 09:40:07', NULL),
('d4ad1a76-07db-4370-a146-22d69f2c5a8d', '1b599c53-4cb4-4ff9-b799-86e1f9ba979a', 'A first job to be completed straight away.', '2023-11-30', 0, '2023-11-30 07:09:41', '2023-11-30 07:09:41', NULL),
('d792f94e-0f89-4012-8bd6-53b25f0041e9', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'Confirm technical requirements, instruments, and personnel', '2024-03-06', 1, '2023-11-28 13:16:04', '2023-11-28 13:17:10', NULL),
('dd3994cd-4776-4da6-8a37-d7873c186d08', '86344d9c-43ce-43f5-9dac-249836819f6d', 'Do something after', '2024-08-01', 1, '2024-02-14 10:40:19', '2024-03-13 12:12:19', NULL),
('de84b3f7-1a1b-4e7f-9fb2-9094ce0894a2', '301007a1-014f-4f77-9781-ca8d2a49cac2', 'Secure School Calendar Booking', '2023-11-29', 1, '2023-11-28 13:16:04', '2023-11-28 13:17:11', NULL),
('eb87577f-d120-453b-a57d-1d5f6b0e7621', '7fda1c0c-dee3-4ef6-b54b-f54be7bd1cab', 'Confirm Performance repertoire', '2024-04-17', 1, '2024-02-05 14:24:29', '2024-02-05 14:24:46', NULL);

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
('3f800c76-392d-4f55-8a5f-5ced590f90a0', 'Do something on the day', '0fece09a-6b4c-45c4-80eb-3572e45a92a5', 13, '2024-02-14 10:05:28', '2024-02-14 10:05:28', NULL),
('434558b3-2f33-4d0b-87ea-d656c311c639', 'A New Job', '6a8cd833-ce9e-4660-b206-2c9fe3ae1a0b', 3, '2023-11-29 11:36:58', '2023-11-29 11:36:58', NULL),
('5cf55707-ef4f-48d2-a3df-e59df64c410e', 'New job', 'f240f750-62be-432c-9c1b-6732e846735e', 7, '2023-11-30 10:24:29', '2023-11-30 10:24:29', NULL),
('79c55ade-6c07-4036-b426-c0f9b1014cd1', 'Do something after', '0fece09a-6b4c-45c4-80eb-3572e45a92a5', 14, '2024-02-14 10:05:36', '2024-02-14 10:05:36', NULL),
('7e102974-693e-4f43-bcbd-4f57dd1e3cec', 'A New Template Job', '025faf74-ae16-4c4b-997f-732624860e42', 6, '2023-11-29 09:34:22', '2023-11-29 09:40:20', '2023-11-29 09:40:20'),
('824d150c-062f-4579-a80b-382e2643b690', 'Do something middle', '0fece09a-6b4c-45c4-80eb-3572e45a92a5', 5, '2024-02-14 10:05:19', '2024-02-14 10:05:19', NULL),
('888e9bcd-481f-4292-8e47-e53ff77c7e59', 'Another New Template Job', '025faf74-ae16-4c4b-997f-732624860e42', 14, '2023-11-29 09:36:07', '2023-11-29 09:40:23', '2023-11-29 09:40:23'),
('89654a1f-fd24-4f8d-8020-ce534756a7a1', 'Do something early', '0fece09a-6b4c-45c4-80eb-3572e45a92a5', 2, '2024-02-14 10:05:08', '2024-02-14 10:05:08', NULL),
('8a72ef9e-de0e-47e8-8919-20334aa9d1b7', 'Buy Luke an Ice-cream', '025faf74-ae16-4c4b-997f-732624860e42', 1, '2023-11-29 09:58:04', '2024-02-05 14:23:48', '2024-02-05 14:23:48'),
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
('0fece09a-6b4c-45c4-80eb-3572e45a92a5', 'Trial Event Template', 'A Description', 'Some Notes', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-14 10:04:38', '2024-02-14 10:07:36', NULL),
('331091c4-ebe8-4f43-9afb-7d7032563484', 'Term 3 Events', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-29 11:27:35', '2024-02-14 10:38:02', '2024-02-14 10:38:02'),
('3d9f5a1a-997b-40f6-acf9-aca42c6d2e78', 'A First Template', 'Here is the first template for Sampsonwood', NULL, '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', '2023-11-30 07:08:03', '2023-11-30 07:08:26', NULL),
('6a8cd833-ce9e-4660-b206-2c9fe3ae1a0b', 'Another Template', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-29 11:36:33', '2024-02-14 10:38:13', '2024-02-14 10:38:13'),
('8446d3be-d656-4f42-861d-9907114c909d', 'Evening Concerts', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-30 08:34:40', '2024-02-14 10:38:08', '2024-02-14 10:38:08'),
('ec4305f8-d138-4395-94e6-140ea362dbba', 'External Events', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-14 10:30:21', '2024-02-14 10:38:21', '2024-02-14 10:38:21'),
('f240f750-62be-432c-9c1b-6732e846735e', 'External Events', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-30 09:58:17', '2024-02-14 10:37:51', '2024-02-14 10:37:51'),
('f51ce2f2-d59f-4920-83f8-79a522c9fb9f', 'Trial Template', NULL, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-11-30 10:03:45', '2024-02-14 10:37:34', '2024-02-14 10:37:34');

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
(10, 'Violin 1', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-17 02:22:52', '2022-12-11 02:47:49', NULL),
(11, 'Violin 2', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:02:41', '2023-12-03 21:16:13', NULL),
(12, 'Bassoon 1', 'Bassoon', 'Woodwind', '#3323', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 02:11:36', '2022-11-30 14:36:20', NULL),
(13, 'Oboe 1', 'Oboe', 'Woodwind', '#S16008 SELMER', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:12:08', '2023-12-19 00:28:03', NULL),
(14, 'Double Bass', 'Double Bass', 'Strings', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 200, '2022-11-29 02:32:06', '2023-11-27 00:41:02', NULL),
(15, 'Cello 1', 'Cello', 'Strings', 'Czech Model', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 02:33:39', '2023-11-06 22:10:50', NULL),
(16, 'Cello 2', 'Cello', 'Strings', 'Hardcase', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 02:33:54', '2022-11-30 14:36:20', NULL),
(17, 'Cello 3', 'Cello', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 02:34:08', '2023-12-19 00:24:03', NULL),
(18, 'Cello 4', 'Cello', 'Strings', '1/2 size. Stentor Student II.', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 200, '2022-11-29 02:34:58', '2023-11-20 21:32:15', NULL),
(19, 'Cello 5', 'Cello', 'Strings', '1/2 size. Yellow/Brown Flame. Case strap broken.', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 02:35:23', '2023-11-15 02:00:31', NULL),
(20, 'Cello 6', 'Cello', 'Strings', '3/4 Size, Hardcase', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 200, '2022-11-29 02:38:53', '2023-11-06 22:12:28', NULL),
(21, 'Cello 7', 'Cello', 'Strings', 'Softcase - NEEDS A NEW HARD CASE', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 02:39:16', '2023-12-19 00:24:47', NULL),
(22, 'Cello 8', 'Cello', 'Strings', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 02:39:42', '2023-04-05 01:09:48', NULL),
(23, 'Trumpet 2', 'Trumpet', 'Brass', 'NEW CASE NEEDED - Lark M4015-1', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 2, 100, '2022-11-29 02:40:29', '2023-12-19 00:26:50', NULL),
(24, 'Trumpet 3', 'Trumpet', 'Brass', 'Yamaha YTR1310 027728', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 100, '2022-11-29 02:41:31', '2023-12-19 00:27:18', NULL),
(25, 'Trumpet 4', 'Trumpet', 'Brass', '#YTR01 735884', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 100, '2022-11-29 02:42:19', '2023-03-05 21:29:43', NULL),
(26, 'Trumpet 5 Jupiter', 'Trumpet', 'Brass', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:43:04', '2022-11-30 14:36:20', NULL),
(27, 'Trumpet 6', 'Trumpet', 'Brass', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 100, '2022-11-29 02:48:21', '2023-03-05 21:28:07', NULL),
(28, 'Flute 1', 'Flute', 'Woodwind', '#666796 Blessing', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:49:05', '2023-11-26 21:52:07', NULL),
(29, 'Flute 6.5', 'Flute', 'Woodwind', '#725936', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:49:36', '2023-07-17 02:29:49', NULL),
(30, 'Flute 5', 'Flute', 'Woodwind', '#34385 Blessing', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:50:19', '2023-11-26 21:52:34', NULL),
(31, 'Flute 6', 'Flute', 'Woodwind', '#921093 Yamaha 2015', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:53:23', '2022-11-30 14:36:20', NULL),
(32, 'Flute 7', 'Flute', 'Woodwind', 'REMOVED FROM CIRCULATION #9382759 Yamaha', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:54:01', '2023-03-04 16:34:38', '2023-03-04 18:34:30'),
(33, 'Flute 8', 'Flute', 'Woodwind', '#938275P Yamaha', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 100, '2022-11-29 02:54:40', '2023-03-05 21:11:15', NULL),
(34, 'Clarinet 1', 'Clarinet', 'Woodwind', 'Bundy #1166545', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:55:54', '2022-11-30 14:36:20', NULL),
(35, 'Clarinet 2', 'Clarinet', 'Woodwind', 'Buffet 119699', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:56:30', '2022-11-30 14:41:23', NULL),
(36, 'Clarinet 3', 'Clarinet', 'Woodwind', 'MISSING FOR A YEAR - Buffett #1194551', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 5, 100, '2022-11-29 02:57:02', '2023-12-19 00:24:29', NULL),
(37, 'Clarinet 4', 'Clarinet', 'Woodwind', 'Yamaha #003751', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 02:57:27', '2022-11-30 14:41:23', NULL),
(38, 'Clarinet 5', 'Clarinet', 'Woodwind', 'Yamaha #014625', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 100, '2022-11-29 02:58:35', '2023-09-18 02:50:41', NULL),
(39, 'Clarinet 6', 'Clarinet', 'Woodwind', 'Buffet #1196998', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:00:11', '2022-11-30 14:41:23', NULL),
(40, 'Saxophone 1', 'Saxophone', 'Woodwind', 'Alto - Jupiter SAS 465 #61279', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:01:34', '2023-11-27 10:33:49', NULL),
(41, 'Saxophone 2', 'Saxophone', 'Woodwind', 'Tenor - Jupiter STS 485 #62330', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:02:10', '2023-12-19 00:25:11', NULL),
(42, 'Saxophone 3', 'Saxophone', 'Woodwind', 'Alto - Bundy II #1039231', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 200, '2022-11-29 03:03:38', '2023-11-27 10:33:49', NULL),
(43, 'Saxophone 4', 'Saxophone', 'Woodwind', 'Alto - Bundy II #1035533', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:04:11', '2023-12-19 00:25:33', NULL),
(44, 'Saxophone 5', 'Saxophone', 'Woodwind', 'Alto - Bundy II #1037188', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:06:50', '2023-11-27 10:33:49', NULL),
(45, 'Saxophone 6', 'Saxophone', 'Woodwind', 'Alto - Bundy II #1037267', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:07:23', '2023-11-27 10:33:49', NULL),
(46, 'Saxophone 7', 'Saxophone', 'Woodwind', 'Alto - Bundy II #1036823', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:07:57', '2023-12-19 00:25:47', NULL),
(47, 'Saxophone 8', 'Saxophone', 'Woodwind', 'Tenor - Bundy II #1038194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:08:47', '2023-11-27 10:33:49', NULL),
(48, 'Saxophone 9', 'Saxophone', 'Woodwind', 'Tenor - Bundy II #1038194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:09:20', '2023-12-19 00:26:03', '2023-12-19 00:26:03'),
(49, 'Saxophone 9', 'Saxophone', 'Woodwind', 'Tenor - Bundy II #1045578', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:10:26', '2023-11-27 10:33:49', NULL),
(50, 'Saxophone 10', 'Saxophone', 'Woodwind', 'Alto - Conn 20m #4007567', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:11:07', '2023-11-27 10:33:49', NULL),
(51, 'Saxophone 11', 'Saxophone', 'Woodwind', 'Alto - Conn 20m #4007161', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:11:35', '2023-11-27 10:33:49', NULL),
(52, 'Saxophone 12', 'Saxophone', 'Woodwind', 'Keliwerth Tenor #110061', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:12:12', '2023-11-27 10:33:49', NULL),
(53, 'Saxophone 13', 'Saxophone', 'Woodwind', 'Keliwerth Alto ST110', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:13:09', '2023-11-27 10:33:49', NULL),
(54, 'Saxophone 14', 'Saxophone', 'Woodwind', 'Baritone - Yanagisawa', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 200, '2022-11-29 03:13:36', '2023-11-27 00:42:36', NULL),
(55, 'Trombone', 'Trombone', 'Brass', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 100, '2022-11-29 03:14:57', '2023-03-05 21:26:20', NULL),
(56, 'Trombone 2', 'Trombone', 'Brass', 'Gone', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:15:16', '2023-03-04 16:33:55', '2023-03-04 18:33:41'),
(57, 'Trombone 3', 'Trombone', 'Brass', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:15:52', '2022-11-30 14:41:23', NULL),
(58, 'Viola 1', 'Viola', 'Strings', 'Case pocket broken', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:16:05', '2023-12-19 00:27:43', NULL),
(59, 'Violin 3', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:16:22', '2022-12-11 02:50:48', NULL),
(60, 'Violin 4', 'Violin', 'Strings', 'Half Size', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:16:45', '2023-12-19 00:28:22', NULL),
(61, 'Violin 5', 'Violin', 'Strings', 'NEW CASE NEEDED', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:17:04', '2024-01-18 01:55:29', NULL),
(62, 'Violin 6', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:17:15', '2023-07-28 03:12:00', NULL),
(63, 'Violin 7', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:17:42', '2023-07-16 05:10:35', NULL),
(64, 'Violin 8', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:18:12', '2022-12-11 02:52:07', NULL),
(65, 'Violin 9', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:18:23', '2022-12-11 02:52:15', NULL),
(66, 'Violin 10', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:18:43', '2023-12-03 23:13:57', NULL),
(67, 'Violin 11', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:18:52', '2023-01-30 22:48:41', NULL),
(68, 'Violin 12', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 2, 100, '2022-11-29 03:19:13', '2022-12-11 02:48:14', NULL),
(69, 'Violin 14', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:19:28', '2022-12-11 02:50:06', NULL),
(70, 'Violin 16', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:19:47', '2022-12-11 02:50:14', NULL),
(71, 'Violin 16 1/4 Size', 'Violin', 'Strings', '1/4 Size\n\nShould probably be renamed...', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-11-29 03:20:09', '2024-01-18 17:08:47', NULL),
(72, 'Piccolo 1', 'Piccolo', 'Woodwind', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-11-29 03:20:24', '2023-11-29 02:17:02', NULL),
(73, 'Trumpet 5 Bach', 'Trumpet', 'Brass', '', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 4, 100, '2022-11-29 03:20:43', '2023-03-05 21:30:54', NULL),
(74, 'Violin 17', 'Violin', 'Strings', NULL, 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 100, '2022-12-04 19:45:24', '2022-12-11 02:50:28', NULL),
(76, 'Saxophone 15', 'Saxophone', 'Woodwind', 'Keilwerth #6F00725', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 1, 200, '2022-12-15 01:44:21', '2023-12-19 00:26:25', NULL),
(77, 'Clarinet 7', 'Clarinet', 'Woodwind', 'Bundy #1199851', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 2, 100, '2023-03-19 20:55:21', '2024-01-27 06:38:33', NULL),
(78, 'Violin 1', 'Violin', 'Strings', 'Here are some edited notes', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 1, 60, '2024-01-23 19:41:13', '2024-02-15 18:43:58', NULL),
(79, 'Cello', 'Cello', 'Strings', 'Changing Notes again', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 4, 0, '2024-02-15 11:44:23', '2024-02-15 18:31:27', NULL);

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
  `upload_id` varchar(36) DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instrument_hires`
--

INSERT INTO `instrument_hires` (`id`, `instrument_id`, `student_id`, `start_date`, `return_date`, `returned_date`, `upload_id`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 33, 'c34b0937-387a-49c3-b74c-0900805edbd9', '2023-03-22 06:14:53', '2024-01-31 06:14:53', NULL, NULL, 'Summer Hire\r\n021351404\r\nkwangdo.kim@gmail.com', '2024-01-19 06:17:27', '2024-01-19 06:17:27', NULL),
(14, 78, '41d70494-ba94-11ee-aeb8-6eb957879d7f', '2024-02-22 05:14:17', '2024-06-19 12:00:00', '2024-01-25 11:00:00', '153b64b1-5ab6-433d-b46a-681ce97006b4', 'Here are some notes', '2024-01-24 07:30:22', '2024-02-21 16:14:17', NULL),
(15, 79, '41d6fbde-ba94-11ee-aeb8-6eb957879d7f', '2024-03-14 08:03:07', '2024-07-23 12:00:00', NULL, 'eb8e83cf-4986-4ab9-8d04-9387d0eeba3a', NULL, '2024-02-15 11:44:32', '2024-03-13 19:03:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instrument_hire_agreement_templates`
--

CREATE TABLE `instrument_hire_agreement_templates` (
  `id` varchar(36) NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `notes` text,
  `header_content` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instrument_hire_agreement_templates`
--

INSERT INTO `instrument_hire_agreement_templates` (`id`, `school_id`, `heading`, `description`, `notes`, `header_content`, `created_at`, `updated_at`, `deleted_at`) VALUES
('2c652d48-3ca0-4f24-8a07-6ab4acf6d07f', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'A Postman Template', 'A Trial template created with Postman', 'No notes to note.', 0, '2024-01-23 11:21:27', '2024-01-24 00:37:18', NULL),
('72607ca4-c8a3-47f7-902a-fdf05e975e09', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'A Trial Hire Agreement Template', NULL, NULL, 0, '2024-01-24 00:11:26', '2024-01-24 00:16:39', NULL);

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
(2, 'Needing Repairs'),
(3, 'Being Repaired'),
(4, 'Hired Out'),
(5, 'Unavailable'),
(6, 'Borrowed');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
('4703b0f6-97fb-4298-82ce-550e78b82e4f', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', '02f30d74-5646-49fc-b100-e256c7982a6d', 'Piano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', NULL, '2024-01-28 09:19:03', '2024-01-28 09:19:03', NULL),
('5480dfc2-b073-445f-8038-d480c17f8c3b', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '987aff3b-aeff-4ec6-b8eb-a39633d81e86', 'Guitar', '14:10:00', '14:30:00', 'Wednesday', '2024-03-01', NULL, 'Funded', NULL, 'Active', 'Minimal', '2024-03-12 18:17:20', '2024-03-12 18:21:46', NULL),
('73cb3cd1-7a69-4d4a-b302-d0ed2e3024b4', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', 'd655923a-8b34-4ffc-97d8-ea073f720fca', 'Flute', NULL, NULL, NULL, '2024-03-14', NULL, 'Partially Funded', NULL, 'Pending', NULL, '2024-03-13 20:18:04', '2024-03-13 20:31:01', NULL),
('7f4d7c32-49e0-4992-8277-dbf20bf54e9b', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3318f503-1094-4d6d-a495-9d7bc6457598', 'Piano', NULL, NULL, NULL, '2024-03-14', NULL, 'Funded', NULL, 'Pending', NULL, '2024-02-18 11:31:31', '2024-03-13 20:31:17', NULL),
('8afdb0ec-c4b8-4af0-a932-9ae13b6edf72', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '41d70494-ba94-11ee-aeb8-6eb957879d7f', 'Piano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', NULL, '2024-02-13 20:11:39', '2024-02-13 20:11:39', NULL),
('9f78ef80-6940-4746-8924-f6f6133857df', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', 'ccf016e6-740f-45bc-99dc-c88f0160dab2', 'Piano', NULL, NULL, NULL, NULL, NULL, 'Private', NULL, 'Pending', NULL, '2024-03-13 20:19:57', '2024-03-13 20:19:57', NULL),
('aa85260b-d329-40b7-8312-8c772bdf2947', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '380fddf3-93b0-4745-b16a-a826c13c469f', 'Flute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', NULL, '2024-03-13 19:47:56', '2024-03-13 19:47:56', NULL),
('cf8c06e6-1e5a-47ce-8fec-b96ca87dc572', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '41d70494-ba94-11ee-aeb8-6eb957879d7f', 'Guitar', '12:20:00', '12:40:00', 'Monday', '2024-01-28', NULL, 'Funded', NULL, 'Active', NULL, '2024-01-24 07:20:21', '2024-01-28 10:15:41', NULL),
('d3d6adb2-4fcf-4d62-870b-0c9a2d7cd8fa', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '41d6fbde-ba94-11ee-aeb8-6eb957879d7f', 'Flute', '15:20:00', '15:40:00', 'Monday', '2024-01-28', NULL, 'Funded', NULL, 'Active', NULL, '2024-01-28 10:16:37', '2024-01-28 10:19:01', NULL),
('d5001575-6ec4-4188-b7ed-0cbb121c87dc', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '41d70494-ba94-11ee-aeb8-6eb957879d7f', 'Guitar', '16:50:00', '17:00:00', 'Wednesday', '2024-02-16', NULL, 'Private', NULL, 'Active', 'None', '2024-02-13 12:24:39', '2024-02-15 11:53:50', NULL),
('dc306d24-1060-4eca-802f-cdf2364df522', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '41d70494-ba94-11ee-aeb8-6eb957879d7f', 'Guitar', '08:56:00', '09:16:00', 'Wednesday', '2024-02-06', NULL, 'Private', NULL, 'Active', NULL, '2024-02-05 14:19:26', '2024-02-05 14:20:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_attendance`
--

CREATE TABLE `lesson_attendance` (
  `id` bigint(20) NOT NULL,
  `lesson_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'cf8c06e6-1e5a-47ce-8fec-b96ca87dc572', 'present', '2024-01-29', '12:22:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2024-01-30 10:22:54', '2024-03-12 18:20:03'),
(2, 'cf8c06e6-1e5a-47ce-8fec-b96ca87dc572', 'late', '2024-03-11', '15:12:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2024-03-12 13:12:22', '2024-03-12 13:56:31'),
(3, 'd5001575-6ec4-4188-b7ed-0cbb121c87dc', 'present', '2024-03-13', '04:07:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2024-03-12 14:07:19', '2024-03-12 14:07:19'),
(4, '5480dfc2-b073-445f-8038-d480c17f8c3b', 'present', '2024-03-13', '08:21:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2024-03-12 18:21:56', '2024-03-12 18:21:56'),
(5, '5480dfc2-b073-445f-8038-d480c17f8c3b', 'absent', '2024-03-06', '08:21:00', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '2024-03-12 18:22:02', '2024-03-12 18:22:02');

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
  `form_description` varchar(150) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Awaiting Review',
  `school_id` varchar(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_requests`
--

INSERT INTO `lesson_requests` (`id`, `student_name`, `student_email`, `student_phone`, `student_age`, `student_year`, `parent_name`, `parent_phone`, `parent_email`, `requested_instrument`, `experience`, `requested_tutor`, `funding_type`, `form_description`, `status`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 'Luke Noble', 'luke.noble91@hotmail.com', NULL, 32, '12', 'Luke Noble', '+642102323137', 'luke.noble@outlook.co.nz', 'Guitar', 'None', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-12-04 09:58:53', '2023-12-05 09:37:06', '2023-12-05 09:37:06'),
(15, 'Luke Noble', 'luke.noble91@hotmail.com', NULL, 12, '7', 'Luke Noble', '+642102323137', 'luke.noble91@hotmail.com', 'Guitar', 'None', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-01-12 12:53:15', '2024-02-13 12:24:39', '2024-02-13 12:24:39'),
(16, 'demo', 'noble.luke91@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Flute', 'None', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-13 12:35:05', '2024-02-13 12:45:49', '2024-02-13 12:45:49'),
(17, 'demo', 'noble.luke91@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Guitar', NULL, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-13 12:40:44', '2024-02-13 12:40:44', NULL),
(18, 'demo', 'noble.luke91@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Drums', NULL, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-13 12:43:12', '2024-02-13 12:43:12', NULL),
(19, 'demo', 'luke.noble91@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Piano', NULL, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-13 12:47:03', '2024-02-13 12:47:03', NULL),
(20, 'demo', 'luke.noble91@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Flute', NULL, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-13 12:50:15', '2024-03-13 19:47:56', '2024-03-13 19:47:56'),
(21, 'Luke Noble', 'luke.noble91@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Flute', NULL, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-13 12:50:27', '2024-02-13 12:50:40', '2024-02-13 12:50:40'),
(22, 'Amazing Device', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Piano', NULL, NULL, NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-13 20:09:15', '2024-02-13 20:11:40', '2024-02-13 20:11:40'),
(23, 'Luke Noble', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Piano', NULL, NULL, NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:16:52', '2024-03-13 20:19:57', '2024-03-13 20:19:57'),
(24, 'Luke Noble', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Drums', NULL, NULL, NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:17:42', '2024-02-16 09:17:42', NULL),
(25, 'Rock Nighty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Flute', NULL, NULL, NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:18:03', '2024-02-16 09:18:03', NULL),
(26, 'Amazing Device', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Guitar', NULL, NULL, NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:18:19', '2024-02-16 09:18:19', NULL),
(27, 'Rock Nighty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Guitar', NULL, '0', NULL, '', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-03-08 14:53:31', '2024-03-08 14:53:31', NULL),
(28, 'Amazing Device', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Flute', NULL, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, NULL, 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-03-11 12:12:01', '2024-03-11 12:12:01', NULL),
(29, 'Rock Night', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Flute', NULL, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', 'Partially Funded', NULL, 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-03-11 12:12:45', '2024-03-13 20:18:04', '2024-03-13 20:18:04'),
(30, 'Amazing Device', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Flute', NULL, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', NULL, '2024 Signups', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-03-11 12:14:36', '2024-03-11 12:14:36', NULL),
(31, 'Emma Noble', 'noble.luke91@gmail.com', NULL, NULL, NULL, 'Luke Noble', '02102323137', 'luke.noble91@hotmail.com', 'Guitar', 'Minimal', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'Free', '2024 Signups', 'Awaiting Review', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-03-12 18:15:36', '2024-03-12 18:17:20', '2024-03-12 18:17:20');

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
  `student_name` varchar(150) NOT NULL DEFAULT 'Student Name',
  `student_email_cb` tinyint(1) DEFAULT '0',
  `student_email` varchar(150) NOT NULL DEFAULT 'Student Email',
  `student_phone_cb` tinyint(1) DEFAULT '0',
  `student_phone` varchar(150) NOT NULL DEFAULT 'Student Phone Number',
  `student_year_cb` tinyint(1) DEFAULT '0',
  `student_year` varchar(150) NOT NULL DEFAULT 'Student year Level',
  `student_age_cb` tinyint(1) DEFAULT '0',
  `student_age` varchar(150) NOT NULL DEFAULT 'Student Age',
  `pc_name_cb` tinyint(1) DEFAULT '0',
  `pc_name` varchar(150) NOT NULL DEFAULT 'Parent / Caregiver Name',
  `pc_phone_cb` tinyint(1) DEFAULT '0',
  `pc_phone` varchar(150) NOT NULL DEFAULT 'Parent / Caregiver Phone Number',
  `pc_email_cb` tinyint(1) DEFAULT '0',
  `pc_email` varchar(150) NOT NULL DEFAULT 'Parent / Caregiver Email',
  `lesson_content_cb` tinyint(1) DEFAULT '0',
  `lesson_content` text,
  `instrument_cb` tinyint(1) DEFAULT '0',
  `instrument` varchar(50) NOT NULL DEFAULT 'Instrument',
  `tutor_cb` tinyint(1) DEFAULT '0',
  `tutor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tutor',
  `funding_type_cb` tinyint(1) DEFAULT '0',
  `funding_type` varchar(150) NOT NULL DEFAULT 'Funding Type',
  `experience_cb` tinyint(1) DEFAULT '0',
  `experience` text,
  `footer_content_cb` tinyint(1) DEFAULT '0',
  `footer_content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_request_forms`
--

INSERT INTO `lesson_request_forms` (`id`, `school_id`, `description`, `year`, `logo_cb`, `logo`, `school_name_cb`, `header_content_cb`, `header_content`, `heading_cb`, `heading`, `contact_content_cb`, `contact_content`, `student_name_cb`, `student_name`, `student_email_cb`, `student_email`, `student_phone_cb`, `student_phone`, `student_year_cb`, `student_year`, `student_age_cb`, `student_age`, `pc_name_cb`, `pc_name`, `pc_phone_cb`, `pc_phone`, `pc_email_cb`, `pc_email`, `lesson_content_cb`, `lesson_content`, `instrument_cb`, `instrument`, `tutor_cb`, `tutor`, `funding_type_cb`, `funding_type`, `experience_cb`, `experience`, `footer_content_cb`, `footer_content`, `created_at`, `updated_at`) VALUES
('6db2a873-6cfd-4ba9-a082-a104d64ecd0f', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'New Form', NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, 'Student Name', 0, 'Student Email', 0, 'Student Phone Number', 0, 'Student year Level', 0, 'Student Age', 0, 'Parent / Caregiver Name', 0, 'Parent / Caregiver Phone Number', 0, 'Parent / Caregiver Email', 0, NULL, 0, 'Instrument', 0, 'Tutor', 0, 'Funding Type', 0, NULL, 0, NULL, '2024-03-08 14:33:59', '2024-03-08 14:33:59'),
('ac69d3ae-28ab-46b1-a269-8badf4f51d07', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024 Signups', 2024, 1, '/images/school_logos/pinecrest_school.png', 1, 1, 'Welcome to the Instrument and Vocal Tuition application form.\nMake sure you\'ve looked through the information at www.pinecrest.school.nz/music-tuition/\nYou can find details about funded lessons and our tutoring team on this webpage.\n\nOnce you have filled out the application below, your information will be passed on to the appropriate tutor who will contact you regarding lesson times and any applicable costs.\n\nAny questions about this form can be directed to music@pinecrest.school.nz', 0, 'Lesson Signups', 0, NULL, 0, 'Student Name', 1, 'Student Email', 0, 'Student Phone Number', 0, 'Student year Level', 0, 'Student Age', 1, 'Parent / Caregiver Name', 1, 'Parent / Caregiver Phone Number', 1, 'Parent / Caregiver Email', 0, NULL, 0, 'Instrument', 1, 'Tutor', 1, 'Funding Option', 1, 'Previous Experience', 0, NULL, '2024-02-13 19:45:58', '2024-03-12 18:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_request_forms_data`
--

CREATE TABLE `lesson_request_forms_data` (
  `id` varchar(36) NOT NULL,
  `lesson_request_form_id` varchar(36) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_request_forms_data`
--

INSERT INTO `lesson_request_forms_data` (`id`, `lesson_request_form_id`, `type`, `value`, `available`, `created_at`, `updated_at`) VALUES
('3cbec3af-6138-4bb8-9b87-4a4a3e69bcc3', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'funding', 'Private', 1, '2024-03-11 13:19:51', '2024-03-12 18:14:37'),
('5e5ab59d-1b7a-45b8-b96c-c22e29272405', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'funding', 'Partially Funded', 0, '2024-03-12 08:34:38', '2024-03-12 18:14:37'),
('aa4d07f0-0fb0-4ef8-bf19-da944caad8ce', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'instrument', 'Guitar', 1, '2024-03-05 10:29:28', '2024-03-12 18:14:37'),
('afb1354d-8e11-46fe-a720-e2e3e57101c7', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'instrument', 'Flute', 1, '2024-03-05 11:05:19', '2024-03-12 18:14:37'),
('e073d261-bf89-4239-b0a1-5bd1cb20fe54', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'instrument', 'Drums', 1, '2024-03-05 10:29:28', '2024-03-12 18:14:37'),
('e3fc7fd0-0f5b-41c4-a7fa-9c5375a42549', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'funding', 'Free', 1, '2024-03-12 18:13:37', '2024-03-12 18:14:37'),
('f161ddc3-ef7c-4c13-aa38-fec0d0859f60', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'funding', 'Fully Funded', 0, '2024-03-11 13:19:51', '2024-03-12 18:14:37'),
('ff67b334-3540-4da0-ac08-300ef373925d', 'ac69d3ae-28ab-46b1-a269-8badf4f51d07', 'instrument', 'Piano', 1, '2024-03-05 10:29:28', '2024-03-12 18:14:37');

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

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('luke.noble91@hotmail.com', '$2y$10$4KDKMDiKsuBWKnVQgeB5bOMiKg.AckpWp3DNtTg8pC7ZH9aSxtAwW', '2024-01-17 12:43:05');

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
(1854, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '9716d9fd25de01f5490a6d827e02c499a70d9c8fd9119433553244bde7d16087', '[\"*\"]', '2023-12-12 06:40:32', NULL, '2023-12-12 06:40:32', '2023-12-12 06:40:32'),
(1855, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '990fc7746e3a5ab2b7dccd0224d7adb04bae53113939d1f310ef5b1c2c4f388f', '[\"*\"]', '2024-01-10 19:27:16', NULL, '2024-01-08 14:13:17', '2024-01-10 19:27:16'),
(1859, 'App\\Models\\User', '97e6a7d4-927c-4e89-9eab-539eb1f58912', 'API Token of Luke Noble', '499ae4ad6039fcf592644017145f14799da103715f7ae05f00505a32e4c7467c', '[\"*\"]', NULL, NULL, '2024-01-14 13:33:10', '2024-01-14 13:33:10'),
(1861, 'App\\Models\\User', '97e6a7d4-927c-4e89-9eab-539eb1f58912', 'API Token of Luke Noble', '2bf84a24c76b135fc95f9d48d8532be8db253c073df6630c2ef253f9e0c9289f', '[\"*\"]', NULL, NULL, '2024-01-15 07:42:55', '2024-01-15 07:42:55'),
(1863, 'App\\Models\\User', '97e6a7d4-927c-4e89-9eab-539eb1f58912', 'API Token of Luke Noble', '2815f28b7857b3986a532adca63294602bee7fbb0db673dfcb2738f651ae126a', '[\"*\"]', NULL, NULL, '2024-01-15 07:52:56', '2024-01-15 07:52:56'),
(1866, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '43ac9b78d420483a66c9117855014ed9eaea467380f340f94aae9204706ecf87', '[\"*\"]', '2024-01-15 16:51:44', NULL, '2024-01-15 16:51:17', '2024-01-15 16:51:44'),
(1869, 'App\\Models\\User', '8f58210e-9086-4c92-8b29-6fe74942dc7f', 'API Token of Dave Wilson', '81e5db13358fe9ac4787c5b2b9a3fa1ed8cf8157a530fd9617e438589c40461e', '[\"*\"]', NULL, NULL, '2024-01-16 14:52:31', '2024-01-16 14:52:31'),
(1871, 'App\\Models\\User', '18adac13-050c-4fb3-ba7f-ceae07ecaac2', 'API Token of Dave Wilson', '2c38f6b2905bd7859d3aebba145f17f4aab3aa5db61fb5ab33d983b55b93c80f', '[\"*\"]', '2024-01-16 15:18:39', NULL, '2024-01-16 15:18:39', '2024-01-16 15:18:39'),
(1872, 'App\\Models\\User', '18adac13-050c-4fb3-ba7f-ceae07ecaac2', 'API Token of Dave Wilson', '51670e4b8e6edf0630f99d05c1573239457a44b09d39976554c61d730bc176e9', '[\"*\"]', '2024-01-16 15:19:22', NULL, '2024-01-16 15:18:39', '2024-01-16 15:19:22'),
(1873, 'App\\Models\\User', 'b1d26b5d-8d61-44b3-9488-5606fda663a8', 'API Token of Lucas Noble', '1a50cdc18ebf7e366fbe05ef10f838243696982ade286eae0c5564c12474de77', '[\"*\"]', NULL, NULL, '2024-01-16 16:43:38', '2024-01-16 16:43:38'),
(1874, 'App\\Models\\User', 'd10eea7a-3e20-4347-a91a-e85dca58f525', 'API Token of Luke Noble', 'c9e419a9575d9451333b49162b4dc938415d96308ea7b97c1fd3069e2a9029f2', '[\"*\"]', NULL, NULL, '2024-01-16 17:01:03', '2024-01-16 17:01:03'),
(1875, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', 'ef8d4b19910a702fb4ff24281a5e92e393a50c249eab376dac4e4e8b65c72e7f', '[\"*\"]', NULL, NULL, '2024-01-16 17:16:25', '2024-01-16 17:16:25'),
(1876, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '70f4e63ebe188a77a7f014a80f42d62d16da60452f3f008c3d5a34bab6ab17c2', '[\"*\"]', '2024-01-16 17:22:45', NULL, '2024-01-16 17:22:45', '2024-01-16 17:22:45'),
(1878, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '037902e793eec1c53d27c75c9c72063bc46b9f37591e1a5036dac87479e65c6b', '[\"*\"]', '2024-01-17 11:37:46', NULL, '2024-01-17 11:37:45', '2024-01-17 11:37:46'),
(1880, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', 'dea46c32b27925aa20cad45d2357b3ad7e05792363519c37dcd0aa6273553474', '[\"*\"]', '2024-01-17 12:08:57', NULL, '2024-01-17 12:08:57', '2024-01-17 12:08:57'),
(1881, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '482ab265fe98d5e7b0a33ee10dc237b127485a9c641be1c9e4380bd771b9b082', '[\"*\"]', NULL, NULL, '2024-01-17 12:08:57', '2024-01-17 12:08:57'),
(1882, 'App\\Models\\User', '61f99dbb-3609-498d-aa3c-813a07e5a5c6', 'API Token of Luke Noble', '4c749e3e1b4c8cf1496f0c4f4f726e8141b1424fbd45f1218f8262cffbb8e068', '[\"*\"]', NULL, NULL, '2024-01-17 12:20:26', '2024-01-17 12:20:26'),
(1883, 'App\\Models\\User', '61f99dbb-3609-498d-aa3c-813a07e5a5c6', 'API Token of Luke Noble', '71b56eca8e73f2bae69f81ebae39bb200685f9d628c543971df169b4a54fb38e', '[\"*\"]', '2024-01-17 12:21:06', NULL, '2024-01-17 12:21:06', '2024-01-17 12:21:06'),
(1884, 'App\\Models\\User', '61f99dbb-3609-498d-aa3c-813a07e5a5c6', 'API Token of Luke Noble', '877f78fb94c2e9430baaa26eef3a3bc42aa9a66b6da4b3ac997b31929a8b353a', '[\"*\"]', NULL, NULL, '2024-01-17 12:21:06', '2024-01-17 12:21:06'),
(1885, 'App\\Models\\User', '5dbc81ee-cb74-443b-ad81-b460f07a3466', 'API Token of Luke Noble', '251fcf27a021283c0e37c52f67467aee2f19c7bc203f0eb138f74819b45a964d', '[\"*\"]', NULL, NULL, '2024-01-17 12:24:40', '2024-01-17 12:24:40'),
(1886, 'App\\Models\\User', '5dbc81ee-cb74-443b-ad81-b460f07a3466', 'API Token of Luke Noble', '186262429ccb7c24c22bcddfc937a54903e3ac4a17fa511372b6b0bb8c1f167b', '[\"*\"]', '2024-01-17 12:25:52', NULL, '2024-01-17 12:25:52', '2024-01-17 12:25:52'),
(1887, 'App\\Models\\User', '5dbc81ee-cb74-443b-ad81-b460f07a3466', 'API Token of Luke Noble', 'c08d370d8a6738e0edcfa54d4592c2dea347b21174abdd7de2c35f12156cb58d', '[\"*\"]', NULL, NULL, '2024-01-17 12:25:52', '2024-01-17 12:25:52'),
(1888, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', 'b3d77d6b4309253e2e791c83897aa635f1f8f08fa0d11d894e313ac86bba621c', '[\"*\"]', '2024-01-17 13:05:22', NULL, '2024-01-17 13:05:22', '2024-01-17 13:05:22'),
(1890, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '6ef3e5137bbfd2477f306cde3313cfb75f43472b6fa0ea3ea2ee1155654d8d0e', '[\"*\"]', '2024-01-17 13:12:14', NULL, '2024-01-17 13:12:14', '2024-01-17 13:12:14'),
(1892, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '7e30d282db40b3636a72238d520adb3d98c18af9323117161224fdfce67888c2', '[\"*\"]', '2024-01-17 13:41:16', NULL, '2024-01-17 13:41:16', '2024-01-17 13:41:16'),
(1894, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '256799264649c67cd435a5ede49d95aded54e2b6f920d775a0a1bfb29207f065', '[\"*\"]', '2024-01-17 13:45:49', NULL, '2024-01-17 13:45:48', '2024-01-17 13:45:49'),
(1896, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '69106c767045fd266f06752288ea442586ba087305bb6e9a1161d3169de3ac2b', '[\"*\"]', '2024-01-17 13:46:39', NULL, '2024-01-17 13:46:39', '2024-01-17 13:46:39'),
(1898, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '7b1a8d1e43cd614553544aa6426bb178e80b0a9529f29615ee4ae3536cf5d748', '[\"*\"]', '2024-01-17 18:52:13', NULL, '2024-01-17 18:52:13', '2024-01-17 18:52:13'),
(1900, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '451b33cf1061edd792193d342ba15ccf67ca96fd348c52b5a3aca167f899c4fa', '[\"*\"]', '2024-01-17 19:17:57', NULL, '2024-01-17 19:17:57', '2024-01-17 19:17:57'),
(1903, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '43725d242a5aaa526654c3e4987b228cac1b0c6d8f1ead5bc84a9efde5b60e8f', '[\"*\"]', '2024-01-17 19:20:12', NULL, '2024-01-17 19:20:12', '2024-01-17 19:20:12'),
(1906, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Suzan Tutor', 'd4b9b295bed92debf348f433ba826f042764c78abd4a10de4cb227edae1a59e0', '[\"*\"]', NULL, NULL, '2024-01-17 19:24:05', '2024-01-17 19:24:05'),
(1907, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Suzan Tutor', 'c3f32ed5a8e747d93d093f2ac588d3799594f35287e61149eb586fab46983b93', '[\"*\"]', '2024-01-17 19:24:35', NULL, '2024-01-17 19:24:35', '2024-01-17 19:24:35'),
(1911, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Suzan Tutor', '20fc87cce24a1af32bf6a5caa3bafe1051a5c7a1ee1fd54d9a9a7e1a88a550ca', '[\"*\"]', '2024-01-17 19:27:16', NULL, '2024-01-17 19:27:15', '2024-01-17 19:27:16'),
(1913, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '061ea2e277975462a4649e7dc0295d08181e3a231b649ba9a964d88a26a47c2a', '[\"*\"]', '2024-01-17 19:28:22', NULL, '2024-01-17 19:28:20', '2024-01-17 19:28:22'),
(1914, 'App\\Models\\User', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'API Token of Luke Noble', '27573263596310ef18daa32c654a55ee4b4082b07df5d06a8de612d85c837598', '[\"*\"]', '2024-01-18 11:31:32', NULL, '2024-01-18 11:31:32', '2024-01-18 11:31:32'),
(1916, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '7f3009802baf38db06b7f47086ee1a84861632b788d383b70c603bc382986db4', '[\"*\"]', '2024-01-18 12:40:59', NULL, '2024-01-18 12:40:59', '2024-01-18 12:40:59'),
(1919, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '0df5f0e8d446862d89b20970385487163f80f59543fa532a63b07883a1041574', '[\"*\"]', '2024-01-18 15:20:37', NULL, '2024-01-18 15:20:37', '2024-01-18 15:20:37'),
(1922, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', 'c341e2eb5398ba78c3c417675d1f2ae3e68c429028b3fa4b4ea5c48c04b7949d', '[\"*\"]', '2024-01-18 16:48:20', NULL, '2024-01-18 16:48:20', '2024-01-18 16:48:20'),
(1925, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '60884393b11e8ad049f0b01e74dbb2000cce4d182b98bb207db0892686fa7d2c', '[\"*\"]', '2024-01-18 17:12:21', NULL, '2024-01-18 17:12:21', '2024-01-18 17:12:21'),
(1927, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', '56fb672158e0b80e810895b207b1d7a04e41db7ce285e8329f044d111e11d15b', '[\"*\"]', '2024-01-21 11:41:03', NULL, '2024-01-21 11:41:03', '2024-01-21 11:41:03'),
(1928, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', '75908fd4bee6188649bae6be51e43d321b9d2010669e1ea373ec49dc748622bd', '[\"*\"]', '2024-01-22 11:13:00', NULL, '2024-01-21 11:41:03', '2024-01-22 11:13:00'),
(1929, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'f365e280f501a631121455be461e47ee196e4cdf9d836effff79ae71b3e7aefb', '[\"*\"]', NULL, NULL, '2024-01-22 09:23:27', '2024-01-22 09:23:27'),
(1930, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', '812aee1631813f2d5eaf01b82a664251eeb559dc29712a8fd9fbdf007e8b31ca', '[\"*\"]', '2024-01-22 09:27:53', NULL, '2024-01-22 09:24:44', '2024-01-22 09:27:53'),
(1933, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '4cae8e11f88cd7a2674f1f896b93a0cda1d6f89961ffac68282ee7a43051fd31', '[\"*\"]', '2024-01-22 10:17:08', NULL, '2024-01-22 10:08:56', '2024-01-22 10:17:08'),
(1934, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '37a2e9a69590504c11fffce5b560243962fe6163710c45f6f704656eda0d27dc', '[\"*\"]', '2024-01-22 10:26:32', NULL, '2024-01-22 10:26:31', '2024-01-22 10:26:32'),
(1937, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '120b79fee1eda21aa26d1676a78098190d8b7c2674b25ca10009b72a95d44adc', '[\"*\"]', '2024-01-22 10:39:33', NULL, '2024-01-22 10:39:33', '2024-01-22 10:39:33'),
(1938, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '4711c59a27c855825995bd96e88e051614ee37504b73b6d9e3e79653fc6d046c', '[\"*\"]', '2024-01-22 10:41:39', NULL, '2024-01-22 10:39:33', '2024-01-22 10:41:39'),
(1939, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', '0ca3e16a908837af9c91fa279d70a206ba9b06150ddf887bf1f1439f9ab29ef1', '[\"*\"]', '2024-01-22 11:37:11', NULL, '2024-01-22 11:37:11', '2024-01-22 11:37:11'),
(1942, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'a071fbda58a933caddf43df72e10d15ac0468965d6ffce99df840d39c8daf88e', '[\"*\"]', '2024-01-23 11:28:45', NULL, '2024-01-23 11:06:02', '2024-01-23 11:28:45'),
(1944, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '3b46028780476e65bcc3866dc9c6be4b13c5bb3dc0ea4d2009158ace5f997491', '[\"*\"]', '2024-01-23 19:42:20', NULL, '2024-01-23 19:42:20', '2024-01-23 19:42:20'),
(1945, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '33c94f77aef966d70b6e32651e747909abb8429460a926daaa60fbfd1d6aa35d', '[\"*\"]', '2024-01-23 19:42:39', NULL, '2024-01-23 19:42:20', '2024-01-23 19:42:39'),
(1946, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'd8ad6ed5af406bb5f05133e8f240e30790c1002d77ab4bd69228a1a28919c8be', '[\"*\"]', NULL, NULL, '2024-01-24 08:14:47', '2024-01-24 08:14:47'),
(1947, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '823dc9dd96b4663b850df5baf9ac43ef28e6daf733583dd141ce15af5da4e217', '[\"*\"]', '2024-01-24 08:16:23', NULL, '2024-01-24 08:16:23', '2024-01-24 08:16:23'),
(1949, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '55c4fe93c0468815ab4efc8d757ee7650b083a24046ff0f47f3f78d946bf87fe', '[\"*\"]', '2024-01-24 10:55:36', NULL, '2024-01-24 10:55:36', '2024-01-24 10:55:36'),
(1950, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', 'add9f422e88feb99d461fdb7a25a5237452849d3d463c5c150edc065354589b4', '[\"*\"]', '2024-01-24 10:56:31', NULL, '2024-01-24 10:55:36', '2024-01-24 10:56:31'),
(1951, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '84f0da44bac924af58ec79965c28557c5260539baa373407391ec3203d5adad5', '[\"*\"]', '2024-01-24 10:57:21', NULL, '2024-01-24 10:57:21', '2024-01-24 10:57:21'),
(1952, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '2f7c417e87768a700c11e9743039e428e9c46fd4b2b8d56a0638942bc46da967', '[\"*\"]', NULL, NULL, '2024-01-24 10:57:21', '2024-01-24 10:57:21'),
(1953, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', 'f125f006080508c19d76996c2f012e1eeb0114113350cefefbc0c7dceef69b58', '[\"*\"]', '2024-01-24 10:57:45', NULL, '2024-01-24 10:57:45', '2024-01-24 10:57:45'),
(1954, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '7a51f94373e1ae1ec419a144d82ebfbbcd913f0b5fd7510fa5559904acec1584', '[\"*\"]', '2024-01-24 11:06:30', NULL, '2024-01-24 10:57:45', '2024-01-24 11:06:30'),
(1955, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '28ae550fa1b889c3c85b2099f59b5a5124b3d485ccbf33e1a234d93be338517c', '[\"*\"]', '2024-01-24 11:06:56', NULL, '2024-01-24 11:06:56', '2024-01-24 11:06:56'),
(1956, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '9c1826e4b3b9998d10c54c343e20090bc154923e237faa2e3fd07dea5fa63ac6', '[\"*\"]', NULL, NULL, '2024-01-24 11:06:56', '2024-01-24 11:06:56'),
(1957, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '51e852b955ea8c3e8f1ff15b0210d2b93baccc5dc1dd2c7096907b7464265e74', '[\"*\"]', '2024-01-24 11:07:14', NULL, '2024-01-24 11:07:14', '2024-01-24 11:07:14'),
(1960, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '7edc128e451c3d22d55f5704ae2745c7e7becf847bf9658180c56a9ae7b99c90', '[\"*\"]', '2024-02-18 11:50:07', NULL, '2024-01-24 11:24:49', '2024-02-18 11:50:07'),
(1961, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '71a446347b17005100daed214b8de6fb62c560ab3d990418ca76cbf21bb60ba4', '[\"*\"]', '2024-01-24 15:24:57', NULL, '2024-01-24 12:12:22', '2024-01-24 15:24:57'),
(1962, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'e9b7645a03c0ce65d89a9a3323d10560fb6825202380464fb0b6d08db837c4fe', '[\"*\"]', '2024-01-25 09:09:58', NULL, '2024-01-25 09:04:54', '2024-01-25 09:09:58'),
(1963, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'f8fc3bb51f1931478f2e3b66a14d1e20a7f2617af4a95eb6abc22134bb6a3350', '[\"*\"]', '2024-01-25 14:16:21', NULL, '2024-01-25 10:13:53', '2024-01-25 14:16:21'),
(1964, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '208e9972e8362dbb3f36450ffab08f12c3fc6a70fbdb78fa3ee5cd8f1a7fd097', '[\"*\"]', '2024-01-25 14:54:53', NULL, '2024-01-25 14:16:55', '2024-01-25 14:54:53'),
(1966, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'd10890c26d9873c284b9f0061f2b970bd45d9e6918b164d18ee2f5aff0214d90', '[\"*\"]', '2024-01-26 17:48:06', NULL, '2024-01-25 17:07:09', '2024-01-26 17:48:06'),
(1967, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', 'bebf065e77d491b083ce83ad418f367bca1e9392a3925fe31fd5a78dbfced2a3', '[\"*\"]', '2024-01-26 17:58:48', NULL, '2024-01-26 17:58:48', '2024-01-26 17:58:48'),
(1969, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '8fc7cd9cff91c812be5352f57397d43b9454b84e2a428a07a202373e0a3cb6f9', '[\"*\"]', '2024-02-07 09:40:41', NULL, '2024-01-27 10:28:31', '2024-02-07 09:40:41'),
(1970, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', '62b4908db9bf877e506637b5619108f0a7a30a63c3aa02fdca7639973b52f56d', '[\"*\"]', '2024-01-27 11:35:21', NULL, '2024-01-27 11:35:20', '2024-01-27 11:35:21'),
(1972, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '847a20cd120b6db99dbffd594c10e16249f115095bbe326639a36948284b2ecd', '[\"*\"]', '2024-01-27 12:50:13', NULL, '2024-01-27 12:50:12', '2024-01-27 12:50:13'),
(1974, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', '85f340a8284e0faf2be27dcba041841c7e9e87a6a2c890383ece1a965fa7d314', '[\"*\"]', '2024-01-27 12:50:32', NULL, '2024-01-27 12:50:32', '2024-01-27 12:50:32'),
(1975, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', 'b5b7521f453680009a00d59d66cf4dbf3a8204578eca10788b6161fa72c7117b', '[\"*\"]', '2024-01-27 12:57:58', NULL, '2024-01-27 12:50:32', '2024-01-27 12:57:58'),
(1976, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', 'c3c27bebf3c7f8d643a922e625b87c6eb6b368419247e281604c6be21eebf5f7', '[\"*\"]', '2024-01-27 12:58:16', NULL, '2024-01-27 12:58:16', '2024-01-27 12:58:16'),
(1978, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', 'ee7372dda36140333690e952ee2463f932314df3f73db261d0c1f732cb5f884d', '[\"*\"]', '2024-01-27 13:12:55', NULL, '2024-01-27 13:12:55', '2024-01-27 13:12:55'),
(1979, 'App\\Models\\User', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'API Token of Tom Tutor', 'd2be7d5e6d7d591be455d9ab3562add5b5eed88d121e52f65e4d00f823a458ba', '[\"*\"]', '2024-01-28 08:35:03', NULL, '2024-01-27 13:12:55', '2024-01-28 08:35:03'),
(1993, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '572374fcba4f9b41936eef34d6e8c86ed29ef45d9d028529ea15b70d0a407d5f', '[\"*\"]', '2024-01-29 07:48:22', NULL, '2024-01-28 09:51:48', '2024-01-29 07:48:22'),
(1994, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '19f0e3417f718ed99f567956b1b8b6364d57a14feb4cc2bd0f457fbb43bfc708', '[\"*\"]', '2024-02-25 09:44:05', NULL, '2024-01-29 08:51:35', '2024-02-25 09:44:05'),
(1996, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '6b27e96cff5469a71d2fc0bd10fc6b377dd3bd568d58653d83d21854bbb99b2d', '[\"*\"]', '2024-01-30 09:32:58', NULL, '2024-01-30 09:32:58', '2024-01-30 09:32:58'),
(1997, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '32e1519702b8511d6f2c9de93b0e27fd548a5d034d1e3a3d5552e10b65e8cdee', '[\"*\"]', '2024-01-30 10:03:38', NULL, '2024-01-30 09:40:31', '2024-01-30 10:03:38'),
(1998, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'c6e86cb64f1140aa409cad96fa7fd8969feb0f80f78745fdb3c0bb20ddf6fc2a', '[\"*\"]', '2024-01-30 10:25:32', NULL, '2024-01-30 10:07:56', '2024-01-30 10:25:32'),
(2001, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'd057f7968ca95b83c09a51f0ca0174c170f4ddfc6413097fe12d1529e2987886', '[\"*\"]', '2024-02-23 10:40:48', NULL, '2024-01-31 17:17:22', '2024-02-23 10:40:48'),
(2003, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', 'd26642e98d2066df14722e0e7941d291940001862d714e75d8a864b4e730ec61', '[\"*\"]', '2024-02-05 14:21:44', NULL, '2024-02-05 14:21:44', '2024-02-05 14:21:44'),
(2005, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '3c8c37a3c1b65a62dc4ca5ab381db19d8b4bd84241ecf1e9dae1db0992ebcb9e', '[\"*\"]', '2024-02-10 13:54:04', NULL, '2024-02-05 14:23:33', '2024-02-10 13:54:04'),
(2006, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '9e9324c9686b4c3af1440fd6b264667d5bee332019ee82505319bcbd236423e9', '[\"*\"]', '2024-02-07 10:01:34', NULL, '2024-02-07 09:51:14', '2024-02-07 10:01:34'),
(2009, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'f996bc3c2a9ff07a36e8a57a266524485f105e96c662cf4cec02eac56cea20e3', '[\"*\"]', '2024-02-13 20:26:39', NULL, '2024-02-13 12:10:26', '2024-02-13 20:26:39'),
(2010, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '76eefab7dcd5ed26bf5e8b9e361ba6b3dcb5300ce1d45c2aca4369251f68ded2', '[\"*\"]', '2024-02-13 20:07:01', NULL, '2024-02-13 20:05:26', '2024-02-13 20:07:01'),
(2011, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'b512f0ab3c69dac5a1593aa64c162b5f16247bc17a063ecf51f3c89e26d7aaa6', '[\"*\"]', '2024-02-14 07:25:45', NULL, '2024-02-14 07:25:32', '2024-02-14 07:25:45'),
(2012, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '96df0651d63fbf3dc65aad21bc8eceb8f19e77e3f650a5d1955a2d9a8185fc58', '[\"*\"]', '2024-02-14 07:25:56', NULL, '2024-02-14 07:25:51', '2024-02-14 07:25:56'),
(2013, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'f4845bac0334f34f59ac091b94f64b4822f7c3a68773d6bc4fc49ab2acabf760', '[\"*\"]', '2024-02-14 07:34:40', NULL, '2024-02-14 07:26:03', '2024-02-14 07:34:40'),
(2014, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '0b11dbd3e1e6ff76d759f4d2cd6a21d13afe11160aff4be6fcca7bd5bffe65d1', '[\"*\"]', '2024-02-14 07:39:06', NULL, '2024-02-14 07:34:45', '2024-02-14 07:39:06'),
(2015, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '8d954424c2ee746a383e109b42124547bc747f1155529195f8fcccbe85d5da46', '[\"*\"]', '2024-03-13 09:55:58', NULL, '2024-02-14 07:38:00', '2024-03-13 09:55:58'),
(2017, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '8a06184915a60c8cb55e643a4740598b76dd5664623cb730c6dc6b9e6c3328b2', '[\"*\"]', NULL, NULL, '2024-02-14 10:29:05', '2024-02-14 10:29:05'),
(2019, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'e108c369706b76a929207c1e3c696abf6b57e90813dc7549e87fb3c1c5b5c85a', '[\"*\"]', '2024-02-16 09:35:56', NULL, '2024-02-16 09:05:08', '2024-02-16 09:35:56'),
(2020, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '9f1854f576cd6929c30ede102e6989fecbfb21bddb6041f1305a42674327090f', '[\"*\"]', '2024-02-16 09:37:23', NULL, '2024-02-16 09:36:31', '2024-02-16 09:37:23'),
(2021, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '4fe8d77daf12e7429b8febe5f0568146c203e84088956bbe9f2834f39f24336a', '[\"*\"]', '2024-02-18 12:23:26', NULL, '2024-02-16 09:37:26', '2024-02-18 12:23:26'),
(2022, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'b9ea3c387c9d1807e7405b1334aae324e5d2f2eda47ea69bb85864fe8b35fa4b', '[\"*\"]', '2024-02-20 09:10:28', NULL, '2024-02-18 12:27:39', '2024-02-20 09:10:28'),
(2024, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '2dd649c4f046d57ba8ee59a14a1561fe7ae225239e833d9254debad41d25af15', '[\"*\"]', '2024-02-21 15:48:45', NULL, '2024-02-20 09:37:39', '2024-02-21 15:48:45'),
(2025, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', '6fe911200a9fb53777e35b9373500bca9e75c578604023ba229ecca8b4f73129', '[\"*\"]', '2024-02-23 07:38:37', NULL, '2024-02-23 07:38:36', '2024-02-23 07:38:37'),
(2026, 'App\\Models\\User', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'API Token of Luke Noble', 'a5508438d8f539111065600df4bd889825bd82e10b65b7aaaa5397c0434452aa', '[\"*\"]', '2024-02-23 07:58:45', NULL, '2024-02-23 07:38:37', '2024-02-23 07:58:45'),
(2028, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '495d0689fa468cf62f556e9e646e74a022d4705d0e9941362558ced959c3de75', '[\"*\"]', '2024-03-04 14:05:33', NULL, '2024-03-04 10:23:07', '2024-03-04 14:05:33'),
(2029, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '8923f49de44c714ad93ada2235e2731b5ec11494ae67bbdcf43feaf1fd472b6f', '[\"*\"]', '2024-03-05 07:30:13', NULL, '2024-03-04 14:11:57', '2024-03-05 07:30:13'),
(2030, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '2e9331d5d864e3bce63e9f1513b1dacab5ee399569886bd44ac6ba72cef9094b', '[\"*\"]', '2024-03-05 07:30:31', NULL, '2024-03-05 07:30:23', '2024-03-05 07:30:31'),
(2031, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '38611db9cf59734e257f872207176592cb98456d55aa98b2dbbb99819d59b266', '[\"*\"]', '2024-03-05 07:54:58', NULL, '2024-03-05 07:42:09', '2024-03-05 07:54:58'),
(2032, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'b4d6dacbfd6e7a73f8222e77ef002af398a4d0952b6fe288ea7d3ff8ecdb26df', '[\"*\"]', '2024-03-05 07:57:33', NULL, '2024-03-05 07:57:03', '2024-03-05 07:57:33'),
(2033, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'b84ff1304dfc520621ac642da09406355e665fb9da655ed79895de53eb65bf09', '[\"*\"]', '2024-03-05 07:57:48', NULL, '2024-03-05 07:57:45', '2024-03-05 07:57:48'),
(2034, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '20d7bd184946456d5339d40185fa25959a641a9b81ffd25990f08a274103b00e', '[\"*\"]', '2024-03-05 07:58:43', NULL, '2024-03-05 07:58:42', '2024-03-05 07:58:43'),
(2035, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '1b9755951941ba1267170d0c1752c330e680c2c03b428d0f9e02f7d450c00c32', '[\"*\"]', '2024-03-05 07:59:08', NULL, '2024-03-05 07:59:06', '2024-03-05 07:59:08'),
(2036, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '13bc675495c53dfdd9fc570aeec419321d4737418129a97fc9714f0864d922e4', '[\"*\"]', '2024-03-05 08:02:49', NULL, '2024-03-05 08:02:45', '2024-03-05 08:02:49'),
(2037, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'ad43f2d919d88317aae8733344591995e41c6b1edc8312ccd386856daf9d61c2', '[\"*\"]', '2024-03-05 08:03:12', NULL, '2024-03-05 08:03:10', '2024-03-05 08:03:12'),
(2038, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '3e15342c1e53b53c6493ff85bb38cc848ea346838ab4e2f42e073b5381e07cef', '[\"*\"]', '2024-03-05 08:03:34', NULL, '2024-03-05 08:03:32', '2024-03-05 08:03:34'),
(2039, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '5114e32084f3766f69f31d2c1ddcfcd645a7122bdac814e53b6e7e5376bc723c', '[\"*\"]', '2024-03-05 08:04:04', NULL, '2024-03-05 08:04:02', '2024-03-05 08:04:04'),
(2040, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '8a397332d3477360ba3943d153fb040c81894393b87efda2b6dc3170b2200d64', '[\"*\"]', '2024-03-05 08:05:36', NULL, '2024-03-05 08:05:35', '2024-03-05 08:05:36'),
(2041, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '91d64a507983737bbf79b744710ff79b730d33ae779c1d15dda4fe2d199d74d7', '[\"*\"]', '2024-03-05 08:06:28', NULL, '2024-03-05 08:06:26', '2024-03-05 08:06:28'),
(2042, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '4453b4dfda2b01d8f76c9baa01a79c323daff188cd8486fac402286deab3df70', '[\"*\"]', '2024-03-05 08:06:47', NULL, '2024-03-05 08:06:45', '2024-03-05 08:06:47'),
(2043, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '51051c50583a180fab3a238a07cefeb80a0c4d756dfc2d5b3343dc410e953078', '[\"*\"]', '2024-03-05 08:09:18', NULL, '2024-03-05 08:09:16', '2024-03-05 08:09:18'),
(2044, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '4a2009900c164881f9bbe3615364cae450e1607049ab241bb593e18845fa3b6b', '[\"*\"]', '2024-03-05 08:09:45', NULL, '2024-03-05 08:09:42', '2024-03-05 08:09:45'),
(2045, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'd4285ba7f597d96da221d94f668150550c724e6d5997aa04127ea38940efcfe0', '[\"*\"]', '2024-03-05 08:11:29', NULL, '2024-03-05 08:11:27', '2024-03-05 08:11:29'),
(2046, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '4460e354fb9690a0aceef5cc80fa0af1e398a143f43fd1e824931b0cc2f7f2cc', '[\"*\"]', '2024-03-05 08:12:06', NULL, '2024-03-05 08:12:04', '2024-03-05 08:12:06'),
(2047, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'c3418319643f47a712d21dc5dbd6d0bf766d5a85c1cb2d7a2e39d166598d6deb', '[\"*\"]', '2024-03-05 08:13:52', NULL, '2024-03-05 08:13:50', '2024-03-05 08:13:52'),
(2048, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'c06e12b301e09e1af57488c51bab7b4db1fee2065ec75fc9d16a5721f43478a2', '[\"*\"]', '2024-03-05 08:14:09', NULL, '2024-03-05 08:14:07', '2024-03-05 08:14:09'),
(2049, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '9cc2ce4be7c20fe0e7714871be1d8c696d4a2b1230b6d1a1109c7135e0f45c04', '[\"*\"]', '2024-03-05 08:15:20', NULL, '2024-03-05 08:15:18', '2024-03-05 08:15:20'),
(2050, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '312edf7a7cd1b09765e1f459f3788c41edb90afd51c3101c03e72ef26f3d35b7', '[\"*\"]', '2024-03-05 08:16:09', NULL, '2024-03-05 08:16:07', '2024-03-05 08:16:09'),
(2051, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'c6bc12d29e9460f30d2d6f0d185c0920478bd0d1702c75cd6209dfc2259f07c0', '[\"*\"]', '2024-03-05 08:16:28', NULL, '2024-03-05 08:16:27', '2024-03-05 08:16:28'),
(2052, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'e60a53220b5ce8a5c6977d70aa9b56512c02501bd1106d49f673602425bfdf3f', '[\"*\"]', '2024-03-05 08:17:51', NULL, '2024-03-05 08:17:08', '2024-03-05 08:17:51'),
(2053, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'bb62ecef550a073550f2ac5193468a7795decb3d5c4b01761df07275566de02a', '[\"*\"]', '2024-03-05 10:36:33', NULL, '2024-03-05 08:18:10', '2024-03-05 10:36:33'),
(2054, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '92d7a9b39765a0475e2939b87374a2952932a32268faeafbf858664e08987500', '[\"*\"]', '2024-03-05 10:37:36', NULL, '2024-03-05 10:37:32', '2024-03-05 10:37:36'),
(2055, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '7f0e83bb1834b63eb94cda99d6d59e8a5e511fac872be964ebda35841afe7393', '[\"*\"]', '2024-03-05 10:40:20', NULL, '2024-03-05 10:38:38', '2024-03-05 10:40:20'),
(2056, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '2e54c57ada4803abdf2316b832693f44c51593a6160bd84c6f85cecd3b3956a9', '[\"*\"]', '2024-03-05 10:42:32', NULL, '2024-03-05 10:40:42', '2024-03-05 10:42:32'),
(2060, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '771e90c269267c79e9229069fef12b0fada92ff4190ca93f74bd48c3eb6a1017', '[\"*\"]', '2024-03-08 11:54:25', NULL, '2024-03-08 11:48:23', '2024-03-08 11:54:25'),
(2063, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '1c42ff1fb6a0acbc93d7751eacc64bfdfa8e2829bf96f0653205969a57cc3fe6', '[\"*\"]', '2024-03-10 11:58:23', NULL, '2024-03-08 14:35:31', '2024-03-10 11:58:23'),
(2066, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '6ece10e4e02cfed1f06bff33cf7ea1b2077352fa6dfea4e7dc70ce9109f54d02', '[\"*\"]', '2024-03-11 07:31:41', NULL, '2024-03-11 07:07:51', '2024-03-11 07:31:41'),
(2067, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '26351a4fdbb466880600d390e12f0138ada4f25bcb3b6e2165a72f88cf60ddbe', '[\"*\"]', '2024-03-11 07:48:13', NULL, '2024-03-11 07:48:05', '2024-03-11 07:48:13'),
(2068, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '5fe1b6bbf1020bab187259e262ac0841f886f5efd96860400a6857787df8fcc1', '[\"*\"]', '2024-03-11 07:48:46', NULL, '2024-03-11 07:48:41', '2024-03-11 07:48:46'),
(2069, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '731838ab169b95a13decd1bb2ee59769824527d4f1e99146a8ac42de3a766fce', '[\"*\"]', '2024-03-11 07:50:35', NULL, '2024-03-11 07:49:15', '2024-03-11 07:50:35'),
(2070, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '5d3aa03da3c89ecf483461d8c68b00e15f8910e93116913a7cfc579de1f4b90a', '[\"*\"]', '2024-03-11 07:50:38', NULL, '2024-03-11 07:50:35', '2024-03-11 07:50:38'),
(2071, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '32943da3d22e7064af02cb056fac1d85ba861a491f1e710ed730f1a0aecd3a16', '[\"*\"]', '2024-03-11 07:58:12', NULL, '2024-03-11 07:51:38', '2024-03-11 07:58:12'),
(2072, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '41b77ff8960a62596633108ee3e213dfb63260f8af0f18f513f819f05704f750', '[\"*\"]', '2024-03-11 08:13:48', NULL, '2024-03-11 07:58:12', '2024-03-11 08:13:48'),
(2073, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '15eb911f52fbe69eba74275c66b811bf62dba9e26c99191e24aac1e64bfcb6ad', '[\"*\"]', '2024-03-11 08:14:06', NULL, '2024-03-11 08:14:02', '2024-03-11 08:14:06'),
(2074, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '16bf4275b49acae20fabd02140d0e966891907335190b8a7d68fdd6e5853f6fc', '[\"*\"]', '2024-03-11 08:43:47', NULL, '2024-03-11 08:16:29', '2024-03-11 08:43:47'),
(2075, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'ecf0c05666ec3ea684cbf14fb8e665cb3d10f297b305272239305509d66eafe0', '[\"*\"]', '2024-03-11 08:46:13', NULL, '2024-03-11 08:44:03', '2024-03-11 08:46:13'),
(2076, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '193d5c0c1d198b961145198101feb078c9102be747aa8f100c96a26fc64ddd68', '[\"*\"]', '2024-03-11 08:47:47', NULL, '2024-03-11 08:47:03', '2024-03-11 08:47:47'),
(2077, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'b1cc0c9c66615e2817650f9bac27066ec8fdaef3e23a3c0dedcd2fd65a46e511', '[\"*\"]', '2024-03-11 08:52:08', NULL, '2024-03-11 08:48:50', '2024-03-11 08:52:08'),
(2078, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'eaae403c2be8c4fbcbbfbd3c640a647e40ab47206f93ac557d34404d7e5f4f08', '[\"*\"]', '2024-03-11 08:54:07', NULL, '2024-03-11 08:54:01', '2024-03-11 08:54:07'),
(2079, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '01165081855eb932c6896481c8bcbcb680f190cc370e1dc388f4084229de89b3', '[\"*\"]', '2024-03-11 08:55:45', NULL, '2024-03-11 08:55:09', '2024-03-11 08:55:45'),
(2080, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '4210b8f67e1568fb7b80978e2c454bc78168bdb51ca84317dc7f0e34225eefd7', '[\"*\"]', '2024-03-11 09:02:36', NULL, '2024-03-11 08:56:20', '2024-03-11 09:02:36'),
(2081, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '75646ff136d9078ca0a2ae67a9f0b5ed48b265dba3524aa06dca51669b43e418', '[\"*\"]', '2024-03-11 09:10:39', NULL, '2024-03-11 09:09:59', '2024-03-11 09:10:39'),
(2082, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '96fdcdfd72364b86a8f20daf58824181655d868e07230d313d2448c81a34422d', '[\"*\"]', '2024-03-11 09:12:59', NULL, '2024-03-11 09:12:11', '2024-03-11 09:12:59'),
(2083, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '129ed00c14cee42186f40b8eb587ccbaa6d0609e51b5e7927959dd3ea049a65b', '[\"*\"]', '2024-03-11 09:24:51', NULL, '2024-03-11 09:20:50', '2024-03-11 09:24:51'),
(2084, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'b4f63859044bf13f44c8ba540a53c9a1099869508fdbd48379a730fd897ea7bc', '[\"*\"]', '2024-03-11 09:31:46', NULL, '2024-03-11 09:29:50', '2024-03-11 09:31:46'),
(2085, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'c28b582219f363bfcabab2133afb30475997661e1629b7cc5f69ff3061d53572', '[\"*\"]', '2024-03-11 09:35:24', NULL, '2024-03-11 09:33:03', '2024-03-11 09:35:24'),
(2086, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '9fb978db2ddb732c85978cf0878d84ec959409502ede7252a24366bfd815bb6c', '[\"*\"]', '2024-03-11 09:40:05', NULL, '2024-03-11 09:39:48', '2024-03-11 09:40:05'),
(2087, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'e6ef52c470afdabd658d6bb4f21424747eba6301e18ce77ab4d85b17660b0c2f', '[\"*\"]', '2024-03-11 09:40:37', NULL, '2024-03-11 09:40:16', '2024-03-11 09:40:37'),
(2088, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '4fa592ea89c8dbdfd0ef2e9dc2431c2eff1fce66277f9a00e7bf707b6d0647fb', '[\"*\"]', '2024-03-11 09:42:16', NULL, '2024-03-11 09:41:07', '2024-03-11 09:42:16'),
(2089, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '83bd406d5820be12059f79b7fb5a47d288c1e950f2f714a5df76517e74179213', '[\"*\"]', NULL, NULL, '2024-03-11 09:43:58', '2024-03-11 09:43:58'),
(2090, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '937bb8a0818d7ac079e4b7093fd9472208f04d9d8c3cbd0902365363d3a3d3c6', '[\"*\"]', '2024-03-11 09:45:23', NULL, '2024-03-11 09:45:19', '2024-03-11 09:45:23'),
(2091, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', 'a5e4780c5ee244c68737a68368fbeb153330da5e846a1a203046a690c927ddc4', '[\"*\"]', '2024-03-12 06:44:44', NULL, '2024-03-11 09:45:57', '2024-03-12 06:44:44'),
(2092, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '0dfeb4ae3b3a6561922cb0114900f2715d250ca9c650dac22122908767f077f9', '[\"*\"]', '2024-03-12 10:16:14', NULL, '2024-03-12 07:58:58', '2024-03-12 10:16:14'),
(2093, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '37a06442b8d5eeedc5b29c813de6204ce64a893f48f51f8bff2c566e77972451', '[\"*\"]', '2024-03-13 08:07:59', NULL, '2024-03-12 10:18:33', '2024-03-13 08:07:59'),
(2094, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '0883556f6515bc128f25fa77163f1abbdb5abec86ab3d24e7fc4172534ddd976', '[\"*\"]', '2024-03-13 08:08:19', NULL, '2024-03-13 08:08:17', '2024-03-13 08:08:19'),
(2095, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '23e0bd98456d6a8fe47d171766193ec30ae7f45d37ec26bcca5f6c96fea733aa', '[\"*\"]', '2024-03-13 08:21:56', NULL, '2024-03-13 08:09:14', '2024-03-13 08:21:56'),
(2096, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '061bb130ac53580eac4868dd7750efa6aec55b1f040980fbcca3533024821cb2', '[\"*\"]', '2024-03-13 08:22:23', NULL, '2024-03-13 08:22:17', '2024-03-13 08:22:23'),
(2100, 'App\\Models\\User', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'API Token of John Smith', '78cdd36899c1e0b7556f935382ab7a250eb184745e1835aadcb68b9a73022b36', '[\"*\"]', '2024-03-13 20:43:01', NULL, '2024-03-13 19:27:03', '2024-03-13 20:43:01');

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
('Luke\'s School of Awesome', '24851c5c-8748-4877-93b4-3461058a4dc7', 'Basic', NULL, NULL, NULL, NULL, NULL, '2024-01-17 13:48:34', '2024-01-17 13:48:34', NULL),
('Sampsonwood Primary', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Basic', NULL, NULL, '/images/school_logos/sampsonwood_school.png', NULL, NULL, '2023-08-18 11:51:13', '2023-08-18 11:51:13', NULL),
('Pinecrest School', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Basic', '9876543', '123 Fake Street, Newtown', '/images/school_logos/pinecrest_school.png', '#336666', NULL, NULL, NULL, NULL),
('Demo School High', 'f6f99a38-925f-486a-a0bc-a80d4d610181', 'Basic', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 10:23:32', NULL),
('Middleton Grange School', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'Basic', NULL, NULL, NULL, NULL, NULL, '2024-01-18 15:21:34', '2024-01-18 15:21:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school_data`
--

CREATE TABLE `school_data` (
  `id` varchar(36) NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `school_data`
--

INSERT INTO `school_data` (`id`, `school_id`, `type`, `value`, `created_at`, `updated_at`) VALUES
('344848fe-4795-4e6e-93c0-75d631559a66', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'funding type', 'Funded', '2024-03-13 19:51:03', '2024-03-13 19:51:03'),
('39522526-8169-4c3f-ba95-1c821f8464e5', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'funding type', 'Partially Funded', '2024-03-13 20:29:49', '2024-03-13 20:29:49'),
('42663dbd-c856-4b49-a8c9-b4ae7e83ee3f', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'funding type', 'Private', '2024-03-13 19:51:01', '2024-03-13 19:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `school_terms`
--

CREATE TABLE `school_terms` (
  `id` varchar(36) NOT NULL,
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(4) NOT NULL,
  `description` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `school_terms`
--

INSERT INTO `school_terms` (`id`, `school_id`, `year`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
('8053f7e5-79fc-46a3-8d13-bec0f13b135a', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024', 'Term 2', '2024-03-15', '2024-03-31', '2024-03-13 18:39:03', '2024-03-14 07:46:40'),
('8c78bbd5-5548-41f4-9515-690b23d71a88', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024', 'Term 1', '2024-03-01', '2024-03-14', '2024-03-13 18:39:03', '2024-03-14 07:46:44');

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
('Tine Dourado', 'Bianca', '0009623c-e074-4bcb-9d50-2b124f2a1bd8', '12CH', '', NULL, 'F', 1, '23265', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-27 10:32:57'),
('Galaz Duarte', 'Valeria', '004fd2eb-d32d-4e16-a428-508be8e80db7', '10LN', '10', NULL, '', 1, '22110', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-27 10:32:57'),
('Crocker', 'Caleb', '00802d77-9897-424c-9855-36cfd957c04a', '11MC', NULL, NULL, 'M', 1, '131330', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Harris', 'Jade', '008d68f4-8617-40db-8788-5055a59c0ed4', '12AN', NULL, NULL, 'F', 1, '21069', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Williams', 'Stanley', '00aa64d3-4c68-4d64-b0b0-d827adcc35e8', '4r10', NULL, NULL, 'M', 1, '20262', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Jaftha', 'Romeo', '00bb5414-56b7-4939-89d9-e4f899c0e31b', '13OG', NULL, NULL, 'M', 1, '22135', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Li', 'Alina', '00c45b2d-bdb9-4171-a0c8-b88a4fb58fe5', '11MC', NULL, NULL, 'F', 1, '14228', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Diggs', 'Christian', '00f5ee02-016d-42c2-90df-9955dfa6b735', '4r11', NULL, NULL, 'M', 1, '21248', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ju', 'Jay', '01b24c93-5188-4e56-9fb1-8d2abd9908c1', '11WW', NULL, NULL, 'M', 1, '20072', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Read', 'Jasper', '01c03ca8-5d9c-4775-b1db-a83a12bc70ad', '7PM', NULL, NULL, 'M', 1, '17289', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Li', 'Annabelle', '02113f56-d493-4236-83b5-8cf19a1ed00b', '2r7', NULL, NULL, 'F', 1, '23208', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lu', 'Olivia', '0211c988-8032-43df-ba3e-0647d1b97668', '6r14', NULL, NULL, 'F', 1, '20276', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('de Nysschen', 'Henco', '0222d069-eb9e-46d7-bd11-937f316b2f91', '8EL', NULL, NULL, 'M', 1, '240048', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Li', 'Yichen', '02683ba6-84e1-4f4a-bb5d-7b63206dfaef', '11MZ', NULL, NULL, 'F', 1, '240211', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Ball', 'Lily', '02f30d74-5646-49fc-b100-e256c7982a6d', '10SC', NULL, NULL, 'F', 1, '23499', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Broughton', 'Boaz', '02f5a8ea-c057-42c2-ba06-297728ecf10d', '10LE', NULL, NULL, 'M', 1, '21023', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Szurpicka', 'Gabriela', '03050b44-8e6a-4d74-9433-9e72c49e33e3', '12BT', NULL, NULL, 'F', 1, '21149', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Na', 'Tim', '030ce61b-a90f-4185-8485-1ff2fcb748bb', '13KR', NULL, NULL, 'M', 1, '18044', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Park', 'Chanmin KDS', '0329721b-8ffe-4cd5-951d-7f2242b6fcfa', '9BR', NULL, NULL, 'M', 1, '240252', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Stuart', 'Raya', '034743d7-ad25-49d1-8875-5dc6d2b8e31d', '5r13', NULL, NULL, 'F', 1, '19238', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kuo', 'Joseph', '03573249-12a4-4e12-bad0-7bebf14d6a9e', '2r5', NULL, NULL, 'M', 1, '23434', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pijpker', 'Mike', '036e94eb-4812-4026-8750-00d86857e754', '3r8', NULL, NULL, 'M', 1, '21226', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Nakashima', 'Yuu', '03e928f0-a6db-4b93-b500-0b0b2c063de2', '12BT', NULL, NULL, 'M', 1, '23069', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lee', 'Bryan', '03f13e0f-af34-4370-a57e-e6c26f1f38aa', '11HK', NULL, NULL, 'M', 1, '23538', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Drake', 'Ella', '0410b864-40d0-4c47-8afc-252c45b53e52', '8RO', NULL, NULL, 'F', 1, '23136', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('You', 'Sanghyun KDS', '0412f3a7-02b1-4092-bac1-e30254a8d0c1', '9BR', NULL, NULL, 'M', 1, '240259', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Dekker', 'Danika', '043cfabe-01a8-4a7e-b398-29a62e9101c1', '11MC', NULL, NULL, 'F', 1, '240049', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Masara', 'Sainiana', '04714516-cfca-401c-b81c-34c1c983dbb3', '13ME', NULL, NULL, 'F', 1, '23259', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Liken', 'Lottie', '04a49147-8411-4031-96a2-a4e9c5b6a4b8', '11HM', NULL, NULL, 'F', 1, '20079', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Croker', 'Evangeline', '04c52ca5-2f9f-4dca-ac78-c7e3cce3bc0e', '11MK', NULL, NULL, 'F', 1, '240041', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McEwan', 'Eilish', '04cf17e5-1682-4ba6-b9a2-d5f1e71f7e13', '12BY', NULL, NULL, 'F', 1, '19029', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Choe', 'Daniel', '04d0840b-95cc-4564-9cfe-463ee8caf682', '11JD', NULL, NULL, 'M', 1, '14192', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Beckingsale', 'Ryan', '04e44271-5fbf-416b-ba9a-0c22ace1a05e', '11WW', NULL, NULL, 'M', 1, '18292', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tavai', 'Lynnette', '04f7228c-ce0e-4c48-9564-5068063e96bd', '13CI', NULL, NULL, 'F', 1, '22027', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Van Kekem', 'Brooklyn', '05125c40-7d98-4d02-9311-019844f3e31a', '11MC', NULL, NULL, 'M', 1, '22016', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Campbell', 'Luke', '05265e21-8ce5-4709-8846-b26ebef3ab4f', '5r12', NULL, NULL, 'M', 1, '23492', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tasker', 'Isaac', '05adf87a-2d7e-42ac-a8e8-fe6a3351821e', '10LI', NULL, NULL, 'M', 1, '14534', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Ma', 'Thomas', '05c1b408-575a-4119-8748-b0978c3acdb4', '4r11', NULL, NULL, 'M', 1, '21216', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Dos Santos', 'Kaleb', '06058912-994d-47a3-bfcf-fe5ed802f7ff', '5r13', NULL, NULL, 'M', 1, '20217', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kishiyama', 'Mei', '0606fc79-4574-4da5-8cb1-ff066cb828b5', '10TL', NULL, NULL, 'F', 1, '240263', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lester', 'Stephanie', '06206ae1-5630-4fd9-99d0-b86fa0431433', '10TL', NULL, NULL, 'F', 1, '21095', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Chan', 'Elijah', '062209a0-2bff-44a1-8164-19b36a73ad0c', '3r8', NULL, NULL, 'M', 1, '22294', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Duffield', 'Kate', '0650dddc-320b-41e4-b34c-6ee6fbf35c22', '13LH', NULL, NULL, 'F', 1, '18019', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xu', 'Jess', '06580386-2236-4779-b33c-80a466f12851', '9ED', NULL, NULL, 'F', 1, '16192', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Bedggood', 'Isabella', '06d06e1c-c4f6-4963-917a-038f494c8983', '11WW', NULL, NULL, 'F', 1, '131389', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Greenstreet', 'Luca', '0712e0e7-ce9a-43b2-a55c-fb852ed3175f', '11HM', NULL, NULL, 'F', 1, '240070', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Spicer', 'Brianna', '0715efee-2511-4e96-b533-8bcf9e9d2a2e', '13NL', NULL, NULL, 'F', 1, '22032', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kim', 'Sunjoo KDS', '07a78af9-7007-4580-9395-c6b97d4b7368', '9CN', NULL, NULL, 'M', 1, '240236', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Zhang', 'Isabella', '07ff1a58-ab16-4a2a-a047-9647134edb95', '8EL', NULL, NULL, 'F', 1, '17275', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Cadigan', 'Ruby', '083bdf27-0a94-4a53-9b81-cfdaabafda07', '11HM', NULL, NULL, 'F', 1, '22144', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mulholland', 'James', '087f640b-e9e4-461e-93e1-723ea196b3f1', '12PA', NULL, NULL, 'M', 1, '33503174', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Poulsen', 'Logan', '089d3a05-98f6-412c-85d8-d8631fc37e73', '6r14', NULL, NULL, 'M', 1, '21243', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Utting', 'Rach', '08b2696c-1465-4db5-8cc3-c5c4171a4c5f', '12BY', NULL, NULL, 'F', 1, '18328', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Diggs', 'Lincoln', '091ae05b-a4aa-4dba-b4f0-37ec30278e96', '5r13', NULL, NULL, 'M', 1, '19216', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Eskander', 'Marina', '094f1990-41d4-4d9c-82cc-bc593f6f0c08', '8CL', NULL, NULL, 'F', 1, '20220', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chong', 'Emmanuel', '097388d1-b753-475f-9704-c75fcb7527a2', '13ME', NULL, NULL, 'M', 1, '21335', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Turnbull', 'Charlotte', '098d3378-bcf8-45b9-9139-ff6cf382fe8f', '9CN', NULL, NULL, 'F', 1, '22019', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Nathan', 'Elisha', '0998f71c-1583-4475-bfcf-57fc63ee0f6b', '6r15', NULL, NULL, 'F', 1, '18315', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('McKenzie', 'Olivia', '09a14450-99de-4e4b-834f-4facf535c7e0', '10TL', NULL, NULL, 'F', 1, '23080', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Garcia', 'Martha', '09b6f4a5-5b2b-413d-b298-35f233e4407f', '8RS', NULL, NULL, 'F', 1, '17259', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Baek', 'Joha KDS', '09da8127-c0a2-45fd-bba5-7bc2667c8cc1', '10GO', NULL, NULL, 'F', 1, '240240', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xu', 'Jessie', '09f1b0cf-4f65-4753-9c0e-f422769c07a4', '5r13', NULL, NULL, 'F', 1, '19246', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Yang', 'Bianka', '0a0ebd1e-4444-419c-b084-0380d7532eca', '9FR', NULL, NULL, 'F', 1, '16207', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Smith', 'Tamara', '0a4a3259-c710-4729-869b-4f39e9e2517d', '12CG', NULL, NULL, 'F', 1, '23045', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Santos', 'Bella', '0a89556b-3e9c-4ba9-9692-29357e12c149', '7CO', NULL, NULL, 'F', 1, '240142', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Savage', 'Cairo', '0af5df78-b440-4f62-8f1a-422fbd759142', '10LN', NULL, NULL, 'M', 1, '21178', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Giddy', 'Josh', '0af72cf9-c836-45a2-bfe7-d24860806de9', '12DE', NULL, NULL, 'M', 1, '33503164', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sikaleti', 'Moala', '0b11fa61-7383-4bd1-8c87-95038cb1ce9e', '11MC', NULL, NULL, 'M', 1, '14195', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Wilson', 'George', '0b6d6158-f046-4fda-b953-0c50bfd11692', '13NL', NULL, NULL, 'M', 1, '33502919', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Carpenter', 'James', '0bd7f669-a903-44ff-aaa8-9a3c84ea7a26', '7TW', NULL, NULL, 'M', 1, '240031', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wang', 'Qingxiao', '0c7a28c0-e46e-4cc1-ac64-ffdbb3e66d08', '11WT', NULL, NULL, 'M', 1, '23526', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hong', 'Yulmi', '0c876d48-92f1-489c-9141-5b6814ba36cd', '12DE', NULL, NULL, 'F', 1, '240327', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ha', 'Ji Hoon', '0cacfd34-a343-485e-9bb4-906a4d69b011', '12AN', NULL, NULL, 'M', 1, '22104', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Evans', 'Luca', '0cacfe2b-d083-4f41-888d-ba2a4d0815c0', '11JM', NULL, NULL, 'M', 1, '131372', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hall', 'Lily-Rose', '0cb828e9-53a0-4ee6-88b4-f467fcb30fbe', '4r11', NULL, NULL, 'F', 1, '20221', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('George', 'Cardazki', '0ccecfb7-60b6-48d5-a8b5-1cefd00f5bb7', '7FZ', NULL, NULL, 'M', 1, '21203', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hyun', 'Jiyoung', '0ce61524-6941-4dfd-80cf-d26ebeaab0aa', '11WT', NULL, NULL, 'F', 1, '240277', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Duarte', 'Isabella', '0ce6c733-aea6-4c67-b78d-b464c2d63f16', '12DE', NULL, NULL, 'F', 1, '23135', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Addison', 'Annabel', '0d00f6f0-820f-40d7-91b0-708dbdd36c6d', '12CH', NULL, NULL, 'F', 1, '33503484', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Han', 'YiZiYu', '0d66ef06-09b3-4b15-9462-8081bcea9292', '10SC', NULL, NULL, 'M', 1, '17307', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Luiters', 'Tashmari', '0d8847e0-a96c-488d-997e-9ac7f6488250', '10LE', NULL, NULL, 'F', 1, '23089', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Tebbutt', 'Danica', '0dcb1936-6ea6-4091-b739-9b5f5010eafb', '11MK', NULL, NULL, 'F', 1, '240158', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lim', 'Jooan KDS', '0e4ceaed-553c-49bc-a807-19622a4fb5c1', '10TL', NULL, NULL, 'M', 1, '240246', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Turnbull', 'Oli', '0e5429ee-fbcb-4bf8-9c2d-f68781c58f7f', '7FZ', NULL, NULL, 'M', 1, '240166', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Young', 'Toby', '0e5b15bd-4043-4afd-846a-53b684ab4219', '13KR', NULL, NULL, 'M', 1, '22116', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Elliffe', 'Benjamin', '0e7e2236-b773-4250-aa9f-56789f7e75fb', '12BY', NULL, NULL, 'M', 1, '23132', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Oosthuizen', 'Josh', '0e7fea71-e2bd-49f3-8605-32c1d49792c2', '9SN', NULL, NULL, 'M', 1, '22057', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Dick', 'Harrison', '0e831d16-fa59-49ea-8886-cc61e996e33b', '13SO', NULL, NULL, 'M', 1, '22119', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Young', 'Sophia', '0ea665f4-ed1e-499d-90e3-51c2cbee32bf', '11JM', NULL, NULL, 'F', 1, '240189', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Cooper', 'Anne', '0ee6265e-4e65-4235-9f90-3104544b2cbd', '7PM', NULL, NULL, 'F', 1, '20382', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Immanuel', 'Samuel', '0ee73b09-003b-404c-bb3a-4029de5f741e', '11AL', NULL, NULL, 'M', 1, '240079', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sankey', 'Molly', '0f08402e-eec0-43bf-aa23-38010bd6cb60', '13NL', NULL, NULL, 'F', 1, '20122', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kindsvater', 'Ariana', '0f5a0253-55d0-412a-9277-0b7d1bb845ee', '11JD', NULL, NULL, 'F', 1, '240090', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Maddala', 'Joshna', '0f5fd134-3825-49ca-a718-4a2e43f48a67', '9FR', NULL, NULL, 'F', 1, '18285', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Alcayde', 'Jed', '0f6f1f68-999b-4cda-ba70-d19f1fb5eec5', '13NL', NULL, NULL, 'M', 1, '18012', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chang Jimenez', 'Emma', '0f71e1b3-4b46-4ab0-848c-fc559bf43319', '1r4', NULL, NULL, 'F', 1, '23228', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fraser', 'Kaitlyn', '0f902c18-df3a-4ea4-a1fc-3fd36da37340', '10SC', NULL, NULL, 'F', 1, '14550', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bracefield', 'Joshua', '0f9050ba-9bb1-47fb-b0be-0a70d00e274d', '13LH', NULL, NULL, 'M', 1, '22146', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Sarang', '0fe1dd64-a9cd-4d0c-a9ec-78e078f0d7fd', '12BY', NULL, NULL, 'F', 1, '19024', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Mori', 'Kokone', '103c44ff-17ce-401f-a900-fc6761d6d421', '10LI', NULL, NULL, 'F', 1, '240205', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Kogoshi', 'Ippei', '108e8710-8923-4540-8ac1-256ca56a2a23', '10LI', NULL, NULL, 'M', 1, '240207', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('An', 'Sungchan KDS', '10a3e634-5e01-4d23-b70b-b2f53bf0f7de', '9MD', NULL, NULL, 'M', 1, '240223', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('de Lange', 'Janneke', '10bada2f-4be4-46e7-aa9d-704c8cfe2e80', '7TW', NULL, NULL, 'F', 1, '240046', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Li', 'Leo', '10c052f0-a570-4f44-803e-5151a5147dba', '12AN', NULL, NULL, 'M', 1, '19025', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Price', 'Leah', '11e9dafe-2655-44d1-bad4-481247a330c8', '9FR', NULL, NULL, 'F', 1, '23267', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Dinnissen', 'Imri', '120f74cc-68e0-4583-9d11-29589dc670da', '7CO', NULL, NULL, 'M', 1, '240053', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Zhang', 'Xuanxuan', '12152c33-f1c5-4972-af0f-22c3d3579111', '7CO', NULL, NULL, 'M', 1, '240190', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Wu', 'Sianna', '121eb56e-2d25-4d9c-b25d-655665da4487', '7PM', NULL, NULL, 'F', 1, '17287', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Muzel Watanabe', 'Esther', '12445a7c-1080-4b99-92d9-86a37378216b', '11MK', NULL, NULL, 'F', 1, '240116', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Thompson', 'Noah', '1269a2ca-9d27-407c-994e-22a2c0843fae', '9FR', NULL, NULL, 'M', 1, '22026', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wu', 'Elisha', '1282bc60-71f3-4838-888f-5c8c032f67d8', '9BR', NULL, NULL, 'F', 1, '19194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Robb', 'Daisy', '12de4edd-48cd-4e22-9461-1a48b40faedb', '11JM', NULL, NULL, 'F', 1, '131340', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Webber', 'Thomas', '13064d70-0077-4880-ac01-8d617eb6f8ff', '11JM', NULL, NULL, 'M', 1, '240174', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Kan', 'Isabella', '1335f900-0a58-4f62-81de-b04d63db07d7', '12ST', NULL, NULL, 'F', 1, '33503486', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wang', 'Cooper', '134cec4c-baef-42c6-9c6a-b2f56c688518', '8RS', NULL, NULL, 'M', 1, '23020', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Smith', 'Mason', '1354f2f8-3219-4a42-b038-6ae728549281', '8RS', NULL, NULL, 'M', 1, '20253', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Smith', 'Jonah', '138786fd-4851-4bcc-93a2-47d78555ab1d', '12LK', NULL, NULL, 'M', 1, '21139', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Harrington', 'Rebecca', '13a0ba15-56f0-420d-b83e-0219a10f47ff', '12BT', NULL, NULL, 'F', 1, '33503467', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chan', 'Ryan', '13baf0c4-2c10-47c0-b3ad-96892ffae4a5', '11MZ', NULL, NULL, 'M', 1, '20026', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Saruwaka', 'Tawanashe', '13c6edfc-0678-45ae-b503-55a78b17a6a3', '12LK', NULL, NULL, 'F', 1, '23048', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ooi', 'Chanel', '141eec5b-bb34-435a-aba3-2a0a11020220', '13ME', NULL, NULL, 'F', 1, '16194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Falconer', 'Alicia', '1460ead8-e8a5-4e97-9d5e-4bff1a0682e9', '6r15', NULL, NULL, 'F', 1, '18303', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Ethan', '149c9710-0ecc-44c5-ade0-5bb7fe3f5c32', '13CI', NULL, NULL, 'M', 1, '23248', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Diederiks', 'Ruan', '14b61ff4-c236-47b7-bafc-7435c65adcf3', '9CN', NULL, NULL, 'M', 1, '240052', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Watson', 'Georgia', '151be066-a6e0-4e63-b4e2-615132df0000', '8CL', NULL, NULL, 'F', 1, '23019', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wong', 'Sophie', '15417c42-91ee-4163-8286-d449db9f9416', '8RS', NULL, NULL, 'F', 1, '16296', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Nadarajah', 'Jesica', '154b497a-871d-49e1-bc7c-8daf8a9cb276', '5r12', NULL, NULL, 'F', 1, '20243', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Rootman', 'Andrea', '156aa8fa-9b8a-47db-98aa-74948ff4f1d2', '12PA', NULL, NULL, 'F', 1, '23051', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Liu', 'Yang', '163e4def-2547-453b-b7a0-479831d81f74', 'Enrol', NULL, NULL, 'F', 1, '240005', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Jones', 'Isaac', '16a8f2f4-157a-4712-a3c5-92164ad58961', '10GO', NULL, NULL, 'M', 1, '23108', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lawry', 'Cameron', '16b336db-ce96-4bf5-a847-c111a0f4f60d', '4r10', NULL, NULL, 'M', 1, '20232', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Smith', 'Senka', '16f6e16e-e265-4edb-bff2-350eae744418', '7FZ', NULL, NULL, 'F', 1, '21232', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kendrew', 'Roman', '16f72b6d-ff4d-4aa7-942d-a15bf77c86e1', '7TW', NULL, NULL, 'M', 1, '240086', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Haselden', 'Sophie', '1714afb2-9b8b-4dd9-924e-b25cddd39871', '9CN', NULL, NULL, 'F', 1, '19197', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gee', 'Toby', '172c65ae-dd01-4486-935b-718f03770ec7', '11WT', NULL, NULL, 'M', 1, '22108', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('France', 'Elliot', '17cb94c0-c1d8-4195-bdbf-9f31ef4a2a1e', '5r13', NULL, NULL, 'M', 1, '19219', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dos Santos', 'Gabriel', '17ceafdb-44e1-45a8-b09d-c9e527508f08', '11JD', NULL, NULL, 'M', 1, '16172', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Dongeun', '17f9949e-75b3-4dd4-b81d-4b9e9bcad630', '9MD', NULL, NULL, 'M', 1, '23240', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Zhang', 'Mofei', '1855546d-4c8d-4f81-9cf6-b1d1ffac4526', '4r11', NULL, NULL, 'F', 1, '23562', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Gibbs', 'Cam', '18573974-8511-4099-99a4-bba5dba534c5', '9ED', NULL, NULL, 'M', 1, '15290', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hayton', 'Azaria', '18f8e2c7-05af-4894-b484-48c53f57e3bc', '5r12', NULL, NULL, 'F', 1, '20225', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shi', 'Ethan', '18fe4932-a731-4c9e-a902-46d44e0a4b58', '9ED', NULL, NULL, 'M', 1, '16248', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Wu', 'Canaan', '19109114-c3f0-4b58-adf0-68063f13c528', '8CL', NULL, NULL, 'M', 1, '17269', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Sano', 'Shohei', '191f41e4-4ff6-4a91-8bae-31ba3e75e2d1', '11MK', NULL, NULL, 'M', 1, '240209', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Maumau', 'Lilo', '1928be60-0348-4fba-b110-a04b6f89c556', '1r4', NULL, NULL, 'M', 1, '23413', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Kidson', 'Eli', '19776713-b2f3-4753-b568-4341e264d6f3', '9CN', NULL, NULL, 'M', 1, '240087', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Zhang', 'Lea', '19832451-d555-4776-936a-42bf98b459a7', '6r14', NULL, NULL, 'F', 1, '20269', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Ngu', 'Abigail', '19911e5a-702b-4614-b01d-fd7faee6b63f', '12ST', NULL, NULL, 'F', 1, '21111', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Luiters', 'Engelbert', '19920f25-3398-4ba9-a385-d7e60bf0fdc0', '9CN', NULL, NULL, 'F', 1, '240105', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Li', 'Tim', '19956988-1ad7-4ba3-b356-aa73afabb58a', '', NULL, NULL, 'M', 1, '139787270', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Ho', 'Janelle', '199f7c7c-c8fa-4e5f-b283-240b8b9db0f3', '7TW', NULL, NULL, 'F', 1, '18282', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Esterhuizen', 'Daniel', '19c4763e-1b94-46eb-ae2b-39fad0fab741', '9BR', NULL, NULL, 'M', 1, '240061', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Proctor-McGregor', 'Alyssa', '19eb303b-f35c-4253-aac6-2cdcfd82890b', '11HM', NULL, NULL, 'F', 1, '20163', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Tan', 'Matthew', '1a0f6990-e9ad-4028-b726-dc1d4faa826d', '10LE', NULL, NULL, 'M', 1, '240156', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hunt', 'Phoebe', '1a26ea25-0611-49d3-a4e7-15e34d57e756', '8RO', NULL, NULL, 'F', 1, '23112', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wong', 'Sarah', '1a39ddc3-1d68-4ad3-9659-9f28092e6bab', '2r7', NULL, NULL, 'F', 1, '23183', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Walters', 'David', '1a49c4a9-b23c-4a8f-ad12-21a9e5b15bb8', '8EL', NULL, NULL, 'M', 1, '23023', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Zhang', 'Ella', '1a88b383-c7cb-4f5a-86c2-af98fe6c3c10', '9MD', NULL, NULL, 'F', 1, '16252', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('George', 'Alex', '1aab243c-7894-4562-97d1-664474d28c84', '10LE', NULL, NULL, 'M', 1, '21061', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Neville', 'Madeleine', '1ab4a880-77cd-4957-93e2-c56c96b48469', '13ME', NULL, NULL, 'F', 1, '33503116', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Irvine', 'Ollie', '1ad681e6-6711-4fe9-8fe2-8b38476affa9', '13ME', NULL, NULL, 'M', 1, '22091', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fyfe', 'Nadia', '1ae32d93-06bf-4943-a834-0df14bb31ce7', '5r12', NULL, NULL, 'F', 1, '19220', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Long', 'Yana', '1b6b2aee-6103-468c-b001-6b5c6b43986a', '9SN', NULL, NULL, 'F', 1, '240103', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Ramsay', 'Blake', '1b81325a-a6d8-4f39-a6ac-f76702601b76', '7CO', NULL, NULL, 'M', 1, '18318', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Newbury', 'Lexie', '1bdc3951-b91c-4133-be81-e8267994f12a', '3r8', NULL, NULL, 'F', 1, '21225', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Moe', 'Shanna', '1c24e05f-f99e-48fc-a20e-f922ff3d4404', '12PA', NULL, NULL, 'F', 1, '19031', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Xu', 'Angela', '1c3368a0-937a-4f5c-810f-2c765a307198', '5r13', NULL, NULL, 'F', 1, '19245', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('So-Beer', 'Miya', '1c5fc0bd-6b3a-4a93-9699-6e41005742cd', '13LVR', NULL, NULL, 'M', 1, '33503147', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hoyt', 'Maria', '1c6b73eb-1e13-4807-ba00-89afd034f95c', '11AL', NULL, NULL, 'F', 1, '240077', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tang', 'Xiaotong', '1ca6bf70-cc7b-47fb-aac9-6ac84b8fe070', '13LH', NULL, NULL, 'F', 1, '22367', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Salele', 'Natania', '1ca7580c-757d-4747-be21-ebaeb0347ce2', '7PM', NULL, NULL, 'F', 1, '240140', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Boyce', 'Luke', '1cd9c018-0812-447e-b65c-521c16c9ff3c', '13KR', NULL, NULL, 'M', 1, '21021', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jang', 'Minjun KDS', '1ce2e003-5a6c-4c27-894e-aadcccc9578e', '9BR', NULL, NULL, 'M', 1, '240233', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Thwaites', 'Cypress', '1d30dd9e-7cd7-4a49-8a43-7789bec01e83', '13KR', NULL, NULL, 'M', 1, '22025', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Bowater', 'Jayden', '1d4b62ec-93d3-4d15-b9a6-f01fad38f5cd', '3r9', NULL, NULL, 'M', 1, '22344', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Morton', 'Henrietta', '1d94cb2f-da5c-477e-af90-163541f5b15d', '13CI', NULL, NULL, 'F', 1, '23075', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Trethowan', 'Tahlia', '1db46954-ed25-494c-b14f-6f085d3863c4', '7CO', NULL, NULL, 'F', 1, '18324', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Boyd', 'Rose', '1dd86268-84ed-46a1-b8a5-e7f7fe996b06', 'Enrol', NULL, NULL, 'F', 1, '240282', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yang', 'Jaegar', '1deb9164-e869-438a-ae91-3d4c21b926d7', '5r12', NULL, NULL, 'M', 1, '20264', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Frazer', 'Poppy', '1e0a1ee2-6ba7-4c87-a463-2469e5a2186b', '6r15', NULL, NULL, 'F', 1, '21202', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dos Santos', 'Mateus', '1e67f1bb-00d1-4de4-b81e-46cf28df69fa', '8EL', NULL, NULL, 'M', 1, '16297', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Milne', 'Maddie', '1e9a9945-5c5a-46d1-ae2e-e01a65ec659c', '9BR', NULL, NULL, 'F', 1, '22062', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Park', 'Roy', '1e9ba33b-bb46-4384-a21f-cc0657214af3', '6r14', NULL, NULL, 'M', 1, '18316', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Yu', 'Jaydon', '1ea3a6b5-bc5c-441b-8b5c-533a6b4654cc', '7CO', NULL, NULL, 'M', 1, '18327', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Caldwell', 'William', '1eb086ca-9222-44d9-8d48-6a3c35a125bf', '7CO', NULL, NULL, 'M', 1, '240030', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Hannah', '1ec302db-db25-48fc-9533-5660205d64b7', '10LI', NULL, NULL, 'F', 1, '18290', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Kim', 'Jiwoo KDS', '1ed0e537-51dc-4b3e-8f56-f696041ab9f3', '9CN', NULL, NULL, 'F', 1, '240231', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Diggs', 'Judah', '1ed6c786-8af1-4e93-8474-45ecf2c219d2', '7CO', NULL, NULL, 'M', 1, '17288', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chung', 'Hyeyoon', '1f2d8ed3-2611-4817-945c-10e28b7742e7', '12CG', NULL, NULL, 'F', 1, '23468', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Park', 'Joon', '1fbabdc0-5b9b-4f6e-ba74-496dae3ebf54', '10TL', NULL, NULL, 'M', 1, '22377', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Anderson', 'Alexis', '1fc4ebb3-1c3a-47b4-9153-812e6f7cbab5', '4r10', NULL, NULL, 'F', 1, '20206', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hung', 'Lucas', '200ab358-9c29-4a4d-bdad-aeed24983655', '9MD', NULL, NULL, 'M', 1, '15359', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Rodwell', 'Aysha', '2025aae9-e626-4480-bf1a-b703df61e7b5', '7CO', NULL, NULL, 'F', 1, '18275', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Orcajada', 'Andrea', '204da4df-cae2-4e1a-a0b6-c64aedb8766c', '9SN', NULL, NULL, 'F', 1, '20275', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Zhang', 'Zac', '208cfbc1-0f0d-4e20-99ae-05f6c61352e1', 'Enrol', NULL, NULL, 'M', 1, '240322', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Jack', 'Asha', '208d7de6-014a-4a22-8d78-924b4102486d', '5r13', NULL, NULL, 'F', 1, '19224', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Henderson', 'Libby', '20a295b9-277c-4c2f-8cbf-d02caa627048', '8RO', NULL, NULL, 'F', 1, '23115', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jordan', 'Caleb', '20cb3ff4-ba6c-4187-914d-078b8ad9fb81', '9SN', NULL, NULL, 'M', 1, '16209', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Blair', 'Natalia', '211e8f36-a330-4c4e-817d-5004695dd32e', '9SN', NULL, NULL, 'F', 1, '240019', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Watson', 'Isabella', '21736205-9610-4485-afad-a776e69b2933', '8RO', NULL, NULL, 'F', 1, '23018', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wong', 'Eliana', '2177903b-b55a-4526-ad59-8a0afb7fdfd4', '6r15', NULL, NULL, 'F', 1, '19243', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Nihoniho', 'Oliver', '21a91938-fb3f-4d2d-b769-8af8494ce71c', '11JM', NULL, NULL, 'M', 1, '240119', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Goodall', 'Amelia', '21c7c270-f3a3-4398-8dac-05d496db45c8', '5r12', NULL, NULL, 'F', 1, '19223', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hung', 'Abigail', '21e6caf9-826f-4946-aae6-230762f3ed73', '6r14', NULL, NULL, 'F', 1, '18305', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Brindley', 'Harry', '2205702f-c34f-4c9d-8024-a4f48dac184a', '12AN', NULL, NULL, 'M', 1, '19006', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wang', 'Jasper', '22218cda-9415-4e73-ac32-3862484ca20a', '1r4', NULL, NULL, 'M', 1, '23184', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Cooper', 'Zion', '22234e01-aea5-40bb-b968-deff1a09c246', '12LK', NULL, NULL, 'M', 1, '18416', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cummins', 'Emily', '2224e143-962a-4c8e-9837-5a137562534a', '12LK', NULL, NULL, 'F', 1, '33503501', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wu', 'Emma', '222bcb01-9b99-4d11-ac1a-2b1dbdbb6783', '1r4', NULL, NULL, 'F', 1, '23182', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Li', 'Audrey', '2230d204-6824-4a32-9927-3e6157bb6b81', '9ED', NULL, NULL, 'F', 1, '16230', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Highsted', 'Samuel', '22695764-4e70-40df-96e7-d30d7f571023', '11AL', NULL, NULL, 'M', 1, '20062', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jack', 'Ella', '227ac734-cd2e-4b42-800f-f2c7017685b9', '8CL', NULL, NULL, 'F', 1, '16298', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Song', 'Yeram', '22980b76-eb11-4810-be9e-54823d64a371', '10LE', NULL, NULL, 'F', 1, '19201', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Bouman', 'Emilee', '22a67894-8a21-4abf-a8bb-7d70fed7e013', '9CN', NULL, NULL, 'F', 1, '22147', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Milne', 'Jesse', '22c96b30-9967-47b1-abe2-fb77848c6512', '13KR', NULL, NULL, 'M', 1, '18043', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Carter', 'Tom', '22ef529a-fd37-497f-a781-65c3b4f10419', '11MC', NULL, NULL, 'M', 1, '22138', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Taylor', 'Holly', '233c1850-4007-416b-85b5-7c5dbf99a278', '10LE', NULL, NULL, 'F', 1, '21152', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Harris', 'Caleb', '23541a0f-5886-4705-ab2f-3fa4c7db89d6', '12CH', NULL, NULL, 'M', 1, '23122', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sibi', 'Afrayim', '23a5cb6d-ccf6-4072-a5ce-a067c8182705', '13NL', NULL, NULL, 'M', 1, '18385', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('de Freitas', 'Matthew', '23cb86b6-8296-47af-9996-8e07e73fd60e', '8RO', NULL, NULL, 'M', 1, '240044', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jaquiery', 'Hannah', '23f7d5b7-aa1a-4a38-8f32-76d7f28d8687', '12LK', NULL, NULL, 'F', 1, '23497', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Li', 'Jesse', '23fcc905-d00f-4416-810a-06761c74c81a', '4r10', NULL, NULL, 'M', 1, '21212', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Rin', 'Emily', '2425a81e-a2d7-4265-8f9e-3231e9e9b8d4', '7FZ', NULL, NULL, 'F', 1, '18278', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hong', 'Seok KDS', '247a365b-4be0-468e-bd0c-6a27f0199ccc', '10LN', NULL, NULL, 'M', 1, '240245', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Trouten', 'Eli', '2487f157-8d42-4085-bd53-f2934687c406', '12BY', NULL, NULL, 'M', 1, '23461', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Taring', 'E J', '24a6793f-2785-4266-894a-1a7701cf22f3', '12ST', NULL, NULL, 'M', 1, '19039', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Bay', 'Shepherd', '24b1976b-4134-4bd9-b967-28d22d795d40', '11MZ', NULL, NULL, 'M', 1, '240016', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chin Poy', 'Eden', '251c9b64-540f-4149-95d5-1a7ce822236f', '13ME', NULL, NULL, 'F', 1, '18016', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xu', 'Jacob', '25449953-1e59-42a7-acd3-c1c2bedccb67', '8CL', NULL, NULL, 'M', 1, '16261', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Hayes', 'Samuel', '257a38f3-fc07-4073-91b0-e3c88b8dc4ab', '10GO', NULL, NULL, 'M', 1, '15224', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Irvine', 'Lucy', '2598da81-1bc3-4c94-837b-41695ce87c09', '11HM', NULL, NULL, 'F', 1, '240080', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Linton', 'Ella', '25d303fc-b313-4af1-9d71-6318184e0bda', '11JD', NULL, NULL, 'F', 1, '240102', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Hoskins', 'Asher', '25de85cd-9150-49bb-b561-78747df9e60e', '12JH', NULL, NULL, 'M', 1, '19020', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('George', 'Chaeus', '25e4d9f2-2889-48b4-a7ea-d362f8d18dac', '4r11', NULL, NULL, 'M', 1, '21204', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bennetts', 'Georgia', '268ff2e4-e0fa-4a24-8c88-5bdedbeca1ad', '10LN', NULL, NULL, 'F', 1, '14234', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Holah', 'Grace', '26993c3f-a086-4dcd-a1d6-019546e9b71d', '7FZ', NULL, NULL, 'F', 1, '19449', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Choi', 'Issac', '26beed90-8c82-4685-96d9-32656e5dac95', '5r12', NULL, NULL, 'M', 1, '19214', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chan', 'Ethan', '26d81556-34a0-4ac9-b7b2-7c29aa789770', '8RS', NULL, NULL, 'M', 1, '23156', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Brooks', 'Amelia', '26e585df-0e5c-4426-a7c2-838b23a2bda8', '10LE', NULL, NULL, 'F', 1, '21022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Nacion', 'Juleana', '26fd344b-e72c-4a00-b3bc-416d66ba40a1', '12BY', NULL, NULL, 'F', 1, '23070', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lawrence', 'Anniek', '27218680-a5db-4229-a03c-14a5c75d945d', '2r5', NULL, NULL, 'F', 1, '23411', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Shin', 'Yeonjae KDS', '273ebe40-f5e4-4f12-956c-72a8ac9d2e14', '10SC', NULL, NULL, 'F', 1, '240255', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Duke', 'Charlotte', '27a19106-1744-4c76-a19d-eccbe7e804e1', '9CN', NULL, NULL, 'F', 1, '15292', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tseng', 'Gedeon', '27b08fbd-a3ce-446d-88e2-9d23e56fb75f', '4r11', NULL, NULL, 'M', 1, '21247', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wiegersma', 'Yuliana', '27ed53be-bff1-4032-8f41-9d64e4bab230', '10LI', NULL, NULL, 'F', 1, '20440', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Deighton', 'Emily', '27ef6bde-7152-4cd9-9b64-ca632fce20b2', '10GO', NULL, NULL, 'F', 1, '22123', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shen', 'William', '28071c32-0843-4a01-91b4-5b29c5002c0b', '11JM', NULL, NULL, 'M', 1, '14191', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Anggawijaya', 'Rafael', '2809e351-0276-4883-a432-190622859730', '12LK', NULL, NULL, 'M', 1, '23169', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Copland', 'Ella', '2821a125-0d35-4f16-8237-39400ee53a86', '13NL', NULL, NULL, 'F', 1, '22128', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Weston', 'Jo', '28262c92-005e-4e92-b4c0-ecd797dec2ae', '8RO', NULL, NULL, 'M', 1, '23016', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Fenton', 'Jess', '2839bd58-d3dd-4f88-bd98-f8b14a651521', '10GO', NULL, NULL, 'F', 1, '14501', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Choi', 'Isaiah', '28494703-e40a-4535-8017-f8518eb47716', '2r7', NULL, NULL, 'M', 1, '22295', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Given', 'Monty', '28e04713-8a6e-45b7-acc3-194aeca18afc', '10TL', NULL, NULL, 'M', 1, '21065', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Villa', 'Mel', '2910a3f2-964a-43bf-af74-3dcfe695752f', '13CI', NULL, NULL, 'F', 1, '15205', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Dong', 'Yvonne', '294fdaff-3bc1-4020-bcbf-22c2f1665889', '8RS', NULL, NULL, 'F', 1, '23139', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Si', 'Zoie', '29611e92-edb0-4cf8-a6b0-74b104581cee', '4r11', NULL, NULL, 'F', 1, '20251', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Scarlet', 'Hollie', '2999618d-c93c-4a34-b431-2b895155d18a', '11HM', NULL, NULL, 'F', 1, '22038', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kadowaki', 'Tomomi', '29d8097d-80d6-4c20-93fa-78281020e085', '10TL', NULL, NULL, 'F', 1, '23251', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Yiannett', 'Saskia', '29fdd891-f699-41f1-a4cf-ed7149c7138a', '12ST', NULL, NULL, 'F', 1, '23438', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Hill', 'Alan', '2a024d1a-8b59-4d3b-ab70-6daa672e2940', '12BT', NULL, NULL, 'M', 1, '33503315', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chavani', 'Ariana', '2a1414f9-8122-4513-9be9-0e87dd156b0b', '2r7', NULL, NULL, 'F', 1, '23227', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pelotin', 'Mark', '2a143fe3-721c-4808-b620-b98fed1b6a9a', '2r7', NULL, NULL, 'M', 1, '23196', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Roberts', 'Alysia', '2a4926d8-5d88-46da-817b-1569fbf11b51', '12AN', NULL, NULL, 'F', 1, '23054', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Li', 'Zhejun', '2a5ebb5c-ecfb-4771-8fcd-cacce89f68e9', '13CI', NULL, NULL, 'M', 1, '23264', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Kolb', 'Lorenz', '2a603dd8-173d-4e1d-af72-8b4047d7f1a0', '12CG', NULL, NULL, 'M', 1, '240199', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Maheswari', 'Grace', '2ae92af6-108e-4d53-8afb-46ce5cdc8e57', 'Enrol', NULL, NULL, 'F', 1, '240301', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Gou', 'Stephen', '2b0c4a39-fe94-4db2-87a4-20bdfe47212f', '2r5', NULL, NULL, 'M', 1, '23216', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Prima', 'Riley', '2b1c5ae8-c18b-4243-a102-fe4aaecc64df', '8RS', NULL, NULL, 'M', 1, '23059', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Uy', 'Jack', '2b5c6249-1474-498b-9b5a-84017389c54b', '5r12', NULL, NULL, 'M', 1, '19240', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wang', 'Xindi', '2b7bf8c3-7c48-412b-9ac5-c545ebeb79c2', '10GO', NULL, NULL, 'F', 1, '240266', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lafituanai', 'Laura', '2bb7c841-1d03-4b5c-ac35-50c075ea548e', '11MZ', NULL, NULL, 'F', 1, '20077', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Shimodaira', 'Karin', '2bcf6c0b-29a2-4687-9e9e-39e1775d181c', '10GO', NULL, NULL, 'F', 1, '240262', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Moon', 'Aram KDS', '2c134a69-7503-4899-9595-b18e518e1789', '10LI', NULL, NULL, 'M', 1, '240253', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Chong', 'Jedidiah', '2c415c9a-f039-42e1-83c7-1782841bbeb1', '10SC', NULL, NULL, 'M', 1, '22132', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ofa', 'Faiva', '2c5c1c02-a26e-42ca-a0e0-072ca198a90d', '12DE', NULL, NULL, 'F', 1, '19032', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Donaldson', 'Sofia', '2c62189d-c587-4298-be13-d602d9dc0e2e', '11MK', NULL, NULL, 'F', 1, '22174', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Given', 'Tessa', '2c71eb2b-a29a-4dd5-8550-94d268184fb1', '13FS', NULL, NULL, 'F', 1, '18024', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Villaseca Chacon', 'Izzy', '2c96b48e-df02-4e5b-a052-d59e5f536956', '10SC', NULL, NULL, 'F', 1, '23025', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Smith', 'Adin', '2cb97b9d-18c6-456d-8553-0108f8fca1fe', '2r5', NULL, NULL, 'M', 1, '23191', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Redhead', 'Josiah', '2d5ef3f4-aab7-49e8-8c9b-7dd498e509ae', '7TW', NULL, NULL, 'M', 1, '240132', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Jones', 'Leona', '2d92463f-798f-422d-872a-83796642967b', '13KR', NULL, NULL, 'F', 1, '22088', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Scheib', 'Sophia', '2da91e7c-f46e-4c3c-a4b5-495739984c8d', '9BR', NULL, NULL, 'F', 1, '240144', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hoffmann', 'Jné', '2da9ad91-7568-4c70-b7fe-4482346d8b03', '13LH', NULL, NULL, 'F', 1, '22099', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Moe', 'Isabel', '2db4e8de-b659-4abb-a611-5ef46f071a85', '7PM', NULL, NULL, 'F', 1, '240113', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('McKenzie', 'Josiah', '2dc5a939-cde7-4e18-bf09-5ebfbd3d5475', '11MK', NULL, NULL, 'M', 1, '22070', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Reyneke', 'Daniel', '2dc7a45a-1b2a-46cd-9566-dcd41254cc21', '5r12', NULL, NULL, 'M', 1, '20247', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Bryan', 'Sergio', '2e41abb9-f930-4566-8222-448ad8f069e6', '10GO', NULL, NULL, 'M', 1, '240024', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Rin', 'Lydia', '2e607fc1-bf3f-4c4d-82da-4f218087068d', '1r4', NULL, NULL, 'F', 1, '23193', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hill', 'Robert', '2e9508a3-cb78-4406-b80c-037355745f05', '10GO', NULL, NULL, 'M', 1, '14249', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Carpenter', 'Emily', '2f0d6bbd-b9df-4523-a52c-c6e1b3f88489', '12CH', NULL, NULL, 'F', 1, '23176', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Morgenstern', 'Anna', '2f3b87e8-462c-4b1f-8c59-0b71a866c346', '13FS', NULL, NULL, 'F', 1, '20100', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Braam', 'Mila', '2f6a1b07-071c-4548-b968-0ee73332ba0b', '2r5', NULL, NULL, 'F', 1, '22288', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wessels', 'JT', '2f70e351-7f9d-40f1-ae03-10bf6482a87c', '8CL', NULL, NULL, 'M', 1, '240176', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hoyt', 'Marica', '2fc5e785-8334-480c-a4de-c23c4d0b693f', '13SO', NULL, NULL, 'F', 1, '22095', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Doak', 'Aislinn', '2fd1ef17-aece-4b57-bfc7-ab85733a9345', '9ED', NULL, NULL, 'F', 1, '22117', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ho', 'Hannah', '301361d0-ba71-4d4e-8023-68e327c886ed', '7CO', NULL, NULL, 'F', 1, '18281', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gort', 'Riley', '301c4b04-cf26-403c-a03b-4341cc07766a', '12LK', NULL, NULL, 'M', 1, '33503162', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Siose', 'Tyrus', '307e319a-fea5-405b-9839-fb220bf6327c', '4r10', NULL, NULL, 'M', 1, '21231', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Pope', 'Cohen', '30c36b92-edc4-4dbd-b881-1d863779a3b9', '10LN', NULL, NULL, 'M', 1, '14511', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Aveeseina', 'Irae', '30d53e4d-00eb-4301-b4f5-9245d0916bb4', '9BR', NULL, NULL, 'F', 1, '22157', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Boyd', 'Lewis', '31084f53-65e2-4388-9eab-b0b3c5f29f1d', '4r11', NULL, NULL, 'M', 1, '20212', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Higa', 'Marin', '31768237-61f2-4e5b-9be0-d88095c4810b', '12LK', NULL, NULL, 'F', 1, '240271', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Alcock', 'Esther', '319575a4-e552-41dd-b1eb-6de447438d9e', '8RS', NULL, NULL, 'F', 1, '23441', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chin', 'Val', '31bf3111-834a-41cd-8ce5-701b8e77951c', '6r14', NULL, NULL, 'F', 1, '19388', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sung', 'David', '31dd5ed6-66d1-48ec-99dc-473ac32bf986', '12CH', NULL, NULL, 'M', 1, '21147', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Mwashita', 'Andre', '31fc9c45-920c-4157-92c0-324e99d3e8c8', '11MZ', NULL, NULL, 'M', 1, '240117', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ramos', 'Wade', '3204ed14-138d-42a4-978c-d0a78cf87a35', '8CL', NULL, NULL, 'M', 1, '23057', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('England', 'Joshua', '3222b1c3-425f-4113-a4c2-c0492e8bff5d', '11AL', NULL, NULL, 'M', 1, '20040', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ennor', 'Lucy', '324cedb7-215d-4c73-92a4-44e890eac223', '3r8', NULL, NULL, 'F', 1, '21199', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hartstonge', 'Levi', '3259d84b-aa05-442e-9d47-4883970026ff', '5r12', NULL, NULL, 'M', 1, '20224', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Balakrishnan', 'Kavin', '329db565-4a5f-405a-bbb7-2da41b7fd2d9', '12ST', NULL, NULL, 'M', 1, '23167', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cooper', 'Lucy', '32b6680f-a0a0-41fa-b84c-801418c186dc', '7FZ', NULL, NULL, 'F', 1, '22362', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Muza', 'Tavonga', '32e3e18c-5319-4c47-a103-35847820578b', '11MK', NULL, NULL, 'M', 1, '13007', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Couperus', 'Caleb', '32efbeb1-b816-47be-a2c3-648f63a724a3', '12PA', NULL, NULL, 'M', 1, '33503416', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cadigan', 'Tim', '3318f503-1094-4d6d-a495-9d7bc6457598', '', NULL, NULL, 'M', 1, '139799341', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Mumford', 'Mark', '3329d076-8f9b-4902-b66f-0e6d36f19b55', '10TL', NULL, NULL, 'M', 1, '21246', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('van Kekem', 'Scarlett', '338a547c-18fc-4743-bac5-fdec01a3d41a', '9BR', NULL, NULL, 'F', 1, '240171', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Sohn', 'Yeonjin KDS', '33afda95-bd86-4d7c-9bee-0d6b8de332ab', '10LE', NULL, NULL, 'F', 1, '240256', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cho', 'Nathan', '33b034dc-cf24-4610-aee4-1b1fca65eeb2', '9SN', NULL, NULL, 'M', 1, '16246', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Stocks', 'Elsie', '3452770e-6e6e-40c8-b600-59686496fbdb', '10SC', NULL, NULL, 'F', 1, '21145', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Dhlakama', 'Divine', '3474e428-cd2b-4fa5-9135-723a59bf3b85', '10LN', NULL, NULL, 'F', 1, '23440', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hilaga', 'Mary', '34a776f3-6c8a-4007-9876-de3656353af2', '11WW', NULL, NULL, 'F', 1, '240074', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Little', 'Mia', '34e168d0-7c35-482b-836b-23e16d00793d', '5r13', NULL, NULL, 'F', 1, '20235', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Carter', 'Chloe', '34e5a227-4755-4563-9535-f81be6892f7e', '12JH', NULL, NULL, 'F', 1, '23157', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hart', 'Amalie', '353b67bc-b7eb-472c-9217-6cbaef02d591', '12AN', NULL, NULL, 'F', 1, '16179', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hackney', 'Olivia', '35711820-b171-4bd3-9458-13d9a9dbbfb2', '11HK', NULL, NULL, 'F', 1, '20049', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bird', 'Emma', '35a3ddf6-2948-45b3-8f84-a7bb8acd57ac', '13ME', NULL, NULL, 'F', 1, '33502850', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Trethowan', 'Neeva', '35dcb980-bbd0-474d-95f0-5ea44e938422', '4r11', NULL, NULL, 'F', 1, '20256', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Yuan', 'Timothy', '35fcd5bd-a66b-4191-b0af-0e87ac53f5fd', '10LE', NULL, NULL, 'M', 1, '23429', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Maumau', 'Marieta', '3661463c-b0f6-49d8-91b4-aea62a7b0bc3', '8RO', NULL, NULL, 'F', 1, '16326', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('d\'Auvergne', 'Alexis', '369f34de-2a14-4a8c-870e-bdda046e0fed', '7CO', NULL, NULL, 'F', 1, '240042', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yeo', 'Sarah', '36ae779f-28f0-4687-ae0c-442c4df4a55a', '13ME', NULL, NULL, 'F', 1, '33503115', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Harrington', 'Samuel', '36b0750a-0442-4c3e-92dc-b5ca7080e60b', '10TL', NULL, NULL, 'M', 1, '15260', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Percy', 'Jack', '36ce3a24-3edd-40a8-9fb8-be88189d3102', '13SO', NULL, NULL, 'M', 1, '15206', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Misa', 'Leaongo', '373938ac-0b5b-49a5-87d6-3b751f890c9c', '4r11', NULL, NULL, 'M', 1, '20242', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Fa\'alogo', 'Richard', '373f8325-60a3-4d2f-8f42-cd246a2e06c2', '10TL', NULL, NULL, 'M', 1, '15225', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('France', 'Henry', '374a796c-4d28-462b-b21c-1f884fc3e655', '3r9', NULL, NULL, 'M', 1, '22309', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bi', 'Joycey', '375f70ba-9732-4fee-817e-6bc0aa9583c1', '9ED', NULL, NULL, 'F', 1, '22149', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pask', 'Ella', '378aa768-2e19-4339-a12b-8c9f43f7ede7', '13LH', NULL, NULL, 'F', 1, '14169', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Langford', 'Joe', '37b89a20-9be2-419a-8865-bc126948a752', '11WT', NULL, NULL, 'M', 1, '240454', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Huijsamer', 'Kaylin', '37d21781-6b7a-4ced-bef1-ee447051ab07', '12CH', NULL, NULL, 'F', 1, '19021', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bird', 'Matthew', '380fddf3-93b0-4745-b16a-a826c13c469f', '', NULL, NULL, 'M', 1, '139772223', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Haywood', 'Chloe', '3842fe68-124d-40ea-b78d-86a380bb3583', '12CH', NULL, NULL, 'F', 1, '20409', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gomez', 'Leo', '387c13c5-e856-4ef1-b637-af619be4c25c', '1r4', NULL, NULL, 'M', 1, '23217', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jansen', 'Hannah', '38cbdf3e-b9f6-4b89-9abd-f54519a092cf', '13FS', NULL, NULL, 'F', 1, '20067', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Goddard', 'Zoe', '39472f46-383c-4a49-943d-1d77de368b88', '8RS', NULL, NULL, 'F', 1, '16314', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ellis', 'Abbie', '394995cd-7daa-44c4-b98a-7827bf634603', '12ST', NULL, NULL, 'F', 1, '21050', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dodd', 'Alexandria', '394d9df7-fa25-4f7a-9edd-f85be09a1028', '13CI', NULL, NULL, 'F', 1, '33503154', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('de Belen', 'Mac', '398ad27b-a214-4257-81cf-0f0851cd232c', '12CH', NULL, NULL, 'M', 1, '19161', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Coulbeck', 'Levi', '39d95d7b-647c-4fd6-880a-5d6660a9bcad', '2r5', NULL, NULL, 'M', 1, '23226', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Davis', 'Micah', '39e7b3df-4133-4dc8-85ad-6786963d235a', '9MD', NULL, NULL, 'M', 1, '240043', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xie', 'Jason', '3a133870-89c2-4698-b8e2-3b98f750f6b4', '9FR', NULL, NULL, 'M', 1, '16218', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Gillies', 'Malachi', '3a5126bd-7e2d-462f-b10d-242e24fd52c4', '8RS', NULL, NULL, 'M', 1, '23418', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lu', 'Mia', '3a899b57-345e-451a-a00f-af353eaf8c34', '9BR', NULL, NULL, 'F', 1, '16233', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Mattiucci Schnack', 'Mia', '3acf6879-f80c-43b7-a97c-5abe2c618242', '12ST', NULL, NULL, 'F', 1, '240267', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Aldridge', 'Ben', '3ae3360e-32c4-4e83-8a4a-659ee20a73c4', '13SO', NULL, NULL, 'M', 1, '22160', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ryan', 'Leeann', '3ae39ba4-30b2-4df0-b5c0-1aa7fb124c11', '11WW', NULL, NULL, 'F', 1, '240136', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hatakeyama', 'Kazuki', '3b3a62cc-5062-4500-a5bf-5b4bce6a55c6', '11JM', NULL, NULL, 'M', 1, '240323', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cooper', 'Olivia', '3bc3e1ad-4d42-4f2e-ae3f-3a91bdc67184', '12LK', NULL, NULL, 'F', 1, '19456', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Weston', 'Kira', '3bdc06f0-caaa-4b20-bfbe-9b207d62ca7e', '9BR', NULL, NULL, 'F', 1, '22010', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Guirgis', 'Daniel', '3c278522-91e7-499f-873d-57692703174f', '12DE', NULL, NULL, 'M', 1, '33503176', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yeo Hui Ernn', 'Claire', '3c2b6958-6511-4b36-ac09-d89b66cef4a1', '10TL', NULL, NULL, 'F', 1, '23012', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Talafu', 'Jordan', '3c5e2117-c65a-4c1e-9920-a73eb318a9b3', '8RS', NULL, NULL, 'M', 1, '23040', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Milmine', 'Jessica', '3ce6d7ee-d5cd-4d55-970a-2b7b4a5021dc', '9BR', NULL, NULL, 'F', 1, '22063', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Williams', 'Toby', '3cf86574-5473-4c50-956a-c00a81c9e4b9', '12CG', NULL, NULL, 'M', 1, '19041', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Drauna', 'Simeli', '3d0ca847-ec7f-43f5-9532-056a80bf82ae', '10LE', NULL, NULL, 'M', 1, '22172', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Frazer', 'Isabella', '3d1cb83a-eedd-485b-bae9-f5c7dfe5a9a7', '8EL', NULL, NULL, 'F', 1, '21201', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Birse', 'Amira', '3d441edc-08dc-42d3-973f-e1d3b69dd0d0', '12AN', NULL, NULL, 'F', 1, '21017', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gerretsen', 'Rosie', '3d625edc-8dbc-49a1-9799-2fde7c695d35', '8RO', NULL, NULL, 'F', 1, '23129', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bi', 'Joylyn', '3d78f758-8e06-49d6-88ce-baf42788a5bc', '11MZ', NULL, NULL, 'F', 1, '22150', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Campbell', 'Ethan', '3e4e0908-fce4-4b7c-94e3-8033019c3470', '10LN', NULL, NULL, 'M', 1, '21029', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hosking', 'Matthew', '3e73a8af-bcba-49d1-a8da-f39acf57d53b', '13SO', NULL, NULL, 'M', 1, '22096', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Monk', 'Cohen', '3ebbe57a-938c-4592-b4b8-90de7643e8f2', '9SN', NULL, NULL, 'M', 1, '22061', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lee', 'John', '3f0057ec-9b05-4668-9a93-9ddbcc228608', '7PM', NULL, NULL, 'M', 1, '23451', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Profit', 'Maiyah', '3f28570e-c5e0-443c-8a0a-4852e3a46239', '8EL', NULL, NULL, 'F', 1, '23084', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('van Tuinen', 'Luisana', '3f4c77fe-9025-4459-9b2d-1269ec95003a', '9BR', NULL, NULL, 'F', 1, '240172', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Tasker', 'Nathan', '3f83339d-06fc-4456-ab67-1f8a23f0e67f', '12BT', NULL, NULL, 'M', 1, '33503155', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Ota', 'Kosumo', '3f8413ec-489c-4731-9c33-45d10bf5d4f7', '12AN', NULL, NULL, 'M', 1, '23568', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('McCluskey', 'Elric', '3fb737cb-2564-4bd9-b0ad-d02544d992ee', '13CI', NULL, NULL, 'M', 1, '22015', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Taylor', 'Jonty', '3fe542cf-3818-412a-9195-8f08f0715ebb', '13NL', NULL, NULL, 'M', 1, '18055', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Parr', 'Andrea', '3ff33eb6-908f-4be3-b9b2-736074653203', '12PA', NULL, NULL, 'F', 1, '19154', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Verd', 'Daniel', '3ff8e840-923d-44df-8329-8e0429d7df9e', '12CH', NULL, NULL, 'M', 1, '21156', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lee', 'Yani', '3fffce77-bae5-4b56-9870-b6b8adfcecf4', '13FS', NULL, NULL, 'M', 1, '23252', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Guirgis', 'Sam', '40267e2f-f091-43e9-a218-eab11d7e6cdc', '11JD', NULL, NULL, 'M', 1, '14237', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fa\'alogo', 'Josh', '40917cc8-c194-4ac6-aea6-6b0dfa2370ae', '8RO', NULL, NULL, 'M', 1, '16315', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Kevin', '409a477d-c664-411a-8827-c83981548b28', '12CG', NULL, NULL, 'M', 1, '20186', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Qiao', 'Sarah', '40d88fb5-94ac-4c66-9dac-eae3f4f1c1ff', '12JH', NULL, NULL, 'F', 1, '33503472', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Im', 'Kangbin', '40f73f9a-a1d5-4f42-aa1c-2c96cf01fed4', '9MD', NULL, NULL, 'M', 1, '240192', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Brown', 'Evie', '4108d054-da4b-4950-b58a-62cdc1ea20ef', '7FZ', NULL, NULL, 'F', 1, '21189', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mene-Vaele', 'Ropeta', '412e1839-335a-414d-a3e8-7836091e4825', '11JM', NULL, NULL, 'F', 1, '240111', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ho', 'Chloe', '412e38f8-2f37-4885-97f2-167bffd92275', '3r8', NULL, NULL, 'F', 1, '22315', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chin Poy', 'Judah', '413044b9-9925-4c63-aac9-5e8844a0ff20', '9BR', NULL, NULL, 'M', 1, '19196', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Schulze', 'Richard', '417a56b7-51a9-4c89-8090-e9016a2d5924', '12ST', NULL, NULL, 'M', 1, '23458', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cruz Croucher', 'Sebastian', '417c811a-695c-47cc-8a1b-f1ca18c050fb', '4r10', NULL, NULL, 'M', 1, '20215', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yu', 'Amelia', '418029b2-d264-4e6e-9e51-31248bcb32b2', '4r10', NULL, NULL, 'F', 1, '20267', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Lynch', 'Anna', '41a6362b-4357-40f1-807f-3c47c32cf450', '6r15', NULL, NULL, 'F', 1, '19186', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Li', 'Yannan', '41bc33ad-6ca5-4a2f-bc99-261902d18e60', 'Enrol', NULL, NULL, 'F', 1, '240329', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Savage', 'Isaac', '41d6fbde-ba94-11ee-aeb8-6eb957879d7f', '11JF', '11', NULL, NULL, 1, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', NULL, '2024-02-15 18:36:13'),
('Fostery', 'Eliza', '41d70494-ba94-11ee-aeb8-6eb957879d7f', '12NB', '12', NULL, NULL, 1, NULL, '5f6a486f-ae48-4755-be6c-0d86ef491f68', NULL, '2024-02-15 18:36:00'),
('Stewart', 'Finn', '41d73e55-15b4-41da-8962-f5fea6d635eb', '10TL', NULL, NULL, 'M', 1, '21143', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kim', 'Oliver', '422b84de-70b0-49e2-a31e-8ba8bbb80226', '9BR', NULL, NULL, 'M', 1, '15370', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Stavrou', 'Judah', '422df007-554b-4e51-b261-2f2b6e57ed7f', '11MZ', NULL, NULL, 'M', 1, '15194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lim', 'Joe', '4270ef41-d7ea-463f-b42a-d5def065c1a8', '10GO', NULL, NULL, 'M', 1, '21096', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lorgelly', 'Daniel', '42ab32f5-0c3b-4a40-a956-f94d3b59d991', '', NULL, NULL, 'M', 1, '139702075', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Woods', 'Nate', '42bb39c3-290f-4b1d-aad1-8ba70cf3765c', '12LK', NULL, NULL, 'M', 1, '23015', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Sibley', 'Bryce', '42c89caf-c3b9-4347-b2cf-c0306b5003f3', '13OG', NULL, NULL, 'M', 1, '20126', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Villaseca Chacon', 'Paz', '42e7389f-d850-4252-a355-b449aef88338', '8RS', NULL, NULL, 'F', 1, '23026', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('He', 'Alice', '43684dc8-29b8-4ba0-862e-2744f06c44d2', '8CL', NULL, NULL, 'F', 1, '23118', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Harema', 'Anika', '44166cf1-0bba-4762-b144-23e4a3eac648', '10LN', NULL, NULL, 'F', 1, '23124', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dos Santos Sanders', 'Salvador', '4449b3f0-114b-4de6-9336-31424d21d3d5', '7PM', NULL, NULL, 'M', 1, '240054', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Minso KDS', '444eca99-08db-4c6f-86fe-513b0ef60695', '9CN', NULL, NULL, 'F', 1, '240229', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Myatt', 'Bryce', '44ca35c4-7fbe-4433-ba66-8e24a7e8c370', '', NULL, NULL, 'M', 1, '139787097', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('McArthur-Pattinson', 'Max', '44e3bcb3-a173-4eb4-87a9-c590d2797575', '11MC', NULL, NULL, 'M', 1, '240108', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Kang', 'Seungjun', '45197cee-2b22-45cc-88c2-10a15eff0e7d', '8RS', NULL, NULL, 'M', 1, '23263', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Gnade', 'Daniela', '45ec8608-ee32-464f-bdd3-785f951e9813', '12BT', NULL, NULL, 'F', 1, '23543', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Goto', 'Elisha', '45f01d97-bd46-43a7-83c2-42ba0caa5e0a', '8RS', NULL, NULL, 'M', 1, '17277', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cleine-Beaman', 'Joe', '464d4c2c-9d15-40de-be2f-36dcf061dbac', '9CN', NULL, NULL, 'M', 1, '23145', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xie', 'Jasmine', '466e7b9a-bc23-4aa9-99a1-7952d5ee9df7', '1r4', NULL, NULL, 'F', 1, '23181', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('van der Colff', 'Jonty', '46ab90c6-3677-4c4b-98f2-ca81895f7481', '13KR', NULL, NULL, 'M', 1, '18059', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hoffman', 'Abby', '46c4a38a-a78f-476e-b311-b0fcae0313a1', '11WT', NULL, NULL, 'F', 1, '240075', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hikuroa', 'Tiaho Maia', '4714bbf7-8417-4d81-8c57-7ba30678e16b', '3r8', NULL, NULL, 'F', 1, '22314', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tinga', 'Antonia', '4728e7f5-bfae-4ff8-b56f-2384226e5cc3', '13FS', NULL, NULL, 'F', 1, '22024', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Cummins', 'Reuben', '47444e33-669c-49ea-a5e0-2b37de62c002', '12BT', NULL, NULL, 'M', 1, '33503502', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ellena', 'Rafael', '475e3c0e-5e9b-4d00-b913-78bc60755954', '4r10', NULL, NULL, 'M', 1, '22307', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gee', 'Katelyn', '47b370a7-f4c1-436d-8a20-0af71d3ac2bc', '13NL', NULL, NULL, 'F', 1, '20160', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McKay', 'Georgia', '47c7648e-07df-4f30-bf74-a1792d124053', '8EL', NULL, NULL, 'F', 1, '23081', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Caldwell', 'Ella', '47f1fa4d-cc71-467f-841b-d89c84ba3da8', '13NL', NULL, NULL, 'F', 1, '22143', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Manson', 'Grace', '4873d9b2-d5ee-4fa3-b985-ad5b43a9b2dd', '11HK', NULL, NULL, 'F', 1, '20087', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Du', 'Avery', '48a2a23a-3373-401a-a1d6-1bb2e6ca8cd5', '3r9', NULL, NULL, 'F', 1, '22305', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wu', 'Zihan', '48bef51c-bcdf-4a5f-a023-61bb1f16e660', '12AN', NULL, NULL, 'M', 1, '240356', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Lopez-Montofre', 'Elias', '49e83929-73a9-4867-8862-5366e958501f', '12ST', NULL, NULL, 'M', 1, '21097', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Chai', 'Gabriel', '4a27a1da-d9a6-41e0-8cbd-2c33528fbc58', '13KR', NULL, NULL, 'M', 1, '20025', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wang', 'Bella', '4a48dce1-9d16-45a7-91b3-ef7994bd78a3', '2r7', NULL, NULL, 'F', 1, '23185', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Fa\'alogo', 'Christian', '4a5df53b-c585-4fe9-b3ec-5115042ce9d1', '11MK', NULL, NULL, 'M', 1, '131380', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Waubke', 'Amelie Viktoria', '4b402fe4-dd6b-4bf5-aac2-1b3b30f29f2e', '13ME', NULL, NULL, 'F', 1, '23250', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Judkins', 'Joshua', '4b887167-29c2-47fe-9a81-fd42f71e42f4', '9SN', NULL, NULL, 'M', 1, '16229', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Griffith', 'Luke', '4baf1dfd-8d97-4a7f-95c1-906421ba5e0f', '9MD', NULL, NULL, 'M', 1, '22106', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Prima', 'Margaret', '4bf72894-d731-4903-a785-9d8672ea84bf', '13NL', NULL, NULL, 'F', 1, '20115', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cowan', 'Tiare', '4c07d898-5dc3-453c-a467-673a7598226b', '12CG', NULL, NULL, 'M', 1, '23144', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ellena', 'Eva', '4c175187-e0fd-4329-8313-bb1fb5143d85', '12BY', NULL, NULL, 'F', 1, '22170', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tang', 'Joshua', '4c41515a-e9a8-469d-8a74-fb24d6f5944d', '12CG', NULL, NULL, 'M', 1, '23038', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Mohi', 'Li\'oa', '4c45f8aa-6da3-4f84-acc4-abc306acf6c2', '10SC', NULL, NULL, 'M', 1, '23077', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Rodwell', 'Finley', '4c85f316-4653-4fa2-ab27-c2d7587ff9ed', '3r9', NULL, NULL, 'F', 1, '21228', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Rin', 'Natalie', '4cbf5674-726d-43ea-9669-754b126bbe0f', '5r12', NULL, NULL, 'F', 1, '20249', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ayers', 'Seb', '4d57275d-a1b3-448b-a894-8dfe4aa73744', '13NL', NULL, NULL, 'M', 1, '22156', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fu', 'Tongxi', '4d9f41e8-4956-4340-b933-209113f8bc8f', '11JM', NULL, NULL, 'F', 1, '20377', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Blom', 'Dylan', '4deec48e-c91d-48d8-bed1-9c373dfe8a0e', '11MZ', NULL, NULL, 'M', 1, '240020', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Griffith', 'Jordan', '4e15b9b0-7654-4d95-9c01-4739a9cca319', '11HM', NULL, NULL, 'F', 1, '20047', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('d\'Auvergne', 'Gabriella', '4e3aa092-8aba-492d-a072-8b47a032b73d', '11AL', NULL, NULL, 'F', 1, '20033', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Park', 'Lime', '4e41e368-40fc-4e86-bd5d-c46d78cd5710', '4r11', NULL, NULL, 'F', 1, '20245', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Turner', 'Alex', '4e5044a1-a49c-4a2f-b0a1-2aee1ca1fcad', '13SO', NULL, NULL, 'M', 1, '18057', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Roberts', 'Josh', '4e57a3a2-ea62-4994-87fc-dfb589ee3e97', '10LN', NULL, NULL, 'M', 1, '23053', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Azer', 'Veronica', '4e7d4ff5-4c2b-4999-b8dd-c8795f3a71cf', '9SN', NULL, NULL, 'F', 1, '22175', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lopez-Montofre', 'Isabella', '4e8ba06b-dfa1-4e03-9fb9-9a2234bf461c', '9ED', NULL, NULL, 'F', 1, '23094', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Poulsen', 'Ella', '4eb484ec-9373-4c80-ad68-5c9dd745325a', '9CN', NULL, NULL, 'F', 1, '22049', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Whitehead', 'Amy', '4eb77b51-dafd-410a-a107-aeee8a0e1793', '9SN', NULL, NULL, 'F', 1, '240177', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Li', 'Yichan', '4f0b64e3-e02e-427d-a324-aa10291cd4e9', '11MZ', NULL, NULL, 'F', 1, '23447', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lorgelly', 'Julian', '4f0b6733-a634-4803-b5ac-29330246076e', '11MK', NULL, NULL, 'M', 1, '240104', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Richardson', 'Luke', '4f16f618-1021-4b4d-884b-6669281eee44', '13OG', NULL, NULL, 'M', 1, '33502815', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Sutton', 'Emelia', '4f4a5785-053f-4345-a019-1b355c071fab', '7TW', NULL, NULL, 'F', 1, '240152', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Gilpin', 'Poppy', '4f556a72-89ff-478d-923a-a2fd271190f4', '13LH', NULL, NULL, 'F', 1, '18022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wallis', 'Asher', '4f84d564-2744-48e3-9d0e-37bf1fbbd01b', '7PM', NULL, NULL, 'M', 1, '17299', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Tian', 'Arthur', '4fbbd725-0f37-4267-9992-cfb3eea23b38', '11AL', NULL, NULL, 'M', 1, '240160', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Pomare', 'Micah', '4fc73705-ad93-4647-9eca-3cbe655f39f5', '12ST', NULL, NULL, 'M', 1, '33503208', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Pelotin', 'Charlotte', '4fd0f521-d324-496a-b726-490e51914f55', '8RS', NULL, NULL, 'F', 1, '17280', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Burnell', 'Alyssa', '500520da-df9e-4cf5-973c-22e6785d7a94', '8CL', NULL, NULL, 'F', 1, '23160', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tine Dourado', 'Lara', '5043ab25-3a43-40a6-bcc4-f47a459c41ee', '9MD', NULL, NULL, 'F', 1, '240162', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Milmine', 'Hannah', '50630aee-3aa8-48c2-81cb-a57af47dbc83', '9CN', NULL, NULL, 'F', 1, '22064', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Akinbo', 'Jade', '5099c5f2-f0b1-4f57-b418-2aec8c3f1862', '11MC', NULL, NULL, 'F', 1, '240007', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('King', 'Charlie', '50cfdb32-30c6-42f3-a635-1fac7d167247', '12JH', NULL, NULL, 'F', 1, '23103', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Mitchell', 'Edward', '50d2dec3-e9cc-4f97-aba4-7feaaca68af7', '2r5', NULL, NULL, 'M', 1, '23432', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Capill', 'Mariah', '5123a8a7-be4c-4bd3-af35-c8433e154775', '2r5', NULL, NULL, 'F', 1, '22292', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Phillips', 'Tim', '51325d34-f3bc-4cdd-ab76-7262a71804fc', '13LH', NULL, NULL, 'M', 1, '18045', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Marchand', 'Avi', '514ffebb-434d-4f37-b9b0-080f26e2680c', '9ED', NULL, NULL, 'F', 1, '15377', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Armstrong', 'Sol', '517c8b75-bae2-44e9-a0ca-df4f5026978c', '10SC', NULL, NULL, 'M', 1, '21004', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Clerkin', 'Erinn', '522d87c5-0d42-481a-bb66-ab301661322b', '12AN', NULL, NULL, 'F', 1, '19009', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shin', 'Isaac', '5255e4d6-28d1-42ba-9da3-986e794ac624', '12PA', NULL, NULL, 'M', 1, '18051', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Bal', 'Ranvir', '52e231d3-bb60-4567-8e32-2c1196fe49e2', '7PM', NULL, NULL, 'M', 1, '17298', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ennor', 'Mordecai', '52e6163f-f229-4379-af49-e5ade8512b72', '2r7', NULL, NULL, 'M', 1, '23221', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shen', 'Isabella', '53393a21-9ed7-46a1-ba1f-d682ab4e5fe8', '2r5', NULL, NULL, 'F', 1, '22334', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ballingall', 'Arden', '5346e80c-b956-44ab-9533-5187f9856925', '6r15', NULL, NULL, 'M', 1, '19211', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jones', 'Johnny', '535d2859-e142-4075-8225-bd254cb3041f', '10GO', NULL, NULL, 'M', 1, '23107', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hartstonge', 'Elysia', '53865949-320b-49a5-8336-050744da738a', '9FR', NULL, NULL, 'F', 1, '20223', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jaquiery', 'Christiana', '540da4e2-3b7c-4d7e-8ad3-eb89f247f318', '10LI', NULL, NULL, 'F', 1, '23496', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Silivale', 'Debbie', '5468456b-5b84-4ee8-9174-21033390ef84', '6r14', NULL, NULL, 'F', 1, '20252', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('McKellar', 'Rachel', '548de817-74e7-42df-8ad1-4af82a8daadc', '12AN', NULL, NULL, 'F', 1, '17313', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ta\'ala', 'Anzac', '54ad2fe9-b930-4724-94e8-4a584d07c875', '7FZ', NULL, NULL, 'M', 1, '21235', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Xu', 'Kay', '5500b790-27d7-465e-aa2c-1233f2d2e306', '3r9', NULL, NULL, 'F', 1, '21240', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Carter', 'Ava', '551ab020-a923-4ff5-a2fb-e0425294daa5', '10LI', NULL, NULL, 'F', 1, '23158', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ichihara', 'Soya', '55211a90-0d53-43a2-a97a-f7bf43780c9f', '11MK', NULL, NULL, 'M', 1, '23565', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Zheng', 'Matthew', '553039f1-3bee-4347-8efa-ab15e558c713', '10SC', NULL, NULL, 'M', 1, '21173', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Dhlakama', 'Anne', '558c105c-888e-43e6-8b49-5ffa96fbc69f', '4r11', NULL, NULL, 'F', 1, '23439', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wang', 'Lucas', '559572b5-46db-42fe-a69c-2ce8c67c8b2e', '1r4', NULL, NULL, 'M', 1, '23186', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wu', 'Daniel', '564b8ffc-58bd-45fc-b378-966daeb65008', '12DE', NULL, NULL, 'M', 1, '19042', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Aldridge', 'William', '568571f0-0305-4b9c-9c78-1da2175efe41', '11HM', NULL, NULL, 'M', 1, '240008', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ji', 'Jiale', '568878ad-e34e-4b58-910a-f4176dc05603', '12JH', NULL, NULL, 'M', 1, '23489', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pellizzari', 'Pedro', '5697a8c3-cd12-4547-b1a5-e8ee91c4b88c', '7FZ', NULL, NULL, 'M', 1, '240124', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Marshall', 'Navajo', '569e0f24-6030-4ae8-9878-b2156f832767', '13CI', NULL, NULL, 'M', 1, '22073', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Smith', 'Brooke', '56ab27bb-c6c9-493e-b42d-7e12ab7cbf58', '12LK', NULL, NULL, 'F', 1, '19413', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Baserga Slavik', 'Francesca', '56f03b67-4472-426c-b383-d4dc9005ea6f', '12LK', NULL, NULL, 'F', 1, '240273', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Buick', 'Emilie', '5706a683-a920-418a-ab3e-717f74dd8575', '12CG', NULL, NULL, 'F', 1, '240026', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lau', 'Rena', '57729d25-89f7-42f4-86e3-51990a969425', '6r14', NULL, NULL, 'F', 1, '22321', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Mein', 'Renee', '577f1c8a-45df-4aae-9770-e1670f865c72', '13ME', NULL, NULL, 'F', 1, '22067', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Davis', 'Eli', '57869713-c78d-4664-915c-c415937ae340', '13OG', NULL, NULL, 'M', 1, '22179', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wilson', 'Blake', '57889105-e920-47f2-b293-85448d9751da', '4r11', NULL, NULL, 'M', 1, '22343', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Denne', 'Andrew', '57e51d99-c5c2-460c-a644-708f48e07fc8', '13NL', NULL, NULL, 'M', 1, '22121', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Esther', '57f7e64e-1f85-444f-8a52-02bb070a9fed', '11WT', NULL, NULL, 'F', 1, '22084', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Yu', 'Dahel', '58112521-9ffe-46cd-b6dc-7aa00a5ecb27', '10LI', NULL, NULL, 'F', 1, '23008', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Malcolm', 'David', '58312411-5200-4ea1-a466-133db4b0506e', '11HM', NULL, NULL, 'M', 1, '131370', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Alcock', 'Nathan', '586e15d7-d654-4d61-86b4-aa7362035025', '13NL', NULL, NULL, 'M', 1, '22161', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lau', 'Alex', '58963f3a-3afc-49d1-93e4-7e0ae5f8915e', '12AN', NULL, NULL, 'M', 1, '23099', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Liu', 'Cecilia', '58a05c7e-b82e-4056-a5df-e85a10f80a1f', '10TL', NULL, NULL, 'F', 1, '23095', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Stuart', 'Luca', '58c2efc7-b3bb-4e68-a7a9-85b7ee6c6449', '7CO', NULL, NULL, 'M', 1, '20254', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Halliday', 'Nate', '58d1b540-1a9a-404a-b354-70447de5abb2', '13FS', NULL, NULL, 'M', 1, '33503149', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mattingley', 'James', '58e475bf-5cf7-4a24-a193-4c67c9f05419', '3r9', NULL, NULL, 'M', 1, '21221', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Hendry', 'Mia', '5900c600-91d0-4158-9ae6-9aa7e83b9092', '4r11', NULL, NULL, 'F', 1, '20226', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Rashbrook-Field', 'James', '5970a211-4e7b-4fe9-a658-560c85b91aeb', '13ME', NULL, NULL, 'M', 1, '18046', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Davis', 'Lilly', '59d3adbe-4f7b-4b2b-84b0-631523972579', '12ST', NULL, NULL, 'F', 1, '23141', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Posthuma', 'Austin', '59fe721c-7eab-46cc-add9-88bfda0b9c59', '9BR', NULL, NULL, 'M', 1, '22050', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Saunders', 'Hannah-Grace', '5a08bab3-2e93-4fa1-ba3d-96a7cf1a6a47', '5r13', NULL, NULL, 'F', 1, '19189', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kim', 'Sunwoo KDS', '5a48cf28-f1c5-4e7f-a0cf-bc0d5067fd36', '10LE', NULL, NULL, 'M', 1, '240244', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Maddala', 'Anusha', '5a6e2b64-310a-45d1-a586-99bb0b2c27f3', '11JD', NULL, NULL, 'F', 1, '17309', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Harnett', 'Louie', '5a77abd0-6542-4f56-bcf0-1cc159d3aac3', '8RS', NULL, NULL, 'M', 1, '23123', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Malcolm', 'Zoe', '5a82c4ec-e5e1-48e9-a157-bc7835435457', '8RO', NULL, NULL, 'F', 1, '17273', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Rechkunova', 'Nicole', '5a94ddb4-85c7-4e9d-b5cc-575b7c2f21a3', '11MK', NULL, NULL, 'F', 1, '240131', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Fenika', 'Kayla', '5b859941-bb75-469c-8491-3c2650a920a0', '13LH', NULL, NULL, 'F', 1, '18021', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yang', 'Aria', '5b89b222-8f7d-40aa-875a-9062095b6173', '7PM', NULL, NULL, 'F', 1, '18326', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Le Roux', 'Ben', '5bfad8fc-2ca4-401c-ad07-2e2d540f4c64', '12DE', NULL, NULL, 'M', 1, '23096', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Chindove', 'Tamuka', '5c16db30-a067-4333-aeda-bb07a927adc3', '11MC', NULL, NULL, 'M', 1, '14221', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cleave', 'Jayme', '5c3c5491-d602-409a-a194-74ff074810d0', '12CG', NULL, NULL, 'F', 1, '23146', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Omondiagbe', 'Joanna', '5c4e9199-43ab-48ed-9d5f-367b2bbb814c', '7TW', NULL, NULL, 'F', 1, '21336', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Morton', 'Polly', '5c5dd62f-aaa7-482e-8ecf-78eb21ddcf0c', '10LN', NULL, NULL, 'F', 1, '23074', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Siose', 'Hosea', '5ccdf833-1ba4-40bd-967a-33e3583d7751', '6r14', NULL, NULL, 'M', 1, '19235', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Overcomer', 'Rejoice', '5d356aa4-670d-4c2b-bff9-64162a1800bc', '13OG', NULL, NULL, 'F', 1, '22165', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Venter', 'Annabelle', '5d3870c2-42d1-4310-b90d-e8ab138fdde7', '8RS', NULL, NULL, 'F', 1, '23028', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hanzawa', 'Noa', '5d3960ff-909a-4575-85f1-87900b5bad1c', '10TL', NULL, NULL, 'F', 1, '240261', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Haselden', 'Aspen', '5d776e28-ccc3-47da-84a2-9f586be1217d', '13KR', NULL, NULL, 'F', 1, '15207', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Haultain', 'Boston', '5db5139f-aed0-449b-bd64-11171ec9dba3', '12BT', NULL, NULL, 'M', 1, '23119', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cooper', 'Alethia', '5dca2757-5a3b-4e2e-bf14-bbaf191f64c2', '10GO', NULL, NULL, 'F', 1, '18330', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McCrostie', 'Eve', '5dcf2894-6f91-4db7-8029-100481ebc344', '2r7', NULL, NULL, 'F', 1, '23200', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Joshua', 'Samuel', '5ddbdfd8-054e-4765-982c-44f383d47a32', '9ED', NULL, NULL, 'M', 1, '240084', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Han', 'YiZiXuan', '5e6178e4-cd9f-46e5-9858-61902f407e43', '7TW', NULL, NULL, 'M', 1, '18274', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tobing', 'Justin', '5e8bdbdd-f0db-4dcd-88c9-1a6cab144745', '8RO', NULL, NULL, 'M', 1, '23266', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lim', 'Ethan', '5e8c1c62-8578-4434-92e6-4165c04baafa', '1r4', NULL, NULL, 'M', 1, '23206', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Lester', 'Annabelle', '5e91060a-cfbe-4fbc-9d07-7ca751d26a78', '11MZ', NULL, NULL, 'F', 1, '20078', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Greig', 'Micah', '5ecd733e-d1ca-425d-bb40-6bb143b2aaba', '11HM', NULL, NULL, 'M', 1, '15193', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shyle', 'Ethan', '5ef4c1cc-d510-4bc1-bcb2-9c78d2bbb8cc', '9FR', NULL, NULL, 'M', 1, '23444', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Liu', 'Noah', '5f23d73f-dfce-4ed1-a717-d7bf016a5785', '13LH', NULL, NULL, 'M', 1, '33503156', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Jansen', 'Luke', '5f5702cb-66d0-43a3-a72c-c5b6a5c5eb77', '11HM', NULL, NULL, 'M', 1, '21082', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Buick', 'Eddy', '5ff96194-da11-4918-9709-0bb7b9bde0e8', '8RS', NULL, NULL, 'M', 1, '240025', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Stolzenberger', 'Hugh', '60029eff-014d-4bb0-9c68-acae556165f3', '', NULL, NULL, 'M', 1, '139704009', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Yorke', 'Saryah', '60170a3c-1cdd-4dd1-9fdb-1ef9a470a11b', '8EL', NULL, NULL, 'F', 1, '17267', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Munnings', 'Daniel', '601c4de9-7e7a-4585-9bb8-825a19652a68', '2r7', NULL, NULL, 'M', 1, '23197', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Mattingley', 'Abigail', '606edcea-c3e8-4189-82a6-dcf8ec634abe', '2r5', NULL, NULL, 'F', 1, '23201', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lester', 'Alana', '6098bd0f-6f50-41d6-a9d0-86e53dda3458', '', NULL, NULL, 'F', 1, '139754396', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('McKenzie', 'Skye', '60b329ef-f3be-4610-926c-d51833bd0c07', '8EL', NULL, NULL, 'F', 1, '17265', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Read', 'Theo', '60dca0be-59a5-4689-b532-37936e4b14bf', '12CH', NULL, NULL, 'M', 1, '16176', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Mohi', '\'Ana', '61810728-a8a1-4738-87fa-915a53f1e1f3', '12CH', NULL, NULL, 'F', 1, '21176', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Suarez', 'Zed', '61a418c9-df12-4c8f-9289-82e9e2ea8a59', '9ED', NULL, NULL, 'F', 1, '22029', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Spring', 'Theresa', '61b3c4d3-b728-4ee8-8fee-59ef4f5900ae', '11JD', NULL, NULL, 'F', 1, '22031', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Tobing', 'Jonathan', '61bb557b-db81-4b9b-89eb-86d6799c07b1', '5r12', NULL, NULL, 'M', 1, '23431', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Buckley', 'Rhys', '61ea8846-d013-414e-93c2-95fb26eded7e', '10LN', NULL, NULL, 'M', 1, '15261', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Steetskamp', 'Isabella', '61f21f65-27e3-451c-b39d-a04637f42cc8', '7PM', NULL, NULL, 'F', 1, '240147', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Anderson', 'Petra', '621d9a17-403d-4199-b253-aa1aa8833176', '13KR', NULL, NULL, 'F', 1, '19210', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gu', 'Gabby', '623c0f49-b866-4cd8-a456-234f1ebaf874', '12CG', NULL, NULL, 'F', 1, '33503469', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mun', 'Daniel', '62525562-0cc6-40c4-b18e-426fb4372b94', '11MZ', NULL, NULL, 'M', 1, '14199', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Jiang', 'Rachel', '6266ff3e-652b-45c5-bc06-0a6addb01520', '12CH', NULL, NULL, 'F', 1, '16181', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Donaldson', 'Jake', '62829565-dc7f-4ee9-b9da-ba55820d9b0a', '13FS', NULL, NULL, 'M', 1, '15208', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dodd', 'Anastasia', '629dd83b-da6d-4a33-8afc-a4c152630c94', '10LI', NULL, NULL, 'F', 1, '14544', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('d\'Auvergne', 'Zoe', '62b2a144-d273-480a-a5d5-ee8408c9f244', '11AL', NULL, NULL, 'F', 1, '20034', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Broekman', 'Lee', '62c30d45-9175-42b9-9151-cfcc8dd5ec72', '13KR', NULL, NULL, 'F', 1, '23162', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Montenegro', 'Kirby', '62c52a3d-1d85-431a-9b44-88867a7bed40', '13LH', NULL, NULL, 'M', 1, '17314', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Wong', 'Gabriel', '62d2008c-d188-43b2-9345-ec850184c693', '10GO', NULL, NULL, 'M', 1, '15222', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Lopez-Montofre', 'Antonia', '62d8de65-634b-4370-828f-3ef303b88ae3', '9FR', NULL, NULL, 'F', 1, '23093', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Drauna', 'Ratu', '632c88ab-1b19-4794-a6ad-f56ba0078a48', '3r9', NULL, NULL, 'M', 1, '23223', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chan', 'Elisabeth', '634632a7-19df-4d4b-8721-c076dddba077', '10GO', NULL, NULL, 'F', 1, '23154', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Foster', 'Saxon', '6348307c-22e8-47f3-963c-70cec109c219', '5r13', NULL, NULL, 'M', 1, '19218', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Daly', 'Jack', '634aa0ce-0563-46ff-8178-5d22ead4f15d', '12AN', NULL, NULL, 'M', 1, '21040', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Jua', '6391832a-21bf-4876-836c-644cd30cd681', '11JD', NULL, NULL, 'F', 1, '240088', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Faulkner', 'Charlie', '63a7706b-35d1-4d8f-acb3-50c1682d8563', '11WW', NULL, NULL, 'M', 1, '21055', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Zhou', 'Shichao', '63d1c3f0-38e6-459d-bff6-a8f8c751fa5e', '11AL', NULL, NULL, 'M', 1, '23553', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Yappa', 'Naomi', '63d548ef-7864-4060-ad17-22c9324cfb91', '12CH', NULL, NULL, 'F', 1, '23014', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Foster', 'Xavier', '63e87f17-8095-46ae-830a-cf94684066bb', '7PM', NULL, NULL, 'M', 1, '17300', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Thomson', 'Esther', '64388a14-4476-435f-8a0a-d4dba1330f71', '9SN', NULL, NULL, 'F', 1, '15303', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lim', 'Yulia', '645704ba-f319-41f1-a967-6a2f4ec3f843', '8CL', NULL, NULL, 'F', 1, '240100', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Surrey', 'Joseph', '64789626-83ee-4d27-a0c9-313e8736af13', '12LK', NULL, NULL, 'M', 1, '21148', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Zhen', 'Terry', '649d2d94-772a-44a6-a53a-15342fb2e24c', '12JH', NULL, NULL, 'M', 1, '19044', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Li', 'Tom', '64aae05d-d845-44ec-8903-7bef18c87cd6', '11MK', NULL, NULL, 'M', 1, '23178', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wang', 'Michael', '64bca9c4-8b50-45a4-8230-d8a1048d84b1', '8RO', NULL, NULL, 'M', 1, '23540', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('van Biljon', 'Pieter', '650c2424-cb14-447c-bd50-6bda75840278', '11MC', NULL, NULL, 'M', 1, '20139', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Redhead', 'Ella', '651b0a5b-a7cd-4bf3-b97b-059a74fa4737', '10SC', NULL, NULL, 'F', 1, '21121', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Wong', 'Ethan', '65589a75-444b-47e4-85fe-cb798f958bb0', '13FS', NULL, NULL, 'M', 1, '22008', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Lal', 'Aman', '65618d2d-42eb-4c04-a889-9c61a9e90f0a', '7FZ', NULL, NULL, 'M', 1, '17301', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Sheng', 'Levi', '65836339-336f-4fff-9a62-6ccbe6fce5db', '8RO', NULL, NULL, 'M', 1, '16239', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Smith', 'Luke', '65bbadb5-18d9-4aca-afdf-98db0adf2357', '6r15', NULL, NULL, 'M', 1, '22338', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Wells', 'Izaya', '65bd80cc-8341-4445-9c65-01970ed18f3d', '7PM', NULL, NULL, 'M', 1, '240175', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Haraguchi', 'Tomoha', '65e272bb-57dc-49de-a2fa-607ff7973fab', '11HM', NULL, NULL, 'F', 1, '240325', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Indrawan', 'Nicholas', '66072853-9f94-4022-a54d-451737aca416', '13FS', NULL, NULL, 'M', 1, '22092', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Seojin KDS', '66637305-d1ad-4dc6-be48-c3208435fd75', '9SN', NULL, NULL, 'F', 1, '240227', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Barker', 'Ava', '66973d82-2b57-443a-8941-44bb6bd3a562', '13SO', NULL, NULL, 'F', 1, '22155', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kennedy', 'Felicity', '671c0cd7-401e-4db6-8695-400203019924', '10SC', NULL, NULL, 'F', 1, '23105', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Couperus', 'Ephraim', '67545d5d-2a9c-4208-9f75-87a96f78fe7b', '9SN', NULL, NULL, 'M', 1, '15315', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Campbell', 'Brody', '67787b8f-7453-4545-ba5a-8453bcdc254d', '13SO', NULL, NULL, 'M', 1, '20022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Van Rooyen', 'Zack', '67b590aa-1fb6-4d80-aa2e-b8bcefc7a994', '13LH', NULL, NULL, 'M', 1, '18060', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Buckley', 'Sara', '67bf50db-d839-4985-a0fb-055545feaaa7', '11MZ', NULL, NULL, 'F', 1, '131337', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Te Hae', 'Evarn', '680627c5-8427-4169-be5f-ba258a4254fb', '12PA', NULL, NULL, 'M', 1, '23036', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Li', 'Jiayi', '6808cd8c-d7e1-47bf-b4fc-ba144e2ef5e3', '11JM', NULL, NULL, 'F', 1, '23536', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Posthuma', 'Ella', '684d1846-1efd-4e2d-bc0e-67a8d549e007', '2r5', NULL, NULL, 'F', 1, '23195', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Reynolds', 'Callie', '6850a97d-0313-4e8f-8ab1-0a6482e0c077', '12CG', NULL, NULL, 'F', 1, '21123', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Itofele', 'Remi', '68564781-94cc-42cb-aef7-c412c9a9ff04', 'Enrol', NULL, NULL, 'M', 1, '240295', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Trengrove', 'Oliver', '68acf41a-fcdb-4a22-aa71-c4707ce30893', '13LH', NULL, NULL, 'M', 1, '22022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Li', 'Xinyi', '68cef7b0-1156-43a0-97cb-6c61f3d413a2', '2r7', NULL, NULL, 'F', 1, '23448', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Ryde', 'Gabriel', '690a6955-8a89-4811-8a32-ba178d16b08d', '10LN', NULL, NULL, 'M', 1, '23050', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Qin', 'David', '69a7ea71-4f84-4911-a8ba-a2add931f9d7', '7TW', NULL, NULL, 'M', 1, '23560', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Yee', 'Kai Ying', '69c58f58-4b1d-4cf2-9a39-2135a2dbdf6a', '12AN', NULL, NULL, 'F', 1, '19165', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Walsh', 'Cheney', '69e1bdf2-e63a-4f02-a284-c81c7fa19dee', '7FZ', NULL, NULL, 'F', 1, '240173', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lee', 'Liam', '69e2a0de-e0e8-432b-bd5f-38e5cfc1fe63', '8RO', NULL, NULL, 'M', 1, '17263', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Hurren', 'Samuel', '6a312aaf-3942-4ed6-9d97-3eb00f906e05', '3r8', NULL, NULL, 'M', 1, '22317', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dirkze', 'Katherine', '6a369b36-2dce-4f0c-8b5c-d1df0f2de137', '2r7', NULL, NULL, 'F', 1, '22302', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Carswell', 'Liam', '6a3e4f6a-0a70-4d22-b86f-d8d65f0ee609', '11JM', NULL, NULL, 'M', 1, '240032', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Plew', 'Lara', '6a868137-41a1-478b-a096-6bc08a54c24e', '13KR', NULL, NULL, 'F', 1, '16215', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Yoon', 'Yeseung KDS', '6adbf0e6-ba81-434f-b6b7-bd43b9d9e5fa', '9BR', NULL, NULL, 'M', 1, '240258', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Wallace', 'Zac', '6ae18299-23ae-4b5f-bec4-8ec929e1ff88', '13SO', NULL, NULL, 'M', 1, '33502813', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Jin', 'John', '6af2c340-4ad6-490c-8e30-447ef89bd869', '10TL', NULL, NULL, 'M', 1, '23488', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dos Santos', 'Lily', '6b14b53f-4076-4f48-8efa-e5f1f9231489', '3r9', NULL, NULL, 'F', 1, '21195', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('van der Horst', 'Eva', '6b497dd9-0dd9-4123-b854-5e55d77c411f', '11JD', NULL, NULL, 'F', 1, '240169', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Festing', 'Joshua', '6b675432-74d0-4eae-90c7-3cb9bb78438b', '7CO', NULL, NULL, 'M', 1, '240063', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mam', 'Peter', '6bb347d5-228c-4e2a-8867-4337b6caaeca', '8CL', NULL, NULL, 'M', 1, '17258', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Clark', 'Isla', '6c2c42a1-eab8-4b8e-9e3b-d216eacad38f', '7FZ', NULL, NULL, 'F', 1, '23531', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Seojoon KDS', '6c427387-c60e-4360-823a-da742b633f6f', '9MD', NULL, NULL, 'M', 1, '240226', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Anderson', 'Liam', '6c7fb018-1704-4eb1-b6d2-6d8208d34c19', '8RO', NULL, NULL, 'M', 1, '23170', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mara', 'Yara', '6c98fc47-f2e6-4b6a-94f9-18b1d06b8607', '8RO', NULL, NULL, 'F', 1, '23086', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Clark', 'Paige', '6c9adb38-85a7-4b89-9530-db01259713d5', '10GO', NULL, NULL, 'F', 1, '23151', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ambundo', 'Lel', '6d1d3e5e-bc1f-468b-aa00-2e745028fb0e', '2r5', NULL, NULL, 'M', 1, '22284', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Asher', '6d20ec27-98df-4182-a194-63fd2f0912ed', '11JM', NULL, NULL, 'M', 1, '240003', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Gutsell', 'Olivia', '6d6c3588-dc3f-4d26-a0c0-bd2d8e0fe50a', '10LN', NULL, NULL, 'F', 1, '23126', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Collier', 'Millie', '6d7347b9-65e7-4928-a1cb-5e7234ef3deb', '11MK', NULL, NULL, 'F', 1, '20030', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Waretini', 'Lewis', '6d7ce16b-4488-4228-85f9-4cf6996d5d38', '10SC', NULL, NULL, 'M', 1, '21159', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Chan', 'Isaac', '6d89cb6e-3510-4cbd-a814-5891509fee1c', '13OG', NULL, NULL, 'M', 1, '20387', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Turnbull', 'Sophia', '6dc9ccef-6f5e-49d2-83f8-4cb2f4244e99', '11AL', NULL, NULL, 'F', 1, '22020', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Oelofse', 'Conner', '6dcf45db-e891-47b1-8949-5295cc03d38f', '13KR', NULL, NULL, 'M', 1, '22058', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Jack', 'Isobel', '6decf55a-afcf-44e2-a925-0ff0eec00972', '10LE', NULL, NULL, 'F', 1, '14254', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Stoddart', 'Sam', '6df6d958-22b6-4ea7-b68a-1e7cf25bae2e', '11HM', NULL, NULL, 'M', 1, '240148', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Clarke', 'Maddi', '6e607ebf-0678-493a-b503-dcb69c0e4c40', '9ED', NULL, NULL, 'F', 1, '19393', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Minty', 'Billy', '6e9d4a85-83f6-4163-90b8-231bb3b7f501', '4r10', NULL, NULL, 'M', 1, '20241', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ramirez', 'Audrey', '6eae877b-740e-43a7-8c27-df13c8c37ebd', '6r14', NULL, NULL, 'F', 1, '20246', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hardanava', 'Asia', '6f03c158-bff7-4ce7-97be-2fab63389c80', '10LI', NULL, NULL, 'F', 1, '16182', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Huang', 'Ally', '6f1cc168-a1da-4153-974e-11cd0ac07b0e', '9MD', NULL, NULL, 'F', 1, '15362', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Rodriguez Ravasi', 'Constantino', '6f665ae1-3bc4-4dd9-8703-2b62ccf766c5', '12ST', NULL, NULL, 'M', 1, '240215', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lu', 'Tracy', '6f68511c-16c9-41a5-808a-27e97143c224', '8RO', NULL, NULL, 'F', 1, '20437', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Adams', 'Hannah', '6f949f1b-3214-4c10-8207-cd8a70d00b05', '9ED', '10', NULL, 'F', 1, '240006', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-02-23 07:55:13'),
('Savage', 'Zane', '6fae3bd7-1398-48a2-a415-3abea1a609de', '7CO', NULL, NULL, 'M', 1, '240143', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cho', 'Joshua', '7029854f-39e6-4f37-947f-fe8a6214d30e', '6r14', NULL, NULL, 'M', 1, '18297', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Liu', 'Kyan', '703cb8de-68b2-4053-8849-15349467ffd2', '1r4', NULL, NULL, 'M', 1, '23205', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lee', 'Geunha KDS', '7067004f-029f-49b2-b23c-b0ebd61faf72', '9SN', NULL, NULL, 'M', 1, '240224', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Winder', 'Annabelle', '7071e23f-459f-48e0-acf5-62fbf4737de0', '', NULL, NULL, 'F', 1, '139799288', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Wong', 'Samuel', '70d1faba-d7ee-4b69-8d35-119223d1d60f', '8EL', NULL, NULL, 'M', 1, '16325', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Chitena', 'Ted', '70f0db1a-af61-4895-982c-053c986e4df8', '13SO', NULL, NULL, 'M', 1, '22134', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Duddy', 'Fleur', '71b0cdce-6886-4e32-95ed-5dc2f375b67c', '12BT', NULL, NULL, 'F', 1, '19012', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Park', 'Joy', '71b9872a-1951-45be-a177-67a66095fa13', '13CI', NULL, NULL, 'F', 1, '20110', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Sureerattanan', 'Chatnaphak', '72512d63-d21d-443e-ae8d-c54b4d4fdc84', '12DE', NULL, NULL, 'F', 1, '23550', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Edminstin', 'Lily', '725772b1-82eb-4ec3-96c6-aaf7c26543f4', '4r10', NULL, NULL, 'F', 1, '21198', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Binu', 'Kenus', '72a83c55-7b6e-4f4b-b399-feee5493ba21', '12AN', NULL, NULL, 'M', 1, '23164', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Brown', 'Zoe', '72deb974-d9b4-4392-aff8-e456aac8445d', '10SC', NULL, NULL, 'F', 1, '18288', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Son', 'Deborah', '72fd25fe-d961-469c-8ec8-99b89662032e', '6r15', NULL, NULL, 'F', 1, '18322', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Tau-Manuel', 'Jarrah', '7306bdd4-c5f9-461c-ad3f-d7fd81c37b9f', '13CI', NULL, NULL, 'F', 1, '18054', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wilson', 'Ashley', '73300d03-1a07-4c90-9fee-3e13f54fcb11', '9MD', NULL, NULL, 'F', 1, '15342', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Bal', 'Preet', '7362c092-0e50-428b-a5cb-f08e56cee7b1', '13SO', NULL, NULL, 'F', 1, '15199', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pheng', 'Sotheara', '7367ecf1-20f7-4aba-877c-c0477c8a61f5', '11HK', NULL, NULL, 'F', 1, '20112', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ngu', 'Cherry', '74579656-7b85-43dd-8b4c-179a8897bbe9', '9MD', NULL, NULL, 'F', 1, '15330', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Chikura', 'Tim', '7490ff8f-7687-4a48-b5e9-26df8d1ac40d', '13KR', NULL, NULL, 'M', 1, '22136', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Burnell', 'Tyler', '74b8155d-d197-44b9-9c10-58e54e395a08', '7FZ', NULL, NULL, 'M', 1, '240028', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McKenzie', 'Max', '750714a4-f8e9-4956-a34c-1f74f08a8f9e', '11WW', NULL, NULL, 'M', 1, '240109', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Goodall', 'Caitlin', '753c8337-fb4d-4943-8c8c-1c56605cc3ec', '2r5', NULL, NULL, 'F', 1, '22312', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Urata', 'Wataru', '756f90c9-c258-4894-b8fe-23bdfd32caf5', '11HK', NULL, NULL, 'M', 1, '23559', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lowe', 'Harry', '7586a7e5-7d6a-4eda-acfa-615c7f8436a0', '10LE', NULL, NULL, 'M', 1, '21098', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pijpker', 'Stephanie', '75944221-47b3-45a5-abf4-a7139f46c71c', '6r15', NULL, NULL, 'F', 1, '20442', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Irvine', 'John', '759cea45-c546-4970-a71e-f91bfc585cc0', '6r14', NULL, NULL, 'M', 1, '18307', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Jaebeom', '75c88d75-d034-4cf0-a85d-e9f156ba1cca', '6r15', NULL, NULL, 'M', 1, '23004', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Venter', 'Jacob', '75dd9590-52f7-4714-acaa-d8e9982d81f8', '2r5', NULL, NULL, 'M', 1, '23430', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lewis', 'Will', '75e7fe0b-1c56-413c-af5c-8ed2b0c4abbb', '12JH', NULL, NULL, 'M', 1, '14168', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Tyler', 'Sam', '75ff3020-d6b6-4990-b2b9-0035b694fe86', '13FS', NULL, NULL, 'M', 1, '22018', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Juguilon', 'Yassi', '761d9332-95ac-4085-b90d-bf03b379c093', '2r5', NULL, NULL, 'F', 1, '23213', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Chan', 'Lowanna', '768f14d6-99d9-402e-aac1-86ef443ef5a3', '11JD', NULL, NULL, 'F', 1, '22137', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Oh', 'Chaehyun KDS', '7697cdf3-b376-475b-9541-7ed968e7c495', '10LN', NULL, NULL, 'F', 1, '240254', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Hoffman', 'Julia', '76c63b5d-5e5a-4b89-a034-efbffc39a448', '12ST', NULL, NULL, 'F', 1, '16175', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sloane', 'Isabella', '770bbbe2-94e5-45e2-a95f-0a2992837df6', '12CH', NULL, NULL, 'F', 1, '21137', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Eskander', 'David', '77124d4f-44f0-4014-a0dd-3eac0b851db2', '12CG', NULL, NULL, 'M', 1, '21052', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gillies', 'Isaiah', '771b9bd0-5434-454b-96b3-bba3d9a84e0d', '12LVR', NULL, NULL, 'M', 1, '23417', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Stevenson', 'Noah', '77407b21-da76-4476-9bb4-e05856280c66', '4r10', NULL, NULL, 'M', 1, '23445', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Sato', 'Kana', '7761e390-6553-4757-8b58-2daa91490865', '10GO', NULL, NULL, 'F', 1, '240219', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lynch', 'Ruby', '7768b205-737b-441b-bc32-0ee1b39ca821', '7CO', NULL, NULL, 'F', 1, '19191', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Li', 'Peiyun', '7785f015-5c80-4664-afa3-cf33d32393b0', '13ME', NULL, NULL, 'F', 1, '23433', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Armstrong', 'Sophia', '7790c155-0ac9-4c52-990f-4d91ad111146', '9CN', NULL, NULL, 'F', 1, '240010', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Meecham', 'Tobias', '77b64b11-c8de-410e-a2ff-1508cf22ad20', '13CI', NULL, NULL, 'M', 1, '22068', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ha', 'Yerang KDS', '77cd656b-d5b0-4dd4-ad53-908b9271577f', '10LN', NULL, NULL, 'F', 1, '240239', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Romero', 'Gabbie', '77e75b9b-6a2e-4053-8ddc-c30cdb27223a', '8RS', NULL, NULL, 'F', 1, '16258', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ewing', 'Willow', '780b3ab1-017c-4c76-92c6-f44fa0da6ee9', '10LE', NULL, NULL, 'F', 1, '21053', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Duke', 'Tom', '784a9fe4-7f01-43cc-a70c-1797b34b5b0b', '9MD', NULL, NULL, 'M', 1, '15291', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Burgess', 'Samuel', '78681a7c-5e27-4c2d-9b37-33dbf19e34d3', '13ME', NULL, NULL, 'M', 1, '18015', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lui', 'Kimberly', '78759383-b748-4e20-b922-7d9d7ed80c82', '11WW', NULL, NULL, 'F', 1, '20082', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Walter', 'Ethan', '788d6827-af1e-4ad5-ad15-b6e962f5c73b', '13FS', NULL, NULL, 'M', 1, '22012', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Drummond', 'Arlo', '78a12559-465e-452c-b876-ec6b7ebecf4d', '3r8', NULL, NULL, 'M', 1, '21197', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Andrea', '78f6a708-f743-4e01-9aaa-4c578768fd01', '6r14', NULL, NULL, 'F', 1, '20230', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wasa', 'Zephath-Ahmed', '78f9a486-c0fb-46e6-b67c-db69ca4b3bf8', 'Enrol', NULL, NULL, 'M', 1, '240318', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Edwards', 'Gianeth', '7926b897-03cd-480c-999a-fc174172193f', '12BY', NULL, NULL, 'F', 1, '23134', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Norton', 'Lily', '795d2e2a-a1fa-4e3a-9372-9eca86476b87', '12AN', NULL, NULL, 'F', 1, '23067', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lim', 'Charlotte', '7989cf78-6d89-49a9-add5-ffa629fb0143', '11WT', NULL, NULL, 'F', 1, '240099', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Drake', 'Sophia', '79a15826-64cf-49f5-9713-a8abf2e50f59', '10SC', NULL, NULL, 'F', 1, '21047', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fa\'alogo', 'Madison', '79f42920-a54d-447d-863c-3ec7e53e3836', '2r5', NULL, NULL, 'F', 1, '23220', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tang', 'Yuchen', '7a635248-7312-4a68-bdcc-c1b7a4722046', '9SN', NULL, NULL, 'M', 1, '240001', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Antoun', 'Peter', '7a9ad9af-6969-413f-8aad-c9b2d8dd491f', '9BR', NULL, NULL, 'M', 1, '20207', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Suga', 'Honoka', '7aa62268-ccb1-4a4a-8907-c6830d355179', '12DE', NULL, NULL, 'F', 1, '240268', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hughes', 'Allie', '7b297c99-60e2-4a8c-87d2-e44113b4815c', '12CG', NULL, NULL, 'F', 1, '33503161', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Posthuma', 'Madeline', '7b62cad1-f373-46da-bd0c-ee315a6d116e', '7PM', NULL, NULL, 'F', 1, '240127', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Markham', 'Faye', '7bcc2aac-0829-416a-8013-f9d730ff958c', '10SC', NULL, NULL, 'F', 1, '23085', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Choi', 'Sihoo KDS', '7bd7f701-df52-4af5-a651-f95c05ba52d4', '10LE', NULL, NULL, 'M', 1, '240250', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Trotter', 'Eli', '7be4e3a5-884b-4a70-9327-b4965715b845', '12CH', NULL, NULL, 'M', 1, '23031', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Davis', 'Tessa', '7c0cd329-9f9c-468e-a947-0b121064d3f0', '12AN', NULL, NULL, 'F', 1, '23140', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shen', 'Ezra', '7c3d92d7-f971-43d2-abb9-d841af2f0c16', '5r12', NULL, NULL, 'M', 1, '20250', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Brand', 'Justin', '7c6d6f0f-1999-4da0-b24b-50e9c2abe753', '11AL', NULL, NULL, 'M', 1, '240021', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yu', 'Teresa', '7c96aad0-b1b5-4f58-a418-bc8046560ff6', '12CG', NULL, NULL, 'F', 1, '21181', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Ure', 'Samuel', '7caa20a8-404f-4762-8936-55150eb8792b', '7FZ', NULL, NULL, 'M', 1, '240168', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Siose', 'Hanalei', '7cb69551-27f6-4012-b170-11e44827691d', '10LE', NULL, NULL, 'F', 1, '14247', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ballinger', 'Cody', '7d0385f8-93f1-462f-9a71-3abbb1632ea3', '9FR', NULL, NULL, 'M', 1, '23166', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Smith', 'Alexis', '7d1c50bd-2cf4-4539-8aa3-285cad936f05', '3r9', NULL, NULL, 'F', 1, '22337', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Chua', 'Yojwan Gabriel', '7d5fed45-4088-4dfa-8d67-e4b687479b9c', '11MZ', NULL, NULL, 'M', 1, '240035', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Skilling', 'Izzy', '7d65b041-0fed-4bc8-9bf2-4953a0132fc7', '3r9', NULL, NULL, 'F', 1, '22336', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lopez-Montofre', 'Isaac', '7db2f801-099b-4571-9a00-b04d1683d11a', '11WW', NULL, NULL, 'M', 1, '22080', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Ju', 'Chanmin KDS', '7e45b9af-fb67-4ccd-8098-ba4eca62f6a2', '10LI', NULL, NULL, 'M', 1, '240237', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Jansen', 'Briarley', '7ead2edb-840b-4a5f-a6de-15ddc8b88dba', '12BY', NULL, NULL, 'F', 1, '21081', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Manning', 'Peyton', '7ed7f9bb-32b2-4aa4-9642-4492dee7cc35', '5r13', NULL, NULL, 'F', 1, '21219', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Brown', 'Esther', '7eee1e3a-d7e9-4564-8b0c-91bc9f4da91d', '5r12', NULL, NULL, 'F', 1, '21188', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sefo-McGregor', 'Daniel', '7f0b6816-e9d4-4424-961f-3e119109f3cc', '6r14', NULL, NULL, 'M', 1, '22332', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Endo', 'Kanoko', '7f1d98a3-29fc-433d-b0e2-72b4bf278e4d', '11MK', NULL, NULL, 'F', 1, '23349', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chacon Gonzalez', 'Matias', '7f69c9e8-4213-4198-b4d9-e8c515b052d0', '12ST', NULL, NULL, 'M', 1, '240034', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('de Lange', 'Laurika', '7f746944-c3fa-4321-8320-891dce60175c', '8RO', NULL, NULL, 'F', 1, '240047', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Henderson', 'Maiah', '7f948d74-cd2f-4c61-831d-4029c2a9faec', '13KR', NULL, NULL, 'F', 1, '18331', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Boonchu', 'Nicha', '801a31bf-5531-4559-ad24-817b34ff9331', '8EL', NULL, NULL, 'F', 1, '23485', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Schubach', 'Matthew', '8030df41-c6d0-4266-8887-47bbfa5e3b9b', '1r4', NULL, NULL, 'M', 1, '23534', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Thomson', 'Joel', '8040b1a7-450d-4e67-8976-146a42bab5fc', '13FS', NULL, NULL, 'M', 1, '15211', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hikuroa', 'Ihaia', '8097ae03-0e0a-4a3d-861e-1d2d3151c75c', '4r10', NULL, NULL, 'M', 1, '21209', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ha', 'Jeffrey', '80a1773e-b3c7-4ec4-b65b-4d18452c95a4', '13OG', NULL, NULL, 'M', 1, '22105', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kindsvater', 'Marc-Leon', '80a7cea8-ee48-4260-a530-bdb21bf28dc0', '7PM', NULL, NULL, 'M', 1, '240091', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Li', 'Aldrich', '80e34b9f-d754-40f9-8d3e-c2f22adb37d1', '6r15', NULL, NULL, 'M', 1, '18310', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Perry', 'Gabriel', '813011a2-6842-4104-8563-714505e1ca72', '3r9', NULL, NULL, 'M', 1, '22328', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Chung', 'Yujin KDS', '8154ff39-9e33-4c39-a37d-701eb55449f1', '10TL', NULL, NULL, 'M', 1, '240248', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wang', 'Chris', '815c866a-bc0b-4bb4-9f31-999bf0adb785', '8EL', NULL, NULL, 'M', 1, '23022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Tebbutt', 'Dylan', '81825320-5f9c-4828-bb02-898833ea8e97', '11WT', NULL, NULL, 'M', 1, '240159', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Pieterse', 'Ruben', '81879f4e-8cbf-43d6-91fe-59a70197e0e9', '7PM', NULL, NULL, 'M', 1, '240126', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Kench', 'Theo', '81dd1aa0-7796-4fd4-88e9-83d1863b647c', '3r9', NULL, NULL, 'M', 1, '22319', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wiegersma', 'Phoenix', '81e3ced1-32c3-4b03-ae72-cdabd89e248e', '7TW', NULL, NULL, 'M', 1, '20261', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Rodger', 'William', '81f2c765-96cc-443e-af52-499435437d41', '9ED', NULL, NULL, 'M', 1, '22040', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Morris', 'Sorayah', '82033b96-809e-43ec-b470-6c17ada3817d', '11JM', NULL, NULL, 'F', 1, '240115', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Au', 'Jordan', '8222a6bf-5a0b-40e0-91d0-7f6ca740c8ac', '2r7', NULL, NULL, 'M', 1, '23230', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Soper', 'Isabel', '822b7c42-f466-40bc-89d4-589a37b23da1', '13ME', NULL, NULL, 'F', 1, '18052', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Pope', 'Francesca', '82872bbb-0957-4805-b62f-eadc842a9274', '13OG', NULL, NULL, 'F', 1, '33503118', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cotter', 'Mackenzie', '82a424bc-c898-4ead-a1ba-8985018aa8f6', '9MD', NULL, NULL, 'F', 1, '15329', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jun', 'Esther', '82b961ec-b92a-48c8-a468-4a3a953240ec', '10LI', NULL, NULL, 'F', 1, '18287', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Scott', 'Jackson', '82d41074-3fe5-477a-a271-5b6c9eae5d25', '13FS', NULL, NULL, 'M', 1, '22036', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Loughnan', 'Arlie', '83a9931d-0bda-4bc5-a24b-c4b7aa605640', '11MZ', NULL, NULL, 'M', 1, '22078', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Haultain-Speight', 'Mischa', '83b70d47-b11d-4b11-b91e-083c46f5df15', '11MC', NULL, NULL, 'F', 1, '240073', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Young', 'Millie', '83c1b017-c9a0-4732-a7b6-95cff617030a', '12BY', NULL, NULL, 'F', 1, '23009', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Pratt', 'Jordie', '83f85647-e19d-48a2-8694-b9016713629a', '9FR', NULL, NULL, 'M', 1, '22048', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Shimizu', 'Kanna', '843e0a18-1d6b-45c9-bc24-b77734fb8de4', '10GO', NULL, NULL, 'F', 1, '240220', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Churton', 'Luke', '84e1e145-2873-4e72-8203-7b29d2b4512c', '9BR', NULL, NULL, 'M', 1, '22131', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hwang', 'Woosung KDS', '854e164c-2e60-494b-ab3b-49f46bd69203', '10LE', NULL, NULL, 'M', 1, '240242', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gamboa', 'Joisse Brient', '854e8a12-9ff8-4d76-9772-38d8313a1f79', '11JD', NULL, NULL, 'F', 1, '240068', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Manning', 'Jake', '855eb245-e120-44f6-a1fa-40afbc929a36', '12LK', NULL, NULL, 'M', 1, '23087', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wong', 'Gideon', '85627348-4976-4fd7-a964-a538e5288cc6', '12PA', NULL, NULL, 'M', 1, '33503207', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Baker', 'Chloe', '857043b2-37c9-476b-8769-0ef7aef17109', '13KR', NULL, NULL, 'F', 1, '20010', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Garratt', 'Lydia', '8601300c-5d4a-4b5f-b0be-d658dfc8b8b7', '12BT', NULL, NULL, 'F', 1, '14167', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Orr', 'Adelia', '861d555a-1365-4540-9eab-840893353d25', '9ED', NULL, NULL, 'F', 1, '22056', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Foster', 'Hazel', '86313dff-81ed-4314-b320-5ba5e6aaf9dc', '9CN', NULL, NULL, 'F', 1, '16234', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wilson', 'Carter', '8635e510-0512-461d-854f-ba1f4d52d508', '12LK', NULL, NULL, 'M', 1, '33503470', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Scott', 'Hannah', '86cc4b85-e0d2-4e75-b918-8c55bfd350c6', '13KR', NULL, NULL, 'F', 1, '18049', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Muroka', 'Takataro', '86cfda4d-867b-4969-bd3e-f08a7150213e', '12PA', NULL, NULL, 'M', 1, '23567', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lovell', 'Benjamin', '86dde939-8aaf-46f5-9371-16e87691cdc6', '10LE', NULL, NULL, 'M', 1, '23092', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Garratt', 'Peter', '86f998e8-df4a-4ebb-a4ca-8ffaf4f147dc', '8CL', NULL, NULL, 'M', 1, '16304', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Zhao', 'Nina', '87011f39-a5b6-42a4-80dd-6ff79f39e813', '10TL', NULL, NULL, 'F', 1, '22002', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Reynolds', 'Aiden', '871a2f4e-84b0-4fc5-8ad1-14065d0ba906', '9MD', NULL, NULL, 'M', 1, '240133', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kim', 'Hyeonwoo', '871e165d-8301-42cc-8ee0-e050eaef7474', '10LI', NULL, NULL, 'M', 1, '240197', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Millington', 'Ethan', '875cf91f-c023-487c-ad4a-2183dbb7ce30', '10GO', NULL, NULL, 'M', 1, '21106', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Drauna', 'Lucy', '8765b89e-d3c5-4e76-bf4b-3189de2beb7c', '11HM', NULL, NULL, 'F', 1, '22173', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yassa', 'John', '878c9e00-53c6-40fb-b4a3-40abb76c792b', '13CI', NULL, NULL, 'M', 1, '21054', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Shirota', 'Haru', '8796d2d8-0ba7-4962-9f5c-c035052a5836', '12CG', NULL, NULL, 'F', 1, '23005', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Mackey', 'Lily', '87e6857a-a9fb-44e3-8bb9-b33c03d580e5', '6r15', NULL, NULL, 'F', 1, '19230', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Hentschel', 'Matthew', '88170ef5-eece-4700-b37d-7774ebbc7bdd', '9MD', NULL, NULL, 'M', 1, '22100', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Rea', 'Joel', '881d8df6-a717-4df7-ad39-e72ad6d3c52f', '9FR', NULL, NULL, 'M', 1, '240130', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Choi', 'David', '882ffa96-a035-4757-9bb0-59320966679b', '10LI', NULL, NULL, 'M', 1, '23152', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tanaka', 'Nana', '885966c8-7bb9-4ec0-be76-699a0d078f76', '10TL', NULL, NULL, 'F', 1, '240265', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Harnett', 'Emily', '88c3a1b0-03bd-4449-8427-3351bcae2c2c', '11WT', NULL, NULL, 'F', 1, '20053', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Horn', 'Keziah', '88f32434-1382-4938-8ac3-c34f5f00253f', '10TL', NULL, NULL, 'F', 1, '21075', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Steve', '892cbf6d-4123-4bf2-a9eb-d980446b3681', '10LI', NULL, NULL, 'M', 1, '21093', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Broekman', 'Chariska', '89389c63-8a64-4adf-beac-2b80e0a6586a', '10LN', NULL, NULL, 'F', 1, '240022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Harty-Eugster', 'Coco', '8963fa72-e003-45db-baa7-14418fc42ccc', '12ST', NULL, NULL, 'F', 1, '23120', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'James', '89ed4801-66db-42f1-8987-aa68a3d4e450', '11HK', NULL, NULL, 'M', 1, '131350', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Scarrott', 'Joshua', '89f02bff-a186-439e-ba52-596546da15b9', '10LN', NULL, NULL, 'M', 1, '21130', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Smith', 'Mack', '89fe3568-63a7-4d83-81b1-87d081eab56c', '7FZ', NULL, NULL, 'M', 1, '18321', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('McCann', 'Katie', '8a4f2b04-a545-4066-9248-88b22958daae', '12ST', NULL, NULL, 'F', 1, '23082', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Kendrew', 'Lily', '8a5e17d6-0247-47fa-8711-38c4bb7fc264', '9BR', NULL, NULL, 'F', 1, '22085', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Chalmers', 'Gianna', '8a6be42e-5f7a-4e97-b554-228d736340e7', '10SC', NULL, NULL, 'F', 1, '21032', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wright', 'Joshua', '8aace6f0-e068-4897-9264-1758245f1c04', '11HM', NULL, NULL, 'M', 1, '240181', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Lee', 'Hyunjung KDS', '8ab85c41-dc59-45db-8c7a-4f782031a8e5', '9ED', NULL, NULL, 'F', 1, '240260', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wallis', 'Levi', '8ab8eed7-e107-4edf-b950-b619421cf7a9', '10TL', NULL, NULL, 'M', 1, '15223', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Bakker', 'Isobelle', '8ad6d5c0-0e4e-4736-8256-631c980822b1', '9BR', NULL, NULL, 'F', 1, '16251', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bower', 'Christopher', '8b173f39-3ad0-47d6-bbe1-33d1a7b03f79', '12BT', NULL, NULL, 'M', 1, '21020', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Li', 'Melva', '8b19e098-22dd-4c07-bbe9-78470a4ec9e2', '13ME', NULL, NULL, 'F', 1, '18033', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Jiang', 'Rochelle', '8b3e26d9-2f74-4220-84c4-dfcf190ffe3b', '8CL', NULL, NULL, 'F', 1, '16306', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kwon', 'Dawon KDS', '8bb5ab80-12c9-4d29-91f0-954e9d23afe1', '10SC', NULL, NULL, 'F', 1, '240241', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Hiramoto', 'Ayako', '8bd212ba-4826-4285-abc3-74d7d6b899d5', '12BT', NULL, NULL, 'F', 1, '23566', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ramirez', 'Maria', '8c0b326e-a27a-4bbc-853a-ef574b6fe4a4', '11HK', NULL, NULL, 'F', 1, '20117', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Gou', 'Cindy', '8c1a6127-9c2e-4920-b3c1-f747a560e2bb', '8EL', NULL, NULL, 'F', 1, '17260', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Drummond', 'Matthew', '8c2adf3d-885e-486c-ad5f-0ba549258b0f', '4r11', NULL, NULL, 'M', 1, '20218', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Smith', 'Jemma', '8c3e673b-513c-4c01-993f-f73b40ce0eb1', '10LI', NULL, NULL, 'F', 1, '23044', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Fukofuka', 'Santino', '8c6a7481-4496-4b9b-a171-fef82639b7e0', '12AN', NULL, NULL, 'M', 1, '23462', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Wensley', 'Michela', '8c9f3677-ff58-41da-abf8-78e87bae8a48', '12JH', NULL, NULL, 'F', 1, '21162', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Weeks', 'Jacqueline', '8d2dad90-bd0f-421e-9bf0-4eb72ebd7e2a', '12ST', NULL, NULL, 'F', 1, '23017', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Saparat', 'Theema', '8d5a5b09-717d-4af9-868c-a381d373361b', '11WT', NULL, NULL, 'M', 1, '240326', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lee', 'Donggeon', '8d8b10e3-6018-42ac-b916-b08b198e922e', '5r12', NULL, NULL, 'M', 1, '23003', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Anderson', 'Leila', '8da82f78-f8c1-4add-943f-44e6efef6603', '12JH', NULL, NULL, 'F', 1, '23171', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Plew', 'Karena', '8e07baca-75cb-404d-af69-35d27cf852ee', '11JD', NULL, NULL, 'F', 1, '16183', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Clancey', 'Ethan', '8e1f9e77-4d65-4e15-b59b-24308da07a18', '4r10', NULL, NULL, 'M', 1, '21249', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bisseker', 'Toby', '8e4afba3-3d47-473b-9f37-a3c086f78435', '6r14', NULL, NULL, 'M', 1, '19212', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wise', 'Elliot', '8e4fe3d6-4575-4f03-b637-42ae5ab3db0d', '11MK', NULL, NULL, 'M', 1, '240179', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Ye', 'Houxi', '8e5f4253-3f7b-48b0-8403-0dc49fdf14c8', '12DE', NULL, NULL, 'M', 1, '22383', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Joseph', 'Isla', '8f95dceb-84ff-4f1d-a763-034bc976e818', '12PA', NULL, NULL, 'F', 1, '19022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Li', 'Pumo', '8fd2d0ed-57fa-45ca-b3ee-406197e7d7e6', '2r7', NULL, NULL, 'M', 1, '23232', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Prince', 'Zach', '8fe585d5-059f-4413-81ec-a1b38aac284f', '12PA', NULL, NULL, 'M', 1, '19034', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Burford', 'Sam', '900e8db0-734a-411f-9292-396a13ccf8e8', '11WW', NULL, NULL, 'M', 1, '240027', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kay', 'Eden', '907f7aad-3586-412e-9cc8-cc3610707be0', '12JH', NULL, NULL, 'F', 1, '17312', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Docherty', 'Iona', '909e1c64-9ab6-46ca-9479-e84e25243f62', '11HK', NULL, NULL, 'F', 1, '21046', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Holliday', 'Katie', '90adc2d0-abb5-4f47-b34e-1934c9d2f923', '', NULL, NULL, 'F', 1, '139658539', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Hurren', 'William', '90bc67c2-7694-4d34-b365-6f8557fb9411', '7CO', NULL, NULL, 'M', 1, '18306', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Allison', 'Reid', '90d59314-87b1-47ea-8fb3-1679d29df877', '12BY', NULL, NULL, 'M', 1, '23173', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('France', 'Bennett', '90dcdb9d-fc49-4104-8a78-cd6829109f78', '2r5', NULL, NULL, 'F', 1, '23219', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McKenzie', 'Naomi', '90e48887-4836-4d8e-8940-654d7331de72', '2r7', NULL, NULL, 'F', 1, '23199', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ma', 'Daniel', '914066fd-e2fc-4d7a-8ab3-5e6c77a82a0f', '9BR', NULL, NULL, 'M', 1, '22167', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Payag', 'Rj', '917dcf83-fd18-46af-9e53-9cf613683ad8', '12BY', NULL, NULL, 'M', 1, '21117', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Takai', 'Hanna', '9193934d-e978-423d-92f5-ed408405e0ff', '11AL', NULL, NULL, 'F', 1, '240324', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Drake', 'Asher', '919ec106-ae4d-43b5-98ca-2c17bef22dd9', '5r12', NULL, NULL, 'M', 1, '23224', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Azer', 'Monica', '91c98109-3c79-4d95-8bd9-ca1d4e1c2df1', '8EL', NULL, NULL, 'F', 1, '23168', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cleaver', 'Charli', '91dcfff5-e257-4bbb-940d-d1568dd6c9af', '11MZ', NULL, NULL, 'F', 1, '19378', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jordan', 'Libby', '9216cee7-53fe-4485-a371-78691dca8ea7', '13CI', NULL, NULL, 'F', 1, '33503163', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Padiernos', 'Daniel', '9229baf1-bdbe-4494-9de6-8a826fd0734a', '7CO', NULL, NULL, 'M', 1, '17295', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Harvey', 'Hazel', '923d4423-8270-4664-982c-2ed955ffcebb', '13OG', NULL, NULL, 'F', 1, '20161', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Padiernos', 'David', '924abaa6-7d4b-41a6-b803-f19354e3f489', '9FR', NULL, NULL, 'M', 1, '16211', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Skilling', 'Maddie', '9287ac55-7150-4b7e-8bdc-b734200961fa', '4r10', NULL, NULL, 'F', 1, '20446', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Henderson', 'Brooke', '92ff7a18-b722-4248-a782-09f73dd7f156', '8RO', NULL, NULL, 'F', 1, '23116', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Nyamutswa', 'Muneni', '93162cbc-7933-4b77-adec-a8fba3fd6ac0', '1r3', NULL, NULL, 'M', 1, '22327', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Anderson', 'Aria', '9317f9f2-e6d2-41f5-b4ed-248bd8fbb0b1', '2r5', NULL, NULL, 'F', 1, '22285', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Urban', 'Aidan', '935312fa-94ef-4911-aa5c-19b75e5829a6', '12CH', NULL, NULL, 'M', 1, '19040', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Omondiagbe', 'Pascal', '93cd8507-aa5b-4eb4-8f1d-ff41b5180052', '10LE', NULL, NULL, 'M', 1, '14253', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lee', 'Minu', '93e64e1a-4a4c-4f90-8307-901c4ca4b1b3', '9FR', NULL, NULL, 'M', 1, '240095', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Trengrove', 'Mary', '93e8b4e5-20b1-4820-9852-7480ccb18bf3', '9CN', NULL, NULL, 'F', 1, '22021', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Bayford', 'Jaz', '93eef5fa-2cd7-49db-98c6-a71806248663', '13NL', NULL, NULL, 'F', 1, '22151', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Rodriguez', 'Mayten', '93f71055-4cd4-48eb-b66a-c16d4a0ffd14', '11WT', NULL, NULL, 'M', 1, '240134', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Judkins', 'Amber', '94169585-7eec-4e02-957c-8ee127e3d2f4', '10SC', NULL, NULL, 'F', 1, '15192', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Neyra', 'Marcus', '942ea2c8-4d95-4e51-bb8a-e488d5d90a8e', '8RO', NULL, NULL, 'M', 1, '23068', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Maniapoto', 'Calvary', '9444bea0-fa25-4520-8597-01cb8c0869b4', '9FR', NULL, NULL, 'M', 1, '240106', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('King', 'Maia', '9448f836-8f90-4072-8fb6-a09231a2e842', '1r4', NULL, NULL, 'F', 1, '23211', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pearson', 'Jireh', '94556c48-f69b-4c07-8d46-bc9a0e731614', '12BT', NULL, NULL, 'M', 1, '33503379', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Rao', 'Vedika', '947a7fb1-da60-4ac9-b4b7-cd69c7979718', '13FS', NULL, NULL, 'F', 1, '22043', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Currie-Cook', 'Josh', '94931191-1f13-4fc1-b9fc-fd6e87ae95c0', '13KR', NULL, NULL, 'M', 1, '22126', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Holliday', 'Jess', '94a5136e-39e8-4447-9bdb-62b107e84ab1', '13FS', NULL, NULL, 'F', 1, '22098', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wilson', 'Eden', '94ccc36f-c756-40a4-b322-a4a3a23ef7b0', '11HM', NULL, NULL, 'F', 1, '131373', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Roentgen', 'Jason', '94d18635-30c4-4da2-bf3f-ad68fd13d061', '7TW', NULL, NULL, 'M', 1, '17294', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Murray', 'Ryder', '94d1916a-8d6d-475e-b4e0-8d2dce7b17c1', '3r8', NULL, NULL, 'M', 1, '22326', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Anderson', 'Jay', '94e9e02b-2616-43c6-9885-440dc660b2be', '12DE', NULL, NULL, 'M', 1, '19209', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mam', 'Bill', '951ba893-2f28-41df-9ee7-beb32b201514', '1r4', NULL, NULL, 'M', 1, '23203', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Li', 'Grace', '952a7180-2f8c-4a9e-a31b-b42b8cdc8fea', '2r7', NULL, NULL, 'F', 1, '22322', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Laufiso', 'Jeremiah', '95435632-f649-438d-aa75-8c83377fd83a', '8RO', NULL, NULL, 'M', 1, '23098', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Donaldson', 'William', '95482691-a926-4010-a45e-2a8d28283e8c', '', NULL, NULL, 'M', 1, '139683731', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Molina', 'Anica', '955c7432-f5af-4c38-bebb-8379e9200338', '11MC', NULL, NULL, 'F', 1, '21109', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Anggawijaya', 'Nadya', '9570cf8a-bf99-4982-a60e-fcf8161c40af', '11JD', NULL, NULL, 'M', 1, '240009', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Naktuean', 'Keng', '95ae7760-8a16-4a79-8924-20fcb7ea3802', '12JH', NULL, NULL, 'M', 1, '23551', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Chiu', 'Julie', '96049e5d-52df-4549-ae25-9b8db2c97736', '12PA', NULL, NULL, 'F', 1, '13006', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Li', 'Jiangqi', '964ef545-ee8a-423b-b865-aa4157c75678', '10LI', NULL, NULL, 'F', 1, '23537', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Joseph', 'Deegan', '96652fdf-6542-421c-b485-afb76ce1bdf1', '9MD', NULL, NULL, 'M', 1, '19195', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Conner', 'Claire', '96915b98-0b03-420e-8ae2-808c1b8e5b20', '3r8', NULL, NULL, 'F', 1, '21191', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pope', 'Austen', '96a470f2-7e09-48ac-9eab-bf7ab129855b', '8CL', NULL, NULL, 'M', 1, '17271', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Sun', 'Yingnuo', '96c5405c-79a6-4dba-b523-6877e074954f', '7FZ', NULL, NULL, 'F', 1, '240150', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Liu', 'Elaine', '96dce3b8-6300-4e1d-82b8-00770c6a405d', '7CO', NULL, NULL, 'F', 1, '18311', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('McConnell', 'Ethan', '9710d3fe-aad4-4fd3-a453-6fdf9673ca6b', '10LN', NULL, NULL, 'M', 1, '14535', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Nguyen', 'Alisa', '9729787e-cc78-4130-9418-0b98738691d9', '11JM', NULL, NULL, 'F', 1, '240118', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Monk', 'Amara', '9749ed17-b42c-49a6-9989-1cda5d9c05e9', '5r13', NULL, NULL, 'F', 1, '22324', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Huang', 'Richard', '97619f4e-46ab-499d-937c-9fc4fab74455', '7TW', NULL, NULL, 'M', 1, '17283', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lu', 'Chloe', '97860af4-b55f-4a0c-b97f-a1756bbcd04f', '4r11', NULL, NULL, 'F', 1, '21215', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Sabey', 'Levi', '97ba4759-c64d-4f62-8180-2e1ca6ba10fa', '11WW', NULL, NULL, 'M', 1, '240138', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Mattingley', 'Samuel', '97cd0f02-c215-4983-898b-d86df5f077c5', '5r12', NULL, NULL, 'M', 1, '20238', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Robson', 'Zoe', '97d6e369-dad4-41f5-80ee-8be4f47de299', '5r12', NULL, NULL, 'F', 1, '19234', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cui', 'Jason', '97e579ae-5b1e-428a-ae08-4ffa962589fe', '8RO', NULL, NULL, 'M', 1, '23142', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yu', 'Joel', '97e97e8a-4d26-4997-b68a-6a8d0db3a73a', '12BY', NULL, NULL, 'M', 1, '21169', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Zhang', 'Ella', '9855e990-89fd-40ac-90b1-1a1124590e32', '13SO', NULL, NULL, 'F', 1, '20155', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Meecham', 'Lara', '987aff3b-aeff-4ec6-b8eb-a39633d81e86', '', NULL, NULL, 'F', 1, '139791736', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Gerber', 'Tristan', '9880e932-6a49-4f90-9a53-ee2384eefa1d', '11WT', NULL, NULL, 'M', 1, '21063', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dong', 'Zoe', '988d61bf-7978-490d-82ca-7b5b526a532d', '8CL', NULL, NULL, 'F', 1, '23138', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Prince', 'Christiana', '98bc6993-769d-4e5a-b483-4c9fea504fd5', '11MC', NULL, NULL, 'F', 1, '22044', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Klaassen', 'Alisha', '98f56e6a-0983-4595-bf91-d54f070f1fd9', '11WT', NULL, NULL, 'F', 1, '240093', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pellow', 'Sophie', '9928c9a6-f034-4212-8eb9-a2c7f405213b', '11AL', NULL, NULL, 'F', 1, '16174', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Arnswald', 'Johanne Emilie', '99a95767-7551-44c5-9b7f-4e3d95130023', '12AN', NULL, NULL, 'F', 1, '240194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yee', 'William', '99f3884d-bf0b-475b-aa1f-29511d01b64c', '8CL', NULL, NULL, 'M', 1, '23013', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Boag', 'Matthew', '9a327f46-e37f-4cdc-801f-b657e3bb1cac', '10SC', NULL, NULL, 'M', 1, '21019', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Edwards', 'Ezra', '9a4c3779-38c9-4515-ac62-3a78fad39279', '10GO', NULL, NULL, 'M', 1, '23133', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sankey', 'Poppy', '9a8af83d-081f-4a88-a5e5-35c578f9b4cf', '10LE', NULL, NULL, 'F', 1, '23049', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Galaz', 'Gadiel', '9b3984a7-b13d-47f7-bb85-00c7e1574b69', '7FZ', NULL, NULL, 'M', 1, '240067', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Choi', 'Caleb', '9b3d7620-f6fb-48c1-9169-c141bad1962f', '8EL', NULL, NULL, 'M', 1, '17268', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jensen', 'Jesse', '9b69c08a-220b-43de-83ee-679a44a04052', '2r7', NULL, NULL, 'M', 1, '22318', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Harris', 'Mackenzie', '9bb08461-85ca-4944-b1d4-19894b14dd01', '6r15', NULL, NULL, 'F', 1, '18304', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mulholland', 'Alex', '9bcda3d9-cc02-40a5-872c-0b52df54b724', '13CI', NULL, NULL, 'M', 1, '33502807', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Pellow', 'Samuel', '9c3fb206-0120-450d-a102-2986d5573236', '7TW', NULL, NULL, 'M', 1, '17285', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Campbell', 'Korbin', '9c78078d-c018-4c9a-aabd-67522adf6c9d', '12PA', NULL, NULL, 'M', 1, '21101', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wilson', 'Dominic', '9cc504fa-09ba-4b21-a90e-83d16db077a2', '2r5', NULL, NULL, 'M', 1, '22342', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Head', 'Milli', '9ccf52cf-efbf-4922-bf37-b8170b15bd30', '11MK', NULL, NULL, 'F', 1, '22102', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pattison', 'Annie', '9ceb26b9-625f-4a0d-b7b4-1bde1055b357', '11WT', NULL, NULL, 'F', 1, '22052', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Robinson', 'Nalanee', '9cfa47e4-1ad4-4579-838d-21056a1482a9', '11WW', NULL, NULL, 'F', 1, '22041', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kim', 'Jeongmin', '9d180421-ca23-4b83-9218-80ed55990dbd', '11WT', NULL, NULL, 'F', 1, '240004', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lammerding', 'Katelyn', '9d2bed3c-e59e-4d98-acd0-e38fae713651', '13LH', NULL, NULL, 'F', 1, '22082', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lester', 'Imogen', '9d3befba-a953-43e6-9e69-89e80179fae5', '13OG', NULL, NULL, 'F', 1, '18032', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Manning', 'Braxton', '9d735899-a497-4747-9b30-dc887b9aa578', '7PM', NULL, NULL, 'M', 1, '21217', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Yang', 'Timothy', '9da19cda-b9da-441f-be6c-b6e3a49df713', '11HK', NULL, NULL, 'M', 1, '20154', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Diggs', 'Liberty', '9dafefa9-a406-42d0-a31b-6d8d76a28997', '1r4', NULL, NULL, 'F', 1, '23225', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Penno', 'Thomas', '9dc95bbc-b04c-41bf-a7bc-ded0495f2a91', '12JH', NULL, NULL, 'M', 1, '19170', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Crocker', 'Elise', '9dd5d9cc-930a-4a16-8dc1-a92ace8d3a5b', '8RS', NULL, NULL, 'F', 1, '16270', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Manson', 'Sam', '9dd92d31-c6fe-469d-b85d-3226393a1c1e', '12JH', NULL, NULL, 'M', 1, '19026', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Zhang', 'Tiantian', '9ddf95e9-37f6-4d6c-a305-41f3dc53533d', '9SN', NULL, NULL, 'M', 1, '22003', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Tseng', 'Kaelan', '9e0805ff-2b60-48c5-abb8-d04fc34b76d3', '9SN', NULL, NULL, 'M', 1, '15316', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Ballingall', 'Rayana', '9e0ddc1a-3651-4c71-84f2-c0fb0190f9a5', '9CN', NULL, NULL, 'F', 1, '15343', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Roque Tine', 'Rony', '9e13cdbf-cb24-444a-b709-57ca670931ca', '7FZ', NULL, NULL, 'M', 1, '240135', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Brand', 'Kirsten', '9e258daf-9663-4145-b462-967f6a77ded1', '13OG', NULL, NULL, 'F', 1, '22145', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('O\'Connor', 'Mollie', '9e3f530a-7165-4a80-891e-6f77891c4693', '12DE', NULL, NULL, 'F', 1, '23066', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Andales', 'Shania', '9e55b55f-dd29-43b2-8025-4914e6b0d9cd', '8EL', NULL, NULL, 'F', 1, '23172', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ngu', 'Eunice', '9ea3faca-8c01-41fa-a058-9caa42bd8980', '11WT', NULL, NULL, 'F', 1, '22376', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Nishikawa', 'Sara', '9eb0b8d7-3541-4eb4-98b1-e1f389f3f53e', '11WW', NULL, NULL, 'F', 1, '240214', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Williams', 'Evelyn', '9ed4b0cb-0535-4ca6-9d54-3a1f526db8b0', '3r9', NULL, NULL, 'F', 1, '22341', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Docherty', 'Charlotte', '9f1fefb4-2dfe-45d1-86ed-51ae14a3975b', '11WT', NULL, NULL, 'F', 1, '21045', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tipple', 'Grace', '9f2ac648-eb7e-4646-950c-850d056e41d9', '12CH', NULL, NULL, 'F', 1, '23033', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Boyd Pettitt', 'Lecia', '9f33c494-95a5-4c3d-99de-9c304268689c', '6r15', NULL, NULL, 'F', 1, '19349', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mullen', 'Phoebe', '9f4abc79-e6ee-45b3-b758-44bd5d227c4e', '8RS', NULL, NULL, 'F', 1, '23073', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Capill', 'Asher', '9f898a7b-07e8-46b8-b1b9-623addf8d3ff', '4r11', NULL, NULL, 'M', 1, '22293', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cornish', 'Jasmine', '9fd48103-5348-4045-b64c-df238c3245a2', '4r10', NULL, NULL, 'F', 1, '21192', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Yejun KDS', 'a05e4ca5-7579-40a3-b004-f624e7ce9a9e', '9ED', NULL, NULL, 'M', 1, '240232', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Han', 'Sunkyu', 'a081f599-8931-4979-8e71-b24f66a9587a', '9MD', NULL, NULL, 'M', 1, '23425', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Choi', 'Aiden', 'a0876cdd-61ac-4ea5-802d-3d0572d18010', '9SN', NULL, NULL, 'M', 1, '22133', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lowe', 'Wilf', 'a092a0a2-ff97-4962-9dce-04f062a5a6b7', '8EL', NULL, NULL, 'M', 1, '23091', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Fyfe', 'Evander', 'a097c3fb-edfc-4634-ba81-bfa5037fec63', '1r4', NULL, NULL, 'M', 1, '23218', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jennings', 'Anja', 'a09b6c53-3a6c-4163-8602-9883439e3801', '7TW', NULL, NULL, 'F', 1, '19466', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Woohyeong KDS', 'a0c3e0da-0cab-4ce6-b4c4-c9aef44a238a', '10LE', NULL, NULL, 'M', 1, '240251', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Overcomer', 'Mercy', 'a11286f2-a6d0-428e-8652-123c81140b51', '11AL', NULL, NULL, 'F', 1, '22166', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Cooper', 'Phoebe', 'a12ed6c7-0185-450d-81f3-c3a6d6c8718f', '13CI', NULL, NULL, 'F', 1, '20032', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Schubach', 'Johnathan', 'a19ff255-e2ce-4b41-a077-0735f74c8bbb', '7PM', NULL, NULL, 'M', 1, '240145', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Spoelstra', 'Levi', 'a1ddd24a-3a5b-4ba9-8d88-9c1db2030efc', '13SO', NULL, NULL, 'M', 1, '18053', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Wu', 'Yanyiyi', 'a2136f4f-90fd-437e-a5ae-2a9f1eefd96e', '7CO', NULL, NULL, 'F', 1, '23556', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Dos Santos', 'Joshua', 'a231b561-149e-470e-9618-9161d4a5bf7d', '11MC', NULL, NULL, 'M', 1, '16171', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Smith', 'Lily', 'a232f8a9-a0e2-4f67-8ee1-ff6efd5df91a', '10SC', NULL, NULL, 'F', 1, '18289', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Van Der Horst', 'Elijah', 'a26e5bb5-8838-4ae6-9e87-c836ca2b9050', '13LH', NULL, NULL, 'M', 1, '22017', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wu', 'Tony', 'a2bd972f-b1f0-40e4-9fb3-c4b674b0ccab', '11HM', NULL, NULL, 'M', 1, '240182', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('You', 'Thomas', 'a2bf1b2b-835a-4d84-82f0-7db723d5d478', '7TW', NULL, NULL, 'M', 1, '240187', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Taane', 'Ebony', 'a2fd3603-843b-49db-a0b4-968fbc8d380f', '12LK', NULL, NULL, 'F', 1, '33503153', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Moe', 'Ayala', 'a32e346a-e9f8-4201-9925-f72afc703e42', '10LI', NULL, NULL, 'F', 1, '21108', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ling', 'Esther', 'a3387449-484a-4eee-b9e2-ece3fe205ead', '11MZ', NULL, NULL, 'F', 1, '131376', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Si', 'Zuriel', 'a3a3e5c1-c2e2-4757-8dd8-9dcf7a2ca129', '2r5', NULL, NULL, 'M', 1, '22335', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Juguilon', 'Krsnaji', 'a422dbad-4e37-415a-8069-09441b9bae57', '7PM', NULL, NULL, 'M', 1, '18277', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Tanagi', 'Keito', 'a42a8ac5-e958-4b47-8ad8-2ba84cd66429', '10LI', NULL, NULL, 'M', 1, '240208', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Garland', 'Amber', 'a4581268-4e76-40db-8958-addc3bce759c', '12LK', NULL, NULL, 'F', 1, '23131', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Newton', 'Max', 'a484e283-ee63-4cf9-b762-fd1246fc180d', '11HK', NULL, NULL, 'M', 1, '14200', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Chavani', 'Lorraine', 'a4877dc7-74cb-40ab-b04e-c3069917a3c7', '12AN', NULL, NULL, 'F', 1, '23153', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Millington', 'Jack', 'a48b516a-7b77-43f3-931f-c05e6f7e73ce', '11LVR', NULL, NULL, 'M', 1, '20240', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Mumford', 'Savanna', 'a4bfc6cd-5204-46e0-a21a-dd86580be45e', '13OG', NULL, NULL, 'F', 1, '20414', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Couperus', 'Israel', 'a4f54294-34df-4405-b67a-26230c8208c0', '7CO', NULL, NULL, 'M', 1, '17297', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yee', 'Kenneth', 'a505dc5b-bec4-4328-8b21-be5915457c32', '9CN', NULL, NULL, 'M', 1, '22163', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Gibbs', 'Georgia', 'a50a1afd-96b5-48e9-8bc8-d16dd7ba8ebc', '5r12', NULL, NULL, 'F', 1, '20182', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Taerim', 'a54988e2-f7ec-4dd1-9205-656d2ace944f', '6r14', NULL, NULL, 'F', 1, '18308', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Millington', 'Holly', 'a5983318-1161-4ca4-bf7e-e630be21921a', '13FS', NULL, NULL, 'F', 1, '20098', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Van der Merwe', 'Cydney', 'a59bbbe1-7751-4c5e-8d2f-5f9ac821cbec', '9SN', NULL, NULL, 'F', 1, '240170', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lawrence', 'Harper', 'a5b1dadc-a1c5-468a-947d-2c43b8c53b18', '4r10', NULL, NULL, 'F', 1, '23412', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Taveesak', 'Mio', 'a5f53b67-5a1b-4cf0-b741-557a1a286561', '11HK', NULL, NULL, 'F', 1, '22369', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Manahi', 'Jethro', 'a60ca855-131a-4ea2-be34-e8da88eb4f20', '12BT', NULL, NULL, 'M', 1, '23088', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Sandes', 'Joe', 'a61becb6-2a14-45bd-87ec-099d969fce7f', '11MZ', NULL, NULL, 'M', 1, '240141', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Li', 'Alfred', 'a6c7b610-891b-41fb-930c-c212399d497e', '5r13', NULL, NULL, 'M', 1, '19228', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wright', 'Anastasia', 'a6d5d0c1-4450-4a62-8296-304dd2cfdad4', '8RS', NULL, NULL, 'F', 1, '240180', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Dos Santos', 'Lucas', 'a6ee72d3-833c-4eba-bcfe-a22e7105917d', '3r8', NULL, NULL, 'M', 1, '21196', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ota', 'Hanaka', 'a7344fb0-9ba9-4d67-8128-c9c0bf6b46e1', '12LK', NULL, NULL, 'F', 1, '240217', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Yoon', 'Hyeok KDS', 'a7bc2ca6-76b7-4087-a9f8-ed2e1b7fcd85', '10TL', NULL, NULL, 'M', 1, '240243', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Podolian', 'Illia', 'a7ebb278-d8f6-49d2-abff-2b823204e25c', '11JD', NULL, NULL, 'M', 1, '20114', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Wiegersma', 'Levi', 'a82d4db1-ff4a-4b0a-9c64-242b47ae1c6c', '9SN', NULL, NULL, 'M', 1, '20439', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Croker', 'Caleb', 'a830883f-b3b1-4625-ad7d-d5a74604712f', '13NL', NULL, NULL, 'M', 1, '22127', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Andales', 'Kareem', 'a83d5c66-d957-43ac-bfa9-03e0b583d2bb', '11JD', NULL, NULL, 'M', 1, '22159', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Zheng', 'Yi', 'a88fc005-c476-4abe-8d1d-b3999e2fae9f', '12CG', NULL, NULL, 'F', 1, '21339', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Pijpker', 'Audrey', 'a8b6ea54-cc7f-4349-a35b-0ff1f121ae06', 'Enrol', NULL, NULL, 'F', 1, '240306', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Horn', 'Joshua', 'a8ea87d2-d115-44f6-9f12-191e64c0171f', '13OG', NULL, NULL, 'M', 1, '22097', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hendry', 'Aylah', 'a90a7596-aaa3-42cf-910d-7fa7eb755677', '1r4', NULL, NULL, 'F', 1, '23561', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Han', 'Yajing', 'a91b0596-569c-4359-b7f2-d48d47aae5d7', '12PA', NULL, NULL, 'F', 1, '240195', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Harvey', 'Molly', 'a9876ff2-3380-4ba3-8e3d-440547d37144', '11HM', NULL, NULL, 'F', 1, '20054', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Li', 'Alex', 'a9877995-4e1f-401f-89b6-7c55d0199ada', '11WT', NULL, NULL, 'M', 1, '240097', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Naruto', 'Momo', 'a9ae02bc-95b2-4acc-8943-cb11a716e2f6', '12ST', NULL, NULL, 'F', 1, '240213', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Bryan', 'Ambrose', 'a9c9a14a-1926-46c9-a993-83dc0fdd200c', '7FZ', NULL, NULL, 'M', 1, '240023', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Uhm', 'Daniel', 'a9d6e5e2-11f3-47dd-9493-5ea3ff300d33', '13CI', NULL, NULL, 'M', 1, '18058', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Son', 'Aiden', 'a9e5be13-ccb9-452d-babf-6da0c531252e', '3r8', NULL, NULL, 'M', 1, '21234', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Dowall', 'Maia', 'a9e98a0e-d45d-4d40-9969-adc4e2b9e116', '12LK', NULL, NULL, 'F', 1, '23137', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Annabelle', 'a9f9bd42-f17c-436d-9ab7-1b7f75fc662a', '12AN', NULL, NULL, 'F', 1, '240002', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Tilbury', 'Isaac', 'aa1daa88-5bde-4422-bda0-4494406a8dc6', '11MC', NULL, NULL, 'M', 1, '240161', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Do', 'Jiyoon KDS', 'aa1f76da-d8a4-42ac-b454-a1455d562ac9', '9FR', NULL, NULL, 'F', 1, '240230', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fujikawa', 'Haruto', 'aa4c98ed-135c-41d1-8c8c-f0e26f88f5cb', '12ST', NULL, NULL, 'M', 1, '23253', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Zhen', 'Alina', 'aa51cf43-ecb8-4774-997b-5564b046142d', '8EL', NULL, NULL, 'F', 1, '23007', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Bailey', 'Tori', 'aa56f1ce-1ace-4d5b-8335-daec9d70ef4d', '11HK', NULL, NULL, 'F', 1, '240013', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Quayle', 'Nathan', 'aac78969-bb98-4d0b-8975-0eabd95e18bc', '12JH', NULL, NULL, 'M', 1, '23058', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cui', 'Daniel', 'aac7cac1-7394-47b0-8651-4d5f46c842b8', '8RS', NULL, NULL, 'M', 1, '23143', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Peez', 'Katy', 'aae6818c-859f-4318-81a7-de99acb8ef66', '13ME', NULL, NULL, 'F', 1, '16195', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Tait', 'C-Jay', 'aaefc226-7187-4f07-9397-f91780f085c6', '11HK', NULL, NULL, 'M', 1, '23529', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lofredo', 'Andy', 'aafcd854-b583-43b2-abbf-249b51156818', '10LI', NULL, NULL, 'M', 1, '15286', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Ko', 'Phoebe', 'ab0abb5e-a0c5-4d0d-b385-36e4976e1dc6', '1r4', NULL, NULL, 'F', 1, '23210', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Li', 'Adela', 'ab358c2e-7d7a-4a5a-84f2-d284e43b4bda', '1r4', NULL, NULL, 'F', 1, '23207', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('van Nieff', 'Alina', 'ab395527-ee45-4ef0-b280-4b815b350270', '11JD', NULL, NULL, 'F', 1, '15195', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wallis', 'Maddie', 'ab472367-dd78-4167-bdab-c65043975731', '11HM', NULL, NULL, 'F', 1, '131369', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Kyung', 'Rian KDS', 'ab7057d1-0851-4074-a5dd-0ad66774ef5e', '9CN', NULL, NULL, 'F', 1, '240228', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Yao', 'Zehong', 'ac0e4df2-8c8f-4575-9f94-fa21aefdbd5a', '11JM', NULL, NULL, 'M', 1, '23415', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Reynolds', 'Mya', 'ac2e48e0-71e3-4008-89b3-2190c9a28540', '4r10', NULL, NULL, 'F', 1, '20248', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kim', 'Geonmin KDS', 'ac3b200c-8232-42f2-a93c-131d0f08a873', '9FR', NULL, NULL, 'M', 1, '240235', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pheng', 'Zoe', 'ac4da0e3-9725-404a-a92b-5e63a593d083', '8RO', NULL, NULL, 'F', 1, '23061', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Cooper', 'Isaac', 'ac8c9e4a-8001-4f24-971c-ca2ffc0e4bc9', '7TW', NULL, NULL, 'M', 1, '18280', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Su', 'Joseph', 'acc37cae-76fa-4e82-a2f2-b21c1778d330', '7TW', NULL, NULL, 'M', 1, '240149', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Siwan', 'Catherine', 'ad163036-733c-4e43-b1dd-85ffda86f6ae', '10LN', NULL, NULL, 'F', 1, '240146', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Sainsbury', 'Sophie', 'ad43fa97-e3ff-4230-8a27-f0fad9ebf8da', '12CH', NULL, NULL, 'F', 1, '33503415', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Campbell', 'Carla', 'ad616137-ccce-4eb0-8f4b-b7e9ec68000d', '13CI', NULL, NULL, 'F', 1, '22142', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Roy', 'ad836291-ec2b-42b5-8188-5ba69da75e8c', '8EL', NULL, NULL, 'M', 1, '20231', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Phillips', 'Levi', 'ad90db5e-e7e3-4baf-94da-f7d61acddbbd', '', NULL, NULL, 'M', 1, '139136430', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Nguyen', 'Vy', 'adbf0b64-c742-4e19-bf1e-40391d208469', '13SO', NULL, NULL, 'F', 1, '22365', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Tang', 'Priscilla', 'ae27cded-ee93-4e02-8857-c2d9d407bc8a', '2r7', NULL, NULL, 'F', 1, '23187', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Boaru', 'Estera-Daniela', 'ae5bde55-d95b-4d20-828b-adf6f4934034', '10LN', NULL, NULL, 'F', 1, '19203', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Clark', 'Beau', 'ae60382e-f7de-4623-9a52-d295054fec14', '3r9', NULL, NULL, 'M', 1, '23530', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kapa', 'Hamuera', 'ae87834e-8fda-4bc8-b29f-ad06ed77db84', '12CH', NULL, NULL, 'M', 1, '23261', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Shyle', 'Ernst', 'ae89a2ee-5412-4cc1-b3f1-07298286dba7', '9MD', NULL, NULL, 'M', 1, '23443', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Muchena', 'Hannah', 'aeb9cb03-7503-4414-adcf-ba6a890930a0', '13LH', NULL, NULL, 'F', 1, '20102', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Conner', 'Larissa', 'af0f42b3-bbd6-4e30-8e97-a759c0099cce', '12DE', NULL, NULL, 'F', 1, '131328', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Parker', 'Lois', 'af22e230-e989-46c3-b905-9246d3a12ce7', '13OG', NULL, NULL, 'F', 1, '22054', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Gerretsen', 'Josh', 'af42ca33-468f-448c-b70c-ac9b2b718010', '10TL', NULL, NULL, 'M', 1, '21064', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hutchinson', 'Payton', 'af869109-a80e-48ea-93a8-a772a983aab2', '9FR', NULL, NULL, 'F', 1, '22094', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lubbers', 'Olie', 'afd0102d-2f35-4e54-ba06-8ce602d9e03e', '12PA', NULL, NULL, 'M', 1, '23090', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Morrison', 'Isabella', 'b003e2dd-5f59-4c31-8d05-144b26e936ff', '9SN', NULL, NULL, 'F', 1, '23503', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Si', 'Zechariah', 'b05367ae-7de6-4dde-a4fb-bdea3f34c229', '6r14', NULL, NULL, 'M', 1, '18320', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ramsay', 'Sloane', 'b0883c27-62e4-44f8-95d3-4de5e87e3f84', '9FR', NULL, NULL, 'F', 1, '15357', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Botherway', 'Preston', 'b0a6b447-9083-4013-9e34-5ea33a3b8aa1', '10GO', NULL, NULL, 'M', 1, '23410', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Yoonseo KDS', 'b0c862ac-4bda-4088-af12-cae7a3834623', '9MD', NULL, NULL, 'F', 1, '240221', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Ford', 'Emma', 'b0fc7b9f-06a7-4aa7-bb14-5dbe0d4bd5d8', '11WW', NULL, NULL, 'F', 1, '240066', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Sabey', 'Micah', 'b104d61a-3e2b-41e0-8f40-ae7965baffa6', '7PM', NULL, NULL, 'M', 1, '240139', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Taylor', 'Nathan', 'b10bd123-7d26-4a6f-9829-d30c0cdfb6be', '11JM', NULL, NULL, 'M', 1, '240157', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Giaccio', 'Constanza', 'b13e46f8-950f-4210-b222-97be895162ba', '12BT', NULL, NULL, 'F', 1, '240272', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cherry', 'Paige', 'b17967e9-c6a7-4278-8857-56e80492b15e', '11MZ', NULL, NULL, 'F', 1, '21033', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Song', 'Haram', 'b1892e64-2c33-4476-80cb-f0fade3dcf0d', '8RS', NULL, NULL, 'M', 1, '19193', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Woodfield', 'Nadia', 'b1a6cdd4-e8c2-461f-99f3-cb8af9de66df', '13CI', NULL, NULL, 'F', 1, '22007', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Varghese', 'Afrema', 'b1b385e6-56b5-480b-b963-9623b858c579', '11HK', NULL, NULL, 'F', 1, '20143', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Dreadon', 'Aubrey', 'b1d65c0a-dd10-4a3e-b693-6e2e9741ee8d', '2r5', NULL, NULL, 'F', 1, '22304', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Geng', 'Lucy', 'b1eb72a8-8252-4aae-82f5-709ec54fe931', '7FZ', NULL, NULL, 'F', 1, '240069', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Qiao', 'Lucas', 'b208b3de-fc07-4fc7-ba42-983808ae33d1', '5r13', NULL, NULL, 'M', 1, '19233', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Hastie Falkiner', 'Cristina', 'b235e45a-f601-4358-aba7-651d5ab8774d', '11MK', NULL, NULL, 'F', 1, '240072', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Arrambide', 'Josias', 'b2745e9d-2d22-4e82-96a6-f9aec5f57d97', '11WT', NULL, NULL, 'M', 1, '240011', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gilroy', 'Zara', 'b27c3d63-00ba-46e9-ba2b-bdbcfd6d51e2', '13SO', NULL, NULL, 'F', 1, '18023', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Clarke', 'Harrison', 'b2983eb6-7f14-439f-a616-05951e9ce9f1', '12JH', NULL, NULL, 'M', 1, '23150', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Muza', 'Levi', 'b2dec083-c0ec-4c9a-a416-28525947faa9', '8CL', NULL, NULL, 'M', 1, '17274', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Jensen', 'Ellie', 'b3257e27-db12-4e0b-b9e3-8559c69d66d8', '5r12', NULL, NULL, 'F', 1, '19225', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cho', 'Emily', 'b33ad58c-f017-4251-90b1-c721c1c88f09', '13NL', NULL, NULL, 'F', 1, '23254', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shiferaw', 'Alem', 'b351035b-22e1-4bb2-8237-652b499a2d3f', '13OG', NULL, NULL, 'M', 1, '22034', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lui', 'Kayla', 'b360d6d7-327d-4dce-b00f-723db71af06c', '9CN', NULL, NULL, 'F', 1, '22076', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Cornish', 'India', 'b369e7ef-2f98-430d-a70f-175bc5cace0d', 'Enrol', NULL, NULL, 'F', 1, '240285', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Palmer', 'Lauren', 'b3b55457-7ae0-43fe-a991-adf56511bca7', '13KR', NULL, NULL, 'F', 1, '22164', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Trethowan', 'Addison', 'b3dd611b-71f1-4c7c-9e2a-e1fb75d88f67', 'Enrol', NULL, NULL, 'F', 1, '240313', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Joseph', 'Lily', 'b3ec995b-16fb-47bd-b947-fd66616587ad', '13NL', NULL, NULL, 'F', 1, '18029', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pulin', 'Dany', 'b3fcc1e4-7d8c-4ee3-891a-199e5f6b1570', '11MC', NULL, NULL, 'M', 1, '240129', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Clements', 'Heidi', 'b44d3246-6e51-4cec-8866-7f462740dbbb', '13ME', NULL, NULL, 'F', 1, '22130', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Johnston', 'Hugh', 'b45fb908-4234-48bf-8b8b-2ec59f36b9a2', '13ME', NULL, NULL, 'M', 1, '18028', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tuiloma', 'Sakalia', 'b4642b79-881d-4bf0-9a97-bd236b9ecb2a', '13LH', NULL, NULL, 'M', 1, '22090', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wang', 'Soaring', 'b46b24b0-fda2-4134-9e50-9b2ec1d08f19', '12CG', NULL, NULL, 'M', 1, '22371', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Stuart', 'Skyler', 'b48a0143-5ad6-4c6d-a976-a730c138b32c', '5r12', NULL, NULL, 'M', 1, '19239', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kong', 'Mark', 'b4d175e5-dcd7-4980-b533-fca37fa575b4', '7PM', NULL, NULL, 'M', 1, '240458', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Bowater', 'Zaiah', 'b50707b7-763d-4904-a79b-5872df593ce2', '5r12', NULL, NULL, 'M', 1, '19213', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Moraes', 'Giulia', 'b52a6b7e-1f1b-45c2-8adb-3b12941a43d5', '11JM', NULL, NULL, 'F', 1, '240114', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('de Nysschen', 'Elmar', 'b52aee9d-ffa9-4efc-accb-b936c62d16e3', '12JH', NULL, NULL, 'M', 1, '23446', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tau', 'Kupa', 'b5320cff-c810-4b8c-b24b-db49f280df77', '8EL', NULL, NULL, 'M', 1, '23037', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Tse', 'Zaneta', 'b53cd66f-8420-4630-ad8b-bf1e80628df3', '12DE', NULL, NULL, 'F', 1, '240164', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Gerber', 'Keegan', 'b54a5898-32ed-4663-9207-f776e2034b13', '10GO', NULL, NULL, 'M', 1, '21062', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mwedzo', 'Ryan', 'b595dba9-254b-40e3-a378-61936923b5db', '12CH', NULL, NULL, 'M', 1, '23071', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Renner', 'James', 'b641ee70-2518-483c-9437-958dbc1dfc94', '12BY', NULL, NULL, 'M', 1, '16186', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Tuala', 'Samuel', 'b6a4c4f4-651c-419b-bda6-7061bb580154', '12DE', NULL, NULL, 'M', 1, '23030', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Parsons', 'Zach', 'b6ab60c2-f8b4-42a8-9ac4-eb9ca0368eac', '13SO', NULL, NULL, 'M', 1, '22053', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Robson', 'Tom', 'b6ec36d9-22e0-42b4-be13-0c4568021c6a', '10LE', NULL, NULL, 'M', 1, '23052', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Barb', 'Emmy', 'b70b492b-3329-4731-941d-e753e9bcf047', '3r9', NULL, NULL, 'F', 1, '22286', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Romero', 'Kianna', 'b7121af1-0e55-4d3e-afb7-6fd2295e99de', '13LH', NULL, NULL, 'F', 1, '33503400', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Blewett', 'Marica', 'b7fb42f9-1d9a-4e76-a337-05fd0ff7d824', '9ED', NULL, NULL, 'F', 1, '22148', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Parker', 'Nathan', 'b7ffa6e8-1351-472e-8507-603e5efafdb1', '11MZ', NULL, NULL, 'M', 1, '240122', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Penno', 'Lucy', 'b8231ddc-bd95-4e35-ae3e-0ef01674aa74', '10TL', NULL, NULL, 'F', 1, '19199', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Capill', 'Caleb', 'b82764c6-195f-4e56-a078-07c9f437283b', '10SC', NULL, NULL, 'M', 1, '22140', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hayes', 'Ruth', 'b853aa7c-c93c-4bf7-ab36-bfd7b475e25d', '7FZ', NULL, NULL, 'F', 1, '17278', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jennings', 'Regan-Grace', 'b87a5e4d-5cdd-479b-b6e8-df9e762207ac', '4r11', NULL, NULL, 'F', 1, '21211', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lim', 'Jeremy', 'b8ba4215-8671-4e3a-b6da-c5b48e5285fc', '5r12', NULL, NULL, 'M', 1, '19229', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Chalmers', 'Maddison', 'b8c6fd9a-cf66-472a-8486-d89c3a49d7f0', '12BY', NULL, NULL, 'F', 1, '19007', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wilkinson', 'Eva', 'b8df53d0-fde7-43df-b736-cdf221aa664a', '11MK', NULL, NULL, 'F', 1, '240178', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Milmine', 'Liam', 'b8e101ec-eb41-403f-8086-d39adfb8f0bc', '11AL', NULL, NULL, 'M', 1, '22065', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Li Zlotkowska', 'Ivy', 'b9681286-3caf-445b-ab58-58c1cbb362f5', '11JD', NULL, NULL, 'F', 1, '240098', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Brooks', 'Adi', 'b9b148b0-8605-4ed2-bfca-2a8853f57859', '8CL', NULL, NULL, 'F', 1, '23161', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Uy', 'Bryan', 'b9e84b2f-a7e3-485f-a712-1b5ede233a2a', '6r14', NULL, NULL, 'M', 1, '18325', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Garratt', 'Hudson', 'ba33d5c7-598b-432b-b254-ae549610660c', '11JD', NULL, NULL, 'M', 1, '14196', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Van Kekem', 'Annabelle', 'ba55c871-7f05-4474-a0b3-a981655ce287', '13KR', NULL, NULL, 'F', 1, '20172', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Huang', 'Maddison', 'ba7d74be-c23e-4911-9992-0facaa362db8', '4r10', NULL, NULL, 'F', 1, '20227', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Geldard', 'Adelaide', 'babf0ced-0c87-45b1-8813-59bc57f73d8f', '12JH', NULL, NULL, 'F', 1, '19014', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Nadarajah', 'Jeni', 'bac7f16d-fa3c-45bb-9d72-30cc709d1e42', '8CL', NULL, NULL, 'F', 1, '16305', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('McLintock', 'Breana', 'bacbe0e9-bdcd-49fc-b0db-dab15954e111', '11WW', NULL, NULL, 'F', 1, '20094', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Kan', 'Olivia', 'bae931d8-ef94-4862-9fcd-3474806ddbb3', '9SN', NULL, NULL, 'F', 1, '15313', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Munnings', 'Rebecca', 'bb000749-69d7-4bcb-a1fe-365f55e962e6', '5r12', NULL, NULL, 'F', 1, '20438', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Antoun', 'Sandra', 'bb23dfac-d58d-4c08-8abe-a91fb34000df', '12CG', NULL, NULL, 'F', 1, '19166', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Muraya', 'Alice', 'bb3a1832-1273-40a0-9af2-79a5c4bf8a7e', '12BY', NULL, NULL, 'F', 1, '23072', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Manson', 'Tom', 'bb4ad3e7-cd22-41b0-a0f2-09df9ccc5cb4', '10LN', NULL, NULL, 'M', 1, '21103', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Shaw', 'Kayla', 'bb5c26f5-1b77-40ac-a3ca-e88c06bb4900', '6r14', NULL, NULL, 'F', 1, '23192', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kim', 'Noah', 'bb88edc3-6d3b-47ac-b9d9-73acebcd9c97', '7CO', NULL, NULL, 'M', 1, '240089', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Yang', 'Elan', 'bb8ab1c5-67ff-44a2-8bf0-44a894fc2940', '13ME', NULL, NULL, 'M', 1, '22004', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Gibbs', 'Reuben', 'bbe6b2eb-7e92-4897-9eb6-3cec3354bc3f', '3r8', NULL, NULL, 'M', 1, '22311', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dotulong', 'Faith', 'bc2ee95a-6215-4b0e-bf15-ac639e07b5c4', '11WW', NULL, NULL, 'F', 1, '240055', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jiang', 'Aidan', 'bc394695-acee-4813-9ce1-379d287b505b', '10LI', NULL, NULL, 'M', 1, '16180', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mafua', 'Salote', 'bc4ccc23-eb63-4acb-a1aa-ce5272b1209c', '11MZ', NULL, NULL, 'F', 1, '17311', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Turner', 'Violet', 'bc5f8242-50e4-405d-b09c-da0bc0c745e1', '12DE', NULL, NULL, 'F', 1, '21155', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Manning', 'Hunter', 'bc668c89-edb8-4458-9887-5c8a3a2c297e', '8RO', NULL, NULL, 'M', 1, '21218', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Molina', 'Aliyah', 'bc69fac0-205c-4ea5-aad0-1b6e72371a3d', '3r8', NULL, NULL, 'F', 1, '22323', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Stephen', 'Adina', 'bcabc8b5-113f-4174-adf4-a4e0de6f7f48', '10LN', NULL, NULL, 'F', 1, '23042', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Baxter', 'Dylan', 'bcbb34d0-ac80-49de-bfdd-7fbf058648fd', '8EL', NULL, NULL, 'M', 1, '20210', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Trenuela-Chan', 'Ayden', 'bcc7e62c-cd11-465e-b9a7-e335ef81585e', '10LI', NULL, NULL, 'M', 1, '23032', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('McLeod', 'Alexander', 'bd02841c-e37d-4cbf-b6ba-9dee69ccf27a', '8EL', NULL, NULL, 'M', 1, '17261', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Kunimoto', 'Masato', 'bd1897d3-8b7f-456b-b9a2-b4c5908beacd', '10GO', NULL, NULL, 'M', 1, '23564', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Smit', 'Matthew', 'bd2ed33e-739e-4b52-a0e0-871a5700cbde', '5r13', NULL, NULL, 'M', 1, '19236', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Nyamutswa', 'Ethan', 'bd3c64d3-6c86-4ef5-91b5-062c040b692c', '5r13', NULL, NULL, 'M', 1, '20411', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Wong', 'Daniel', 'bd51b907-b182-473d-b7ca-a34436f68c4d', '10SC', NULL, NULL, 'M', 1, '14551', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Hansen', 'Amelia', 'bd75c8ba-e702-4c53-a54b-08b78f669159', '12DE', NULL, NULL, 'F', 1, '19016', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Popa', 'Stephanie', 'bdeda6c7-5656-442b-af59-56249b6f7490', '3r8', NULL, NULL, 'F', 1, '21350', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Wu', 'Jessica', 'bdef18c8-aafc-42f8-89be-e90b34397724', '5r13', NULL, NULL, 'F', 1, '19244', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Landon-Lane', 'Lucy', 'be6a95e1-b141-4b07-8ee6-04e692d36d88', '8CL', NULL, NULL, 'F', 1, '23102', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pomare', 'Ollie', 'be7fda6c-0784-4264-8676-a6c56b65f248', '9ED', NULL, NULL, 'M', 1, '16205', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('McConnell', 'Ella-Rose', 'bead00d4-868e-4405-be85-4a20a11de1c4', '8CL', NULL, NULL, 'F', 1, '16317', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Daff', 'Solomon', 'beb26531-d7d3-43bf-8187-43174273b670', '13KR', NULL, NULL, 'M', 1, '22125', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Winder', 'Michael', 'bec5c677-9952-4e17-a3c5-4665ef3f96ca', '13SO', NULL, NULL, 'M', 1, '22009', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Souza Godoy Moreira', 'Paige', 'beea9369-e150-43f5-9759-761e2af9fe61', '11MC', NULL, NULL, 'F', 1, '14194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ko', 'Dayoon', 'bf185f6a-158b-4e7c-8667-0cb1b4d2119d', '8RS', NULL, NULL, 'F', 1, '240270', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Su', 'Grant', 'bf2c6d95-f967-418f-95fd-b22452c87482', '4r11', NULL, NULL, 'M', 1, '23188', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Monk', 'Arden', 'bf340b4d-7b03-4e28-b360-8791c5917cd8', '6r15', NULL, NULL, 'M', 1, '22325', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Eggers', 'Isabelle', 'bf6939c3-3db0-4f06-80b5-17f099347921', '3r9', NULL, NULL, 'F', 1, '22306', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Birse', 'Nate', 'bfc70c51-5b2f-4828-a37e-c6b6c7068bc8', '9CN', NULL, NULL, 'M', 1, '240017', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xie', 'Richard', 'bfdc7c1c-cdb1-4a21-bf67-c8c05b5623b7', '6r15', NULL, NULL, 'M', 1, '18381', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Ta\'ala', 'Poppy', 'c01d3d0c-7da2-4b1f-a833-650ba0b429da', '4r11', NULL, NULL, 'F', 1, '20255', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Waines', 'Caleb', 'c0550d1b-5204-4f8f-8849-4871010e1f35', '6r15', NULL, NULL, 'M', 1, '19242', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Varghese Iyjo', 'Aaron', 'c093b51b-c94c-4dea-8a30-da5b2d970ddf', '10SC', NULL, NULL, 'M', 1, '14241', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hentschel', 'Ben', 'c096af43-a0c9-4dd1-a0fd-1dfab6127cb1', '12CG', NULL, NULL, 'M', 1, '19019', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lowe', 'Jack', 'c097b831-3bae-4afe-8046-25012c365be6', '12BY', NULL, NULL, 'M', 1, '21099', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Gull', 'Ezekiel', 'c0aa4f19-a440-436e-aabe-6dcf2df6ee70', '1r4', NULL, NULL, 'M', 1, '23215', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cao', 'Rui', 'c0b05983-2897-4c1d-ba42-95d6a23719f7', '11HK', NULL, NULL, 'M', 1, '23476', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Botherway', 'Calista', 'c14687da-19cb-4f02-90c9-6e337432ddf3', '8RS', NULL, NULL, 'F', 1, '23409', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Maeng', 'Yoobeen', 'c148f68a-685d-49b6-860a-0f19413500fb', 'Enrol', NULL, NULL, 'F', 1, '240202', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Scheib', 'Bradley', 'c1d42fcc-06b0-46f2-b36a-ad4e45fdea3d', '11WT', NULL, NULL, 'M', 1, '22037', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cotter', 'Emerson', 'c20bec22-ddce-4ad2-b947-f8afbd753245', '5r13', NULL, NULL, 'M', 1, '19215', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pagaduan', 'Jadon', 'c26f13a2-d27d-4660-8d38-8d05de682d25', '10SC', NULL, NULL, 'M', 1, '14527', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Cooper', 'India', 'c2963c6a-56f5-4090-a12c-bf540a890ec2', '8RO', NULL, NULL, 'F', 1, '18283', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Giddings', 'Ryan', 'c2abd30d-5f15-472c-a574-2033f9bf049d', '12BT', NULL, NULL, 'M', 1, '33503204', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Robinson', 'Caleb', 'c2b58a2f-fe27-4051-86ad-09a3553c1fc5', '11HK', NULL, NULL, 'M', 1, '20164', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Grieve', 'Josiah', 'c2baebee-449c-4932-a35c-b7015211df26', '9FR', NULL, NULL, 'M', 1, '18284', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gracey', 'Annabelle', 'c2bfbbf6-c36c-42a4-89de-76eb74d8c929', '12AN', NULL, NULL, 'F', 1, '33503167', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Prince', 'Grace', 'c31a612a-a610-46b2-a15a-03b1470c5eab', '10TL', NULL, NULL, 'F', 1, '21120', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ma', 'Yeda', 'c32f48dc-1144-4f1f-8117-a31f8d972a0f', '9SN', NULL, NULL, 'M', 1, '240218', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Kim', 'Julia', 'c34b0937-387a-49c3-b74c-0900805edbd9', '8EL', NULL, NULL, 'F', 1, '23104', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Bennetts', 'Bree', 'c3d4a338-dc78-419c-bf5d-8fd7dd03eaf2', '9ED', NULL, NULL, 'F', 1, '15328', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Minty', 'Eva-Rose', 'c3fb0ed7-8897-4d8f-8cb4-730fd78b4fc6', '10GO', NULL, NULL, 'F', 1, '21043', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Santiago Oliveira', 'Samara', 'c43e01d1-6ffb-4a5b-ba8c-e96f9d9ae6c7', '3r8', NULL, NULL, 'F', 1, '22331', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Jefcoate', 'Chloe', 'c466e167-63f4-42d5-9f88-ce102d61b066', '7TW', NULL, NULL, 'F', 1, '240082', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lawry', 'Caitlin', 'c480bd09-174c-4e09-abaa-6cc34c3c5aa1', '6r15', NULL, NULL, 'F', 1, '18309', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Joseph', 'Nathan', 'c50379eb-3795-4a45-a404-9a99d72ad2c2', '13CI', NULL, NULL, 'M', 1, '22087', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Hu', 'Gloria', 'c53569ed-aff8-4b9d-9dce-54b0e288b7c5', '13FS', NULL, NULL, 'F', 1, '15200', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cadigan', 'Tessa', 'c54303e5-720b-4c94-bead-bff4f1008087', '13SO', NULL, NULL, 'F', 1, '20021', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hansen', 'Danielle', 'c5a7b1ec-971d-4315-a74a-0cebf9d3b586', '11MC', NULL, NULL, 'F', 1, '20052', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ling', 'Gabriel', 'c5c2d019-eab9-470e-9d57-902ddb20bb66', '5r13', NULL, NULL, 'M', 1, '20234', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Murray', 'Nova', 'c5c6848b-c3f2-497c-b4e6-78eb5a1c1629', '5r12', NULL, NULL, 'F', 1, '19232', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Bennetts', 'Lucas', 'c6b79347-a485-4edb-a3ef-6adb644e9342', '12LK', NULL, NULL, 'M', 1, '33503331', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xia', 'Hansun', 'c6cf262a-7427-474c-8171-0af1f19648ec', '9BR', NULL, NULL, 'M', 1, '240183', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Stander', 'Yanke', 'c6d3c668-d232-4454-b0f5-2e7c33b7963d', '9FR', NULL, NULL, 'F', 1, '15304', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lubbers', 'Jesse', 'c6f9eaef-bf24-4c98-b0c1-a197ce8095c4', '13NL', NULL, NULL, 'M', 1, '22077', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Gee', 'Lois', 'c7cecc21-3f2c-44e7-92de-afc2fbd975a1', '', NULL, NULL, 'F', 1, '139530980', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Lee', 'Jayden', 'c7d86570-bba9-4c02-9174-4219c281150d', '11WT', NULL, NULL, 'M', 1, '23249', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Yip', 'Ezekiel', 'c7f2890c-145f-4398-a4cd-e67675412fc9', '7FZ', NULL, NULL, 'M', 1, '18279', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Atienza', 'Zeph', 'c80233dd-da32-4ec2-ad99-208e9a76661b', '12CG', NULL, NULL, 'M', 1, '21006', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dick', 'Keeleigh', 'c808ba17-c38b-42db-a2b0-40e7b8378944', '11JM', NULL, NULL, 'F', 1, '22120', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cooper', 'Tessa', 'c8c028b2-da3b-44a9-afe2-96b9f50b9fff', '9MD', NULL, NULL, 'F', 1, '22129', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McKie', 'James', 'c9255c84-f9a7-4f47-8ad5-db47ebd2c045', '13SO', NULL, NULL, 'M', 1, '22069', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Cree', 'John', 'c925a43e-687c-4f97-a738-8711578640d4', '3r9', NULL, NULL, 'M', 1, '22299', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hu', 'Jerry', 'c9cab370-8304-4a5c-a912-f209f89e77e4', '8RO', NULL, NULL, 'M', 1, '23113', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Reis', 'JP', 'ca26744d-56f6-46e6-a2b5-521264c8734d', '11AL', NULL, NULL, 'M', 1, '240033', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Choi', 'Courtney', 'ca3b3833-96ab-4eb3-be97-5d1e9db0427c', '11JM', NULL, NULL, 'F', 1, '20028', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yao', 'Zechen', 'ca57acbc-f8cd-480f-bcca-15238a0f9fd1', '11WW', NULL, NULL, 'M', 1, '22389', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Campbell', 'Vincent', 'ca6c5288-2881-4aa9-952c-a754639aa722', '3r9', NULL, NULL, 'M', 1, '22291', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ha', 'Doyeon KDS', 'ca715354-6836-4639-8d6c-e90a41bbc4e3', '10LI', NULL, NULL, 'F', 1, '240249', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('On', 'Raksa', 'ca7cb232-bb71-47e0-a12a-84099b4a2d8d', '12LK', NULL, NULL, 'F', 1, '23064', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Immanuel', 'Jedi', 'ca89b039-7584-4a4d-95b4-d7b9bac5a43e', '13ME', NULL, NULL, 'F', 1, '22093', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Marsden', 'Kayla', 'ca924a66-65ed-4d7d-831f-d22121626e74', '', NULL, NULL, 'F', 1, '139732027', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Gough', 'Kyle', 'ca9cc379-b374-4068-8277-227e183eae9a', '12CH', NULL, NULL, 'M', 1, '23128', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ellena', 'Sienna', 'caa59693-98c9-4357-b350-d89b7b05f230', '7PM', NULL, NULL, 'F', 1, '22308', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Haselden', 'Abbie', 'cac9b362-0c49-4db2-aafe-edd1ed600239', '13KR', NULL, NULL, 'F', 1, '18025', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Myatt', 'Riley', 'caeddc10-de4b-4435-8ba8-3c6c0355ade2', '13LH', NULL, NULL, 'M', 1, '14170', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Maples', 'Amelia', 'cb0f2305-ac17-4986-b104-61decde4e39e', '3r8', NULL, NULL, 'F', 1, '21220', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Hong', 'Alyssa', 'cbc2c489-3d02-48ac-b1b6-a4bdbee567cd', '11JD', NULL, NULL, 'F', 1, '240076', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Surrey', 'Therese', 'cbd6deae-11cb-4639-a9c8-207fb3eb18ca', '9ED', NULL, NULL, 'F', 1, '240151', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Clarke', 'Nico', 'cc175864-b2e5-4a16-b51c-b6143282831f', '9BR', NULL, NULL, 'M', 1, '23149', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fyfe', 'Jasmine', 'cc3e873a-3327-4399-b0cb-83e4f222963f', '11AL', NULL, NULL, 'F', 1, '15326', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Clancey', 'Samuel', 'cc97c3cd-8274-4660-8944-ca76240331ee', '2r7', NULL, NULL, 'M', 1, '22296', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Falconer', 'Hannah', 'cccf08a0-4203-41e1-ac27-f408debf867a', '10GO', NULL, NULL, 'F', 1, '18286', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Carter', 'Alem', 'ccf016e6-740f-45bc-99dc-c88f0160dab2', '', NULL, NULL, 'M', 1, '139772384', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Deighton', 'Olivia', 'cd2b0f28-6da7-4a59-8bfd-78f891c426b8', '7TW', NULL, NULL, 'F', 1, '22301', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kahiya', 'Brandon', 'cd94a77d-0925-4c64-8a21-913f45ca30d6', '11AL', NULL, NULL, 'M', 1, '240085', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Zhang', 'Doris', 'ce04933e-f154-4fcd-9904-b9001e07fba6', '10LI', NULL, NULL, 'F', 1, '14555', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Wei', 'Ella', 'ce09e248-1636-4f37-88e4-76a268453bfb', '7CO', NULL, NULL, 'F', 1, '17293', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('de Freitas', 'Natalie', 'ce56837d-9313-4ee5-ad41-e0124c0ec886', '10LN', NULL, NULL, 'F', 1, '240045', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Coombs', 'Hannah', 'ce893450-b377-4a79-9114-69d1f404186a', '11HK', NULL, NULL, 'F', 1, '240037', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Seo-As', 'Faith', 'ce9c0720-3aa0-45d8-a39d-e9391f146ed6', '3r9', NULL, NULL, 'F', 1, '22333', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Bennetts', 'Madi', 'cee20f7e-e263-4db9-863f-7324a0a8a32f', '12DE', NULL, NULL, 'F', 1, '33503150', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Conner', 'Toby', 'cf16a8d6-eecc-47e4-969b-8afa3344d0b0', '6r14', NULL, NULL, 'M', 1, '18298', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Malcolm', 'Gracie', 'cf2a8727-9fc9-47b0-b7b6-f2914106e008', '5r13', NULL, NULL, 'F', 1, '19231', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Hitchens', 'Tahlia', 'cf3bb077-430a-40ef-bb1e-3ed52641aa3b', '12BY', NULL, NULL, 'F', 1, '21073', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Trotter', 'Emily', 'cfbe30a8-217c-4309-8f7c-8db028706e31', '11AL', NULL, NULL, 'F', 1, '240163', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hayton', 'Benjamin', 'd0023b76-5a96-4216-9397-d882b436c1eb', '13OG', NULL, NULL, 'M', 1, '20057', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cree', 'Kaitlynn', 'd004466d-0115-49c0-811e-0d339dfebe1f', '6r14', NULL, NULL, 'F', 1, '18300', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wain', 'Sam', 'd00d3b87-dff4-4b8c-8cc7-4c7d07f18b6c', '11AL', NULL, NULL, 'M', 1, '20145', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('England', 'Isabel', 'd097ee07-4725-43ae-819a-0445d7f1fc43', '9CN', NULL, NULL, 'F', 1, '22115', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tait', 'Chrystal', 'd0a7f0e4-5882-4ca5-b7f5-c36c87c015a2', '9ED', NULL, NULL, 'F', 1, '240153', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Grieve', 'Isaac', 'd0c1b0bc-17e6-41bb-99f8-11cf15418b50', '12DE', NULL, NULL, 'M', 1, '19145', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Marrion', 'Feona', 'd0cac60e-d5b9-426d-8ba2-2e4fd1284204', '9MD', NULL, NULL, 'F', 1, '22074', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Verd', 'Jacob', 'd0e093c2-8937-4e86-b4b4-3775893530b2', '13ME', NULL, NULL, 'M', 1, '20144', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Wang', 'Coco', 'd10129b5-fc79-443b-815a-42585cf432f4', '9ED', NULL, NULL, 'F', 1, '21237', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Thompson', 'Joel', 'd12b2d0f-e78b-48de-b4b8-4a86a6fdfef1', '11MZ', NULL, NULL, 'M', 1, '20134', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Drummond', 'Harvey', 'd1f821f2-c283-4daf-92f5-2d697b560f89', '5r12', NULL, NULL, 'M', 1, '19217', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kueber', 'Nina', 'd1fa531e-8396-479e-b468-b71c63a4e81e', '12DE', NULL, NULL, 'F', 1, '240193', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Boaru', 'Grace-Naomi', 'd1fefe12-c456-4339-9765-23c44cbd8b35', '8CL', NULL, NULL, 'F', 1, '19204', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Au', 'Alice', 'd25ac32b-25bf-49ef-93a8-610fcfd46d1c', '4r10', NULL, NULL, 'F', 1, '20208', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Scoulding', 'Matilda', 'd271689e-2c8f-4588-aade-98cc4314feef', '10LE', NULL, NULL, 'F', 1, '21132', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ellena', 'Rocco', 'd2940636-145b-4cfb-b4f7-ad71e63e06c4', '10LN', NULL, NULL, 'M', 1, '22171', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Scott', 'Sarah', 'd30bcd44-f33e-49e7-a56c-e32574547a06', '12ST', NULL, NULL, 'F', 1, '19035', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Saruchera', 'Sarah', 'd33d79c5-5e6a-4444-9a52-e14d1a8fb9bd', '12BT', NULL, NULL, 'F', 1, '33503483', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Saunders', 'Kimberley', 'd33e3046-6821-42b8-9bb2-86254b002736', '10LI', NULL, NULL, 'F', 1, '14250', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Huang', 'Jacky', 'd3a5ff6c-2a9d-4f49-bdc0-96b6cf02f089', '12PA', NULL, NULL, 'M', 1, '33503473', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Butler', 'Robson', 'd3e3e290-ddc9-4d9e-846f-49883c7bc6f9', '12BY', NULL, NULL, 'M', 1, '23159', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pretty', 'Aoife', 'd3eb446f-f0d4-4ac8-84eb-6900ccaa9e77', '7PM', NULL, NULL, 'F', 1, '240128', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Yip', 'Nathaniel', 'd45fe586-170b-4e0f-8d92-7aa3038a20fb', '4r10', NULL, NULL, 'M', 1, '21241', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Jantaramaneewong', 'Kwang', 'd4d4bf91-dee9-4d91-a4de-e1567f5114e7', '11MZ', NULL, NULL, 'F', 1, '23535', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McKinnon', 'Caleb', 'd58451ce-51af-4199-93d5-e71ec14bb8b4', '11WW', NULL, NULL, 'M', 1, '14013', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Le Roux', 'Maia', 'd593e0e7-03d4-437d-903d-8557ef5f68df', '13FS', NULL, NULL, 'F', 1, '22354', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Bradley', 'Zoe', 'd5d33ac8-6ebc-4d0b-b786-f0ac3bbc65cd', '3r9', NULL, NULL, 'F', 1, '22289', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Schrier', 'Rachel', 'd5deea5f-fa51-49ce-be57-a64b7cadadcc', '12PA', NULL, NULL, 'F', 1, '21131', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Baker', 'Grace', 'd648ef12-55ef-4497-8564-214f6dd93699', '12BT', NULL, NULL, 'F', 1, '21010', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pattison', 'Charlotte', 'd64ebee9-b517-49ea-904e-3c8a10a93ca8', '9BR', NULL, NULL, 'F', 1, '240123', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Alcayde', 'Josh', 'd655923a-8b34-4ffc-97d8-ea073f720fca', '', NULL, NULL, 'M', 1, '139410065', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Garratt', 'Louis', 'd673b0c4-91aa-4e84-988d-8580e490ad06', '5r13', NULL, NULL, 'M', 1, '19221', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Falconer', 'Leah', 'd678cbb9-7ab5-43e7-83cd-d446b7f950a8', '12PA', NULL, NULL, 'F', 1, '19013', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Manning', 'Samuel', 'd74b1846-47cf-43ff-a2f3-7711bb9a1e48', '13ME', NULL, NULL, 'M', 1, '22075', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Gee', 'Ashton', 'd75aceaa-0500-4fe2-919a-5bb62d42865d', '8CL', NULL, NULL, 'M', 1, '23130', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Walter', 'Ruby', 'd85c0b5e-43b4-42be-ae63-f2ee6ed1afff', '', NULL, NULL, 'F', 1, '139596367', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Jiang', 'Yiwen', 'd86298a8-a666-4222-b17e-fa8e5782f14f', '11MC', NULL, NULL, 'F', 1, '240083', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fisher', 'Will', 'd8795281-cdb2-44e5-bfe2-6f5da1cdfbc5', '11MC', NULL, NULL, 'M', 1, '240064', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wei', 'Lucas', 'd87a6707-1696-47a6-a1bd-472040d2c014', '3r8', NULL, NULL, 'M', 1, '21239', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Young', 'Liam', 'd89ac0d0-2b93-4e8d-80b0-52f8ea248091', '11HK', NULL, NULL, 'M', 1, '240188', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Tseng', 'Jireh', 'd8f0ed5d-2f46-45b2-81ee-a0b860fd1fee', '13NL', NULL, NULL, 'F', 1, '33503157', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Laufiso', 'Caleb', 'd9407de0-b24d-43fd-8faf-7d8632316687', '8CL', NULL, NULL, 'M', 1, '23097', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Dendle', 'Xavier', 'd98e5f73-b6dd-41bd-9b78-865abf35b4b1', '7PM', NULL, NULL, 'M', 1, '240050', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pomare', 'Neve', 'd98f2ae5-78ed-4835-8111-4d17d7427daa', '7PM', NULL, NULL, 'F', 1, '18317', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Duthie', 'Corin', 'd9a12601-8778-4e02-be52-af58a056f4cd', '11WT', NULL, NULL, 'F', 1, '240057', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Seoyoung KDS', 'd9d08e2b-518b-4478-8a5c-2e98e6990e6f', '9SN', NULL, NULL, 'F', 1, '240225', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Gutsell', 'Nicholas', 'd9d64d6a-38cd-4367-b51f-9246394b6ca3', '8RS', NULL, NULL, 'M', 1, '23125', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Thomson', 'Caitlyn', 'd9f8f6fc-7d1f-4c97-a3d9-360a4cfe5b59', '12JH', NULL, NULL, 'F', 1, '15198', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Weng', 'Pat', 'da2b39ad-a1fb-4fcc-937c-3c4348e2bea7', '10TL', NULL, NULL, 'M', 1, '22361', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Hayton', 'Neriah', 'daa2b4e1-8eed-4d7c-af60-f6bb4a70f570', '4r11', NULL, NULL, 'F', 1, '21207', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yew', 'Nathan', 'daa8c939-1589-4ba7-ac90-0746237140a7', '12PA', NULL, NULL, 'M', 1, '23011', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Buena', 'Lorraine', 'dad6f805-a3c4-44ef-8838-978abc61dd71', '12AN', NULL, NULL, 'F', 1, '21026', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Ferguson', 'Joshua', 'db062b4c-d8c2-43aa-9bb7-e12d4c2a3301', '9FR', NULL, NULL, 'M', 1, '15358', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Read', 'Freddie', 'db14c8e9-37d3-477e-9b1a-c4aa8a315ca0', '10SC', NULL, NULL, 'M', 1, '16177', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Denne', 'Rachel', 'dbbd8aae-61c0-4bbb-931a-8bd3c1fee0cf', '11MK', NULL, NULL, 'F', 1, '240051', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lineham', 'Louis', 'dbbf5e37-662c-43e6-b268-142eb91bafd0', '6r15', NULL, NULL, 'M', 1, '21213', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Verd', 'Sarah', 'dbd07dfc-8888-48c8-affc-18997ed9c470', '10LN', NULL, NULL, 'F', 1, '23027', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Moat', 'Jake', 'dbdb78e4-f100-4f60-a6b4-0bb8c1d5ef15', '11WW', NULL, NULL, 'M', 1, '240216', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Marsden', 'Larissa', 'dc33afeb-3992-4644-a22b-9ccaaabe9dfd', '12PA', NULL, NULL, 'F', 1, '23110', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Lok', 'Neeton', 'dc4b336c-20fe-41d7-bb2a-75507ea8b10f', '6r15', NULL, NULL, 'M', 1, '19351', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Clarkson', 'Felix', 'dc59586b-7df5-479d-b117-536db0ce14eb', '12CG', NULL, NULL, 'M', 1, '23147', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Stander', 'Yoné', 'dc8e2ec7-bede-41c2-b2d5-22a603a769b7', '12JH', NULL, NULL, 'F', 1, '15197', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cooper', 'Levi', 'dd37f856-0ce6-4fe1-9093-b10f77ff560c', '2r7', NULL, NULL, 'M', 1, '22297', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Eyre-Churcher', 'Brayden', 'dd4c20c7-d664-42c7-8cfe-f0b98ac3491b', '3r8', NULL, NULL, 'M', 1, '21190', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Tan', 'Andrew', 'dd53db54-caba-4362-ab58-dd2aa1b12e0a', '12ST', NULL, NULL, 'M', 1, '23039', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Ivar', 'Gabe', 'dd7bcaaa-62f5-4d62-bf0a-b3ffd5eb1ede', '12JH', NULL, NULL, 'M', 1, '23111', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Matthews', 'Jordyn', 'dd8fe43d-e9c7-4fc2-8f53-da5017684be6', '12DE', NULL, NULL, 'M', 1, '23083', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lee', 'Michael', 'ddbb03de-77a6-49b9-aa71-223c49b719d9', '3r9', NULL, NULL, 'M', 1, '23452', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Kench', 'Zoey', 'ddc1cc5f-ceaa-4de6-9e3a-94883048fcfd', '5r13', NULL, NULL, 'F', 1, '20229', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Ofa', 'Tupou', 'de06a02a-6f9f-42e4-a7cd-b4e31800e26a', '12DE', NULL, NULL, 'F', 1, '23065', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Aylward', 'Devon', 'de0f080e-30ec-41c8-8a08-09e4d0a3adc0', '13FS', NULL, NULL, 'F', 1, '20009', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Du', 'Morgan', 'de9b3633-c323-490c-bc48-15a2680a16f1', '9SN', NULL, NULL, 'M', 1, '240056', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Williams', 'Dylan', 'dea8339c-ef7b-4e2e-a9cb-ab4672a7a4a3', '8EL', NULL, NULL, 'M', 1, '20263', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('O\'Brien', 'Hunter', 'dea8c17b-6402-412b-9a8f-4973b39351e5', '13OG', NULL, NULL, 'M', 1, '22059', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Mattheus', 'Jocelyn', 'dedc59bc-b936-47ee-ba52-8ea290d673e9', '13SO', NULL, NULL, 'F', 1, '22071', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Manson', 'Nathanael', 'dee972a4-8bd7-4418-804c-d82fba2a1004', '11JM', NULL, NULL, 'M', 1, '240107', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Konishi', 'Reiji', 'df450842-2159-4b2f-8474-aac85dfef3f1', '12BY', NULL, NULL, 'M', 1, '23477', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Opsima', 'Jared', 'df7a151d-9052-4e65-b1fe-28e4c6383e33', '11WW', NULL, NULL, 'M', 1, '20108', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Couprie', 'Matthew', 'df963bff-106d-404c-b136-ccb1f78a209c', '11MC', NULL, NULL, 'M', 1, '240040', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wescombe', 'Cole', 'e0218126-31b0-41ef-bb01-283a70117682', '13NL', NULL, NULL, 'M', 1, '22011', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Gordon', 'Mia', 'e0539040-69fd-4d4e-a431-cc5aad56862d', '5r13', NULL, NULL, 'F', 1, '19350', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Xu', 'Thomas', 'e0543b6d-9cba-496a-b1c7-9cabec00b541', '12LK', NULL, NULL, 'M', 1, '20189', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Cooper', 'Sonny', 'e08f6e18-f9a5-43a8-b35d-47e7753ec6ff', '2r5', NULL, NULL, 'M', 1, '22298', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lewis', 'Hugo', 'e0ec5250-7a2d-4122-b32c-84331a64798b', '11JM', NULL, NULL, 'M', 1, '240096', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Kim', 'Eric', 'e1174933-4129-4495-831f-9746bea29643', '12BT', NULL, NULL, 'M', 1, '19023', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wilson', 'Thomas', 'e146c619-3e2a-4044-8471-ec89c4e5dc48', '13NL', NULL, NULL, 'M', 1, '33502920', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Gibbs', 'Mila', 'e185184e-8edd-4370-947a-b854c78d2669', '7TW', NULL, NULL, 'F', 1, '17282', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Norriss', 'Tiffany', 'e1969c6e-e549-4676-93e5-d97ffaf74009', '7CO', NULL, NULL, 'F', 1, '240120', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ojima', 'Tomoki', 'e19a33c4-5f55-4168-85fd-7846d93f2ced', '10GO', NULL, NULL, 'M', 1, '240264', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Crawford', 'Stella', 'e20ecb4b-57f8-49e6-b17c-ed8f517982a6', '12PA', NULL, NULL, 'F', 1, '21039', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yamada', 'Mysti', 'e22654bd-3e7a-4c4d-a9c0-f95a7d210711', '13FS', NULL, NULL, 'F', 1, '22005', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Brown', 'Gloria', 'e229f750-9f26-4efb-bbe3-018807eeb372', '6r14', NULL, NULL, 'F', 1, '18296', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Maeng', 'Jooha', 'e235ab20-c296-41fc-9134-0ac5f8bd77f5', '7FZ', NULL, NULL, 'M', 1, '240201', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Wang', 'Andrew', 'e27cffa2-fe2e-430e-bd74-b692874d84e7', 'Enrol', NULL, NULL, 'M', 1, '240317', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Au', 'Charlie', 'e283c098-a54c-41fc-a4f6-8c7932effafa', '9ED', NULL, NULL, 'M', 1, '240012', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Stocks', 'Florence', 'e2da8068-0abb-4237-8726-037e9e8fe0f7', '13ME', NULL, NULL, 'F', 1, '33503074', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Togiaso', 'Arona', 'e2ddcaa7-5e0b-4a53-94a9-b4b22c6b1bf7', '11JM', NULL, NULL, 'M', 1, '22023', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Mackey', 'Eden', 'e322cff2-3262-4398-9a99-c33cdc89e491', '10LE', NULL, NULL, 'F', 1, '15221', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Regnault', 'Susannah', 'e3815739-74d2-4ab0-9654-80ba90e137e1', '12CH', NULL, NULL, 'F', 1, '23056', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Dodge', 'Caleb', 'e3f87cbf-7bb2-4b21-b023-aea2fefff592', '11HM', NULL, NULL, 'M', 1, '240014', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bartlett', 'Sophia', 'e41d7c3d-637b-45bf-8937-84b8b9a6fcd6', '7TW', NULL, NULL, 'F', 1, '17291', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Shi', 'Karl', 'e423e107-5309-4376-a147-db9bba3413c9', '9CN', NULL, NULL, 'M', 1, '17325', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Sainsbury', 'Ella', 'e42ed90b-c7eb-4e5f-9d99-369967c40c44', '10LE', NULL, NULL, 'F', 1, '15180', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Misa', 'Asinate', 'e43a0fd5-fba5-46fc-bc31-d05c5cc2bd63', '11AL', NULL, NULL, 'F', 1, '240112', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Cotter', 'Caleb', 'e43eebc9-4bd4-4ca7-94b0-72039e9daec5', '6r14', NULL, NULL, 'M', 1, '18299', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bauit', 'Geraigne', 'e4660c92-3d4d-4ae1-ad2b-d6f0e89dad85', '10GO', NULL, NULL, 'F', 1, '240015', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('McKenzie', 'Olive', 'e4d1f508-6162-4d8c-9449-7b5dc9b203a1', '11MK', NULL, NULL, 'F', 1, '240110', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ewing', 'Mark', 'e4e636b1-3cc0-4953-9a6f-1429f71ef1e5', '7CO', NULL, NULL, 'M', 1, '240062', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Otufangavalu', 'Jairus', 'e5206026-a23d-47db-9649-b128aeaf5ef6', '11MK', NULL, NULL, 'M', 1, '240121', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Mullen', 'Lucy', 'e5209daa-625f-4e62-b95c-22a4218af00a', '11WW', NULL, NULL, 'F', 1, '22060', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Park', 'Roi', 'e5493a15-cfba-4e9f-9b5e-486fbc90dd2e', 'Enrol', NULL, NULL, 'M', 1, '240274', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Pellow', 'Tahlia', 'e5643a1a-91f3-48db-b4cc-6257cbf50bd0', '12CG', NULL, NULL, 'F', 1, '16173', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Xu', 'Yining', 'e56f94e4-a4c9-4089-9577-a2efac245404', '8RO', NULL, NULL, 'F', 1, '16313', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Barr', 'Aspen', 'e5bbfeaf-4815-45f6-8ade-cdf4d4d592c4', '9MD', NULL, NULL, 'F', 1, '16208', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Aratani', 'Koei', 'e630088c-e24a-4922-abd0-9d8a27e0713b', '13FS', NULL, NULL, 'M', 1, '19416', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('van Tuinen', 'Gabriella', 'e680c914-f725-4e5a-8daf-022f936913c4', '13OG', NULL, NULL, 'F', 1, '33503022', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('George', 'Evie', 'e6f5ee39-543e-4d50-838b-f348bc1fdc7f', '12BT', NULL, NULL, 'F', 1, '19015', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Jansen', 'Caleb', 'e6ff0e4f-d7fa-4a9f-b5f5-c8e87ca3c5c8', '9FR', NULL, NULL, 'M', 1, '240081', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Keonwoo', 'e720ce54-05cd-4a2e-b25a-c9d41fde5fa1', '1r4', NULL, NULL, 'M', 1, '23212', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Limpassorn', 'Pream', 'e73dfe17-1167-4637-85bd-fbb761d8cb5e', '12BY', NULL, NULL, 'F', 1, '22368', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Sheng', 'Vincent', 'e74c0615-c2c0-4da1-b82d-5258f4e13b52', '10LI', NULL, NULL, 'M', 1, '14243', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Rodwell', 'Huxley', 'e78b361d-2869-4963-b2eb-72bf282cf6fa', '5r13', NULL, NULL, 'M', 1, '19453', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cooper', 'Poppi', 'e7a47b9b-f640-4f49-bb73-e0565199a9c5', '9SN', NULL, NULL, 'F', 1, '240038', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Choi', 'Yerin KDS', 'e7b7eece-d2d1-483d-a932-48302013af0b', '10LN', NULL, NULL, 'F', 1, '240247', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Javier', 'Arren', 'e86c5aec-df86-4ced-854e-4eb496304d4b', '12BY', NULL, NULL, 'F', 1, '23179', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Zheng', 'Maggie', 'e8c33dfc-655d-4092-93fa-0b80f108cab6', '12ST', NULL, NULL, 'F', 1, '19045', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Nashed', 'David', 'e8e4c549-f793-4024-9cd7-8c6ec1986b91', '11HK', NULL, NULL, 'M', 1, '20105', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lau', 'Raphael', 'e9084409-dc7f-4900-ae94-b24108bbba81', '3r9', NULL, NULL, 'M', 1, '22320', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Teremanuia', 'Teleni', 'e920b04e-f046-4a1b-b037-3aa068c6c409', '8EL', NULL, NULL, 'F', 1, '17279', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Toriumi', 'Hanna', 'e92d3eab-1d2b-442f-8542-69b0e38241c9', '11JD', NULL, NULL, 'F', 1, '240204', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Rodger', 'Valentina', 'e99d9bb8-ba1b-4202-9ce4-7ed233d34a46', '6r15', NULL, NULL, 'F', 1, '22330', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lee', 'Yeseong KDS', 'ea2fec1d-b463-4c92-8ce3-6ea4b12b8f8a', '9MD', NULL, NULL, 'M', 1, '240222', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Pagaduan', 'Daniella', 'ea63b266-9c7c-4d69-9560-5d804f204c48', '7PM', NULL, NULL, 'F', 1, '17296', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Talataina', 'Juliet', 'ea8acc73-b5db-42bb-9e8a-2353d9021fe6', '11HK', NULL, NULL, 'F', 1, '240154', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Akita', 'Ryo', 'eae7e0bf-0bde-48b2-84b5-87e2f93e3a48', '11JM', NULL, NULL, 'M', 1, '240212', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chundprasit', 'Yuri', 'eae836cf-6f32-4708-a713-3e585a738e48', '11WW', NULL, NULL, 'F', 1, '240036', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Souza Godoy Moreira', 'Zoe', 'eb165df5-6c7f-4d70-afb0-320cca6305a1', '2r7', NULL, NULL, 'F', 1, '23190', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Emadi', 'Chi Chi', 'eb3252d7-f6c2-40b5-9f4c-50001546412e', '11MC', NULL, NULL, 'F', 1, '240060', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cooper', 'Eli', 'eb342ba8-de02-4dac-b3ae-cd806196a1e6', '5r13', NULL, NULL, 'M', 1, '20214', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32');
INSERT INTO `students` (`last_name`, `first_name`, `id`, `tutor_group`, `year_level`, `date_of_birth`, `gender`, `enrolled_status`, `identifier`, `school_id`, `created_at`, `updated_at`) VALUES
('Ye', 'Johnny', 'eb5ac45c-2b80-4797-9124-76f0210f67d5', '12LK', NULL, NULL, 'M', 1, '21340', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Tey', 'Vanna', 'eba095f5-d9b6-43a1-a453-e1517fdf7f9f', '12PA', NULL, NULL, 'F', 1, '23035', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Henderson', 'Mia', 'ec3aaa37-c267-4846-8c37-0fedaea32497', '10LE', NULL, NULL, 'F', 1, '21072', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lee', 'Mila', 'ec5198f6-49da-4762-bff8-43edf566faa6', '12DE', NULL, NULL, 'F', 1, '15251', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Morrison', 'Miriam', 'eccc5f68-25d7-4df9-8f8d-aeca57375f9c', '12PA', NULL, NULL, 'F', 1, '23076', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Carter', 'Ollie', 'ecd5b58f-1414-4aba-9bac-ea0a39dfb3a6', '13CI', NULL, NULL, 'M', 1, '20023', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chiu', 'Michael', 'ed73ae54-8b94-4e03-a2b9-690e499f2b33', '10LI', NULL, NULL, 'M', 1, '14548', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Marrion', 'Faith', 'ed8c2842-4d9c-44a1-a4b9-26919b941be6', '11MK', NULL, NULL, 'F', 1, '20088', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Peters', 'Abi', 'ed9a3159-f0b2-41f6-ba6d-3b48fdc4a323', '12CG', NULL, NULL, 'F', 1, '23062', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Lu', 'Symphony', 'ed9ee9dc-604d-43aa-9ff9-c55e78b18870', '8EL', NULL, NULL, 'F', 1, '16303', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Igot', 'Iah', 'eda28ef7-219c-4669-a173-ca7f657f7ab5', '9FR', NULL, NULL, 'F', 1, '240078', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Pretty', 'Isaac', 'edd62afb-82b4-43e0-b7ab-9e3b8f34bfab', '9FR', NULL, NULL, 'M', 1, '22045', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Wainwright', 'Thomas', 'eddac8b7-2534-4fd6-88bf-a5cb2450d1cb', '13ME', NULL, NULL, 'M', 1, '17315', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('McKay', 'Peter', 'ee249608-01ac-4fd2-8268-0cfa355b4271', '13FS', NULL, NULL, 'M', 1, '18042', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Bussararungsi', 'Pai', 'ee272252-f4bf-41dd-a95e-23dea162a9a0', '12BY', NULL, NULL, 'M', 1, '23231', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Itofele', 'Marcel', 'ee8988da-9ec4-4436-bdd9-4ce5ce59baec', '2r7', NULL, NULL, 'M', 1, '22385', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wilson', 'Joel', 'ee8e55a8-9ff7-4b60-8b86-1f9e5a1319cf', '7FZ', NULL, NULL, 'M', 1, '17284', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Tan', 'Lucas', 'ee9d5ce6-eed5-4c76-aee2-df52e734bca5', '13CI', NULL, NULL, 'M', 1, '19004', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Stevenson', 'George', 'ef1b0f9b-20db-4033-8bbd-eed508e2ad73', '2r5', NULL, NULL, 'M', 1, '23189', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Cortez', 'Jayden', 'ef6a24ef-4750-40be-9429-706cab44e4db', '9MD', NULL, NULL, 'M', 1, '240039', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yang', 'Zachary', 'ef7285aa-af9a-4bf7-8cc4-2422c1a70f68', '4r10', NULL, NULL, 'M', 1, '20266', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Lorgelly', 'Ethan', 'ef7b8d97-44a5-429f-8332-ef0322a61a39', '13CI', NULL, NULL, 'M', 1, '22079', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Dreadon', 'Falcon', 'ef84a1cf-c75c-42f5-8201-2776f9c874ea', '5r13', NULL, NULL, 'M', 1, '19448', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Harrison', 'Micah', 'ef894dcf-1cd6-4558-ae0f-0af0715830be', '10GO', NULL, NULL, 'M', 1, '23121', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Santiago Oliveira', 'Daniel', 'ef95b253-6ae6-4bf7-a0aa-25a47ae20966', '11HM', NULL, NULL, 'M', 1, '22039', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Liu', 'Kayson', 'efc675a6-df5a-4d0d-a3c5-652394d112d4', '4r11', NULL, NULL, 'M', 1, '21214', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Shi', 'Emmett', 'efdbaee2-bab9-4790-bc09-86eb5946272e', '6r15', NULL, NULL, 'M', 1, '18319', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Wang', 'Danny', 'f07b760a-7d45-4021-b2dd-582f98780e5f', '4r11', NULL, NULL, 'M', 1, '23539', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Bishop', 'James', 'f0f347a6-1842-427a-9937-da831c0411d3', '8CL', NULL, NULL, 'M', 1, '23163', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dinnissen', 'Kees', 'f0f65ec8-0ba9-4ae4-9ce1-c5709f5d8ed8', '10SC', NULL, NULL, 'M', 1, '21044', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Bader', 'Elsie', 'f114de0d-c7ce-4a85-95dd-382e8b547257', '10GO', NULL, NULL, 'F', 1, '21008', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Garcia', 'Markus', 'f11ec14b-f155-4b6b-b12d-84eb71336ba8', '3r8', NULL, NULL, 'M', 1, '22310', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Mori', 'Nanami', 'f1784f48-31b3-4e10-8504-55909fc7e8e3', '11WT', NULL, NULL, 'F', 1, '22384', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ho', 'Alicia', 'f181b258-9915-4110-bb57-a45d309bee75', '8RO', NULL, NULL, 'F', 1, '16259', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('King', 'Livy', 'f1d9bdb8-b63c-47a8-8cb7-6eddbf064b72', '11HM', NULL, NULL, 'F', 1, '240092', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Dendle', 'Quinn', 'f1f4fc3a-0274-43f8-bdef-e6408e6f0cc9', '9ED', NULL, NULL, 'M', 1, '22122', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Yeo', 'Daniel', 'f2206a1a-8934-459b-9049-cd89bc82f890', '10LN', NULL, NULL, 'M', 1, '15272', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Bishop', 'Bradley', 'f2427100-7029-4fc3-a37c-8eeb87d64f2b', '9ED', NULL, NULL, 'M', 1, '240018', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Owen', 'Sara', 'f24a1223-826c-46aa-8466-ef7809de39be', '10LE', NULL, NULL, 'F', 1, '22177', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Watt', 'Benji', 'f2739e80-ffea-4a66-ab2c-3be6a1f1f524', '9CN', NULL, NULL, 'M', 1, '21238', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Greig', 'Naomi', 'f28d6a4d-4cf0-4b6a-a340-db5fc2293d96', '9MD', NULL, NULL, 'F', 1, '16247', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Andrew', 'f2aa1187-f208-4f2d-aad3-61c59811722d', '13LH', NULL, NULL, 'M', 1, '19172', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Higgins', 'Angelique', 'f2e00c33-2bf6-4d65-adf4-1dbb18601e0c', '4r11', NULL, NULL, 'F', 1, '21206', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Stavrou', 'Mabel', 'f2f697b5-ddcf-4dd9-b004-557812bc349a', '7TW', NULL, NULL, 'F', 1, '17292', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Yu', 'Hanbo', 'f31d40ff-d005-4f4e-aaaf-bdbfa2b2b7e1', '7TW', NULL, NULL, 'M', 1, '240269', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Gilmore', 'Alexandra', 'f3552fe4-cfa7-42bb-a255-23f935b242df', '9CN', NULL, NULL, 'F', 1, '22107', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Gomez', 'Honour', 'f36be7e1-0a1b-4cab-af23-4eb5173e7222', '3r8', NULL, NULL, 'F', 1, '21205', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Vergara', 'Maven', 'f37ed935-d97e-4239-9aa7-96aaf335fe64', '8RS', NULL, NULL, 'F', 1, '17270', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Lawry', 'Emily', 'f3ae5ef2-7da4-46f5-bd93-fad6d85ece3d', '2r7', NULL, NULL, 'F', 1, '23209', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Jeong', 'Kenny', 'f3d9aea2-254b-4e84-9643-8f85546e60b1', '13ME', NULL, NULL, 'M', 1, '18027', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Drauna', 'Iliseva', 'f40178aa-65f2-43bc-af0f-bdec25503423', '5r13', NULL, NULL, 'F', 1, '23222', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Prakhongthanaphan', 'Taofah', 'f40dad61-6b8f-4d4f-ad21-0abb9d406aab', '6r15', NULL, NULL, 'F', 1, '23236', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Van Rooyen', 'Kianna', 'f43366b0-a1ee-4ea0-bb49-86bbf2d34d87', '', NULL, NULL, 'F', 1, '139538356', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-02-16 09:41:59', '2024-02-16 09:41:59'),
('Reynolds', 'Wyatt', 'f4463274-1001-4444-87ee-6fe771733a9f', '2r7', NULL, NULL, 'F', 1, '23194', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('McCrostie', 'Theo', 'f4be169d-986e-4c91-9aab-b180b92dbf7a', '4r10', NULL, NULL, 'M', 1, '21222', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Stolzenberger', 'Mason', 'f4bfaa02-3658-4ff4-a98b-ae5e7df31ecf', '13CI', NULL, NULL, 'M', 1, '33503449', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Capill', 'Abigail', 'f50e30f0-6d04-4e34-990d-9d4e7b7bd690', '9BR', NULL, NULL, 'F', 1, '22139', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Harris', 'Zach', 'f5106f87-9a4c-497e-a084-147dddf7e5da', '5r13', NULL, NULL, 'M', 1, '20222', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Major', 'Ruby', 'f54d218f-ffff-431d-bbba-60ce4cd96fc8', '13OG', NULL, NULL, 'F', 1, '18038', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Saruchera', 'Tapfuma', 'f56d1832-5835-44c3-a3b6-c5fb6a38bc26', '9ED', NULL, NULL, 'M', 1, '16238', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('van Mechgelen', 'Maaike', 'f5b6bc87-0bdb-4beb-947e-e736e6c142d7', '13OG', NULL, NULL, 'F', 1, '22014', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Han', 'Jiah', 'f5ed430c-3336-49c2-a354-705549f1658f', '6r14', NULL, NULL, 'F', 1, '23424', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Yire KDS', 'f6290772-97e3-47c6-b55e-92ec43505bb0', '10LE', NULL, NULL, 'F', 1, '240238', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Au', 'Lily', 'f673fc8b-e6bb-448b-9b97-b80722548c7d', '12BT', NULL, NULL, 'F', 1, '22158', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Minty', 'Jimmy', 'f683e75f-9fd0-49ad-ba6f-72dedf9ed0b5', '1r4', NULL, NULL, 'M', 1, '23198', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Pheng', 'John', 'f69298e6-2a02-433d-aaac-cc64a2f538f4', '7CO', NULL, NULL, 'M', 1, '240125', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Carter', 'Zofeya', 'f7364431-18bf-4741-b5f0-e3ad5d3538a6', '12CH', NULL, NULL, 'F', 1, '21030', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Chan', 'Eleasha', 'f74083d6-9fba-42e1-b5fb-bcae58510012', '12JH', NULL, NULL, 'F', 1, '23155', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Alexander', 'George', 'f753acac-e48c-47e8-a03d-a4f5a9174566', '11JD', NULL, NULL, 'M', 1, '131381', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lau', 'Annika', 'f757441b-bccc-41dd-b228-021766e69f71', '11HK', NULL, NULL, 'F', 1, '131410', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Campbell', 'Isabella', 'f76156b7-e750-4200-84e8-21b4eb3f3e20', '7CO', NULL, NULL, 'F', 1, '23491', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Owens', 'Isabella', 'f7a14c66-76b8-40d8-bb04-ba54e264d90b', '8CL', NULL, NULL, 'F', 1, '23063', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Shelton', 'Zac', 'f7d9db7e-9baf-4681-8623-69e770986af3', '11JD', NULL, NULL, 'M', 1, '14189', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lu', 'Archie', 'f7f6143b-81fc-4b2e-a819-5edcd41e2364', '6r14', NULL, NULL, 'M', 1, '18312', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Akimitsu', 'Miku', 'f827d0bc-37eb-40f1-8b00-0ba64d02d2db', '10TL', NULL, NULL, 'F', 1, '240206', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kwon', 'Hayul KDS', 'f83108af-ff32-4820-89a5-395b54841eea', '9SN', NULL, NULL, 'M', 1, '240234', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Joubert', 'Miah', 'f83222ca-9938-48d3-a416-67e28530631e', '8EL', NULL, NULL, 'F', 1, '23106', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Bartlett', 'Zoe', 'f84d5fb9-3cac-47cd-af6c-89f44854e502', '12JH', NULL, NULL, 'F', 1, '33503329', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Owen', 'Oliver', 'f84db06b-6bf3-4e47-a740-56c7b6ae473e', '9BR', NULL, NULL, 'M', 1, '22178', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ramsay', 'Solomon', 'f8678611-b0fc-4cfd-a2ca-d1a0e75d9b04', '2r7', NULL, NULL, 'M', 1, '22329', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Lu', 'Issachar', 'f889f1da-9ca9-4ced-8895-a1f72a3957a4', '7TW', NULL, NULL, 'M', 1, '18313', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Mara', 'Maya', 'f8a1aee0-b5cb-4de5-99c8-c879f9628e61', '5r12', NULL, NULL, 'F', 1, '23202', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Xiong', 'Joy', 'f8c6de88-3b3c-484f-a56c-938b546ed9e5', '12BY', NULL, NULL, 'F', 1, '19043', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Ling', 'Makayla', 'f9283eb5-6937-40e1-bda2-d8fbddf5cb19', '9MD', NULL, NULL, 'F', 1, '240101', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Fyfe', 'Zoe', 'f95fae27-e880-488e-8ff1-c57710f12504', '8EL', NULL, NULL, 'F', 1, '16318', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Dirkze', 'Luke', 'f9920617-8929-4d14-a4c1-c679225a4985', '6r15', NULL, NULL, 'M', 1, '18302', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Caldwell', 'Noah', 'f9997474-addd-4772-a3dc-d1e753d5116d', '11MK', NULL, NULL, 'M', 1, '240029', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Hentschel', 'Josh', 'f9abc99d-513b-42ae-8b06-98c337dd2bc2', '11AL', NULL, NULL, 'M', 1, '20061', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('van Tonder', 'Jake', 'f9aef165-95ee-4f98-a334-f892f45c3b63', '2r5', NULL, NULL, 'M', 1, '22340', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Ballingall', 'Harvey', 'f9da03e8-4da1-4d69-be7e-f20e931dc0d8', '7FZ', NULL, NULL, 'M', 1, '17281', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Kim', 'Taelyn', 'f9e8f391-e632-4f96-9e59-8df08f018e01', '12JH', NULL, NULL, 'F', 1, '22372', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Basiuk', 'Mikhail', 'fa7fe130-2d46-4e3c-9128-aa3d7a1beb15', '13OG', NULL, NULL, 'M', 1, '22153', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Smith', 'Ethan', 'fa8051c1-ebee-4b7d-9e34-c12567b21195', '11JD', NULL, NULL, 'M', 1, '22033', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Owen', 'William', 'fab603f8-acad-4d6c-b205-3ba9bee780c2', '13CI', NULL, NULL, 'M', 1, '22176', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Ni', 'Yunzhuo', 'fac78a87-258a-4ba2-8ee6-75d9353bc178', 'Enrol', NULL, NULL, 'F', 1, '240203', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Neumann', 'Felicia', 'fac7bfd8-0a69-41d9-a414-ae49a2e1f139', '12BT', NULL, NULL, 'F', 1, '240355', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Reid', 'Zealia', 'faf35811-c603-48cc-aff7-62a506a3d9c4', '12BT', NULL, NULL, 'F', 1, '23055', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Ure', 'Reuben', 'fb0ff08e-8648-46f3-b8e0-3aa543b1029d', '9CN', NULL, NULL, 'M', 1, '240167', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Sabey', 'Aria', 'fb318231-661a-40f9-a7a2-48db746de31d', '9FR', NULL, NULL, 'F', 1, '240137', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Kaufuti', 'Ofa', 'fb468ffb-7c72-4d4d-bea4-35b058f77657', '9BR', NULL, NULL, 'F', 1, '22086', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Misa', 'Sisilia', 'fb635f3e-abf2-4344-a37e-9ecb68aac5c6', '11AL', NULL, NULL, 'F', 1, '14227', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Annan', 'Katie', 'fb8913a8-8d35-438f-9dc0-e20b377ce760', '13LH', NULL, NULL, 'F', 1, '33503120', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Cruz Croucher', 'Camila', 'fbcf859f-a5b2-4bcc-afa6-3eaa7ec476a6', '2r7', NULL, NULL, 'F', 1, '22300', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Henderson', 'Emily', 'fc185214-99e3-4a4d-bca5-5999b5313095', '12CG', NULL, NULL, 'F', 1, '19018', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Holah', 'Abby', 'fc1965c4-8bec-4d8f-8fbf-af0b52843027', '4r10', NULL, NULL, 'F', 1, '21210', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Fletcher', 'Austin', 'fc36402d-1387-4dda-a467-755362e5bd72', '7TW', NULL, NULL, 'M', 1, '240065', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Wylie', 'Hunter', 'fc42077c-4808-41f2-85eb-c9ff98e43078', '13NL', NULL, NULL, 'M', 1, '22006', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Wilson', 'Keira', 'fc5d760c-7f61-43d6-95b7-b654df869a1b', '13OG', NULL, NULL, 'F', 1, '33502804', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Bennetts', 'Samuel', 'fcedcec1-3359-4b6f-899b-ea11992d9647', '6r15', NULL, NULL, 'M', 1, '18295', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lok', 'Nelstein', 'fda1a27e-e2bf-44d8-b3f6-79b5bdde5fb0', '4r10', NULL, NULL, 'M', 1, '20236', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Eggers', 'Isaac', 'fdbe4ce7-abfc-4617-ae1a-e12f28620ce8', '5r13', NULL, NULL, 'M', 1, '20219', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Lal', 'Nikhil', 'fdcc4af6-0a8d-40cb-8f9b-5ba7d3eefcb4', '10LN', NULL, NULL, 'M', 1, '17306', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Read', 'Percy', 'fdeb0a8b-db8b-47ae-97b6-4ac99d98c789', '3r8', NULL, NULL, 'M', 1, '21227', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Scoulding', 'Henry', 'fdeedfa2-fcd9-4e48-910e-53bfc96f4367', '8EL', NULL, NULL, 'M', 1, '23046', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Orr', 'Toby', 'fe0f3a46-1a4e-47a9-af5c-4b6b5f3350ed', '11AL', NULL, NULL, 'M', 1, '20109', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34'),
('Le Roux', 'Marne', 'fe851d74-a7a0-4b82-b27e-b894ee2a6c5a', '11HK', NULL, NULL, 'F', 1, '16187', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Chen', 'Alana', 'feafb3f2-3ae7-499b-aff1-3528bec52d62', '13NL', NULL, NULL, 'F', 1, '19153', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:32', '2024-01-18 16:48:32'),
('Manson', 'Zoe', 'fee59d2a-907d-44c5-a276-b0a7e431f203', '12PA', NULL, NULL, 'F', 1, '20166', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:33', '2024-01-18 16:48:33'),
('Yang', 'Jiyu KDS', 'fefe2c57-42f4-4d65-a743-39f63895f018', '10SC', NULL, NULL, 'F', 1, '240257', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:37', '2024-01-18 16:48:37'),
('Shaw', 'Ethan', 'ff2a12c2-2349-4b5d-8d55-894c66ddbcfa', '9FR', NULL, NULL, 'M', 1, '22035', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:35', '2024-01-18 16:48:35'),
('Walsh', 'Gwyneth', 'ff31bf65-c2fd-4163-95ac-2c90280691c0', '10TL', NULL, NULL, 'F', 1, '23024', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:36', '2024-01-18 16:48:36'),
('Pieterse', 'Elme', 'ffc0fd7a-d97d-4617-bc09-6a5745f1c36b', '12ST', NULL, NULL, 'F', 1, '19033', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 16:48:34', '2024-01-18 16:48:34');

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
(8, '9d4e22e1-3f4e-482e-8b6f-166a0030e8ab', NULL, NULL, 'Luke Noble', NULL, '+642102323137', 'luke.noble@outlook.co.nz', 'Luke Noble', NULL, '+642102323137', 'luke.noble@outlook.co.nz', '2023-12-05 09:37:06', '2023-12-05 09:36:07'),
(9, '41d70494-ba94-11ee-aeb8-6eb957879d7f', NULL, 'luke.noble91@hotmail.com', 'Luke Noble', NULL, '+642102323137', 'luke.noble91@hotmail.com', 'Luke Noble', NULL, '+642102323137', 'luke.noble91@hotmail.com', '2024-02-13 12:24:39', '2024-02-13 12:24:39'),
(10, '987aff3b-aeff-4ec6-b8eb-a39633d81e86', NULL, 'noble.luke91@gmail.com', 'Luke Noble', NULL, '02102323137', 'luke.noble91@hotmail.com', 'Luke Noble', NULL, '02102323137', 'luke.noble91@hotmail.com', '2024-03-12 18:17:20', '2024-03-12 18:17:20'),
(11, '380fddf3-93b0-4745-b16a-a826c13c469f', NULL, 'luke.noble91@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-13 19:47:56', '2024-03-13 19:47:56'),
(12, 'd655923a-8b34-4ffc-97d8-ea073f720fca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-13 20:18:04', '2024-03-13 20:18:04'),
(13, 'ccf016e6-740f-45bc-99dc-c88f0160dab2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-13 20:19:57', '2024-03-13 20:19:57');

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
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pacific/Auckland',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`first_name`, `last_name`, `id`, `image`, `email`, `email_verified_at`, `phone`, `password`, `remember_token`, `timezone`, `created_at`, `updated_at`, `deleted_at`) VALUES
('John', 'Smith', '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', 'avatars/Dc1dv4UeuAFCOEOJpIZTojkCk9Z2XtnrbnWe5AUw.jpg', 'j.smith@this.com', '2024-01-18 07:52:07', '02102323135', '$2y$10$m338UxxWXxc1miegFEWRUuuOtvEgDllRDv.GfNOOYgQ0suy/00OkS', NULL, 'Pacific/Auckland', '2023-03-11 16:10:56', '2023-03-11 16:10:56', NULL),
('Luke', 'Noble', '2c3c74d8-bd45-47d8-8333-15d76b76e286', 'user.png', 'luke@this.com', NULL, NULL, '$2y$10$lpITEHy/MpKL/SBOdlsEA.VzwCzrO7gWCDkUYK6VjFsw2E61UMjd6', NULL, 'Pacific/Auckland', '2023-08-28 22:13:44', '2023-08-28 22:13:44', NULL),
('Jane', 'Henderson', '35cd5940-7d32-4752-8f30-667a76c6e0e7', 'user.png', 'jhenderson@this.com', NULL, NULL, '$2y$10$xVjUFuqkJjjHSGH.U8hcP.nTu8gNzT6H3tRoZwcjJ9qW5K5b2HHDK', NULL, 'Pacific/Auckland', '2023-08-29 09:19:10', '2023-08-29 09:19:10', NULL),
('Emma', 'Willson', '434044cf-24f2-4720-815e-4061635b00c2', 'user.png', 'e.willson@this.com', NULL, NULL, '$2y$10$crG446jOXmrOoqFC45a9A.Pbt4Wr3DW3YjGnF5wMFi3yzYnwejFV6', NULL, 'Pacific/Auckland', '2023-08-25 21:42:36', '2023-08-25 21:42:36', NULL),
('Phillip', 'Smith', '57b0ce43-dbb9-4214-81ca-4842e5ce481d', 'user.png', 'p.smith@this.com', NULL, NULL, '$2y$10$pjzigcZUM5J.ZAmoHcX5TekUVW4eIkgyH5WHguuGLzoSqpmprsW7K', NULL, 'Pacific/Auckland', '2023-08-29 09:23:44', '2023-08-29 09:23:44', NULL),
('Luke', 'Noble', '5dbc81ee-cb74-443b-ad81-b460f07a3466', 'user.png', 'luke.noble@outlook.co.nzz', '2024-01-17 12:25:40', '02102323137', '$2y$10$MMu6s4yVjpNdvmqPo6.lKuXYDu1FjUL0n7iTo3/hjA326GW/rbndy', NULL, 'Pacific/Auckland', '2024-01-17 12:24:39', '2024-01-17 12:25:40', NULL),
('Lucy', 'Williams', '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', 'user.png', 'luke.noble@outlook.co.nz', NULL, NULL, '$2y$10$zvRhfGZconwvw/8VowZ1TOPvITAuKgABt3OnSLVzCv7bYZSYclD2G', NULL, 'Pacific/Auckland', '2023-04-03 12:44:44', '2023-04-03 12:44:44', NULL),
('Luke', 'Noble', 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'user.png', 'l.noble@middleton.school.nz', '2024-01-17 19:24:20', '02102323137', '$2y$10$sN0e.Slz0edsUXeUdAhRgu2tYzXrevCLQp2jFBfB33LOUuxRaJFa.', NULL, 'Pacific/Auckland', '2024-01-17 19:24:04', '2024-01-17 19:24:20', NULL),
('Luke', 'Noble', 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'user.png', 'luke.noble91@hotmail.com', '2024-01-17 12:07:30', NULL, '$2y$10$tuFxB9gWGPjk1sHhHhGa6e9ZPOlNl1fV.tOu33d3.QAOETDYkGJ0S', NULL, 'Pacific/Auckland', '2024-01-16 17:16:24', '2024-01-17 12:07:30', NULL),
('Tom', 'Tutor', 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'user.png', 't.tutor@this.com', '2024-01-22 00:40:08', NULL, '$2y$10$EIH5Rm0/IZZRvQF9h8i8TOszG1yhoJFaneYIe5.9cc3X9IO91it5u', NULL, 'Pacific/Auckland', '2023-04-07 14:32:29', '2023-04-07 14:32:29', NULL);

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
(92, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Administrator', '2023-08-23 15:57:13', '2024-01-19 00:40:52', NULL),
(93, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Administrator', '2023-08-24 04:01:02', '2024-01-19 00:40:52', NULL),
(109, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Access', '2023-08-27 22:48:45', '2023-08-27 22:48:45', NULL),
(110, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Access', '2023-08-27 22:48:45', '2023-08-27 22:48:45', NULL),
(112, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Access', '2023-08-27 15:31:59', '2023-08-27 15:31:59', NULL),
(158, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Administrator', '2023-08-23 15:57:13', '2024-02-07 23:04:31', NULL),
(164, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '24851c5c-8748-4877-93b4-3461058a4dc7', 'Administrator', '2024-01-17 13:48:34', '2024-01-19 00:40:52', NULL),
(165, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'f6f99a38-925f-486a-a0bc-a80d4d610181', 'Access', '2024-01-17 19:18:13', '2024-01-17 19:18:13', NULL),
(166, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Access', '2024-01-17 19:20:33', '2024-01-17 19:20:33', NULL),
(171, 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'Administrator', '2024-01-18 15:21:34', '2024-01-18 15:21:34', NULL),
(172, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'Access', '2024-01-21 11:45:59', '2024-01-21 11:45:59', NULL),
(186, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'LESSONS_V', '2024-01-27 13:14:49', '2024-01-27 13:14:49', NULL),
(188, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'INSTRUMENTS_V', '2024-01-27 13:20:17', '2024-01-27 13:20:17', NULL),
(189, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'HIRES_V', '2024-01-27 13:20:37', '2024-01-27 13:20:37', NULL),
(245, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'LESSONS_R', '2024-03-11 11:57:50', '2024-03-11 11:57:50', NULL),
(247, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'LESSON_REQ_C', '2024-03-11 11:57:51', '2024-03-11 11:57:51', NULL),
(248, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'LESSON_REQ_E', '2024-03-11 11:57:52', '2024-03-11 11:57:52', NULL),
(256, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'STUDENTS_C', '2024-03-13 08:41:23', '2024-03-13 08:41:23', NULL),
(257, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'INSTRUMENTS_V', '2024-03-13 08:41:26', '2024-03-13 08:41:26', NULL),
(258, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'INSTRUMENTS_E', '2024-03-13 08:41:26', '2024-03-13 08:41:26', NULL),
(259, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'INSTRUMENTS_C', '2024-03-13 08:41:27', '2024-03-13 08:41:27', NULL),
(260, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'INSTRUMENTS_D', '2024-03-13 08:41:28', '2024-03-13 08:41:28', NULL);

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
(1, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Administrator', '2023-08-22 01:35:44', '2024-03-11 11:10:21'),
(10, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Performing Arts Coordinator', '2023-08-22 01:35:44', '2023-08-27 22:47:11'),
(11, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Tutor', '2023-08-27 15:31:59', '2023-08-27 15:32:33'),
(12, '57b0ce43-dbb9-4214-81ca-4842e5ce481d', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Basic User', '2023-08-30 18:55:46', '2023-08-30 18:55:46'),
(14, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', 'Performing Arts Coordinator', '2023-08-22 01:35:44', '2023-08-27 22:50:10'),
(17, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '24851c5c-8748-4877-93b4-3461058a4dc7', 'Basic User', '2024-01-17 13:48:34', '2024-01-17 13:48:34'),
(18, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'f6f99a38-925f-486a-a0bc-a80d4d610181', 'Basic User', '2024-01-17 19:18:13', '2024-01-17 19:18:13'),
(19, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Activity Hub Administrator', '2024-01-17 19:20:33', '2024-02-13 20:26:39'),
(23, 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'Activity Hub Technical Support', '2024-01-18 15:21:34', '2024-01-18 17:22:43'),
(24, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', 'Basic User', '2024-01-21 11:45:59', '2024-01-21 11:45:59');

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
(14, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2023-08-27 15:31:59', '2023-08-27 15:31:59', NULL),
(17, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', NULL, NULL, NULL),
(20, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '24851c5c-8748-4877-93b4-3461058a4dc7', '2024-01-17 13:48:34', '2024-01-17 13:48:34', NULL),
(21, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', 'f6f99a38-925f-486a-a0bc-a80d4d610181', '2024-01-17 19:18:13', '2024-01-17 19:18:13', NULL),
(22, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', '2024-01-17 19:20:33', '2024-01-17 19:20:33', NULL),
(26, 'a508894a-e114-42e1-bd25-8677eb6ea9d0', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-18 15:21:34', '2024-01-18 15:21:34', NULL),
(27, 'f0e95e72-527f-4d22-9b11-26b3126b7e84', 'fba5ebcc-6e94-4a5e-8a3d-302ae1a489f1', '2024-01-21 11:45:58', '2024-01-21 11:45:58', NULL),
(28, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '3673153d-5f2c-43b5-ac0b-e20d7c12b88a', NULL, NULL, NULL);

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
(1, '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Luke', 'l.noble@middleton.school.nz', '0e95ed', '2024-02-05 14:26:15', '2024-02-05 14:26:15');

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
(18, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Piano', 1, '2024-02-13 12:33:58', '2024-02-13 12:33:58', NULL),
(19, '8a9d72e6-8c4b-43bb-a3f2-21f0d2bf3a6e', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Flute', 1, '2024-02-13 12:33:59', '2024-02-13 12:33:59', NULL),
(20, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Guitar', 1, '2024-02-13 12:34:07', '2024-02-13 12:34:07', NULL),
(21, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Drums', 1, '2024-02-13 12:34:13', '2024-02-13 12:34:13', NULL),
(22, '1c5667a8-3f4d-48fe-b49c-78d36ac80f68', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Guitar', 1, '2024-03-08 14:49:55', '2024-03-08 14:49:55', NULL),
(23, 'd3f20a7c-25e9-4605-857d-d6a9d6a02026', '5f6a486f-ae48-4755-be6c-0d86ef491f68', 'Violin', 1, '2024-03-12 18:24:46', '2024-03-12 18:24:46', NULL);

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
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
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
-- Indexes for table `instrument_hire_agreement_templates`
--
ALTER TABLE `instrument_hire_agreement_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

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
-- Indexes for table `lesson_request_forms_data`
--
ALTER TABLE `lesson_request_forms_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_request_form_id` (`lesson_request_form_id`);

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
-- Indexes for table `school_data`
--
ALTER TABLE `school_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `school_terms`
--
ALTER TABLE `school_terms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `instrument_hires`
--
ALTER TABLE `instrument_hires`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `instrument_states`
--
ALTER TABLE `instrument_states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lesson_attendance`
--
ALTER TABLE `lesson_attendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lesson_notes`
--
ALTER TABLE `lesson_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lesson_requests`
--
ALTER TABLE `lesson_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2101;

--
-- AUTO_INCREMENT for table `student_contacts`
--
ALTER TABLE `student_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `user_positions`
--
ALTER TABLE `user_positions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_schools`
--
ALTER TABLE `user_schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_school_invitations`
--
ALTER TABLE `user_school_invitations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_subjects`
--
ALTER TABLE `user_subjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

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
-- Constraints for table `instrument_hire_agreement_templates`
--
ALTER TABLE `instrument_hire_agreement_templates`
  ADD CONSTRAINT `instrument_hire_agreement_templates_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lessons_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lesson_attendance`
--
ALTER TABLE `lesson_attendance`
  ADD CONSTRAINT `lesson_attendance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lesson_attendance_ibfk_3` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `lesson_request_forms_data`
--
ALTER TABLE `lesson_request_forms_data`
  ADD CONSTRAINT `lesson_request_forms_data_ibfk_1` FOREIGN KEY (`lesson_request_form_id`) REFERENCES `lesson_request_forms` (`id`);

--
-- Constraints for table `school_data`
--
ALTER TABLE `school_data`
  ADD CONSTRAINT `school_data_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `school_terms`
--
ALTER TABLE `school_terms`
  ADD CONSTRAINT `school_terms_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `user_permissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_positions`
--
ALTER TABLE `user_positions`
  ADD CONSTRAINT `user_positions_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `user_positions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
  ADD CONSTRAINT `user_subjects_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `user_subjects_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
