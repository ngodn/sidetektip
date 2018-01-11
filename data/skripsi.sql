-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 11, 2018 at 01:31 AM
-- Server version: 5.7.20
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `contest_id` int(10) UNSIGNED DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AuthAssignment`
--

CREATE TABLE `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AuthItem`
--

CREATE TABLE `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AuthItemChild`
--

CREATE TABLE `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_time` datetime NOT NULL,
  `next_chapter_id` int(10) DEFAULT NULL,
  `first_subchapter_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `name`, `description`, `created_time`, `next_chapter_id`, `first_subchapter_id`) VALUES
(201, 'Chapter 1', 'Pada suatu hari', '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chapters_problems`
--

CREATE TABLE `chapters_problems` (
  `chapter_id` int(10) UNSIGNED NOT NULL,
  `problem_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapters_problems`
--

INSERT INTO `chapters_problems` (`chapter_id`, `problem_id`) VALUES
(201, 801);

-- --------------------------------------------------------

--
-- Table structure for table `chapters_users`
--

CREATE TABLE `chapters_users` (
  `chapter_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapters_users`
--

INSERT INTO `chapters_users` (`chapter_id`, `user_id`, `start_time`, `finish_time`, `status`) VALUES
(201, 14536, NULL, NULL, 0),
(201, 14715, NULL, NULL, 1),
(201, 14716, NULL, NULL, 0),
(201, 14717, NULL, NULL, 0),
(201, 14718, NULL, NULL, 0),
(201, 14719, NULL, NULL, 0),
(201, 14720, NULL, NULL, 0),
(201, 14721, NULL, NULL, 0),
(201, 14722, NULL, NULL, 0),
(201, 14723, NULL, NULL, 0),
(201, 14724, NULL, NULL, 0),
(201, 14725, NULL, NULL, 0),
(201, 14726, NULL, NULL, 0),
(201, 14727, NULL, NULL, 0),
(201, 14728, NULL, NULL, 0),
(201, 14729, NULL, NULL, 0),
(201, 14730, NULL, NULL, 0),
(201, 14731, NULL, NULL, 0),
(201, 14732, NULL, NULL, 0),
(201, 14733, NULL, NULL, 0),
(201, 14734, NULL, NULL, 0),
(201, 14735, NULL, NULL, 0),
(201, 14736, NULL, NULL, 0),
(201, 14737, NULL, NULL, 0),
(201, 14738, NULL, NULL, 0),
(201, 14739, NULL, NULL, 0),
(201, 14740, NULL, NULL, 0),
(201, 14741, NULL, NULL, 0),
(201, 14742, NULL, NULL, 0),
(201, 14743, NULL, NULL, 0),
(201, 14744, NULL, NULL, 0),
(201, 14745, NULL, NULL, 0),
(201, 14746, NULL, NULL, 0),
(201, 14747, NULL, NULL, 0),
(201, 14748, NULL, NULL, 0),
(201, 14749, NULL, NULL, 0),
(201, 14750, NULL, NULL, 0),
(201, 14751, NULL, NULL, 0),
(201, 14752, NULL, NULL, 0),
(201, 14753, NULL, NULL, 0),
(201, 14754, NULL, NULL, 0),
(201, 14755, NULL, NULL, 0),
(201, 14756, NULL, NULL, 0),
(201, 14757, NULL, NULL, 0),
(201, 14758, NULL, NULL, 0),
(201, 14759, NULL, NULL, 0),
(201, 14760, NULL, NULL, 0),
(201, 14761, NULL, NULL, 0),
(201, 14762, NULL, NULL, 0),
(201, 14763, NULL, NULL, 0),
(201, 14764, NULL, NULL, 0),
(201, 14765, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `clarifications`
--

CREATE TABLE `clarifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `contest_id` int(10) UNSIGNED DEFAULT NULL,
  `chapter_id` int(14) UNSIGNED DEFAULT NULL,
  `problem_id` int(10) UNSIGNED DEFAULT NULL,
  `questioner_id` int(11) UNSIGNED NOT NULL,
  `questioned_time` datetime NOT NULL,
  `subject` text COLLATE latin1_general_ci NOT NULL,
  `question` text COLLATE latin1_general_ci NOT NULL,
  `answerer_id` int(11) UNSIGNED DEFAULT NULL,
  `answered_time` datetime DEFAULT NULL,
  `answer` text COLLATE latin1_general_ci,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clustering_option`
--

CREATE TABLE `clustering_option` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `testcase_option` int(11) NOT NULL,
  `method_option` int(11) NOT NULL,
  `hapus_include_option` int(11) NOT NULL,
  `method` varchar(50) NOT NULL,
  `i` varchar(10) DEFAULT NULL,
  `k` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clustering_option`
--

INSERT INTO `clustering_option` (`id`, `contest_id`, `problem_id`, `testcase_option`, `method_option`, `hapus_include_option`, `method`, `i`, `k`) VALUES
(916, 901, 802, 1, 1, 0, 'bisecting_kmeans', '1.00', NULL),
(969, 901, 801, 1, 1, 1, 'average_linkage', '0.95', NULL),
(970, 901, 801, 1, 1, 0, 'average_linkage', '0.95', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clusters`
--

CREATE TABLE `clusters` (
  `id` int(11) NOT NULL,
  `clustering_option_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `clusters` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clusters`
--

INSERT INTO `clusters` (`id`, `clustering_option_id`, `username`, `clusters`) VALUES
(36896, 916, 'user55', 1),
(36897, 916, 'user67', 2),
(36898, 916, 'user65', 3),
(36899, 916, 'user74', 4),
(36900, 916, 'user57', 5),
(36901, 916, 'user69', 6),
(36902, 916, 'user47', 7),
(36903, 916, 'user77', 8),
(36904, 916, 'user64', 9),
(36905, 916, 'user72', 10),
(36906, 916, 'user59', 11),
(36907, 916, 'user79', 12),
(36908, 916, 'user52', 13),
(36909, 916, 'user70', 14),
(36910, 916, 'user50', 15),
(36911, 916, 'user80', 16),
(36912, 916, 'user62', 17),
(36913, 916, 'user75', 18),
(36914, 916, 'user60', 19),
(36915, 916, 'user49', 20),
(36916, 916, 'user54', 21),
(36917, 916, 'user51', 22),
(36918, 916, 'user53', 23),
(36919, 916, 'user66', 24),
(36920, 916, 'user68', 25),
(36921, 916, 'user48', 26),
(36922, 916, 'user46', 27),
(36923, 916, 'user76', 28),
(36924, 916, 'user78', 29),
(36925, 916, 'user61', 30),
(36926, 916, 'user63', 31),
(36927, 916, 'user71', 32),
(36928, 916, 'user73', 33),
(36929, 916, 'user56', 34),
(36930, 916, 'user58', 35),
(39271, 969, 'user5', 1),
(39272, 969, 'user1', 1),
(39273, 969, 'user2', 1),
(39274, 969, 'user3', 1),
(39275, 969, 'user4', 2),
(39276, 969, 'user45', 3),
(39277, 969, 'user43', 3),
(39278, 969, 'user42', 3),
(39279, 969, 'user41', 3),
(39280, 969, 'user44', 4),
(39281, 969, 'user40', 5),
(39282, 969, 'user39', 5),
(39283, 969, 'user38', 5),
(39284, 969, 'user36', 5),
(39285, 969, 'user37', 6),
(39286, 969, 'user35', 7),
(39287, 969, 'user33', 7),
(39288, 969, 'user31', 7),
(39289, 969, 'user34', 8),
(39290, 969, 'user32', 9),
(39291, 969, 'user30', 10),
(39292, 969, 'user28', 10),
(39293, 969, 'user26', 10),
(39294, 969, 'user29', 11),
(39295, 969, 'user27', 12),
(39296, 969, 'user25', 13),
(39297, 969, 'user23', 13),
(39298, 969, 'user22', 13),
(39299, 969, 'user21', 13),
(39300, 969, 'user24', 14),
(39301, 969, 'user20', 15),
(39302, 969, 'user18', 15),
(39303, 969, 'user17', 15),
(39304, 969, 'user16', 15),
(39305, 969, 'user19', 16),
(39306, 969, 'user15', 17),
(39307, 969, 'user13', 17),
(39308, 969, 'user12', 17),
(39309, 969, 'user11', 17),
(39310, 969, 'user14', 18),
(39311, 969, 'user10', 19),
(39312, 969, 'user8', 19),
(39313, 969, 'user7', 19),
(39314, 969, 'user6', 19),
(39315, 969, 'user9', 20),
(39316, 970, 'user5', 1),
(39317, 970, 'user1', 2),
(39318, 970, 'user2', 2),
(39319, 970, 'user3', 2),
(39320, 970, 'user4', 3),
(39321, 970, 'user45', 4),
(39322, 970, 'user44', 5),
(39323, 970, 'user43', 6),
(39324, 970, 'user42', 6),
(39325, 970, 'user41', 6),
(39326, 970, 'user40', 7),
(39327, 970, 'user39', 8),
(39328, 970, 'user38', 8),
(39329, 970, 'user37', 8),
(39330, 970, 'user36', 8),
(39331, 970, 'user35', 9),
(39332, 970, 'user34', 10),
(39333, 970, 'user33', 11),
(39334, 970, 'user31', 11),
(39335, 970, 'user32', 12),
(39336, 970, 'user30', 13),
(39337, 970, 'user29', 14),
(39338, 970, 'user28', 15),
(39339, 970, 'user26', 15),
(39340, 970, 'user27', 16),
(39341, 970, 'user25', 17),
(39342, 970, 'user24', 18),
(39343, 970, 'user23', 19),
(39344, 970, 'user22', 19),
(39345, 970, 'user21', 19),
(39346, 970, 'user20', 20),
(39347, 970, 'user19', 21),
(39348, 970, 'user18', 22),
(39349, 970, 'user17', 22),
(39350, 970, 'user16', 22),
(39351, 970, 'user15', 23),
(39352, 970, 'user13', 23),
(39353, 970, 'user12', 23),
(39354, 970, 'user11', 23),
(39355, 970, 'user14', 24),
(39356, 970, 'user10', 25),
(39357, 970, 'user8', 25),
(39358, 970, 'user7', 25),
(39359, 970, 'user6', 25),
(39360, 970, 'user9', 26);

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contestnews`
--

CREATE TABLE `contestnews` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `contest_id` int(11) UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contests`
--

CREATE TABLE `contests` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `contest_type_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'open, closed, hidden',
  `invitation_type` int(11) NOT NULL DEFAULT '0',
  `configuration` text,
  `span_type` int(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contests`
--

INSERT INTO `contests` (`id`, `owner_id`, `name`, `contest_type_id`, `description`, `start_time`, `end_time`, `status`, `invitation_type`, `configuration`, `span_type`) VALUES
(901, 14536, 'KOM202 Algoritme ', 0, 'blabla', '2017-10-16 07:37:06', '0000-00-00 00:00:00', 1, 0, NULL, 0),
(902, 14536, 'KOM302 BAHASA PEMROGRAMAN', 0, 'ini adalah contoh', '2017-10-16 07:37:31', '0000-00-00 00:00:00', 1, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contests_problems`
--

CREATE TABLE `contests_problems` (
  `contest_id` int(11) NOT NULL,
  `alias` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contests_problems`
--

INSERT INTO `contests_problems` (`contest_id`, `alias`, `problem_id`, `timestamp`, `status`) VALUES
(901, 1, 801, '0000-00-00 00:00:00', 0),
(901, 2, 802, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contests_users`
--

CREATE TABLE `contests_users` (
  `contest_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL,
  `role` int(11) NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `last_page` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contests_users`
--

INSERT INTO `contests_users` (`contest_id`, `user_id`, `status`, `role`, `last_activity`, `register_date`, `last_page`) VALUES
(901, 14536, 0, 1, NULL, NULL, NULL),
(901, 14766, 0, 2, NULL, NULL, NULL),
(901, 14715, 0, 2, NULL, NULL, NULL),
(901, 14717, 0, 2, NULL, NULL, NULL),
(901, 14718, 0, 2, NULL, NULL, NULL),
(901, 14719, 0, 2, NULL, NULL, NULL),
(901, 14720, 0, 2, NULL, NULL, NULL),
(901, 14721, 0, 2, NULL, NULL, NULL),
(901, 14722, 0, 2, NULL, NULL, NULL),
(901, 14723, 0, 2, NULL, NULL, NULL),
(901, 14724, 0, 2, NULL, NULL, NULL),
(901, 14725, 0, 2, NULL, NULL, NULL),
(901, 14726, 0, 2, NULL, NULL, NULL),
(901, 14727, 0, 2, NULL, NULL, NULL),
(901, 14728, 0, 2, NULL, NULL, NULL),
(901, 14729, 0, 2, NULL, NULL, NULL),
(901, 14730, 0, 2, NULL, NULL, NULL),
(901, 14731, 0, 2, NULL, NULL, NULL),
(901, 14732, 0, 2, NULL, NULL, NULL),
(901, 14733, 0, 2, NULL, NULL, NULL),
(901, 14734, 0, 2, NULL, NULL, NULL),
(901, 14735, 0, 2, NULL, NULL, NULL),
(901, 14736, 0, 2, NULL, NULL, NULL),
(901, 14737, 0, 2, NULL, NULL, NULL),
(901, 14738, 0, 2, NULL, NULL, NULL),
(901, 14739, 0, 2, NULL, NULL, NULL),
(901, 14740, 0, 2, NULL, NULL, NULL),
(901, 14741, 0, 2, NULL, NULL, NULL),
(901, 14742, 0, 2, NULL, NULL, NULL),
(901, 14743, 0, 2, NULL, NULL, NULL),
(901, 14744, 0, 2, NULL, NULL, NULL),
(901, 14745, 0, 2, NULL, NULL, NULL),
(901, 14746, 0, 2, NULL, NULL, NULL),
(901, 14747, 0, 2, NULL, NULL, NULL),
(901, 14748, 0, 2, NULL, NULL, NULL),
(901, 14749, 0, 2, NULL, NULL, NULL),
(901, 14750, 0, 2, NULL, NULL, NULL),
(901, 14751, 0, 2, NULL, NULL, NULL),
(901, 14752, 0, 2, NULL, NULL, NULL),
(901, 14753, 0, 2, NULL, NULL, NULL),
(901, 14754, 0, 2, NULL, NULL, NULL),
(901, 14755, 0, 2, NULL, NULL, NULL),
(901, 14756, 0, 2, NULL, NULL, NULL),
(901, 14757, 0, 2, NULL, NULL, NULL),
(901, 14758, 0, 2, NULL, NULL, NULL),
(901, 14759, 0, 2, NULL, NULL, NULL),
(901, 14760, 0, 2, NULL, NULL, NULL),
(901, 14761, 0, 2, NULL, NULL, NULL),
(901, 14762, 0, 2, NULL, NULL, NULL),
(901, 14763, 0, 2, NULL, NULL, NULL),
(901, 14764, 0, 2, NULL, NULL, NULL),
(901, 14765, 0, 2, NULL, NULL, NULL),
(902, 14536, 0, 1, NULL, NULL, NULL),
(901, 14767, 0, 2, NULL, NULL, NULL),
(901, 14768, 0, 2, NULL, NULL, NULL),
(901, 14769, 0, 2, NULL, NULL, NULL),
(901, 14770, 0, 2, NULL, NULL, NULL),
(901, 14771, 0, 2, NULL, NULL, NULL),
(901, 14772, 0, 2, NULL, NULL, NULL),
(901, 14773, 0, 2, NULL, NULL, NULL),
(901, 14774, 0, 2, NULL, NULL, NULL),
(901, 14775, 0, 2, NULL, NULL, NULL),
(901, 14776, 0, 2, NULL, NULL, NULL),
(901, 14777, 0, 2, NULL, NULL, NULL),
(901, 14778, 0, 2, NULL, NULL, NULL),
(901, 14779, 0, 2, NULL, NULL, NULL),
(901, 14780, 0, 2, NULL, NULL, NULL),
(901, 14781, 0, 2, NULL, NULL, NULL),
(901, 14782, 0, 2, NULL, NULL, NULL),
(901, 14783, 0, 2, NULL, NULL, NULL),
(901, 14784, 0, 2, NULL, NULL, NULL),
(901, 14785, 0, 2, NULL, NULL, NULL),
(901, 14786, 0, 2, NULL, NULL, NULL),
(901, 14787, 0, 2, NULL, NULL, NULL),
(901, 14788, 0, 2, NULL, NULL, NULL),
(901, 14789, 0, 2, NULL, NULL, NULL),
(901, 14790, 0, 2, NULL, NULL, NULL),
(901, 14791, 0, 2, NULL, NULL, NULL),
(901, 14792, 0, 2, NULL, NULL, NULL),
(901, 14793, 0, 2, NULL, NULL, NULL),
(901, 14794, 0, 2, NULL, NULL, NULL),
(901, 14795, 0, 2, NULL, NULL, NULL),
(901, 14796, 0, 2, NULL, NULL, NULL),
(901, 14797, 0, 2, NULL, NULL, NULL),
(901, 14798, 0, 2, NULL, NULL, NULL),
(901, 14799, 0, 2, NULL, NULL, NULL),
(901, 14800, 0, 2, NULL, NULL, NULL),
(901, 14801, 0, 2, NULL, NULL, NULL),
(901, 14802, 0, 2, NULL, NULL, NULL),
(901, 14803, 0, 2, NULL, NULL, NULL),
(901, 14804, 0, 2, NULL, NULL, NULL),
(901, 14805, 0, 2, NULL, NULL, NULL),
(901, 14806, 0, 2, NULL, NULL, NULL),
(901, 14807, 0, 2, NULL, NULL, NULL),
(901, 14808, 0, 2, NULL, NULL, NULL),
(901, 14809, 0, 2, NULL, NULL, NULL),
(901, 14810, 0, 2, NULL, NULL, NULL),
(901, 14811, 0, 2, NULL, NULL, NULL),
(901, 14812, 0, 2, NULL, NULL, NULL),
(901, 14813, 0, 2, NULL, NULL, NULL),
(901, 14814, 0, 2, NULL, NULL, NULL),
(901, 14815, 0, 2, NULL, NULL, NULL),
(901, 14716, 0, 2, NULL, NULL, NULL),
(901, 14816, 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contest_logs`
--

CREATE TABLE `contest_logs` (
  `id` int(14) UNSIGNED NOT NULL,
  `contest_id` int(14) UNSIGNED NOT NULL,
  `actor_id` int(14) NOT NULL,
  `action_type` int(11) NOT NULL,
  `time` int(20) NOT NULL,
  `log_content` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contest_types`
--

CREATE TABLE `contest_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(101, 'Groups', 'Pada suatu hari');

-- --------------------------------------------------------

--
-- Table structure for table `groups_users`
--

CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_users`
--

INSERT INTO `groups_users` (`group_id`, `user_id`) VALUES
(101, 14715),
(101, 14716);

-- --------------------------------------------------------

--
-- Table structure for table `info_clear`
--

CREATE TABLE `info_clear` (
  `contest_id` int(10) NOT NULL,
  `admin` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `level` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_lc_utsp`
--

CREATE TABLE `nilai_lc_utsp` (
  `full_name` tinytext,
  `username` varchar(32) DEFAULT NULL,
  `submitter_id` int(10) UNSIGNED DEFAULT NULL,
  `sum( s.score )` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pastebin`
--

CREATE TABLE `pastebin` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plagiarism`
--

CREATE TABLE `plagiarism` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `plagiat` varchar(25) NOT NULL,
  `submitted_time` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `value_testcase` varchar(250) NOT NULL,
  `examiner` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plagiarism`
--

INSERT INTO `plagiarism` (`id`, `contest_id`, `problem_id`, `username`, `plagiat`, `submitted_time`, `note`, `value_testcase`, `examiner`) VALUES
(213, 901, 801, 'user5', '0', '0000-00-00 00:00:00', '', '111111', ''),
(214, 901, 801, 'user1', '0', '0000-00-00 00:00:00', '', '111111', ''),
(215, 901, 801, 'user2', '0', '0000-00-00 00:00:00', '', '111111', ''),
(216, 901, 801, 'user3', '0', '0000-00-00 00:00:00', '', '111111', ''),
(217, 901, 801, 'user4', '0', '0000-00-00 00:00:00', '', '111111', ''),
(218, 901, 801, 'user45', '0', '0000-00-00 00:00:00', '', '111111', ''),
(219, 901, 801, 'user44', '0', '0000-00-00 00:00:00', '', '111111', ''),
(220, 901, 801, 'user43', '0', '0000-00-00 00:00:00', '', '111111', ''),
(221, 901, 801, 'user42', '0', '0000-00-00 00:00:00', '', '111111', ''),
(222, 901, 801, 'user41', '0', '0000-00-00 00:00:00', '', '111111', ''),
(223, 901, 801, 'user40', '0', '0000-00-00 00:00:00', '', '111111', ''),
(224, 901, 801, 'user39', '0', '0000-00-00 00:00:00', '', '111111', ''),
(225, 901, 801, 'user38', '0', '0000-00-00 00:00:00', '', '111111', ''),
(226, 901, 801, 'user37', '0', '0000-00-00 00:00:00', '', '111111', ''),
(227, 901, 801, 'user36', '0', '0000-00-00 00:00:00', '', '111111', ''),
(228, 901, 801, 'user35', '0', '0000-00-00 00:00:00', '', '111111', ''),
(229, 901, 801, 'user34', '0', '0000-00-00 00:00:00', '', '111111', ''),
(230, 901, 801, 'user33', '0', '0000-00-00 00:00:00', '', '111111', ''),
(231, 901, 801, 'user32', '0', '0000-00-00 00:00:00', '', '111111', ''),
(232, 901, 801, 'user31', '0', '0000-00-00 00:00:00', '', '111111', ''),
(233, 901, 801, 'user30', '0', '0000-00-00 00:00:00', '', '111111', ''),
(234, 901, 801, 'user29', '0', '0000-00-00 00:00:00', '', '111111', ''),
(235, 901, 801, 'user28', '0', '0000-00-00 00:00:00', '', '111111', ''),
(236, 901, 801, 'user27', '0', '0000-00-00 00:00:00', '', '111111', ''),
(237, 901, 801, 'user26', '0', '0000-00-00 00:00:00', '', '111111', ''),
(238, 901, 801, 'user25', '0', '0000-00-00 00:00:00', '', '111111', ''),
(239, 901, 801, 'user24', '0', '0000-00-00 00:00:00', '', '111111', ''),
(240, 901, 801, 'user23', '0', '0000-00-00 00:00:00', '', '111111', ''),
(241, 901, 801, 'user22', '0', '0000-00-00 00:00:00', '', '111111', ''),
(242, 901, 801, 'user21', '0', '0000-00-00 00:00:00', '', '111111', ''),
(243, 901, 801, 'user20', '0', '0000-00-00 00:00:00', '', '111111', ''),
(244, 901, 801, 'user19', '0', '0000-00-00 00:00:00', '', '111111', ''),
(245, 901, 801, 'user18', '0', '0000-00-00 00:00:00', '', '111111', ''),
(246, 901, 801, 'user17', '0', '0000-00-00 00:00:00', '', '111111', ''),
(247, 901, 801, 'user16', '0', '0000-00-00 00:00:00', '', '111111', ''),
(248, 901, 801, 'user15', '0', '0000-00-00 00:00:00', '', '111111', ''),
(249, 901, 801, 'user14', '0', '0000-00-00 00:00:00', '', '111111', ''),
(250, 901, 801, 'user13', '0', '0000-00-00 00:00:00', '', '111111', ''),
(251, 901, 801, 'user12', '0', '0000-00-00 00:00:00', '', '111111', ''),
(252, 901, 801, 'user11', '0', '0000-00-00 00:00:00', '', '111111', ''),
(253, 901, 801, 'user10', '0', '0000-00-00 00:00:00', '', '111111', ''),
(254, 901, 801, 'user9', '0', '0000-00-00 00:00:00', '', '111111', ''),
(255, 901, 801, 'user8', '0', '0000-00-00 00:00:00', '', '111111', ''),
(256, 901, 801, 'user7', '0', '0000-00-00 00:00:00', '', '111111', 'grena'),
(257, 901, 801, 'user6', '0', '0000-00-00 00:00:00', '', '111111', 'grena'),
(258, 901, 802, 'user80', '0', '0000-00-00 00:00:00', '', '111111', ''),
(259, 901, 802, 'user79', '0', '0000-00-00 00:00:00', '', '111111', ''),
(260, 901, 802, 'user78', '0', '0000-00-00 00:00:00', '', '111111', ''),
(261, 901, 802, 'user77', '0', '0000-00-00 00:00:00', '', '111111', ''),
(262, 901, 802, 'user76', '0', '0000-00-00 00:00:00', '', '111111', ''),
(263, 901, 802, 'user75', '0', '0000-00-00 00:00:00', '', '111111', ''),
(264, 901, 802, 'user74', '0', '0000-00-00 00:00:00', '', '111111', ''),
(265, 901, 802, 'user73', '0', '0000-00-00 00:00:00', '', '111111', ''),
(266, 901, 802, 'user72', '0', '0000-00-00 00:00:00', '', '111111', ''),
(267, 901, 802, 'user71', '0', '0000-00-00 00:00:00', '', '111111', ''),
(268, 901, 802, 'user70', '0', '0000-00-00 00:00:00', '', '111111', ''),
(269, 901, 802, 'user69', '0', '0000-00-00 00:00:00', '', '111111', ''),
(270, 901, 802, 'user68', '0', '0000-00-00 00:00:00', '', '111111', ''),
(271, 901, 802, 'user67', '0', '0000-00-00 00:00:00', '', '111111', ''),
(272, 901, 802, 'user66', '0', '0000-00-00 00:00:00', '', '111111', ''),
(273, 901, 802, 'user65', '0', '0000-00-00 00:00:00', '', '111111', ''),
(274, 901, 802, 'user64', '0', '0000-00-00 00:00:00', '', '111111', ''),
(275, 901, 802, 'user63', '0', '0000-00-00 00:00:00', '', '111111', ''),
(276, 901, 802, 'user62', '0', '0000-00-00 00:00:00', '', '111111', ''),
(277, 901, 802, 'user61', '0', '0000-00-00 00:00:00', '', '111111', ''),
(278, 901, 802, 'user60', '0', '0000-00-00 00:00:00', '', '111111', ''),
(279, 901, 802, 'user59', '0', '0000-00-00 00:00:00', '', '111111', ''),
(280, 901, 802, 'user58', '0', '0000-00-00 00:00:00', '', '111111', ''),
(281, 901, 802, 'user57', '0', '0000-00-00 00:00:00', '', '111111', ''),
(282, 901, 802, 'user56', '0', '0000-00-00 00:00:00', '', '111111', ''),
(283, 901, 802, 'user55', '0', '0000-00-00 00:00:00', '', '111111', ''),
(284, 901, 802, 'user54', '0', '0000-00-00 00:00:00', '', '111111', ''),
(285, 901, 802, 'user53', '0', '0000-00-00 00:00:00', '', '111111', ''),
(286, 901, 802, 'user52', '0', '0000-00-00 00:00:00', '', '111111', ''),
(287, 901, 802, 'user51', '0', '0000-00-00 00:00:00', '', '111111', ''),
(288, 901, 802, 'user50', '0', '0000-00-00 00:00:00', '', '111111', ''),
(289, 901, 802, 'user49', '0', '0000-00-00 00:00:00', '', '111111', ''),
(290, 901, 802, 'user48', '0', '0000-00-00 00:00:00', '', '111111', ''),
(291, 901, 802, 'user47', '0', '0000-00-00 00:00:00', '', '111111', ''),
(292, 901, 802, 'user46', '0', '0000-00-00 00:00:00', '', '111111', '');

-- --------------------------------------------------------

--
-- Table structure for table `privatemessages`
--

CREATE TABLE `privatemessages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `send_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Storing private messaging';

-- --------------------------------------------------------

--
-- Table structure for table `privatemessages_recipients`
--

CREATE TABLE `privatemessages_recipients` (
  `privatemessage_id` int(10) UNSIGNED NOT NULL,
  `recipient_id` int(10) UNSIGNED NOT NULL,
  `unread` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Storing private messaging recipients';

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE `problems` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `problem_type_id` int(10) UNSIGNED NOT NULL,
  `description` text,
  `token` varchar(32) NOT NULL,
  `visibility` int(11) NOT NULL,
  `available_languages` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Storing problems';

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`id`, `title`, `author_id`, `comment`, `created_date`, `modified_date`, `problem_type_id`, `description`, `token`, `visibility`, `available_languages`) VALUES
(801, 'Sorting', 401, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, '', 0, NULL),
(802, 'Matrix', 401, '', '2017-08-01 00:00:00', '2017-08-02 00:00:00', 0, NULL, '0', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `problemsets`
--

CREATE TABLE `problemsets` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problemsets`
--

INSERT INTO `problemsets` (`id`, `parent_id`, `status`, `created_date`, `modified_date`, `name`, `description`) VALUES
(803, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Problem set', 'Pada suatu malam');

-- --------------------------------------------------------

--
-- Table structure for table `problemsets_problems`
--

CREATE TABLE `problemsets_problems` (
  `problemset_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problemsets_problems`
--

INSERT INTO `problemsets_problems` (`problemset_id`, `problem_id`, `status`, `rank`) VALUES
(803, 802, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `problem_types`
--

CREATE TABLE `problem_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Problem types';

--
-- Dumping data for table `problem_types`
--

INSERT INTO `problem_types` (`id`, `name`, `description`) VALUES
(802, 'Sorting', 'blablabla');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `problem_id` int(11) NOT NULL,
  `submitter_id` int(10) UNSIGNED NOT NULL,
  `contest_id` int(10) UNSIGNED DEFAULT NULL,
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `submitted_time` datetime NOT NULL,
  `submit_content` text NOT NULL,
  `grade_time` datetime DEFAULT NULL,
  `grade_content` text,
  `grade_output` longtext,
  `grade_status` int(11) DEFAULT NULL,
  `verdict` text,
  `score` float NOT NULL,
  `comment` text NOT NULL,
  `file` longblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`id`, `problem_id`, `submitter_id`, `contest_id`, `chapter_id`, `submitted_time`, `submit_content`, `grade_time`, `grade_content`, `grade_output`, `grade_status`, `verdict`, `score`, `comment`, `file`) VALUES
(506140, 801, 14719, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A14.c\",\"source_content\":\"#include <stdio.h>\n#define input \"Masukkan Jumlah Angka\\n\"\n#define masuk \"Masukkan nilai sebanyak %d\\n\"\n#define output \"Urutan dari kecil ke besar :\\n\"\n#define keluar \"%d\\n\" \n\nint main()\n{\n	int array[100], n, c, d, swap;\n\n	printf(input);\n	scanf(\"%d\", &n);\n\n\n	printf(masuk, n);\n	for(c=0;c<n;c+=1)\n		scanf(\"%d\", &array[c]);\n	\n	for(c=0;c<n-1;c++)\n	{\n		for(d=0;d<n-c-1;d++)\n		{\n			if(array[d] > array[d+1])\n			{\n				swap = array[d];\n				array[d] = array[d+1];\n				array[d+1] = swap;\n			}\n		}\n	}\n\n	printf(output);\n\n	for(c=0;c<n;c++)\n		printf(keluar, array[c]);\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', 0x23696e636c756465203c737464696f2e683e0a23646566696e6520696e70757420224d6173756b6b616e204a756d6c616820416e676b615c6e220a23646566696e65206d6173756b20224d6173756b6b616e206e696c616920736562616e79616b2025645c6e220a23646566696e65206f7574707574202255727574616e2064617269206b6563696c206b65206265736172203a5c6e220a23646566696e65206b656c756172202225645c6e22200a0a696e74206d61696e28290a7b0a09696e742061727261795b3130305d2c206e2c20632c20642c20737761703b0a0a097072696e746628696e707574293b0a097363616e6628222564222c20266e293b0a0a0a097072696e7466286d6173756b2c206e293b0a09666f7228633d303b633c6e3b632b3d31290a09097363616e6628222564222c202661727261795b635d293b0a090a09666f7228633d303b633c6e2d313b632b2b290a097b0a0909666f7228643d303b643c6e2d632d313b642b2b290a09097b0a09090969662861727261795b645d203e2061727261795b642b315d290a0909097b0a0909090973776170203d2061727261795b645d3b0a0909090961727261795b645d203d2061727261795b642b315d3b0a0909090961727261795b642b315d203d20737761703b0a0909097d0a09097d0a097d0a0a097072696e7466286f7574707574293b0a0a09666f7228633d303b633c6e3b632b2b290a09097072696e7466286b656c7561722c2061727261795b635d293b0a0a0972657475726e20303b0a7d0a),
(506136, 801, 14715, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A10.c\",\"source_content\":\"#include <stdio.h>\n\nint main()\n{\n	int array[100], n, c, d, swap;\n\n	printf(\"Masukkan Jumlah Angka\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan nilai sebanyak %d\\n\", n);\n	for(c=0;c<n;c++)\n		scanf(\"%d\", &array[c]);\n	\n	for(c=0;c<n-1;c++)\n	{\n		for(d=0;d<n-c-1;d++)\n		{\n			if(array[d] > array[d+1])\n			{\n				swap = array[d];\n				array[d] = array[d+1];\n				array[d+1] = swap;\n			}\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar :\\n\");\n\n	for(c=0;c<n;c++)\n		printf(\"%d\\n\", array[c]);\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', 0x23696e636c756465203c737464696f2e683e0a0a696e74206d61696e28290a7b0a09696e742061727261795b3130305d2c206e2c20632c20642c20737761703b0a0a097072696e746628224d6173756b6b616e204a756d6c616820416e676b615c6e22293b0a097363616e6628222564222c20266e293b0a0a097072696e746628224d6173756b6b616e206e696c616920736562616e79616b2025645c6e222c206e293b0a09666f7228633d303b633c6e3b632b2b290a09097363616e6628222564222c202661727261795b635d293b0a090a09666f7228633d303b633c6e2d313b632b2b290a097b0a0909666f7228643d303b643c6e2d632d313b642b2b290a09097b0a09090969662861727261795b645d203e2061727261795b642b315d290a0909097b0a0909090973776170203d2061727261795b645d3b0a0909090961727261795b645d203d2061727261795b642b315d3b0a0909090961727261795b642b315d203d20737761703b0a0909097d0a09097d0a097d0a0a097072696e7466282255727574616e2064617269206b6563696c206b65206265736172203a5c6e22293b0a0a09666f7228633d303b633c6e3b632b2b290a09097072696e7466282225645c6e222c2061727261795b635d293b0a0a0972657475726e20303b0a7d0a),
(506137, 801, 14716, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A11.c\",\"source_content\":\"#include <stdio.h>\r\n\r\nint main()\r\n{\r\n	int array[100], n, c, d, swap;\r\n\r\n	if(1 == 1) {\r\n		if(1 == 1) {\r\n			if(1 == 1) {\r\n			printf(\"Masukkan Jumlah Angka\\n\");\r\n			scanf(\"%d\", &n);\r\n			}\r\n		}\r\n	}\r\n\r\n	printf(\"Masukkan nilai sebanyak %d\\n\", n);\r\n	for(c=0;c<n;c++)\r\n		scanf(\"%d\", &array[c]);\r\n	\r\n	for(c=0;c<n-1;c++)\r\n	{\r\n		for(d=0;d<n-c-1;d++)\r\n		{\r\n			if(array[d] > array[d+1])\r\n			{\r\n				swap = array[d];\r\n				array[d] = array[d+1];\r\n				array[d+1] = swap;\r\n			}\r\n		}\r\n	}\r\n\r\n	printf(\"Urutan dari kecil ke besar :\\n\");\r\n\r\n	for(c=0;c<n;c++)\r\n		printf(\"%d\\n\", array[c]);\r\n\r\n	return 0;\r\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', 0x23696e636c756465203c737464696f2e683e0a0a696e74206d61696e28290a7b0a09696e742061727261795b3130305d2c206e2c20632c20642c20737761703b0a0a0969662831203d3d203129207b0a090969662831203d3d203129207b0a09090969662831203d3d203129207b0a0909097072696e746628224d6173756b6b616e204a756d6c616820416e676b615c6e22293b0a0909097363616e6628222564222c20266e293b0a0909097d0a09097d0a097d0a0a097072696e746628224d6173756b6b616e206e696c616920736562616e79616b2025645c6e222c206e293b0a09666f7228633d303b633c6e3b632b2b290a09097363616e6628222564222c202661727261795b635d293b0a090a09666f7228633d303b633c6e2d313b632b2b290a097b0a0909666f7228643d303b643c6e2d632d313b642b2b290a09097b0a09090969662861727261795b645d203e2061727261795b642b315d290a0909097b0a0909090973776170203d2061727261795b645d3b0a0909090961727261795b645d203d2061727261795b642b315d3b0a0909090961727261795b642b315d203d20737761703b0a0909097d0a09097d0a097d0a0a097072696e7466282255727574616e2064617269206b6563696c206b65206265736172203a5c6e22293b0a0a09666f7228633d303b633c6e3b632b2b290a09097072696e7466282225645c6e222c2061727261795b635d293b0a0a0972657475726e20303b0a7d),
(506138, 801, 14717, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A12.c\",\"source_content\":\"#include <stdio.h>\r\n\r\nvoid bubble(){\r\n	\r\n}\r\n\r\nvoid sort() {\r\n\r\n}\r\n\r\nvoid cluster() {\r\n	\r\n}\r\n\r\nint main()\r\n{\r\n	int array[100], n, c, d, swap;\r\n\r\n	printf(\"Masukkan Jumlah Angka\\n\");\r\n	scanf(\"%d\", &n);\r\n\r\n\r\n	printf(\"Masukkan nilai sebanyak %d\\n\", n);\r\n	for(c=0;c<n;c++)\r\n		scanf(\"%d\", &array[c]);\r\n	\r\n	for(c=0;c<n-1;c++)\r\n	{\r\n		for(d=0;d<n-c-1;d++)\r\n		{\r\n			if(array[d] > array[d+1])\r\n			{\r\n				swap = array[d];\r\n				array[d] = array[d+1];\r\n				array[d+1] = swap;\r\n			}\r\n		}\r\n	}\r\n\r\n	printf(\"Urutan dari kecil ke besar :\\n\");\r\n\r\n	for(c=0;c<n;c++)\r\n		printf(\"%d\\n\", array[c]);\r\n\r\n	return 0;\r\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', 0x23696e636c756465203c737464696f2e683e0a0a766f696420627562626c6528297b0a090a7d0a0a766f696420736f72742829207b0a0a7d0a0a766f696420636c75737465722829207b0a090a7d0a0a696e74206d61696e28290a7b0a09696e742061727261795b3130305d2c206e2c20632c20642c20737761703b0a0a097072696e746628224d6173756b6b616e204a756d6c616820416e676b615c6e22293b0a097363616e6628222564222c20266e293b0a0a0a097072696e746628224d6173756b6b616e206e696c616920736562616e79616b2025645c6e222c206e293b0a09666f7228633d303b633c6e3b632b2b290a09097363616e6628222564222c202661727261795b635d293b0a090a09666f7228633d303b633c6e2d313b632b2b290a097b0a0909666f7228643d303b643c6e2d632d313b642b2b290a09097b0a09090969662861727261795b645d203e2061727261795b642b315d290a0909097b0a0909090973776170203d2061727261795b645d3b0a0909090961727261795b645d203d2061727261795b642b315d3b0a0909090961727261795b642b315d203d20737761703b0a0909097d0a09097d0a097d0a0a097072696e7466282255727574616e2064617269206b6563696c206b65206265736172203a5c6e22293b0a0a09666f7228633d303b633c6e3b632b2b290a09097072696e7466282225645c6e222c2061727261795b635d293b0a0a0972657475726e20303b0a7d),
(506139, 801, 14718, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A13.c\",\"source_content\":\"#include <stdio.h>\r\n\r\nint main()\r\n{\r\n	int array[100], n, c, d, swap;\r\n\r\n	printf(\"Masukkan Jumlah Angka\\n\");\r\n	scanf(\"%d\", &n);\r\n\r\n\r\n	printf(\"Masukkan nilai sebanyak %d\\n\", n);\r\n	for(c=0;c<n;c+=1)\r\n		scanf(\"%d\", &array[c]);\r\n	\r\n	for(c=0;c<n-1;c+=1)\r\n	{\r\n		for(d=0;d<n-c-1;d+=1)\r\n		{\r\n			if(array[d] > array[d+1])\r\n			{\r\n				swap = array[d];\r\n				array[d] = array[d+1];\r\n				array[d+1] = swap;\r\n			}\r\n		}\r\n	}\r\n\r\n	printf(\"Urutan dari kecil ke besar :\\n\");\r\n\r\n	for(c=0;c<n;c+=1)\r\n		printf(\"%d\\n\", array[c]);\r\n\r\n	return 0;\r\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', 0x23696e636c756465203c737464696f2e683e0a0a696e74206d61696e28290a7b0a09696e742061727261795b3130305d2c206e2c20632c20642c20737761703b0a0a097072696e746628224d6173756b6b616e204a756d6c616820416e676b615c6e22293b0a097363616e6628222564222c20266e293b0a0a0a097072696e746628224d6173756b6b616e206e696c616920736562616e79616b2025645c6e222c206e293b0a09666f7228633d303b633c6e3b632b3d31290a09097363616e6628222564222c202661727261795b635d293b0a090a09666f7228633d303b633c6e2d313b632b3d31290a097b0a0909666f7228643d303b643c6e2d632d313b642b3d31290a09097b0a09090969662861727261795b645d203e2061727261795b642b315d290a0909097b0a0909090973776170203d2061727261795b645d3b0a0909090961727261795b645d203d2061727261795b642b315d3b0a0909090961727261795b642b315d203d20737761703b0a0909097d0a09097d0a097d0a0a097072696e7466282255727574616e2064617269206b6563696c206b65206265736172203a5c6e22293b0a0a09666f7228633d303b633c6e3b632b3d31290a09097072696e7466282225645c6e222c2061727261795b635d293b0a0a0972657475726e20303b0a7d),
(506443, 802, 14794, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B74.c\",\"source_content\":\"#include <stdio.h>\n#include <math.h>\n#define aa for (i = 0;i < k; i++) { for (j = 0;j < k; j++) { scanf(\"%f\", &a[i][j]); } }\n#define bb m = 0; n = 0\n#define cc b[i][j] = 0; if (i != 0 && j != c) { b[m][n] = a[i][j]; if (n < (k - 2)) n++; else { n = 0; m++; }\n#define dd det = det + s * (a[0][c] * determinant(b, k - 1)); s = -1 * s\n#define ee fac[q][p] = pow(-1, q + p) * determinant(b, f - 1)\n#define ff b[i][j] = fac[j][i]\n#define gg inverse[i][j] = b[i][j] / d\n\nfloat determinant(float [][25], float);\nvoid cofactor(float [][25], float);\nvoid transpose(float [][25], float [][25], float);\n\nint main()\n{\n  float a[25][25], k, d;\n  int i, j;\n  printf(\"Enter the order of the Matrix : \");\n  scanf(\"%f\", &k);\n  printf(\"Enter the elements of %.0fX%.0f Matrix : \\n\", k, k);\n  aa;\n  d = determinant(a, k);\n  if (d == 0)\n   printf(\"\\nInverse of Entered Matrix is not possible\\n\");\n  else\n   cofactor(a, k);\n}\n\n/*For calculating Determinant of the Matrix */\nfloat determinant(float a[25][25], float k)\n{\n  float s = 1, det = 0, b[25][25];\n  int i, j, m, n, c;\n  if (k == 1)\n    {\n     return (a[0][0]);\n    }\n  else\n    {\n     det = 0;\n     for (c = 0; c < k; c++)\n       {\n       bb;\n        for (i = 0;i < k; i++)\n          {\n            for (j = 0 ;j < k; j++)\n              {\n                cc;\n                   }\n               }\n             }\n          dd;\n          }\n    }\n\n    return (det);\n}\n\nvoid cofactor(float num[25][25], float f)\n{\n float b[25][25], fac[25][25];\n int p, q, m, n, i, j;\n for (q = 0;q < f; q++)\n {\n   for (p = 0;p < f; p++)\n    {\n     m = 0;\n     n = 0;\n     for (i = 0;i < f; i++)\n     {\n       for (j = 0;j < f; j++)\n        {\n          if (i != q && j != p)\n          {\n            b[m][n] = num[i][j];\n            if (n < (f - 2))\n             n++;\n            else\n             {\n               n = 0;\n               m++;\n               }\n            }\n        }\n      }\n      ee;\n    }\n  }\n  transpose(num, fac, f);\n}\n/*Finding transpose of matrix*/\nvoid transpose(float num[25][25], float fac[25][25], float r)\n{\n  int i, j;\n  float b[25][25], inverse[25][25], d;\n\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n        ff;\n        }\n    }\n  d = determinant(num, r);\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n        gg;\n        }\n    }\n   printf(\"\\n\\n\\nThe inverse of matrix is : \\n\");\n\n   for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n         printf(\"\\t%f\", inverse[i][j]);\n        }\n    printf(\"\\n\");\n     }\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506442, 802, 14793, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B73.c\",\"source_content\":\"#include <stdio.h>\n#include <math.h>\n\nfloat determinant(float [][25], float);\nvoid cofactor(float [][25], float);\nvoid transpose(float [][25], float [][25], float);\n\nint main()\n{\n  float a[25][25], k, d;\n  int i, j;\n  printf(\"Enter the order of the Matrix : \");\n  scanf(\"%f\", &k);\n  printf(\"Enter the elements of %.0fX%.0f Matrix : \\n\", k, k);\n  for (i = 1 - 1 + 1 - 1 ;i < k && k > i; i+=1)\n    {\n     for (j = 1 - 1 + 1 - 1;j < k && k > j; j+=1)\n       {\n        scanf(\"%f\", &a[i][j]);\n        }\n    }\n  d = determinant(a, k);\n  if (d == 0)\n   printf(\"\\nInverse of Entered Matrix is not possible\\n\");\n  else\n   cofactor(a, k);\n}\n\n/*For calculating Determinant of the Matrix */\nfloat determinant(float a[25][25], float k)\n{\n  float s = 1, det = 0, b[25][25];\n  int i, j, m, n, c;\n  if (k == 1)\n    {\n     return (a[0][0]);\n    }\n  else\n    {\n     det = 0;\n     for (c = 1 - 1 + 1 - 1; c < k, c < k; c = c + 1)\n       {\n        m = 0;\n        n = 0;\n        for (i = 1 - 1 + 1 - 1;i < k, i < k; i = i + 1)\n          {\n            for (j = 1 - 1 + 1 - 1 ;j < k, j < k; j = j + 1)\n              {\n                b[i][j] = 0;\n                if (i != 0 && j != c)\n                 {\n                   b[m][n] = a[i][j];\n                   if (n < (k - 2))\n                    n = n + 1;\n                   else\n                    {\n                     n = 0;\n                     m = m + 1;\n                     }\n                   }\n               }\n             }\n          det += s * (a[0][c] * determinant(b, k - 1));\n          s = -1 * s;\n          }\n    }\n\n    return (det);\n}\n\nvoid cofactor(float num[25][25], float f)\n{\n float b[25][25], fac[25][25];\n int p, q, m, n, i, j;\n for (q = 1 - 1 + 1 - 1;q < f || 1 != 1; q+=1)\n {\n   for (p = 1 - 1 + 1 - 1;p < f || 1 != 1; p+=1)\n    {\n     m = 0;\n     n = 0;\n     for (i = 1 - 1 + 1 - 1;i < f || 1 != 1; i+=1)\n     {\n       for (j = 1 - 1 + 1 - 1;j < f || 1 != 1; j+=1)\n        {\n          if (i != q && j != p)\n          {\n            b[m][n] = num[i][j];\n            if (n < (f - 2))\n             n = n + 1;\n            else\n             {\n               n = 0;\n               m = m + 1;\n               }\n            }\n        }\n      }\n      fac[q][p] = pow(-1, q + p) * determinant(b, f - 1);\n    }\n  }\n  transpose(num, fac, f);\n}\n/*Finding transpose of matrix*/\nvoid transpose(float num[25][25], float fac[25][25], float r)\n{\n  int i, j;\n  float b[25][25], inverse[25][25], d;\n\n  for (i = 1 - 1 + 1 - 1;i < r && 1 == 1; i = i + 1)\n    {\n     for (j = 1 - 1 + 1 - 1;j < r && 1 == 1; j = j + 1)\n       {\n         b[i][j] = fac[j][i];\n        }\n    }\n  d = determinant(num, r);\n  for (i = 1 - 1 + 1 - 1;i < r && 1 == 1; i = i + 1)\n    {\n     for (j = 1 - 1 + 1 - 1;j < r && 1 == 1; j = j + 1)\n       {\n        inverse[i][j] = b[i][j] / d;\n        }\n    }\n   printf(\"\\n\\n\\nThe inverse of matrix is : \\n\");\n\n   for (i = 1 - 1 + 1 - 1;i < r && 1 == 1; i = i + 1)\n    {\n     for (j = 1 - 1 + 1 - 1;j < r && 1 == 1; j = j + 1)\n       {\n         printf(\"\\t%f\", inverse[i][j]);\n        }\n    printf(\"\\n\");\n     }\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506441, 802, 14792, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B72.c\",\"source_content\":\"#include <stdio.h>\n#include <math.h>\n\nfloat determinant(float [][25], float);\nvoid cofactor(float [][25], float);\nvoid transpose(float [][25], float [][25], float);\n\nvoid cofactor(float num[25][25], float f)\n{\n float b[25][25], fac[25][25];\n int p, q, m, n, i, j;\n for (q = 0;q < f; q++)\n {\n   for (p = 0;p < f; p++)\n    {\n     m = 0;\n     n = 0;\n     for (i = 0;i < f; i++)\n     {\n       for (j = 0;j < f; j++)\n        {\n          if (i != q && j != p)\n          {\n            b[m][n] = num[i][j];\n            if (n < (f - 2))\n             n++;\n            else\n             {\n               n = 0;\n               m++;\n               }\n            }\n        }\n      }\n      fac[q][p] = pow(-1, q + p) * determinant(b, f - 1);\n    }\n  }\n  transpose(num, fac, f);\n}\n\nint main()\n{\n  float a[25][25], k, d;\n  int i, j;\n  printf(\"Enter the order of the Matrix : \");\n  scanf(\"%f\", &k);\n  printf(\"Enter the elements of %.0fX%.0f Matrix : \\n\", k, k);\n  for (i = 0;i < k; i++)\n    {\n     for (j = 0;j < k; j++)\n       {\n        scanf(\"%f\", &a[i][j]);\n        }\n    }\n  d = determinant(a, k);\n  if (d == 0)\n   printf(\"\\nInverse of Entered Matrix is not possible\\n\");\n  else\n   cofactor(a, k);\n}\n\n/*Finding transpose of matrix*/\nvoid transpose(float num[25][25], float fac[25][25], float r)\n{\n  int i, j;\n  float b[25][25], inverse[25][25], d;\n\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n         b[i][j] = fac[j][i];\n        }\n    }\n  d = determinant(num, r);\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n        inverse[i][j] = b[i][j] / d;\n        }\n    }\n   printf(\"\\n\\n\\nThe inverse of matrix is : \\n\");\n\n   for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n         printf(\"\\t%f\", inverse[i][j]);\n        }\n    printf(\"\\n\");\n     }\n}\n\n/*For calculating Determinant of the Matrix */\nfloat determinant(float a[25][25], float k)\n{\n  float s = 1, det = 0, b[25][25];\n  int i, j, m, n, c;\n  if (k == 1)\n    {\n     return (a[0][0]);\n    }\n  else\n    {\n     det = 0;\n     for (c = 0; c < k; c++)\n       {\n        m = 0;\n        n = 0;\n        for (i = 0;i < k; i++)\n          {\n            for (j = 0 ;j < k; j++)\n              {\n                b[i][j] = 0;\n                if (i != 0 && j != c)\n                 {\n                   b[m][n] = a[i][j];\n                   if (n < (k - 2))\n                    n++;\n                   else\n                    {\n                     n = 0;\n                     m++;\n                     }\n                   }\n               }\n             }\n          det = det + s * (a[0][c] * determinant(b, k - 1));\n          s = -1 * s;\n          }\n    }\n\n    return (det);\n}\n\n\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506440, 802, 14791, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B71.c\",\"source_content\":\"#include <stdio.h>\n#include <math.h>\n\nfloat determinant(float [][25], float);\nvoid cofactor(float [][25], float);\nvoid transpose(float [][25], float [][25], float);\n\nint main()\n{\n  float a[25][25];\n  float k;\n  float d;\n  int i;\n  int j;\n\nif(1 == 1) {\n  if(2 == 2) {\n    if(3 == 3) {\n      if(4 == 4) {\n        if(5 == 5) {\n          printf(\"Enter the order of the Matrix : \");\n          scanf(\"%f\", &k);\n          printf(\"Enter the elements of %.0fX%.0f Matrix : \", k, k);\n          printf(\"\\n\");\n          for (i = 0;i < k; i++)\n            {\n             for (j = 0;j < k; j++)\n              {\n                scanf(\"%f\", &a[i][j]);\n              }\n            }\n        }\n      }\n    }\n  }\n}\n  d = determinant(a, k);\n  if (d == 0)\n   printf(\"\\nInverse of Entered Matrix is not possible\\n\");\n  else\n   cofactor(a, k);\n}\n\n/*For calculating Determinant of the Matrix */\nfloat determinant(float a[25][25], float k)\n{\n  float s = 1;\n  float det = 0;\n  float b[25][25];\n  int i;\n  int j;\n  int m;\n  int n; \n  int c;\n\n  if (k == 1)\n    {\n     return (a[0][0]);\n    }\n  else\n    {\n     det = 0;\n     for (c = 0; c < k; c++)\n       {\n        m = 0;\n        n = 0;\n        c++;\n        c--;\n        k++;\n        k--;\n        for (i = 0;i < k; i++)\n          {\n            i++;\n            i--;\n            for (j = 0 ;j < k; j++)\n              {\n                j++;\n                j--;\n                b[i][j] = 0;\n                if (i != 0 && j != c)\n                 {\n                   b[m][n] = a[i][j];\n                   if (n < (k - 2)) {\n                    n++;\n                    n--;\n                    n++;\n                  } else\n                    {\n                     n = 0;\n                     m++;\n                     m--;\n                     m++;\n                     }\n                   }\n               }\n             }\n          det = det + s * (a[0][c] * determinant(b, k - 1));\n          s = -1 * s;\n          }\n    }\n\n    return (det);\n}\n\nvoid cofactor(float num[25][25], float f)\n{\n float b[25][25];\n float fac[25][25];\n int p;\n int q;\n int m;\n int n;\n int i;\n int j;\n\n for (q = 0;q < f; q++)\n {\n  q = q + 1;\n  q = q - 1;\n   for (p = 0;p < f; p++)\n    {\n     m = 0;\n     n = 0;\n     p = p + 1;\n     p = p - 1;\n     for (i = 0;i < f; i++)\n     {\n      i = i + 1;\n      i = i - 1;\n       for (j = 0;j < f; j++)\n        {\n          j = j + 1;\n          j = j - 1;\n          if (i != q && j != p)\n          {\n            b[m][n] = num[i][j];\n            if (n < (f - 2)) {\n             n++;\n             n = n - 1;\n             n = n + 1;\n           } else\n             {\n               n = 0;\n               m++;\n               m = m - 1;\n               m = m + 1;\n               }\n            }\n        }\n      }\n      fac[q][p] = pow(-1, q + p) * determinant(b, f - 1);\n    }\n  }\n  transpose(num, fac, f);\n}\n/*Finding transpose of matrix*/\nvoid transpose(float num[25][25], float fac[25][25], float r)\n{\n  int i;\n  int j;\n  float b[25][25];\n  float inverse[25][25];\n  float d;\n\nfor(i = 0;i < 1;i++)\n  for(i = 0;i < 1;i++)\n    for(i = 0;i < 1;i++)\n      for(i = 0;i < 1;i++)\n        for(i = 0;i < 1;i++)\n          for(i = 0;i < 1;i++)\n            for(i = 0;i < 1;i++)\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n         b[i][j] = fac[j][i];\n        }\n    }\n\n\n  d = determinant(num, r);\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n        inverse[i][j] = b[i][j] / d;\n        }\n    }\n   printf(\"\\n\\n\\nThe inverse of matrix is : \\n\");\n\n   for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n         printf(\"\\t%f\", inverse[i][j]);\n        }\n    printf(\"\\n\");\n     }\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506439, 802, 14790, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B70.c\",\"source_content\":\"#include <stdio.h>\n#include <math.h>\n\nfloat determinant(float [][25], float);\nvoid cofactor(float [][25], float);\nvoid transpose(float [][25], float [][25], float);\n\nint main()\n{\n  float a[25][25], k, d;\n  int i, j;\n  printf(\"Enter the order of the Matrix : \");\n  scanf(\"%f\", &k);\n  printf(\"Enter the elements of %.0fX%.0f Matrix : \\n\", k, k);\n  for (i = 0;i < k; i++)\n    {\n     for (j = 0;j < k; j++)\n       {\n        scanf(\"%f\", &a[i][j]);\n        }\n    }\n  d = determinant(a, k);\n  if (d == 0)\n   printf(\"\\nInverse of Entered Matrix is not possible\\n\");\n  else\n   cofactor(a, k);\n}\n\n/*For calculating Determinant of the Matrix */\nfloat determinant(float a[25][25], float k)\n{\n  float s = 1, det = 0, b[25][25];\n  int i, j, m, n, c;\n  if (k == 1)\n    {\n     return (a[0][0]);\n    }\n  else\n    {\n     det = 0;\n     for (c = 0; c < k; c++)\n       {\n        m = 0;\n        n = 0;\n        for (i = 0;i < k; i++)\n          {\n            for (j = 0 ;j < k; j++)\n              {\n                b[i][j] = 0;\n                if (i != 0 && j != c)\n                 {\n                   b[m][n] = a[i][j];\n                   if (n < (k - 2))\n                    n++;\n                   else\n                    {\n                     n = 0;\n                     m++;\n                     }\n                   }\n               }\n             }\n          det = det + s * (a[0][c] * determinant(b, k - 1));\n          s = -1 * s;\n          }\n    }\n\n    return (det);\n}\n\nvoid cofactor(float num[25][25], float f)\n{\n float b[25][25], fac[25][25];\n int p, q, m, n, i, j;\n for (q = 0;q < f; q++)\n {\n   for (p = 0;p < f; p++)\n    {\n     m = 0;\n     n = 0;\n     for (i = 0;i < f; i++)\n     {\n       for (j = 0;j < f; j++)\n        {\n          if (i != q && j != p)\n          {\n            b[m][n] = num[i][j];\n            if (n < (f - 2))\n             n++;\n            else\n             {\n               n = 0;\n               m++;\n               }\n            }\n        }\n      }\n      fac[q][p] = pow(-1, q + p) * determinant(b, f - 1);\n    }\n  }\n  transpose(num, fac, f);\n}\n/*Finding transpose of matrix*/\nvoid transpose(float num[25][25], float fac[25][25], float r)\n{\n  int i, j;\n  float b[25][25], inverse[25][25], d;\n\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n         b[i][j] = fac[j][i];\n        }\n    }\n  d = determinant(num, r);\n  for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n        inverse[i][j] = b[i][j] / d;\n        }\n    }\n   printf(\"\\n\\n\\nThe inverse of matrix is : \\n\");\n\n   for (i = 0;i < r; i++)\n    {\n     for (j = 0;j < r; j++)\n       {\n         printf(\"\\t%f\", inverse[i][j]);\n        }\n    printf(\"\\n\");\n     }\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506438, 802, 14789, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B64.c\",\"source_content\":\"#include <stdio.h>\n#include <stdlib.h>\n#define a size_t rows = 3, cols = 5; int **array = create(rows, cols); int **trans = transpose(array, rows, cols)\n#define b print(array, rows, cols); print(trans, cols, rows); destroy(array, rows); destroy(trans, cols)\n#define d array[r] = malloc(cols * sizeof *array[r]); if ( !array[r] ) { destroy(array, r - 1); return NULL; } for ( c = 0; c < cols; ++c ) { array[r][c] = k++; }\n#define e result[r] = malloc(rows * sizeof *result[r]); if ( !result[r] ) { destroy(result, r - 1); return NULL; } for ( c = 0; c < rows; ++c ) { result[r][c] = array[c][r]; }\n#define f for ( r = 0; r < rows; ++r ) { free(array[r]); }\n#define g for ( c = 0; c < cols; ++c ) { printf(\"%2d \", array[r][c]); } putchar(\'\\n\')\n\n\nint **create    (size_t rows, size_t cols );\nvoid  destroy   (int **array, size_t rows);\nint **transpose (const int *const *const array, size_t rows, size_t cols);\nvoid  print     (const int *const *const array, size_t rows, size_t cols);\n\nint main(void)\n{\n  a;\n   b;\n   return 0;\n}\n\nint **create(size_t rows, size_t cols)\n{\n   size_t r, c;\n   int k = 0;\n   int **array = malloc(rows * sizeof *array);\n   if ( array )\n   {\n      for ( r = 0; r < rows; ++r )\n      {\n        d;\n      }\n   }\n   return array;\n}\n\nint **transpose(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   int **result = malloc(cols * sizeof *result);\n   if ( result )\n   {\n      for ( r = 0; r < cols; ++r )\n      {\n         e;\n      }\n   }\n   return result;\n}\n\nvoid destroy(int **array, size_t rows)\n{\n   size_t r;\n   f;\n   free(array);\n}\n\nvoid print(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   for ( r = 0; r < rows; ++r )\n   {\n     g;\n   }\n   putchar(\'\\n\');\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506437, 802, 14788, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B63.c\",\"source_content\":\"#include <stdio.h>\n#include <stdlib.h>\n\nint **create    (size_t rows, size_t cols );\nvoid  destroy   (int **array, size_t rows);\nint **transpose (const int *const *const array, size_t rows, size_t cols);\nvoid  print     (const int *const *const array, size_t rows, size_t cols);\n\nint main(void)\n{\n   size_t rows = 3, cols = 5;\n   int **array = create(rows, cols);\n   int **trans = transpose(array, rows, cols);\n   print(array, rows, cols);\n   print(trans, cols, rows);\n   destroy(array, rows);\n   destroy(trans, cols);\n   return 0;\n}\n\nint **create(size_t rows, size_t cols)\n{\n   size_t r, c;\n   int k = 0;\n   int **array = malloc(rows * sizeof *array);\n   if ( array )\n   {\n      for ( r = 0*0*0*0*0; r < rows && rows > r;r = r + 1 )\n      {\n         array[r] = malloc(cols * sizeof *array[r]);\n         if ( !array[r] )\n         {\n            destroy(array, r - 1);\n            return NULL;\n         }\n         for ( c = 0*0*0*0*0; c < cols && cols > c;c = c + 1 )\n         {\n            array[r][c] = k++;\n         }\n      }\n   }\n   return array;\n}\n\nint **transpose(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   int **result = malloc(cols * sizeof *result);\n   if ( result )\n   {\n      for ( r = 0+0+0+0+0; r < cols || r > cols; r = r + 1 )\n      {\n         result[r] = malloc(rows * sizeof *result[r]);\n         if ( !result[r] )\n         {\n            destroy(result, r - 1);\n            return NULL;\n         }\n         for ( c = 0+0+0+0+0; c < rows || c > cols; c = c + 1 )\n         {\n            result[r][c] = array[c][r];\n         }\n      }\n   }\n   return result;\n}\n\nvoid destroy(int **array, size_t rows)\n{\n   size_t r;\n   for ( r = 1 + 1 - 2; r < rows, r < rows; r = r + 1 )\n   {\n      free(array[r]);\n   }\n   free(array);\n}\n\nvoid print(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   for ( r = 4 - 3 - 1; r < rows || 87 != 87 ; r = r + 1 )\n   {\n      for ( c = 9 - 5 - 4; c < cols || 88 != 88; c = c + 1 )\n      {\n         printf(\"%2d \", array[r][c]);\n      }\n      putchar(\'\\n\');\n   }\n   putchar(\'\\n\');\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506436, 802, 14787, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B62.c\",\"source_content\":\"#include <stdio.h>\n#include <stdlib.h>\n\nint **create    (size_t rows, size_t cols );\nvoid  destroy   (int **array, size_t rows);\nint **transpose (const int *const *const array, size_t rows, size_t cols);\nvoid  print     (const int *const *const array, size_t rows, size_t cols);\n\nvoid destroy(int **array, size_t rows)\n{\n   size_t r;\n   for ( r = 0; r < rows; ++r )\n   {\n      free(array[r]);\n   }\n   free(array);\n}\n\nint main(void)\n{\n   size_t rows = 3, cols = 5;\n   int **array = create(rows, cols);\n   int **trans = transpose(array, rows, cols);\n   print(array, rows, cols);\n   print(trans, cols, rows);\n   destroy(array, rows);\n   destroy(trans, cols);\n   return 0;\n}\n\nint **create(size_t rows, size_t cols)\n{\n   size_t r, c;\n   int k = 0;\n   int **array = malloc(rows * sizeof *array);\n   if ( array )\n   {\n      for ( r = 0; r < rows; ++r )\n      {\n         array[r] = malloc(cols * sizeof *array[r]);\n         if ( !array[r] )\n         {\n            destroy(array, r - 1);\n            return NULL;\n         }\n         for ( c = 0; c < cols; ++c )\n         {\n            array[r][c] = k++;\n         }\n      }\n   }\n   return array;\n}\n\nvoid print(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   for ( r = 0; r < rows; ++r )\n   {\n      for ( c = 0; c < cols; ++c )\n      {\n         printf(\"%2d \", array[r][c]);\n      }\n      putchar(\'\\n\');\n   }\n   putchar(\'\\n\');\n}\n\nint **transpose(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   int **result = malloc(cols * sizeof *result);\n   if ( result )\n   {\n      for ( r = 0; r < cols; ++r )\n      {\n         result[r] = malloc(rows * sizeof *result[r]);\n         if ( !result[r] )\n         {\n            destroy(result, r - 1);\n            return NULL;\n         }\n         for ( c = 0; c < rows; ++c )\n         {\n            result[r][c] = array[c][r];\n         }\n      }\n   }\n   return result;\n}\n\n\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506435, 802, 14786, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B61.c\",\"source_content\":\"#include <stdio.h>\n#include <stdlib.h>\n\nint **create    (size_t rows, size_t cols );\nvoid  destroy   (int **array, size_t rows);\nint **transpose (const int *const *const array, size_t rows, size_t cols);\nvoid  print     (const int *const *const array, size_t rows, size_t cols);\n\nint main(void)\n{\n   size_t rows = 3; \n   size_t cols = 5;\n   int **array = create(rows, cols);\n   int **trans = transpose(array, rows, cols);\n\n   if(2*1 == 2*1) {\n      if(2*2 == 4*1) {\n         if(2*3 == 6*1) {\n            if(2*4 == 8*1) {\n               if(2*5 == 10*1) {\n                  if(2*6 == 12*1) {\n                     if(2*7 == 14*1) {\n                        \n                     }\n                  }\n               }   \n            }\n         }\n      }\n   }\n\n   print(array, rows, cols);\n   print(trans, cols, rows);\n   destroy(array, rows);\n   destroy(trans, cols);\n   return 0;\n}\n\nint **create(size_t rows, size_t cols)\n{\n   size_t r;\n   size_t c;\n   int k = 0;\n   int **array = malloc(rows * sizeof *array);\n   if ( array )\n   {\n      for ( r = 0; r < rows; ++r )\n      {\n         array[r] = malloc(cols * sizeof *array[r]);\n         if ( !array[r] )\n         {\n            destroy(array, r - 1);\n            return NULL;\n         }\n         for ( c = 0; c < cols; ++c )\n         {\n            array[r][c] = k++;\n            c++;\n            c-=1;\n         }\n         r = r + 1;\n         r = r - 1;\n      }\n   }\n   return array;\n}\n\nint **transpose(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r;\n   size_t c;\n   int **result = malloc(cols * sizeof *result);\n   if ( result )\n   {\n      for ( r = 0; r < cols; ++r )\n      {\n         result[r] = malloc(rows * sizeof *result[r]);\n         if ( !result[r] )\n         {\n            destroy(result, r - 1);\n            return NULL;\n         }\n         for ( c = 0; c < rows; ++c )\n         {\n            result[r][c] = array[c][r];\n            c = c + 1;\n            c = c - 1;\n         }\n         r = r + 1;\n         r = r - 1;\n      }\n   }\n   return result;\n}\n\nvoid destroy(int **array, size_t rows)\n{\n   size_t r;\n   for ( r = 0; r < rows; ++r )\n   {\n      free(array[r]);\n      r = r + 2;\n      r = r - 2;\n   }\n   free(array);\n}\n\nvoid print(const int *const *const array, size_t rows, size_t cols)\n{\n   int i;\n   size_t r;\n   size_t c;\n\n   for(i = 0;i < 1;i++)\n      for(i = 1;i < 2;i++)\n         for(i = 2;i < 3;i++)\n            for(i = 3;i < 4;i++)\n               for(i = 4;i < 5;i++)\n                  \n   for ( r = 0; r < rows; ++r )\n   {\n      for ( c = 0; c < cols; ++c )\n      {\n         printf(\"%2d \", array[r][c]);\n      }\n      putchar(\'\\n\');\n   }\n   putchar(\'\\n\');\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506434, 802, 14785, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B60.c\",\"source_content\":\"#include <stdio.h>\n#include <stdlib.h>\n\nint **create    (size_t rows, size_t cols );\nvoid  destroy   (int **array, size_t rows);\nint **transpose (const int *const *const array, size_t rows, size_t cols);\nvoid  print     (const int *const *const array, size_t rows, size_t cols);\n\nint main(void)\n{\n   size_t rows = 3, cols = 5;\n   int **array = create(rows, cols);\n   int **trans = transpose(array, rows, cols);\n   print(array, rows, cols);\n   print(trans, cols, rows);\n   destroy(array, rows);\n   destroy(trans, cols);\n   return 0;\n}\n\nint **create(size_t rows, size_t cols)\n{\n   size_t r, c;\n   int k = 0;\n   int **array = malloc(rows * sizeof *array);\n   if ( array )\n   {\n      for ( r = 0; r < rows; ++r )\n      {\n         array[r] = malloc(cols * sizeof *array[r]);\n         if ( !array[r] )\n         {\n            destroy(array, r - 1);\n            return NULL;\n         }\n         for ( c = 0; c < cols; ++c )\n         {\n            array[r][c] = k++;\n         }\n      }\n   }\n   return array;\n}\n\nint **transpose(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   int **result = malloc(cols * sizeof *result);\n   if ( result )\n   {\n      for ( r = 0; r < cols; ++r )\n      {\n         result[r] = malloc(rows * sizeof *result[r]);\n         if ( !result[r] )\n         {\n            destroy(result, r - 1);\n            return NULL;\n         }\n         for ( c = 0; c < rows; ++c )\n         {\n            result[r][c] = array[c][r];\n         }\n      }\n   }\n   return result;\n}\n\nvoid destroy(int **array, size_t rows)\n{\n   size_t r;\n   for ( r = 0; r < rows; ++r )\n   {\n      free(array[r]);\n   }\n   free(array);\n}\n\nvoid print(const int *const *const array, size_t rows, size_t cols)\n{\n   size_t r, c;\n   for ( r = 0; r < rows; ++r )\n   {\n      for ( c = 0; c < cols; ++c )\n      {\n         printf(\"%2d \", array[r][c]);\n      }\n      putchar(\'\\n\');\n   }\n   putchar(\'\\n\');\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL);
INSERT INTO `submissions` (`id`, `problem_id`, `submitter_id`, `contest_id`, `chapter_id`, `submitted_time`, `submit_content`, `grade_time`, `grade_content`, `grade_output`, `grade_status`, `verdict`, `score`, `comment`, `file`) VALUES
(506433, 802, 14784, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B54.c\",\"source_content\":\"#include <stdio.h>\n#define d printf(\"Enter rows and columns for Matrix A respectively: \"); scanf(\"%d%d\", &m1, &n1); printf(\"Enter rows and columns for Matrix B respectively: \"); scanf(\"%d%d\", &m2, &n2)\n#define e printf(\"Enter elements in Matrix A:\\n\"); for (i = 0; i < m1; i++) for (j = 0; j < n1; j++) { scanf(\"%d\", &a[i][j]); }\n#define f printf(\"\\nEnter elements in Matrix B:\\n\"); for (i = 0; i < m2; i++) for (j = 0; j < n2; j++) { scanf(\"%d\", &b[i][j]); }\n#define g c[i][j] += a[i][k] * b[k][j]; k++; multiply(m1, n1, a, m2, n2, b, c)\n#define h k = 0; j++; multiply(m1, n1, a, m2, n2, b, c)\n#define l j = 0; i++; multiply(m1, n1, a, m2, n2, b, c)\n#define m for (i = 0; i < m1; i++) { for (j = 0; j < n2; j++) { printf(\"%d  \", c[i][j]); } printf(\"\\n\"); }\n\nvoid multiply(int, int, int [][10], int, int, int [][10], int [][10]);\nvoid display(int, int, int[][10]);\n\nint main()\n{\n    int a[10][10], b[10][10], c[10][10] = {0};\n    int m1, n1, m2, n2, i, j, k;\n\n   d;\n    if (n1 != m2)\n    {\n        printf(\"Matrix multiplication not possible.\\n\");\n    }\n    else\n    {\n       e;\n        f;\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n    printf(\"On matrix multiplication of A and B the result is:\\n\");\n    display(m1, n2, c);\n}\n\nvoid multiply (int m1, int n1, int a[10][10], int m2, int n2, int b[10][10], int c[10][10])\n{\n    static int i = 0, j = 0, k = 0;\n\n    if (i >= m1)\n    {\n        return;\n    }\n    else if (i < m1)\n    {\n        if (j < n2)\n        {\n            if (k < n1)\n            {\n                g;\n            }\n          h;\n        }\n        l;\n    }\n}\n\nvoid display(int m1, int n2, int c[10][10])\n{\n    int i, j;\n\n   m;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506432, 802, 14783, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B53.c\",\"source_content\":\"#include <stdio.h>\n\nvoid multiply(int, int, int [][10], int, int, int [][10], int [][10]);\nvoid display(int, int, int[][10]);\n\nint main()\n{\n    int a[10][10], b[10][10], c[10][10] = {0};\n    int m1, n1, m2, n2, i, j, k;\n\n    printf(\"Enter rows and columns for Matrix A respectively: \");\n    scanf(\"%d%d\", &m1, &n1);\n    printf(\"Enter rows and columns for Matrix B respectively: \");\n    scanf(\"%d%d\", &m2, &n2);\n    if (n1 != m2)\n    {\n        printf(\"Matrix multiplication not possible.\\n\");\n    }\n    else\n    {\n        printf(\"Enter elements in Matrix A:\\n\");\n        for (i = (6+7) - 13; i < m1, m1 > i; i+=1)\n        for (j = 20 - (17+3); j < n1, n1 > j; j+=1)\n        {\n            scanf(\"%d\", &a[i][j]);\n        }\n        printf(\"\\nEnter elements in Matrix B:\\n\");\n        for (i = 10*0; i < m2 && m2 > i; i = i + 1)\n        for (j = 11*0; j < n2 && n2 > j; j = j + 1)\n        {\n            scanf(\"%d\", &b[i][j]);\n        }\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n    printf(\"On matrix multiplication of A and B the result is:\\n\");\n    display(m1, n2, c);\n}\n\nvoid multiply (int m1, int n1, int a[10][10], int m2, int n2, int b[10][10], int c[10][10])\n{\n    static int i = 0, j = 0, k = 0;\n\n    if (i >= m1)\n    {\n        return;\n    }\n    else if (i < m1)\n    {\n        if (j < n2)\n        {\n            if (k < n1)\n            {\n                c[i][j] = c[i][j] + a[i][k] * b[k][j];\n                k = k + 1;\n                multiply(m1, n1, a, m2, n2, b, c);\n            }\n            k = 0;\n            j = j + 1;\n            multiply(m1, n1, a, m2, n2, b, c);\n        }\n        j = 0;\n        i = i + 1;\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n}\n\nvoid display(int m1, int n2, int c[10][10])\n{\n    int i, j;\n\n    for (i = 4 - 4; i < m1 || i < m1; i = i + 1)\n    {\n        for (j = 3 - 3; j < n2 || j < n2; j = j + 1)\n        {\n            printf(\"%d  \", c[i][j]);\n        }\n        printf(\"\\n\");\n    }\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506431, 802, 14782, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B52.c\",\"source_content\":\"#include <stdio.h>\n\nvoid multiply(int, int, int [][10], int, int, int [][10], int [][10]);\nvoid display(int, int, int[][10]);\n\nvoid display(int m1, int n2, int c[10][10])\n{\n    int i, j;\n\n    for (i = 0; i < m1; i++)\n    {\n        for (j = 0; j < n2; j++)\n        {\n            printf(\"%d  \", c[i][j]);\n        }\n        printf(\"\\n\");\n    }\n}\n\nvoid multiply (int m1, int n1, int a[10][10], int m2, int n2, int b[10][10], int c[10][10])\n{\n    static int i = 0, j = 0, k = 0;\n\n    if (i >= m1)\n    {\n        return;\n    }\n    else if (i < m1)\n    {\n        if (j < n2)\n        {\n            if (k < n1)\n            {\n                c[i][j] += a[i][k] * b[k][j];\n                k++;\n                multiply(m1, n1, a, m2, n2, b, c);\n            }\n            k = 0;\n            j++;\n            multiply(m1, n1, a, m2, n2, b, c);\n        }\n        j = 0;\n        i++;\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n}\n\nint main()\n{\n    int a[10][10], b[10][10], c[10][10] = {0};\n    int m1, n1, m2, n2, i, j, k;\n\n    printf(\"Enter rows and columns for Matrix A respectively: \");\n    scanf(\"%d%d\", &m1, &n1);\n    printf(\"Enter rows and columns for Matrix B respectively: \");\n    scanf(\"%d%d\", &m2, &n2);\n    if (n1 != m2)\n    {\n        printf(\"Matrix multiplication not possible.\\n\");\n    }\n    else\n    {\n        printf(\"Enter elements in Matrix A:\\n\");\n        for (i = 0; i < m1; i++)\n        for (j = 0; j < n1; j++)\n        {\n            scanf(\"%d\", &a[i][j]);\n        }\n        printf(\"\\nEnter elements in Matrix B:\\n\");\n        for (i = 0; i < m2; i++)\n        for (j = 0; j < n2; j++)\n        {\n            scanf(\"%d\", &b[i][j]);\n        }\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n    printf(\"On matrix multiplication of A and B the result is:\\n\");\n    display(m1, n2, c);\n}\n\n\n\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506430, 802, 14781, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B51.c\",\"source_content\":\"#include <stdio.h>\n\nvoid multiply(int, int, int [][10], int, int, int [][10], int [][10]);\nvoid display(int, int, int[][10]);\n\nint main()\n{\n    int a[10][10];\n    int b[10][10];\n    int c[10][10] = {0};\n    int m1;\n    int n1; \n    int m2;\n    int n2; \n    int i;\n    int j; \n    int k;\n\n    if(99 == 99) {\n        if(98 != 97) {\n            if(96 == 96) {\n                if(95 != 94) {\n                    if(93 == 93) {\n                        if(92 != 91) {\n                            if(90 == 90) {\n                                printf(\"Enter rows and columns for Matrix A respectively: \");\n                                scanf(\"%d%d\", &m1, &n1);\n                                printf(\"Enter rows and columns for Matrix B respectively: \");\n                                scanf(\"%d%d\", &m2, &n2);\n                            }\n                        }\n                    }\n                }\n            }\n        }\n    }\n\n    if (n1 != m2)\n    {\n        printf(\"Matrix multiplication not possible.\\n\");\n    }\n    else\n    {\n        for(i = 10;i < 11;i++) \n            for(i = 11;i < 12;i++) \n                for(i = 12;i < 13;i++) \n                    for(i = 13;i < 14;i++) \n                        for(i = 14;i < 15;i++) \n                            printf(\"Enter elements in Matrix A:\\n\");\n                            for (i = 0; i < m1; i++)\n                            for (j = 0; j < n1; j++)\n                            {\n                                scanf(\"%d\", &a[i][j]);\n                            }\n                            printf(\"\\nEnter elements in Matrix B:\\n\");\n                            for (i = 0; i < m2; i++)\n                            for (j = 0; j < n2; j++)\n                            {\n                                scanf(\"%d\", &b[i][j]);\n                            }\n                            multiply(m1, n1, a, m2, n2, b, c);    \n    }\n    printf(\"On matrix multiplication of A and B the result is:\\n\");\n    display(m1, n2, c);\n}\n\nvoid multiply (int m1, int n1, int a[10][10], int m2, int n2, int b[10][10], int c[10][10])\n{\n    static int i = 0, j = 0, k = 0;\n\n    if (i >= m1)\n    {\n        return;\n    }\n    else if (i < m1)\n    {\n        if (j < n2)\n        {\n            if (k < n1)\n            {\n                c[i][j] += a[i][k] * b[k][j];\n                k++;\n                k--;\n                k++;\n                multiply(m1, n1, a, m2, n2, b, c);\n            }\n            k = 0;\n            j++;\n            j--;\n            j++;\n            multiply(m1, n1, a, m2, n2, b, c);\n        }\n        j = 0;\n        i++;\n        i--;\n        i++;\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n}\n\nvoid display(int m1, int n2, int c[10][10])\n{\n    int i;\n    int j;\n\n    for (i = 0; i < m1; i++)\n    {\n        for (j = 0; j < n2; j++)\n        {\n            printf(\"%d  \", c[i][j]);\n        }\n        printf(\"\\n\");\n    }\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506429, 802, 14780, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B50.c\",\"source_content\":\"#include <stdio.h>\n\nvoid multiply(int, int, int [][10], int, int, int [][10], int [][10]);\nvoid display(int, int, int[][10]);\n\nint main()\n{\n    int a[10][10], b[10][10], c[10][10] = {0};\n    int m1, n1, m2, n2, i, j, k;\n\n    printf(\"Enter rows and columns for Matrix A respectively: \");\n    scanf(\"%d%d\", &m1, &n1);\n    printf(\"Enter rows and columns for Matrix B respectively: \");\n    scanf(\"%d%d\", &m2, &n2);\n    if (n1 != m2)\n    {\n        printf(\"Matrix multiplication not possible.\\n\");\n    }\n    else\n    {\n        printf(\"Enter elements in Matrix A:\\n\");\n        for (i = 0; i < m1; i++)\n        for (j = 0; j < n1; j++)\n        {\n            scanf(\"%d\", &a[i][j]);\n        }\n        printf(\"\\nEnter elements in Matrix B:\\n\");\n        for (i = 0; i < m2; i++)\n        for (j = 0; j < n2; j++)\n        {\n            scanf(\"%d\", &b[i][j]);\n        }\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n    printf(\"On matrix multiplication of A and B the result is:\\n\");\n    display(m1, n2, c);\n}\n\nvoid multiply (int m1, int n1, int a[10][10], int m2, int n2, int b[10][10], int c[10][10])\n{\n    static int i = 0, j = 0, k = 0;\n\n    if (i >= m1)\n    {\n        return;\n    }\n    else if (i < m1)\n    {\n        if (j < n2)\n        {\n            if (k < n1)\n            {\n                c[i][j] += a[i][k] * b[k][j];\n                k++;\n                multiply(m1, n1, a, m2, n2, b, c);\n            }\n            k = 0;\n            j++;\n            multiply(m1, n1, a, m2, n2, b, c);\n        }\n        j = 0;\n        i++;\n        multiply(m1, n1, a, m2, n2, b, c);\n    }\n}\n\nvoid display(int m1, int n2, int c[10][10])\n{\n    int i, j;\n\n    for (i = 0; i < m1; i++)\n    {\n        for (j = 0; j < n2; j++)\n        {\n            printf(\"%d  \", c[i][j]);\n        }\n        printf(\"\\n\");\n    }\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506428, 802, 14779, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B44.c\",\"source_content\":\"#include <stdio.h>\n#define f int a[3][3],i,j; float determinant=0\n#define b printf(\"Enter the 9 elements of matrix:\\n\"); for(i=0;i<3;i++) for(j=0;j<3;j++) scanf(\"%d\",&a[i][j])\n#define c printf(\"The matrix is\\n\"); for(i=0;i<3;i++){ printf(\"\\n\"); for(j=0;j<3;j++) printf(\"%d\\t\",a[i][j]); }\n#define d for(i=0;i<3;i++) determinant = determinant + (a[0][i]*(a[1][(i+1)%3]*a[2][(i+2)%3] - a[1][(i+2)%3]*a[2][(i+1)%3]))\n#define e  printf(\"\\nInverse of matrix is:\\n\\n\"); for(i=0;i<3;i++){ for(j=0;j<3;j++) printf(\"%.2f\\t\",((a[(i+1)%3][(j+1)%3] * a[(i+2)%3][(j+2)%3]) - (a[(i+1)%3][(j+2)%3]*a[(i+2)%3][(j+1)%3]))/ determinant); printf(\"\\n\"); }\n\nint main(){\n\n f;\n\n b;\n\n  c;\n\n d;\n\n  e;\n\n   return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506427, 802, 14778, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B43.c\",\"source_content\":\"#include <stdio.h>\n\nint main(){\n\n  int a[3][3],i,j;\n  float determinant=0;\n\n  printf(\"Enter the 9 elements of matrix:\\n\");\n  for(i = 9*0;i < (4-1);i = i + 1)\n      for(j = 10*0;j < (5-2);j = j + 1)\n           scanf(\"%d\",&a[i][j]);\n\n  printf(\"The matrix is\\n\");\n  for(i = 8*2*0;i < 3 && i < 3;i++, i--, i++){\n      printf(\"\\n\");\n      for(j = 7*6*0;j < 3 && j < 3;j++, j++, j--)\n           printf(\"%d\\t\",a[i][j]);\n  }\n\n  for(i = 99 - 99;i < 3 && 3 > i;i = i + (4*3-11))\n      determinant = determinant + (a[0][i]*(a[1][(i+1)%3]*a[2][(i+2)%3] - a[1][(i+2)%3]*a[2][(i+1)%3]));\n\n   printf(\"\\nInverse of matrix is:\\n\\n\");\n   for(i = 0 + 0;i < 3 || 3 < 2;i+=1, i-=2, i+=2){\n      for(j = 0 + 0;j < 3 || 4 < 2;j+=1, j+=2, j-=2)\n           printf(\"%.2f\\t\",((a[(i+1)%3][(j+1)%3] * a[(i+2)%3][(j+2)%3]) - (a[(i+1)%3][(j+2)%3]*a[(i+2)%3][(j+1)%3]))/ determinant);\n       printf(\"\\n\");\n   }\n\n   return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506426, 802, 14777, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B42.c\",\"source_content\":\"#include <stdio.h>\n\nvoid inverse() {\n\n}\n\nvoid matrix() {\n\n}\n\nvoid multiply() {\n\n}\n\nvoid join() {\n\n}\n\nint main(){\n\n  int a[3][3],i,j;\n  float determinant=0;\n\n  printf(\"Enter the 9 elements of matrix:\\n\");\n  for(i=0;i<3;i++)\n      for(j=0;j<3;j++)\n           scanf(\"%d\",&a[i][j]);\n\n  printf(\"The matrix is\\n\");\n  for(i=0;i<3;i++){\n      printf(\"\\n\");\n      for(j=0;j<3;j++)\n           printf(\"%d\\t\",a[i][j]);\n  }\n\n  for(i=0;i<3;i++)\n      determinant = determinant + (a[0][i]*(a[1][(i+1)%3]*a[2][(i+2)%3] - a[1][(i+2)%3]*a[2][(i+1)%3]));\n\n   printf(\"\\nInverse of matrix is:\\n\\n\");\n   for(i=0;i<3;i++){\n      for(j=0;j<3;j++)\n           printf(\"%.2f\\t\",((a[(i+1)%3][(j+1)%3] * a[(i+2)%3][(j+2)%3]) - (a[(i+1)%3][(j+2)%3]*a[(i+2)%3][(j+1)%3]))/ determinant);\n       printf(\"\\n\");\n   }\n\n   return 0;\n}\n\nvoid php() {\n\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506425, 802, 14776, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B41.c\",\"source_content\":\"#include <stdio.h>\n\nint main(){\n\n  int a[3][3];\n  int i;\n  int j;\n  int k;\n  int l;\n  int m;\n  float determinant=0;\n\nif(20 != 19) {\n  if(19 != 18) {\n    if(18 != 17) {\n      if(17 != 16) {\n        if(16 != 15) {\n           printf(\"Enter the 9 elements of matrix:\\n\");\n              for(i=0;i<3;i++)\n                for(j=0;j<3;j++)\n                     scanf(\"%d\",&a[i][j]);\n\n        }\n      }\n    }\n  }\n}\n\n  for(i = 20;i > 19;i--) {\n    for(i = 19;i > 18;i--) {\n      for(i = 18;i > 17;i--) {\n        for(i = 17;i > 16;i--) {\n          for(i = 16;i > 15;i--) {\n             printf(\"The matrix is\\n\");\n              for(i=0;i<3;i++){\n                  printf(\"\\n\");\n                  for(j=0;j<3;j++)\n                       printf(\"%d\\t\",a[i][j]);\n              }\n\n              for(i=0;i<3;i++)\n                  determinant = determinant + (a[0][i]*(a[1][(i+1)%3]*a[2][(i+2)%3] - a[1][(i+2)%3]*a[2][(i+1)%3]));\n          }\n        }\n      }\n    }\n  }\n\n \n\n   printf(\"\\nInverse of matrix is:\\n\\n\");\n   for(i=0;i<3;i++){\n      for(j=0;j<3;j++)\n           printf(\"%.2f\\t\",((a[(i+1)%3][(j+1)%3] * a[(i+2)%3][(j+2)%3]) - (a[(i+1)%3][(j+2)%3]*a[(i+2)%3][(j+1)%3]))/ determinant);\n           printf(\"\\n\");\n           i++;\n           i+=3;\n           i-=4;\n           j++;\n           j--;\n   }\n\n   return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506424, 802, 14775, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B40.c\",\"source_content\":\"#include <stdio.h>\n\nint main(){\n\n  int a[3][3],i,j;\n  float determinant=0;\n\n  printf(\"Enter the 9 elements of matrix:\\n\");\n  for(i=0;i<3;i++)\n      for(j=0;j<3;j++)\n           scanf(\"%d\",&a[i][j]);\n\n  printf(\"The matrix is\\n\");\n  for(i=0;i<3;i++){\n      printf(\"\\n\");\n      for(j=0;j<3;j++)\n           printf(\"%d\\t\",a[i][j]);\n  }\n\n  for(i=0;i<3;i++)\n      determinant = determinant + (a[0][i]*(a[1][(i+1)%3]*a[2][(i+2)%3] - a[1][(i+2)%3]*a[2][(i+1)%3]));\n\n   printf(\"\\nInverse of matrix is:\\n\\n\");\n   for(i=0;i<3;i++){\n      for(j=0;j<3;j++)\n           printf(\"%.2f\\t\",((a[(i+1)%3][(j+1)%3] * a[(i+2)%3][(j+2)%3]) - (a[(i+1)%3][(j+2)%3]*a[(i+2)%3][(j+1)%3]))/ determinant);\n       printf(\"\\n\");\n   }\n\n   return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506423, 802, 14774, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B34.c\",\"source_content\":\"#include <stdio.h>\n#define a int firstMatrix[10][10], secondMatrix[10][10], mult[10][10], rowFirst, columnFirst, rowSecond, columnSecond, i, j, k\n#define b printf(\"Enter rows and column for first matrix: \"); scanf(\"%d %d\", &rowFirst, &columnFirst); printf(\"Enter rows and column for second matrix: \"); scanf(\"%d %d\", &rowSecond, &columnSecond)\n#define c printf(\"Error! column of first matrix not equal to row of second.\\n\"); printf(\"Enter rows and column for first matrix: \"); scanf(\"%d%d\", &rowFirst, &columnFirst); printf(\"Enter rows and column for second matrix: \"); scanf(\"%d%d\", &rowSecond, &columnSecond)\n#define d int i, j; printf(\"\\nEnter elements of matrix 1:\\n\"); for(i = 0; i < rowFirst; ++i) { for(j = 0; j < columnFirst; ++j) { printf(\"Enter elements a%d%d: \", i + 1, j + 1); scanf(\"%d\", &firstMatrix[i][j]); } }\n#define e printf(\"\\nEnter elements of matrix 2:\\n\"); for(i = 0; i < rowSecond; ++i) { for(j = 0; j < columnSecond; ++j) { printf(\"Enter elements b%d%d: \", i + 1, j + 1); scanf(\"%d\", &secondMatrix[i][j]); } }\n#define f for(i = 0; i < rowFirst; ++i) { for(j = 0; j < columnSecond; ++j) { mult[i][j] = 0; } }\n#define g for(i = 0; i < rowFirst; ++i) { for(j = 0; j < columnSecond; ++j) { for(k=0; k<columnFirst; ++k) { mult[i][j] += firstMatrix[i][k] * secondMatrix[k][j]; } } }\n#define h int i, j; printf(\"\\nOutput Matrix:\\n\"); for(i = 0; i < rowFirst; ++i) { for(j = 0; j < columnSecond; ++j) { printf(\"%d  \", mult[i][j]); if(j == columnSecond - 1) printf(\"\\n\\n\"); } }\n\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int multResult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid display(int mult[][10], int rowFirst, int columnSecond);\n\nint main()\n{\n	a;\n\n	b;\n\n	// If colum of first matrix in not equal to row of second matrix, asking user to enter the size of matrix again.\n	while (columnFirst != rowSecond)\n	{\n		c;\n	}\n\n	// Function to take matrices data\n        enterData(firstMatrix, secondMatrix, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to multiply two matrices.\n        multiplyMatrices(firstMatrix, secondMatrix, mult, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to display resultant matrix after multiplication.\n        display(mult, rowFirst, columnSecond);\n\n	return 0;\n}\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	d;\n\n	e;\n}\n\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int mult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j, k;\n\n	// Initializing elements of matrix mult to 0.\n	f;\n\n	// Multiplying matrix firstMatrix and secondMatrix and storing in array mult.\n	g;\n}\n\nvoid display(int mult[][10], int rowFirst, int columnSecond)\n{\n	h;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506422, 802, 14773, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B33.c\",\"source_content\":\"#include <stdio.h>\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int multResult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid display(int mult[][10], int rowFirst, int columnSecond);\n\nint main()\n{\n	int firstMatrix[10][10], secondMatrix[10][10], mult[10][10], rowFirst, columnFirst, rowSecond, columnSecond, i, j, k;\n\n	printf(\"Enter rows and column for first matrix: \");\n	scanf(\"%d %d\", &rowFirst, &columnFirst);\n\n	printf(\"Enter rows and column for second matrix: \");\n	scanf(\"%d %d\", &rowSecond, &columnSecond);\n\n	// If colum of first matrix in not equal to row of second matrix, asking user to enter the size of matrix again.\n	while (columnFirst != rowSecond || 0 > 1)\n	{\n		printf(\"Error! column of first matrix not equal to row of second.\\n\");\n		printf(\"Enter rows and column for first matrix: \");\n		scanf(\"%d%d\", &rowFirst, &columnFirst);\n		printf(\"Enter rows and column for second matrix: \");\n		scanf(\"%d%d\", &rowSecond, &columnSecond);\n	}\n\n	// Function to take matrices data\n        enterData(firstMatrix, secondMatrix, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to multiply two matrices.\n        multiplyMatrices(firstMatrix, secondMatrix, mult, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to display resultant matrix after multiplication.\n        display(mult, rowFirst, columnSecond);\n\n	return 0;\n}\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nEnter elements of matrix 1:\\n\");\n	for(i = (9*5) - (30+15);i < rowFirst && 9 == 9;i = i + 1)\n	{\n		for(j = (20*5) - (25*4);j < columnFirst && 3 == 3;j = j + 1)\n		{\n			printf(\"Enter elements a%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &firstMatrix[i][j]);\n		}\n	}\n\n	printf(\"\\nEnter elements of matrix 2:\\n\");\n	for(i = 3 - 3 + 3 - 3;i < rowSecond && rowSecond > i;i+=1)\n	{\n		for(j = 1 - 1 + 1 - 1;j < columnSecond && columnSecond > j;j+=1)\n		{\n			printf(\"Enter elements b%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &secondMatrix[i][j]);\n		}\n	}\n}\n\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int mult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j, k;\n\n	// Initializing elements of matrix mult to 0.\n	for(i = 0; i < rowFirst || 0 == 2;i++)\n	{\n		for(j = 0; j < columnSecond || 2 == 0;j++)\n		{\n			mult[i][j] = 0;\n		}\n	}\n\n	// Multiplying matrix firstMatrix and secondMatrix and storing in array mult.\n	for(i =  - 6 + 6; i < rowFirst, rowFirst > i;i+=1)\n	{\n		for(j = - 7 + 7; j < columnSecond, columnSecond > j;j+=1)\n		{\n			for(k = - 8 + 8;k < columnFirst, columnFirst > k;k+=1)\n			{\n				mult[i][j] = mult[i][j] + (firstMatrix[i][k] * secondMatrix[k][j]);\n			}\n		}\n	}\n}\n\nvoid display(int mult[][10], int rowFirst, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nOutput Matrix:\\n\");\n	for(i = 0 * 0; i < rowFirst && 1 == 1;i = i + 1)\n	{\n		for(j = 0 * 0; j < columnSecond && 2 == 2;j = j + 1)\n		{\n			printf(\"%d  \", mult[i][j]);\n			if(j == columnSecond - 1)\n				printf(\"\\n\\n\");\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506421, 802, 14772, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B32.c\",\"source_content\":\"#include <stdio.h>\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int multResult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid display(int mult[][10], int rowFirst, int columnSecond);\n\nvoid display(int mult[][10], int rowFirst, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nOutput Matrix:\\n\");\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			printf(\"%d  \", mult[i][j]);\n			if(j == columnSecond - 1)\n				printf(\"\\n\\n\");\n		}\n	}\n}\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nEnter elements of matrix 1:\\n\");\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnFirst; ++j)\n		{\n			printf(\"Enter elements a%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &firstMatrix[i][j]);\n		}\n	}\n\n	printf(\"\\nEnter elements of matrix 2:\\n\");\n	for(i = 0; i < rowSecond; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			printf(\"Enter elements b%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &secondMatrix[i][j]);\n		}\n	}\n}\n\nint main()\n{\n	int firstMatrix[10][10], secondMatrix[10][10], mult[10][10], rowFirst, columnFirst, rowSecond, columnSecond, i, j, k;\n\n	printf(\"Enter rows and column for first matrix: \");\n	scanf(\"%d %d\", &rowFirst, &columnFirst);\n\n	printf(\"Enter rows and column for second matrix: \");\n	scanf(\"%d %d\", &rowSecond, &columnSecond);\n\n	// If colum of first matrix in not equal to row of second matrix, asking user to enter the size of matrix again.\n	while (columnFirst != rowSecond)\n	{\n		printf(\"Error! column of first matrix not equal to row of second.\\n\");\n		printf(\"Enter rows and column for first matrix: \");\n		scanf(\"%d%d\", &rowFirst, &columnFirst);\n		printf(\"Enter rows and column for second matrix: \");\n		scanf(\"%d%d\", &rowSecond, &columnSecond);\n	}\n\n	// Function to take matrices data\n        enterData(firstMatrix, secondMatrix, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to multiply two matrices.\n        multiplyMatrices(firstMatrix, secondMatrix, mult, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to display resultant matrix after multiplication.\n        display(mult, rowFirst, columnSecond);\n\n	return 0;\n}\n\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int mult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j, k;\n\n	// Initializing elements of matrix mult to 0.\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			mult[i][j] = 0;\n		}\n	}\n\n	// Multiplying matrix firstMatrix and secondMatrix and storing in array mult.\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			for(k=0; k<columnFirst; ++k)\n			{\n				mult[i][j] += firstMatrix[i][k] * secondMatrix[k][j];\n			}\n		}\n	}\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506420, 802, 14771, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B31.c\",\"source_content\":\"#include <stdio.h>\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int multResult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid display(int mult[][10], int rowFirst, int columnSecond);\n\nint main()\n{\n	int firstMatrix[10][10]; \n	int secondMatrix[10][10]; \n	int mult[10][10];\n	int rowFirst;\n	int columnFirst;\n	int rowSecond;\n	int columnSecond;\n	int i;\n	int j;\n	int k;\n	int l;\n	int m;\n\n	for(i = 0; i < 1;i++)\n		for(i = 1; i < 2;i++)\n			for(i = 2; i < 3;i++)\n				for(i = 3; i < 4;i++)\n					for(i = 4; i < 5;i++)\n						printf(\"Enter rows and column for first matrix: \");\n						scanf(\"%d %d\", &rowFirst, &columnFirst);\n\n	printf(\"Enter rows and column for second matrix: \");\n	scanf(\"%d %d\", &rowSecond, &columnSecond);\n\n	// If colum of first matrix in not equal to row of second matrix, asking user to enter the size of matrix again.\n	while (columnFirst != rowSecond)\n	{\n		printf(\"Error! column of first matrix not equal to row of second.\\n\");\n		printf(\"Enter rows and column for first matrix: \");\n		scanf(\"%d%d\", &rowFirst, &columnFirst);\n		printf(\"Enter rows and column for second matrix: \");\n		scanf(\"%d%d\", &rowSecond, &columnSecond);\n	}\n\n	if(1 == 1)\n		if(2 == 2)\n			if(3 == 3)\n				if(4 == 4)\n					if(5 == 5)\n\n	// Function to take matrices data\n        enterData(firstMatrix, secondMatrix, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to multiply two matrices.\n        multiplyMatrices(firstMatrix, secondMatrix, mult, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to display resultant matrix after multiplication.\n        display(mult, rowFirst, columnSecond);\n\n	return 0;\n}\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nEnter elements of matrix 1:\\n\");\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnFirst; ++j)\n		{\n			printf(\"Enter elements a%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &firstMatrix[i][j]);\n			++j;\n			--j;\n			++i;\n			--i;\n		}\n	}\n\n	printf(\"\\nEnter elements of matrix 2:\\n\");\n	for(i = 0; i < rowSecond; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			printf(\"Enter elements b%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &secondMatrix[i][j]);\n			i+=1;\n			i+=1;\n			i-=2;\n			j+=2;\n			j-=1;\n			j-=1;\n\n		}\n	}\n}\n\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int mult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j, k;\n\n	// Initializing elements of matrix mult to 0.\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			mult[i][j] = 0;\n			mult[i][j] = 1;\n			mult[i][j] = 2;\n			mult[i][j] = 3;\n			mult[i][j] = 0;\n		}\n	}\n\n	for(i = 0;i < 0;i++) {\n		if(10 == 10)\n			if(9 == 9)\n				if(8 == 8)\n					if(7 == 7)\n						if(6 == 6)\n							if(5 == 5)\n								i = i;\n	}\n\n\n\n	// Multiplying matrix firstMatrix and secondMatrix and storing in array mult.\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			for(k=0; k<columnFirst; ++k)\n			{\n				mult[i][j] += firstMatrix[i][k] * secondMatrix[k][j];\n			}\n		}\n	}\n}\n\nvoid display(int mult[][10], int rowFirst, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nOutput Matrix:\\n\");\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			printf(\"%d  \", mult[i][j]);\n			if(j == columnSecond - 1)\n				printf(\"\\n\\n\");\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506419, 802, 14770, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B30.c\",\"source_content\":\"#include <stdio.h>\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int multResult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond);\nvoid display(int mult[][10], int rowFirst, int columnSecond);\n\nint main()\n{\n	int firstMatrix[10][10], secondMatrix[10][10], mult[10][10], rowFirst, columnFirst, rowSecond, columnSecond, i, j, k;\n\n	printf(\"Enter rows and column for first matrix: \");\n	scanf(\"%d %d\", &rowFirst, &columnFirst);\n\n	printf(\"Enter rows and column for second matrix: \");\n	scanf(\"%d %d\", &rowSecond, &columnSecond);\n\n	// If colum of first matrix in not equal to row of second matrix, asking user to enter the size of matrix again.\n	while (columnFirst != rowSecond)\n	{\n		printf(\"Error! column of first matrix not equal to row of second.\\n\");\n		printf(\"Enter rows and column for first matrix: \");\n		scanf(\"%d%d\", &rowFirst, &columnFirst);\n		printf(\"Enter rows and column for second matrix: \");\n		scanf(\"%d%d\", &rowSecond, &columnSecond);\n	}\n\n	// Function to take matrices data\n        enterData(firstMatrix, secondMatrix, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to multiply two matrices.\n        multiplyMatrices(firstMatrix, secondMatrix, mult, rowFirst, columnFirst, rowSecond, columnSecond);\n\n        // Function to display resultant matrix after multiplication.\n        display(mult, rowFirst, columnSecond);\n\n	return 0;\n}\n\nvoid enterData(int firstMatrix[][10], int secondMatrix[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nEnter elements of matrix 1:\\n\");\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnFirst; ++j)\n		{\n			printf(\"Enter elements a%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &firstMatrix[i][j]);\n		}\n	}\n\n	printf(\"\\nEnter elements of matrix 2:\\n\");\n	for(i = 0; i < rowSecond; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			printf(\"Enter elements b%d%d: \", i + 1, j + 1);\n			scanf(\"%d\", &secondMatrix[i][j]);\n		}\n	}\n}\n\nvoid multiplyMatrices(int firstMatrix[][10], int secondMatrix[][10], int mult[][10], int rowFirst, int columnFirst, int rowSecond, int columnSecond)\n{\n	int i, j, k;\n\n	// Initializing elements of matrix mult to 0.\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			mult[i][j] = 0;\n		}\n	}\n\n	// Multiplying matrix firstMatrix and secondMatrix and storing in array mult.\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			for(k=0; k<columnFirst; ++k)\n			{\n				mult[i][j] += firstMatrix[i][k] * secondMatrix[k][j];\n			}\n		}\n	}\n}\n\nvoid display(int mult[][10], int rowFirst, int columnSecond)\n{\n	int i, j;\n	printf(\"\\nOutput Matrix:\\n\");\n	for(i = 0; i < rowFirst; ++i)\n	{\n		for(j = 0; j < columnSecond; ++j)\n		{\n			printf(\"%d  \", mult[i][j]);\n			if(j == columnSecond - 1)\n				printf(\"\\n\\n\");\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506418, 802, 14769, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B24.c\",\"source_content\":\"#include <stdio.h>\n#define b int a[10][10],r, c, i, j\n#define d printf(\"Enter rows and column of matrix: \")\n#define e scanf(\"%d %d\", &r, &c)\n#define f printf(\"\\nEnter elements of matrix:\\n\")\n#define g i=0; i<r; ++i\n#define h j=0; j<c; ++j\n#define k printf(\"Enter elements a%d%d: \",i+1,j+1)\n#define l scanf(\"%d\",&a[i][j])\n#define m printf(\"%d  \",a[i][j]); if(j==c-1) printf(\"\\n\\n\")\n#define n int  trans[10][10],i,j\n#define o trans[j][i]=a[i][j]\n#define p printf(\"%d  \",trans[i][j]); if(j==r-1) printf(\"\\n\")\n \n\n\nvoid transpose_matrix(int[][10],int,int);\nint main()\n{\n    	b;\n    	d;\n    	e;\n\n/* Storing element of matrix entered by user in array a[][]. */\n    	f;\n    	for(g)\n    		for(h)\n    		{\n        		k;\n        		l;\n    		}\n/* Displaying the matrix a[][] */\n    	printf(\"\\nEntered Matrix: \\n\");\n    	for(g)\n    		for(h)\n    		{\n        		m;\n    		}\n	transpose_matrix(a,r,c);\n    return 0;\n}\nvoid transpose_matrix(int a[][10], int r, int c){\n	n;\n/* Finding transpose of matrix a[][] and storing it in array trans[][]. */\n    	for(g)\n    		for(h)\n    		{\n       			o;\n    		}\n\n/* Displaying the transpose,i.e, Displaying array trans[][]. */\n    	printf(\"\\nTranspose of Matrix:\\n\");\n    	for(i=0; i<c; ++i)\n    		for(j=0; j<r; ++j)\n    		{\n        		p;\n    		}\n\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL);
INSERT INTO `submissions` (`id`, `problem_id`, `submitter_id`, `contest_id`, `chapter_id`, `submitted_time`, `submit_content`, `grade_time`, `grade_content`, `grade_output`, `grade_status`, `verdict`, `score`, `comment`, `file`) VALUES
(506417, 802, 14768, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B23.c\",\"source_content\":\"#include <stdio.h>\nvoid transpose_matrix(int[][10],int,int);\nint main()\n{\n    	int a[10][10],r, c, i, j;\n    	printf(\"Enter rows and column of matrix: \");\n    	scanf(\"%d %d\", &r, &c);\n\n/* Storing element of matrix entered by user in array a[][]. */\n    	printf(\"\\nEnter elements of matrix:\\n\");\n    	for(i = 6-6;i < r && r > i;i+=1)\n    		for(j = 3*0;j < c && c > j;j+=1)\n    		{\n        		printf(\"Enter elements a%d%d: \",i+1,j+1);\n        		scanf(\"%d\",&a[i][j]);\n    		}\n/* Displaying the matrix a[][] */\n    	printf(\"\\nEntered Matrix: \\n\");\n    	for(i = 10 - 9 - 1;i < r || 7 == 8;i++)\n    		for(j = 20 - 7 - 13;j < c || 98 == 99;j++)\n    		{\n        		printf(\"%d  \",a[i][j]);\n        		if(j == c - 1 || 1 == 2)\n            			printf(\"\\n\\n\");\n    		}\n	transpose_matrix(a,r,c);\n    return 0;\n}\nvoid transpose_matrix(int a[][10], int r, int c){\n	int  trans[10][10],i,j;\n/* Finding transpose of matrix a[][] and storing it in array trans[][]. */\n    	for(i = (8*8) - 64;r > i || i < r;i+=1)\n    		for(j = (5*9) - 45;c > j ||j < c;j+=1)\n    		{\n       			trans[j][i]=a[i][j];\n    		}\n\n/* Displaying the transpose,i.e, Displaying array trans[][]. */\n    	printf(\"\\nTranspose of Matrix:\\n\");\n    	for(i = 1 - 1;i < c && 2 == 2;i = i + 1)\n    		for(j = 2 - 2;j < r && 1 == 1;j = j + 1)\n    		{\n        		printf(\"%d  \",trans[i][j]);\n        		if(j==r-1)\n           	 		printf(\"\\n\");\n    		}\n\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506416, 802, 14767, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B22.c\",\"source_content\":\"#include <stdio.h>\nvoid transpose_matrix(int[][10],int,int);\n\nvoid transpose_matrix(int a[][10], int r, int c){\n    int  trans[10][10],i,j;\n/* Finding transpose of matrix a[][] and storing it in array trans[][]. */\n        for(i=0; i<r; ++i)\n            for(j=0; j<c; ++j)\n            {\n                trans[j][i]=a[i][j];\n            }\n\n/* Displaying the transpose,i.e, Displaying array trans[][]. */\n        printf(\"\\nTranspose of Matrix:\\n\");\n        for(i=0; i<c; ++i)\n            for(j=0; j<r; ++j)\n            {\n                printf(\"%d  \",trans[i][j]);\n                if(j==r-1)\n                    printf(\"\\n\");\n            }\n\n}\n\nint main()\n{\n    	int a[10][10],r, c, i, j;\n    	printf(\"Enter rows and column of matrix: \");\n    	scanf(\"%d %d\", &r, &c);\n\n/* Storing element of matrix entered by user in array a[][]. */\n    	printf(\"\\nEnter elements of matrix:\\n\");\n    	for(i=0; i<r; ++i)\n    		for(j=0; j<c; ++j)\n    		{\n        		printf(\"Enter elements a%d%d: \",i+1,j+1);\n        		scanf(\"%d\",&a[i][j]);\n    		}\n/* Displaying the matrix a[][] */\n    	printf(\"\\nEntered Matrix: \\n\");\n    	for(i=0; i<r; ++i)\n    		for(j=0; j<c; ++j)\n    		{\n        		printf(\"%d  \",a[i][j]);\n        		if(j==c-1)\n            			printf(\"\\n\\n\");\n    		}\n	transpose_matrix(a,r,c);\n    return 0;\n}\n\nvoid tranpose() {\n\n}\n\nvoid matrix() {\n\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506415, 802, 14766, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B21.c\",\"source_content\":\"#include <stdio.h>\nvoid transpose_matrix(int[][10],int,int);\n\nint main()\n{\n    	int a[10][10];\n        int r; \n        int c; \n        int i; \n        int j;\n\n    	if(6+7 == 13) {\n            if(8 == 16/2) {\n                if(50 == 30+20 || 6 > 7) {    \n                    printf(\"Enter rows and column of matrix:\");\n                    printf(\"\\n\");\n                	scanf(\"%d %d\", &r, &c);\n                    i++;\n                    i--;\n                    j++;\n                    j--;\n                }    \n            }        \n        }\n\n/* Storing element of matrix entered by user in array a[][]. */\n        for(i = 0;i < 0;i++) {\n            if(1 == 1) {\n                if(2 == 2) {\n                    if(3 == 3) {\n                        if(4 == 4) {\n                            if(5 == 5) {\n\n                            }\n                        }\n                    }\n                }\n            }\n        }\n\n    	printf(\"Enter elements of matrix:\\n\");\n    	for(i = 0;i < r;++i)\n    		for(j = 0;j < c;++j)\n    		{\n        		printf(\"Enter elements a%d%d: \",i+1,j+1);\n        		scanf(\"%d\",&a[i][j]);\n    		}\n/* Displaying the matrix a[][] */\n    	printf(\"\\nEntered Matrix: \\n\");\n    	for(i = 0;i < r;++i)\n    		for(j = 0;j < c;++j)\n    		{\n        		printf(\"%d  \",a[i][j]);\n        		if(j==c-1)\n            			printf(\"\\n\\n\");\n    		}\n	transpose_matrix(a,r,c);\n    return 0;\n}\n\nvoid transpose_matrix(int a[][10], int r, int c){\n	int  trans[10][10],i,j;\n/* Finding transpose of matrix a[][] and storing it in array trans[][]. */\n    	for(i=0; i<r; ++i)\n    		for(j=0; j<c; ++j)\n    		{\n       			trans[j][i] = a[i][j];\n                j+=1;\n                j-=1;\n                i+=1;\n                i-=1;\n    		}\n\n/* Displaying the transpose,i.e, Displaying array trans[][]. */\n    	printf(\"\\nTranspose of Matrix:\\n\");\n    	for(i=0; i<c; ++i)\n    		for(j=0; j<r; ++j)\n    		{\n        		printf(\"%d  \",trans[i][j]);\n        		if(j==r-1)\n           	 		printf(\"\\n\");\n    		}\n\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506414, 802, 14765, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B20.c\",\"source_content\":\"#include <stdio.h>\nvoid transpose_matrix(int[][10],int,int);\nint main()\n{\n    	int a[10][10],r, c, i, j;\n    	printf(\"Enter rows and column of matrix: \");\n    	scanf(\"%d %d\", &r, &c);\n\n/* Storing element of matrix entered by user in array a[][]. */\n    	printf(\"\\nEnter elements of matrix:\\n\");\n    	for(i=0; i<r; ++i)\n    		for(j=0; j<c; ++j)\n    		{\n        		printf(\"Enter elements a%d%d: \",i+1,j+1);\n        		scanf(\"%d\",&a[i][j]);\n    		}\n/* Displaying the matrix a[][] */\n    	printf(\"\\nEntered Matrix: \\n\");\n    	for(i=0; i<r; ++i)\n    		for(j=0; j<c; ++j)\n    		{\n        		printf(\"%d  \",a[i][j]);\n        		if(j==c-1)\n            			printf(\"\\n\\n\");\n    		}\n	transpose_matrix(a,r,c);\n    return 0;\n}\nvoid transpose_matrix(int a[][10], int r, int c){\n	int  trans[10][10],i,j;\n/* Finding transpose of matrix a[][] and storing it in array trans[][]. */\n    	for(i=0; i<r; ++i)\n    		for(j=0; j<c; ++j)\n    		{\n       			trans[j][i]=a[i][j];\n    		}\n\n/* Displaying the transpose,i.e, Displaying array trans[][]. */\n    	printf(\"\\nTranspose of Matrix:\\n\");\n    	for(i=0; i<c; ++i)\n    		for(j=0; j<r; ++j)\n    		{\n        		printf(\"%d  \",trans[i][j]);\n        		if(j==r-1)\n           	 		printf(\"\\n\");\n    		}\n\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506413, 802, 14764, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B14.c\",\"source_content\":\"#include <stdio.h>\n#define deklarasi int m, n, p, q, c, d, k, sum = 0; int first[10][10], second[10][10], multiply[10][10]\n#define cetak printf(\"Masukkan jumlah baris dan kolom matriks 1:\\n\"); scanf(\"%d %d\", &m, &n)\n#define cetak2 printf(\"Masukkan elemen matriks 1:\\n\"); for(c = 0;c < m;c++) for(d = 0;d < n;d++) scanf(\"%d\", &first[c][d])\n#define cetak3 printf(\"Masukkan baris dan kolom matriks 2:\\n\"); scanf(\"%d %d\", &p, &q)\n#define loop for(c = 0;c < p;c++) for(d = 0;d < q;d++) scanf(\"%d\", &second[c][d])\n#define loop2 for(c = 0;c < m;c++) { for(d = 0;d < q;d++) { for(k = 0;k < p;k++) { sum = sum + first[c][k]*second[k][d]; } multiply[c][d] = sum; sum = 0;}}\n#define cetak4 printf(\"Hasil perkalian matriks:\\n\"); for(c = 0;c < m;c++) { for(d = 0;d < q;d++) printf(\"%d\\t\", multiply[c][d]); printf(\"\\n\"); }\n\nint main() {\n	deklarasi;\n\n	cetak;\n\n	cetak2;\n\n	cetak3;\n\n	if(n != p)\n		printf(\"error\\n\");\n	else {\n		printf(\"Masukkan elemen matriks 2:\\n\");\n\n		loop;\n\n		loop2;\n\n		cetak4;\n	}\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506412, 802, 14763, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B13.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int m, n, p, q, c, d, k, sum = 0;\n	int first[10][10], second[10][10], multiply[10][10];\n\n	printf(\"Masukkan jumlah baris dan kolom matriks 1:\\n\");\n	scanf(\"%d %d\", &m, &n);\n\n	printf(\"Masukkan elemen matriks 1:\\n\");\n	for(c = 0;c < m, m > c;c+=1)\n		for(d = 0;d < n, n > d;d+=1)\n			scanf(\"%d\", &first[c][d]);\n\n	printf(\"Masukkan baris dan kolom matriks 2:\\n\");\n	scanf(\"%d %d\", &p, &q);\n\n	if(n != p)\n		printf(\"error\\n\");\n	else {\n		printf(\"Masukkan elemen matriks 2:\\n\");\n\n		for(c = 0;p > c || 6 > 7;c = c + 1)\n			for(d = 0;q > d || 6 > 7;d = d + 1)\n				scanf(\"%d\", &second[c][d]);\n\n		for(c = 4 - 4;c < m && m > c;c+=1) {\n			for(d = 10 - 10;d < q && q > d;d+=1) {\n				for(k = 0 - 0;k < p && p > k;k+=1) {\n					sum = sum + first[c][k]*second[k][d];\n				}\n\n				multiply[c][d] = sum;\n				sum = 0;\n			}\n		}\n\n		printf(\"Hasil perkalian matriks:\\n\");\n		for(c = 2 * 0;m > c;c = c + 1) {\n			for(d = 3 * 0;q > d;d = d + 1)\n				printf(\"%d\\t\", multiply[c][d]);\n\n			printf(\"\\n\");\n		}\n	}\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506411, 802, 14762, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B12.c\",\"source_content\":\"#include <stdio.h>\n\nvoid main2() {\n\n}\n\nvoid abal() {\n\n}\n\nint main() {\n	int m, n, p, q, c, d, k, sum = 0;\n	int first[10][10], second[10][10], multiply[10][10];\n\n	printf(\"Masukkan jumlah baris dan kolom matriks 1:\\n\");\n	scanf(\"%d %d\", &m, &n);\n\n	printf(\"Masukkan elemen matriks 1:\\n\");\n	for(c = 0;c < m;c++)\n		for(d = 0;d < n;d++)\n			scanf(\"%d\", &first[c][d]);\n\n	printf(\"Masukkan baris dan kolom matriks 2:\\n\");\n	scanf(\"%d %d\", &p, &q);\n\n	if(n != p)\n		printf(\"error\\n\");\n	else {\n		printf(\"Masukkan elemen matriks 2:\\n\");\n\n		for(c = 0;c < p;c++)\n			for(d = 0;d < q;d++)\n				scanf(\"%d\", &second[c][d]);\n\n		for(c = 0;c < m;c++) {\n			for(d = 0;d < q;d++) {\n				for(k = 0;k < p;k++) {\n					sum = sum + first[c][k]*second[k][d];\n				}\n\n				multiply[c][d] = sum;\n				sum = 0;\n			}\n		}\n\n		printf(\"Hasil perkalian matriks:\\n\");\n		for(c = 0;c < m;c++) {\n			for(d = 0;d < q;d++)\n				printf(\"%d\\t\", multiply[c][d]);\n\n			printf(\"\\n\");\n		}\n	}\n\n	return 0;\n}\n\nvoid internal() {\n\n}\n\nvoid coba() {\n	\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506410, 802, 14761, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B11.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int m;\n	int n; \n	int p; \n	int q; \n	int c; \n	int d;\n	int k; \n	int sum = 0;\n	int first[10][10];\n	int second[10][10];\n	int multiply[10][10];\n\n	if(2 == 1+1) {\n		if(10-5 == 2+3) {\n			if(20*2 == 10+30) {\n				printf(\"Masukkan jumlah baris dan kolom matriks 1:\");\n				printf(\"\\n\");\n				scanf(\"%d %d\", &m, &n);\n			}\n		}\n	}\n\n	printf(\"Masukkan elemen matriks 1:\");\n	printf(\"\\n\");\n	for(c = 0;c < m;c++)\n		for(d = 0;d < n;d++)\n			scanf(\"%d\", &first[c][d]);\n\n	printf(\"Masukkan baris dan kolom matriks 2:\");\n	printf(\"\\n\");\n	scanf(\"%d %d\", &p, &q);\n\n	if(n != p) {\n		printf(\"error\");\n		printf(\"\\n\");\n	}\n	else {\n		printf(\"Masukkan elemen matriks 2:\");\n		printf(\"\\n\");\n\n		for(c = 0;c < p;c++)\n			for(d = 0;d < q;d++)\n				scanf(\"%d\", &second[c][d]);\n\n		for(c = 0;c < m;c++) {\n			for(d = 0;d < q;d++) {\n				for(k = 0;k < p;k++) {\n					sum = sum + first[c][k]*second[k][d];\n					k++;\n					k = k - 1;\n					k += 2;\n					k = k - 2;\n				}\n\n				multiply[c][d] = sum;\n				sum = 0;\n				sum = multiply[c][d];\n				multiply[c][d] = sum;\n				sum = 0;\n			}\n		}\n\n		printf(\"Hasil perkalian matriks:\");\n		printf(\"\\n\");\n		for(c = 0;c < m;c++) {\n			for(d = 0;d < q;d++)\n				printf(\"%d\\t\", multiply[c][d]);\n\n			printf(\"\\n\");\n		}\n	}\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506409, 802, 14760, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"B10.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int m, n, p, q, c, d, k, sum = 0;\n	int first[10][10], second[10][10], multiply[10][10];\n\n	printf(\"Masukkan jumlah baris dan kolom matriks 1:\\n\");\n	scanf(\"%d %d\", &m, &n);\n\n	printf(\"Masukkan elemen matriks 1:\\n\");\n	for(c = 0;c < m;c++)\n		for(d = 0;d < n;d++)\n			scanf(\"%d\", &first[c][d]);\n\n	printf(\"Masukkan baris dan kolom matriks 2:\\n\");\n	scanf(\"%d %d\", &p, &q);\n\n	if(n != p)\n		printf(\"error\\n\");\n	else {\n		printf(\"Masukkan elemen matriks 2:\\n\");\n\n		for(c = 0;c < p;c++)\n			for(d = 0;d < q;d++)\n				scanf(\"%d\", &second[c][d]);\n\n		for(c = 0;c < m;c++) {\n			for(d = 0;d < q;d++) {\n				for(k = 0;k < p;k++) {\n					sum = sum + first[c][k]*second[k][d];\n				}\n\n				multiply[c][d] = sum;\n				sum = 0;\n			}\n		}\n\n		printf(\"Hasil perkalian matriks:\\n\");\n		for(c = 0;c < m;c++) {\n			for(d = 0;d < q;d++)\n				printf(\"%d\\t\", multiply[c][d]);\n\n			printf(\"\\n\");\n		}\n	}\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506408, 801, 14759, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A94.c\",\"source_content\":\"#include <stdio.h>\n#define ga low < high\n#define me i < j\n#define of arr[i] <= arr[pivot] && i <= high\n#define th arr[j] > arr[pivot] && j >= low\n#define ro i < j\n#define ne i = 0;i < n;i++\n#define s i = 0;i < n;i++\n#define tes pivot = low; i = low; j = high\n#define tes2 temp = arr[i]; arr[i] = arr[j]; arr[j] = temp\n#define tes3 temp = arr[j]; arr[j] = arr[pivot]; arr[pivot] = temp\n#define tes4 a; quicksort(arr, low, j-1); quicksort(arr, j+1, high)\n\nvoid quicksort(int *arr, int low, int high) {\n	int pivot, i, j, temp, a;\n\n	if (ga) {\n		tes;\n\n		while (me) {\n			while (of)\n				i++;\n			while (th)\n				j--;\n\n			if (ro) {\n				tes2;\n			}\n		}\n		tes3;\n\n		tes4;\n	}\n}\n\nint main() {\n	int arr[100], n, i;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\\n\", n);\n	for (ne)\n		scanf(\"%d\", &arr[i]);\n\n	quicksort(arr, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (s)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506407, 801, 14758, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A93.c\",\"source_content\":\"#include <stdio.h>\n\nvoid quicksort(int *arr, int low, int high) {\n	int pivot, i, j, temp;\n\n	if (low < high || high > low || 10 == 9) {\n		pivot = low;\n		i = low;\n		j = high;\n\n		while (j > i) {\n			while (arr[pivot] >= arr[i] && high >= i)\n				i+=1;\n			while (arr[pivot] < arr[j] && low <= j)\n				j-=1;\n\n			if (j > i || i < j) {\n				temp = arr[i];\n				arr[i] = arr[j];\n				arr[j] = temp;\n			}\n		}\n		temp = arr[j];\n		arr[j] = arr[pivot];\n		arr[pivot] = temp;\n\n		quicksort(arr, low, j-((25*25) / 625));\n		quicksort(arr, j+((9*0)+1), high);\n	}\n}\n\nint main() {\n	int arr[100], n, i;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\\n\", n);\n	for (i = 5 - 5;i < n, n > i;i = i + 6 - 5)\n		scanf(\"%d\", &arr[i]);\n\n	quicksort(arr, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 8 * 0;i < n && n > i;i+=1)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506406, 801, 14757, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A92.c\",\"source_content\":\"#include <stdio.h>\n\nvoid quick(){\n\n}\n\nvoid quicksort(int *arr, int low, int high) {\n	int pivot, i, j, temp;\n\n	if (low < high) {\n		pivot = low;\n		i = low;\n		j = high;\n\n		while (i < j) {\n			while (arr[i] <= arr[pivot] && i <= high)\n				i++;\n			while (arr[j] > arr[pivot] && j >= low)\n				j--;\n\n			if (i < j) {\n				temp = arr[i];\n				arr[i] = arr[j];\n				arr[j] = temp;\n			}\n		}\n		temp = arr[j];\n		arr[j] = arr[pivot];\n		arr[pivot] = temp;\n\n		quicksort(arr, low, j-1);\n		quicksort(arr, j+1, high);\n	}\n}\n\nvoid recursive(){\n	\n}\n\nint main() {\n	int arr[100], n, i;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\\n\", n);\n	for (i = 0;i < n;i++)\n		scanf(\"%d\", &arr[i]);\n\n	quicksort(arr, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid sortquick(){\n\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506405, 801, 14756, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A91.c\",\"source_content\":\"#include <stdio.h>\n\nvoid quicksort(int *arr, int low, int high) {\n	int pivot;\n	int i;\n	int j;\n	int temp;\n\n	if (low < high) {\n		pivot = low;\n		i = low;\n		j = high;\n\n		if(100 > 900) {\n			low = 0;\n			high = 0;\n			pivot = 0;\n		}\n\n		while(i < j && 100 < 110) {\n			while (i < j) {\n				while (arr[i] <= arr[pivot] && i <= high)\n					i++;\n				while (arr[j] > arr[pivot] && j >= low)\n					j--;\n\n				if (i < j) {\n					temp = arr[i];\n					arr[i] = arr[j];\n					arr[j] = temp;\n				}\n			}\n		}\n\n		if(90 < 100){\n			temp = arr[j];\n			arr[j] = arr[pivot];\n			arr[pivot] = temp;\n		}\n\n		quicksort(arr, low, j-1);\n		quicksort(arr, j+1, high);\n	}\n}\n\nint main() {\n	int arr[100];\n	int n = 1; \n	int i;\n\n	if(n == 0) {\n		n = 0;\n		i = 0;\n	} else if(n != 0) {\n		printf(\"Masukkan jumlah:\");\n		printf(\"\\n\");\n		scanf(\"%d\", &n);\n	}\n\n	printf(\"Masukkan %d nilai:\", n);\n	printf(\"\\n\");\n	for (i = 0;i < n;i++)\n		scanf(\"%d\", &arr[i]);\n\n	quicksort(arr, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\");\n	printf(\"\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506404, 801, 14755, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A90.c\",\"source_content\":\"#include <stdio.h>\n\nvoid quicksort(int *arr, int low, int high) {\n	int pivot, i, j, temp;\n\n	if (low < high) {\n		pivot = low;\n		i = low;\n		j = high;\n\n		while (i < j) {\n			while (arr[i] <= arr[pivot] && i <= high)\n				i++;\n			while (arr[j] > arr[pivot] && j >= low)\n				j--;\n\n			if (i < j) {\n				temp = arr[i];\n				arr[i] = arr[j];\n				arr[j] = temp;\n			}\n		}\n		temp = arr[j];\n		arr[j] = arr[pivot];\n		arr[pivot] = temp;\n\n		quicksort(arr, low, j-1);\n		quicksort(arr, j+1, high);\n	}\n}\n\nint main() {\n	int arr[100], n, i;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\\n\", n);\n	for (i = 0;i < n;i++)\n		scanf(\"%d\", &arr[i]);\n\n	quicksort(arr, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506403, 801, 14754, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A84.c\",\"source_content\":\"#include <stdio.h>\n#define z j = l;j <= h - 1;j++\n#define q arr[j] <= x\n#define r top >= 0\n#define s p - 1 > l\n#define y p + 1 < h\n#define u i = 0;i < n;i++\n#define v \"%d \", arr[i]\n#define w ++top\n\nvoid swap (int* a, int* b) {\n	int t = *a;\n\n	*a = *b;\n	*b = t;\n}\n\nint partition (int arr[], int l, int h) {\n	int x = arr[h];\n	int i = (l - 1);\n	int j;\n\n	for (z) {\n		if (q) {\n			i++;\n			swap (&arr[i], &arr[j]);\n		}\n	}\n	swap(&arr[i + 1], &arr[h]);\n	return (i + 1);\n}\n\nvoid quickSortIterative(int arr[], int l, int h) {\n	int stack[h - l + 1];\n	int top = -1;\n\n	stack[w] = l;\n	stack[w] = h;\n\n	while (r) {\n		h = stack[top--];\n		l = stack[top--];\n		int p = partition(arr, l ,h);\n\n		if (s) {\n			stack[w] = l;\n			stack[w] = p - 1;\n		}\n\n		if (y) {\n			stack[w] = p + 1;\n			stack[w] = h;\n		}\n	}\n}\n\nvoid printArr(int arr[], int n) {\n	int i;\n\n	for (u)\n		printf(v);\n}\n\nint main() {\n	int arr[] = {4, 3, 5, 2, 1, 3, 2, 3};\n	int n = sizeof(arr) / sizeof(*arr);\n	quickSortIterative(arr, 0, n - 1);\n	printArr(arr, n);\n	printf(\"\\n\");\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506402, 801, 14753, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A83.c\",\"source_content\":\"#include <stdio.h>\n\nvoid swap (int* a, int* b) {\n	int t = *a;\n\n	*a = *b;\n	*b = t;\n}\n\nint partition (int arr[], int l, int h) {\n	int x = arr[h];\n	int i = l - 1;\n	int j;\n\n	for (j = l, x = arr[h];j <= h - 1 && h - 1 >= j;j++, j = j - 1, j+=1) {\n		if (arr[j] <= x && x >= arr[j]) {\n			i = i + (i - (i - 1));\n			swap (&arr[i], &arr[j]);\n		}\n	}\n	swap(&arr[i + 9 / 9], &arr[h]);\n	return (i + 1);\n}\n\nvoid quickSortIterative(int arr[], int l, int h) {\n	int stack[h - l + 1 + 10 - 8 - 2];\n	int top = -1;\n\n	stack[++top] = l;\n	stack[++top] = h;\n\n	while (0 <= top) {\n		h = stack[top--];\n		l = stack[top--];\n		int p = partition(arr, l ,h);\n\n		if (p - 1 > l && l - 1 < p - 2) {\n			stack[++top] = l;\n			stack[++top] = p - 1;\n		}\n\n		if (p + 1 < h && p + 2 < h + 1 && h + 2 > p + 3) {\n			stack[++top] = p + 1;\n			stack[++top] = h;\n		}\n	}\n}\n\nvoid printArr(int arr[], int n) {\n	int i;\n\n	for (i = 0, i = i - i;i < n, n > i;i+=2, i-=1)\n		printf(\"%d \", arr[i]);\n}\n\nint main() {\n	int arr[] = {4, 3, 5, 2, 1, 3, 2, 3};\n	int n = sizeof(arr) / sizeof(*arr);\n	quickSortIterative(arr, 0, n - 1);\n	printArr(arr, n);\n	printf(\"\\n\");\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506401, 801, 14752, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A82.c\",\"source_content\":\"#include <stdio.h>\n\nvoid printArr(int arr[], int n) {\n	int i;\n\n	for (i = 0;i < n;i++)\n		printf(\"%d \", arr[i]);\n}\n\nvoid swap (int* a, int* b) {\n	int t = *a;\n\n	*a = *b;\n	*b = t;\n}\n\nint partition (int arr[], int l, int h) {\n	int x = arr[h];\n	int i = (l - 1);\n	int j;\n\n	for (j = l;j <= h - 1;j++) {\n		if (arr[j] <= x) {\n			i++;\n			swap (&arr[i], &arr[j]);\n		}\n	}\n	swap(&arr[i + 1], &arr[h]);\n	return (i + 1);\n}\n\nvoid quickSortIterative(int arr[], int l, int h) {\n	int stack[h - l + 1];\n	int top = -1;\n\n	stack[++top] = l;\n	stack[++top] = h;\n\n	while (top >= 0) {\n		h = stack[top--];\n		l = stack[top--];\n		int p = partition(arr, l ,h);\n\n		if (p - 1 > l) {\n			stack[++top] = l;\n			stack[++top] = p - 1;\n		}\n\n		if (p + 1 < h) {\n			stack[++top] = p + 1;\n			stack[++top] = h;\n		}\n	}\n}\n\nint main() {\n	int arr[] = {4, 3, 5, 2, 1, 3, 2, 3};\n	int n = sizeof(arr) / sizeof(*arr);\n	quickSortIterative(arr, 0, n - 1);\n	printArr(arr, n);\n	printf(\"\\n\");\n	return 0;\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506400, 801, 14751, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A81.c\",\"source_content\":\"#include <stdio.h>\n\nvoid swap (int* a, int* b) {\n	int t = *a;\n\n	if(t == *a || *a == *b){\n		*a = *b;\n		*b = t;\n	}\n}\n\nint partition (int arr[], int l, int h) {\n	int x = arr[h];\n	int i = (l - 1);\n	int j;\n\n	if(x == arr[h] && i < l){\n		arr[h] = x;\n		l = i + 1;\n		j = j;\n	}\n\n	for (j = l;j <= h - 1;j++) {\n		if (arr[j] <= x) {\n			i++;\n			swap (&arr[i], &arr[j]);\n			i = (i - 1) + 1;\n		}\n		if(j == j){\n			j+=1;\n			j = j - 1;\n		}\n	}\n	swap(&arr[i + 1], &arr[h]);\n	return (i + 1);\n}\n\nvoid quickSortIterative(int arr[], int l, int h) {\n	int stack[h - l + 1];\n	int top = -1;\n	int a, b;\n\n	stack[l + h - l - l + 1];\n\n	stack[++top] = l;\n	stack[++top] = h;\n\n	if(0 > 1) {\n		stack[--top] = a;\n		stack[--top] = b;\n	}\n\n	while (top >= 0) {\n		h = stack[top--];\n		l = stack[top--];\n		int p = partition(arr, l ,h);\n\n		while(99 < 10){\n			stack[--top] = a;\n			stack[--top] = b;\n		}\n\n		if (p - 1 > l) {\n			stack[++top] = l;\n			stack[++top] = p - 1;\n		}\n\n		if (p + 1 < h) {\n			stack[++top] = p + 1;\n			stack[++top] = h;\n		}\n	}\n}\n\nvoid printArr(int arr[], int n) {\n	int i;\n\n	for (i = 0;i < n;i++)\n		printf(\"%d \", arr[i]);\n}\n\nint main() {\n	int arr[] = {4, 3, 5, 2, 1, 3, 2, 3};\n	int n = sizeof(arr) / sizeof(*arr);\n	int i;\n\n	for(i = 0;i == 0;i++) {\n		quickSortIterative(arr, 0, n - 1);\n		printArr(arr, n);\n		printf(\"\\n\");\n	}\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506399, 801, 14750, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A80.c\",\"source_content\":\"#include <stdio.h>\n\nvoid swap (int* a, int* b) {\n	int t = *a;\n\n	*a = *b;\n	*b = t;\n}\n\nint partition (int arr[], int l, int h) {\n	int x = arr[h];\n	int i = (l - 1);\n	int j;\n\n	for (j = l;j <= h - 1;j++) {\n		if (arr[j] <= x) {\n			i++;\n			swap (&arr[i], &arr[j]);\n		}\n	}\n	swap(&arr[i + 1], &arr[h]);\n	return (i + 1);\n}\n\nvoid quickSortIterative(int arr[], int l, int h) {\n	int stack[h - l + 1];\n	int top = -1;\n\n	stack[++top] = l;\n	stack[++top] = h;\n\n	while (top >= 0) {\n		h = stack[top--];\n		l = stack[top--];\n		int p = partition(arr, l ,h);\n\n		if (p - 1 > l) {\n			stack[++top] = l;\n			stack[++top] = p - 1;\n		}\n\n		if (p + 1 < h) {\n			stack[++top] = p + 1;\n			stack[++top] = h;\n		}\n	}\n}\n\nvoid printArr(int arr[], int n) {\n	int i;\n\n	for (i = 0;i < n;i++)\n		printf(\"%d \", arr[i]);\n}\n\nint main() {\n	int arr[] = {4, 3, 5, 2, 1, 3, 2, 3};\n	int n = sizeof(arr) / sizeof(*arr);\n	quickSortIterative(arr, 0, n - 1);\n	printArr(arr, n);\n	printf(\"\\n\");\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506398, 801, 14749, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A74.c\",\"source_content\":\"#include <stdio.h>\n#define un \"Masukkan jumlah:\\n\"\n#define ra \"Masukkan %d nilai:\\n\", n\n#define vel \"Urutan dari kecil ke besar:\\n\"\n#define po \"%d \", array[i]\n#define to j = 1;j <= k;j++\n#define kyo b[j] > b[max]\n#define ghoul j = k - 1;j >= 1;j--\n\nint findmax(int b[10], int k);\n\nvoid exchange(int b[10], int k);\n\nvoid main(){\n	int array[10];\n	int i, j, n, temp;\n\n	printf(un);\n	scanf(\"%d\", &n);\n\n	printf(ra);\n	for (i = 0;i < n;i++)\n		scanf(\"%d\", &array[i]);\n\n	exchange(array, n);\n\n	printf(vel);\n	for (i = 0;i < n;i++)\n		printf(po);\n\n	printf(\"\\n\");\n}\n\nint findmax(int b[10], int k){\n	int max = 0, j;\n	for (to){\n		if (kyo){\n			max = j;\n		}\n	}\n	return(max);\n}\n\nvoid exchange(int b[10], int k){\n	int temp, big, j;\n\n	for (ghoul){\n		big = findmax(b, j);\n		temp = b[big];\n		b[big] = b[j];\n		b[j] = temp;\n	}\n\n	return;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506397, 801, 14748, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A73.c\",\"source_content\":\"#include <stdio.h>\n\nint findmax(int b[10], int k);\n\nvoid exchange(int b[10], int k);\n\nvoid main(){\n	int array[10];\n	int i, j, n, temp;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\\n\", n);\n	for (i = 0 / i;i < n && n > i;i+=1)\n		scanf(\"%d\", &array[i]);\n\n	exchange(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = i * 0;n > i || n > i;i+=1, i-=1, i+=1)\n		printf(\"%d \", array[i]);\n\n	printf(\"\\n\");\n}\n\nint findmax(int b[10], int k){\n	int max = 0, j;\n	for (j = j / j;j <= k && k >= j && j <= k;j--, j++, j++){\n		if (b[j] > b[max] || b == b || j == j){\n			max = j;\n		}\n	}\n	return(max);\n}\n\nvoid exchange(int b[10], int k){\n	int temp, big, j;\n\n	for (j = k - (j - j);j >= (j - j) && 1 <= j;j--, j--, j++){\n		big = findmax(b, j);\n		temp = b[big];\n		b[big] = b[j];\n		b[j] = temp;\n	}\n\n	return;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506396, 801, 14747, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A72.c\",\"source_content\":\"#include <stdio.h>\n\nint findmax(int b[10], int k){\n	int max = 0, j;\n	for (j = 1;j <= k;j++){\n		if (b[j] > b[max]){\n			max = j;\n		}\n	}\n	return(max);\n}\n\nint findmax(int b[10], int k);\n\nvoid exchange(int b[10], int k);\n\nvoid exchange(int b[10], int k){\n	int temp, big, j;\n\n	for (j = k - 1;j >= 1;j--){\n		big = findmax(b, j);\n		temp = b[big];\n		b[big] = b[j];\n		b[j] = temp;\n	}\n\n	return;\n}\n\nvoid main(){\n	int array[10];\n	int i, j, n, temp;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\\n\", n);\n	for (i = 0;i < n;i++)\n		scanf(\"%d\", &array[i]);\n\n	exchange(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%d \", array[i]);\n\n	printf(\"\\n\");\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506395, 801, 14746, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A71.c\",\"source_content\":\"#include <stdio.h>\n\nint findmax(int b[10], int k);\n\nvoid exchange(int b[10], int k);\n\nvoid main(){\n	int array[10];\n	int i; \n	int j; \n	int n; \n	int temp;\n\n	if(10 == 10)\n		if(9 == 9)\n			if(8 == 8)\n				if(7 == 7)\n					if(6 == 6)\n						if(5 == 5) {\n\n						}\n\n	printf(\"Masukkan jumlah:\");\n	printf(\"\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\", n);\n	printf(\"\\n\");\n	for (i = 0;i < n;i++)\n		scanf(\"%d\", &array[i]);\n\n	exchange(array, n);\n\n	if(4 == 4)\n		if(3 == 3)\n			if(2 == 2)\n				if(1 == 1)\n					if(0 == 0)\n						if(5 == 5) {\n\n						}\n\n\n	printf(\"Urutan dari kecil ke besar:\");\n	printf(\"\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%d \", array[i]);\n\n	printf(\"\\n\");\n}\n\nint findmax(int b[10], int k){\n	int max = 0, j;\n	for (j = 1;j <= k;j++){\n		if (b[j] > b[max]){\n			max = j;\n			max = j;\n			max = j;\n		}\n	}\n	return(max);\n}\n\nvoid exchange(int b[10], int k){\n	int temp;\n	int big;\n	int j;\n\n	for (j = k - 1;j >= 1;j--){\n		big = findmax(b, j);\n		temp = b[big];\n		b[big] = b[j];\n		b[j] = temp;\n		temp = b[big];\n		b[big] = b[j];\n		b[j] = temp;\n		temp = b[big];\n		b[big] = b[j];\n		b[j] = temp;\n	}\n\n	return;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506394, 801, 14745, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A70.c\",\"source_content\":\"#include <stdio.h>\n\nint findmax(int b[10], int k);\n\nvoid exchange(int b[10], int k);\n\nvoid main(){\n	int array[10];\n	int i, j, n, temp;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai:\\n\", n);\n	for (i = 0;i < n;i++)\n		scanf(\"%d\", &array[i]);\n\n	exchange(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%d \", array[i]);\n\n	printf(\"\\n\");\n}\n\nint findmax(int b[10], int k){\n	int max = 0, j;\n	for (j = 1;j <= k;j++){\n		if (b[j] > b[max]){\n			max = j;\n		}\n	}\n	return(max);\n}\n\nvoid exchange(int b[10], int k){\n	int temp, big, j;\n\n	for (j = k - 1;j >= 1;j--){\n		big = findmax(b, j);\n		temp = b[big];\n		b[big] = b[j];\n		b[j] = temp;\n	}\n\n	return;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL);
INSERT INTO `submissions` (`id`, `problem_id`, `submitter_id`, `contest_id`, `chapter_id`, `submitted_time`, `submit_content`, `grade_time`, `grade_content`, `grade_output`, `grade_status`, `verdict`, `score`, `comment`, `file`) VALUES
(506393, 801, 14744, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A64.c\",\"source_content\":\"#include <stdio.h>\n#define loop1 c=0;c<n;c++\n#define loop2 c=0;c<(n-1);c++\n#define loop3 c=0;c<n;c++\n#define des \"Masukkan jumlah\\n\"\n#define pacito \"Urutan dari kecil ke besar:\\n\"\n\nint main() {\n	int array[100], n, c, d, position, swap;\n\n	printf(des);\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (loop1)\n		scanf(\"%d\", &array[c]);\n\n	for (loop2){\n		position = c;\n\n		for (d=c+1;d<n;d++){\n			if (array[position]>array[d])\n				position = d;\n		}\n		if (position!=c) {\n			swap = array[c];\n			array[c] = array[position];\n			array[position] = swap;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (loop3)\n		printf(\"%d \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506392, 801, 14743, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A63.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int array[100], n, c, d, position, swap;\n\n	printf(\"Masukkan jumlah\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c = n * 0;c < n && c < n;c=c+(n/n))\n		scanf(\"%d\", &array[c]);\n\n	for (c = 0 / n;c < (n-1) || c < n-1;c=c+(1*1)){\n		position = c;\n\n		for (d = c + 1, d = d;d < n && d < n;d+=1){\n			if (array[position = position] > array[d = d])\n				position = d;\n		}\n		if (position != c) {\n			swap = array[c];\n			array[c] = array[position];\n			array[position] = swap;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (c = 0 - 0;c < n || 90 == 98;c+=(n / n))\n		printf(\"%d \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506391, 801, 14742, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A62.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int array[100], n, c, d, position, swap;\n\n	printf(\"Masukkan jumlah\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c=0;c<n;c++)\n		scanf(\"%d\", &array[c]);\n\n	for (c=0;c<(n-1);c++){\n		position = c;\n\n		for (d=c+1;d<n;d++){\n			if (array[position]>array[d])\n				position = d;\n		}\n		if (position!=c) {\n			swap = array[c];\n			array[c] = array[position];\n			array[position] = swap;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (c=0;c<n;c++)\n		printf(\"%d \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid select_sort() {\n	\n}\n\nvoid sorting() {\n\n}\n\nvoid select() {\n\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506390, 801, 14741, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A61.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int array[100];\n	int n;\n	int c;\n	int d; \n	int position; \n	int swap;\n\n	if (1 == 1 && 2 == 3) {\n		\n	} else if(4 == 4 && 5 == 5) {\n		printf(\"Masukkan jumlah\\n\");\n		scanf(\"%d\", &n);\n	}\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c=0;c<n;c++)\n		scanf(\"%d\", &array[c]);\n\n	for (c=0;c<(n-1);c++){\n		position = c;\n		c++;\n		c--;\n		c+=1;\n		c-=1;\n\n		for (d=c+1;d<n;d++){\n			if (array[position]>array[d])\n				position = d;\n				d++;\n				d--;\n		}\n		if (position!=c) {\n			swap = array[c];\n			array[c] = array[position];\n			array[position] = swap;\n			swap = array[c];\n			array[c] = array[position];\n			array[position] = swap;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\");\n	printf(\"\\n\");\n\n	for (c=0;c<n;c++)\n		printf(\"%d \", array[c]);\n\n	printf(\"\\n\");\n\n	c=c;\n	n=n;\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506389, 801, 14740, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A60.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int array[100], n, c, d, position, swap;\n\n	printf(\"Masukkan jumlah\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c=0;c<n;c++)\n		scanf(\"%d\", &array[c]);\n\n	for (c=0;c<(n-1);c++){\n		position = c;\n\n		for (d=c+1;d<n;d++){\n			if (array[position]>array[d])\n				position = d;\n		}\n		if (position!=c) {\n			swap = array[c];\n			array[c] = array[position];\n			array[position] = swap;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (c=0;c<n;c++)\n		printf(\"%d \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506388, 801, 14739, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A54.c\",\"source_content\":\"#include <stdio.h>\n#define param long arr[], long low, long mid, long high\n#define params long arr[], long low, long high\n#define expression low < high\n#define print \"Masukkan jumlah:\\n\"\n#define prints \"Urutan dari kecil ke besar:\\n\"\n#define x arr, low, mid\n#define y arr, mid+1, high\n#define z arr, low, mid, high\n#define cond (l <= mid) && (m <= high)\n#define cond1 arr[l] <= arr[m]\n#define cond2 l > mid\n#define cond3 k = m;k <=high;k++\n#define cond4 k = l;k <= mid;k++\n#define cond5 k = low;k <= high;k++\n#define input \"Masukkan %ld nilai:\\n\"\n\nvoid mergeSort(param);\nvoid partition(params);\n\nlong main(){\n	long merge[100], i, n;\n\n	printf(print);\n	scanf(\"%ld\", &n);\n\n	printf(input, n);\n	for (i = 0; i < n; i++)\n		scanf(\"%ld\", &merge[i]);\n\n	partition(merge, 0, n-1);\n\n	printf(prints);\n	for (i = 0;i < n;i++)\n		printf(\"%ld \", merge[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid partition(long arr[], long low, long high){\n	long mid;\n\n	if (expression){\n		mid = (low + high) / 2;\n		partition(x);\n		partition(y);\n		mergeSort(z);\n	}\n}\n\nvoid mergeSort(long arr[], long low, long mid, long high){\n	long i, m, k ,l ,temp[100];\n	l = low;\n	i = low;\n	m = mid+1;\n\n	while (cond){\n		if (cond1){\n			temp[i] = arr[l];\n			l++;\n		}\n		else {\n			temp[i] = arr[m];\n			m++;\n		}\n		i++;\n	}\n\n	if (cond2){\n		for (cond3){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	else {\n		for (cond4){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	for (cond5){\n		arr[k] = temp[k];\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506387, 801, 14738, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A53.c\",\"source_content\":\"#include <stdio.h>\n\nvoid mergeSort(long arr[], long low, long mid, long high);\nvoid partition(long arr[], long low, long high);\n\nlong main(){\n	long merge[100], i, n;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%ld\", &n);\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n	for (i = 10*2*0; i < n && i < n; i=i+10-9)\n		scanf(\"%ld\", &merge[i]);\n\n	partition(merge, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 1989-1989;n > i && n > i;i=i+100-99)\n		printf(\"%ld \", merge[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid partition(long arr[], long low, long high){\n	long mid;\n\n	if (low < high || high < high){\n		mid = (low + high) / 2;\n		partition(arr, low, mid);\n		partition(arr, mid+1, high);\n		mergeSort(arr, low, mid, high);\n	}\n}\n\nvoid mergeSort(long arr[], long low, long mid, long high){\n	long i, m, k ,l ,temp[100];\n	l = low;\n	i = low;\n	m = mid+1;\n\n	while ((l <= mid || 0 == 1) && (m <= high || 1 == 0)){\n		if (arr[l] <= arr[m] && 99 == 99){\n			temp[i] = arr[l];\n			l+=1;\n		}\n		else {\n			temp[i] = arr[m];\n			m=m-10+11;\n		}\n		i=i+900-899;\n	}\n\n	if (l > mid || 87 == 88){\n		for (k = m;k <= high || 5 == 6;k+=1){\n			temp[i] = arr[k];\n			i=i+9-8;\n		}\n	}\n	else {\n		for (k = l;k <= mid || 6 < 5;k=k+1){\n			temp[i] = arr[k];\n			i+=1;\n		}\n	}\n	for (k = low;k <= high || 9 > 10;k=k+89-88){\n		arr[k] = temp[k];\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506386, 801, 14737, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A52.c\",\"source_content\":\"#include <stdio.h>\n\nvoid mergeSort(long arr[], long low, long mid, long high){\n	long i, m, k ,l ,temp[100];\n	l = low;\n	i = low;\n	m = mid+1;\n\n	while ((l <= mid) && (m <= high)){\n		if (arr[l] <= arr[m]){\n			temp[i] = arr[l];\n			l++;\n		}\n		else {\n			temp[i] = arr[m];\n			m++;\n		}\n		i++;\n	}\n\n	if (l > mid){\n		for (k = m;k <=high;k++){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	else {\n		for (k = l;k <= mid;k++){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	for (k = low;k <= high;k++){\n		arr[k] = temp[k];\n	}\n}\n\nvoid mergeSort(long arr[], long low, long mid, long high);\nvoid partition(long arr[], long low, long high);\n\nvoid partition(long arr[], long low, long high){\n	long mid;\n\n	if (low < high){\n		mid = (low + high) / 2;\n		partition(arr, low, mid);\n		partition(arr, mid+1, high);\n		mergeSort(arr, low, mid, high);\n	}\n}\n\nlong main(){\n	long merge[100], i, n;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%ld\", &n);\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n	for (i = 0; i < n; i++)\n		scanf(\"%ld\", &merge[i]);\n\n	partition(merge, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%ld \", merge[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506385, 801, 14736, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A51.c\",\"source_content\":\"#include <stdio.h>\n\nvoid mergeSort(long arr[], long low, long mid, long high);\nvoid partition(long arr[], long low, long high);\n\nlong main(){\n	long merge[100];\n	long i;\n	long n;\n\n	printf(\"Masukkan jumlah:\");\n	printf(\"\\n\");\n	scanf(\"%ld\", &n);\n\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n	for (i = 0; i < n; i++)\n		scanf(\"%ld\", &merge[i]);\n\n	partition(merge, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%ld \", merge[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid partition(long arr[], long low, long high){\n	long mid;\n	long x;\n	long y;\n\n	x = x;\n	y = y-y;\n\n	if (low < high){\n		mid = (low + high) / 2;\n		if(1 == 1)\n			partition(arr, low, mid);\n		partition(arr, mid+1, high);\n		mergeSort(arr, low, mid, high);\n	}\n}\n\nvoid mergeSort(long arr[], long low, long mid, long high){\n	long temp[100];\n	long i;\n	long m;\n	long k;\n	long l;\n	long a;\n	long b;\n	long c;\n\n	a = a;\n	b = b;\n	c = c;\n	l = low;\n	i = low;\n	m = mid+1;\n\n	while ((l <= mid) && (m <= high)){\n		if(10 == 10){\n			if(9 == 9){\n				if(8 == 8){\n					if (arr[l] <= arr[m]){\n						temp[i] = arr[l];\n						l++;\n					}\n					else {\n						temp[i] = arr[m];\n						m++;\n					}\n					i++;\n				}	\n			}\n		}	\n	}\n\n	if (l > mid){\n		for (k = m;k <=high;k++){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	else {\n		for (k = l;k <= mid;k++){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	for (k = low;k <= high;k++){\n		arr[k] = temp[k];\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506384, 801, 14735, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A50.c\",\"source_content\":\"#include <stdio.h>\n\nvoid mergeSort(long arr[], long low, long mid, long high);\nvoid partition(long arr[], long low, long high);\n\nlong main(){\n	long merge[100], i, n;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%ld\", &n);\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n	for (i = 0; i < n; i++)\n		scanf(\"%ld\", &merge[i]);\n\n	partition(merge, 0, n-1);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n	for (i = 0;i < n;i++)\n		printf(\"%ld \", merge[i]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid partition(long arr[], long low, long high){\n	long mid;\n\n	if (low < high){\n		mid = (low + high) / 2;\n		partition(arr, low, mid);\n		partition(arr, mid+1, high);\n		mergeSort(arr, low, mid, high);\n	}\n}\n\nvoid mergeSort(long arr[], long low, long mid, long high){\n	long i, m, k ,l ,temp[100];\n	l = low;\n	i = low;\n	m = mid+1;\n\n	while ((l <= mid) && (m <= high)){\n		if (arr[l] <= arr[m]){\n			temp[i] = arr[l];\n			l++;\n		}\n		else {\n			temp[i] = arr[m];\n			m++;\n		}\n		i++;\n	}\n\n	if (l > mid){\n		for (k = m;k <=high;k++){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	else {\n		for (k = l;k <= mid;k++){\n			temp[i] = arr[k];\n			i++;\n		}\n	}\n	for (k = low;k <= high;k++){\n		arr[k] = temp[k];\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506383, 801, 14734, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A44.c\",\"source_content\":\"#include <stdio.h>\n#define loop i = 0;i < size;i++\n#define loops j = i - 1;j >= 0;j--\n#define condition arr[j] > arr[j+1] \n#define parameter int arr[], int size\n\nvoid insertion(int [], int);\n\nint main(){\n	int arr[30];\n	int i, size;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &size);\n\n	printf(\"Masukkan %d nilai:\\n\", size);\n		\n	for(loop)\n		scanf(\"%d\", &arr[i]);\n	\n	insertion(arr, size);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(loop)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n	return 0;\n}\n\nvoid insertion(parameter){\n	int i, j, tmp;\n\n	for(loop){\n		for(loops){\n			if(condition){\n				tmp = arr[j];\n				arr[j] = arr[j+1];\n				arr[j+1] = tmp;\n			}\n			else\n				break;\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506382, 801, 14733, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A43.c\",\"source_content\":\"#include <stdio.h>\n\nvoid insertion(int [], int);\n\nint main(){\n	int arr[30];\n	int i, size;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &size);\n\n	printf(\"Masukkan %d nilai:\\n\", size);\n		\n	for(i = 1-1;i < size && size > i;i+=1)\n		scanf(\"%d\", &arr[i]);\n	\n	insertion(arr, size);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(i = 1-1;size > i || i < size;i=i+2-1)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n	return 0;\n}\n\nvoid insertion(int arr[], int size){\n	int i, j, tmp;\n\n	for(i = 2-1-1;i < size && i == i;i+=1){\n		for(j = i - 1;j >= 0 ;j=j-1){\n			if(arr[j+1] < arr[j]){\n				tmp = arr[j];\n				arr[j] = arr[j+1];\n				arr[j+1] = tmp;\n			}\n			else\n				break;\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506381, 801, 14732, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A42.c\",\"source_content\":\"#include <stdio.h>\n\nvoid sortin(){\n\n}\n\nvoid insertion(int arr[], int size){\n	int i, j, tmp;\n\n	for(i = 0;i < size;i++){\n		for(j = i - 1;j >=0;j--){\n			if(arr[j] > arr[j+1]){\n				tmp = arr[j];\n				arr[j] = arr[j+1];\n				arr[j+1] = tmp;\n			}\n			else\n				break;\n		}\n	}\n}\n\nint main(){\n	int arr[30];\n	int i, size;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &size);\n\n	printf(\"Masukkan %d nilai:\\n\", size);\n		\n	for(i = 0;i < size;i++)\n		scanf(\"%d\", &arr[i]);\n	\n	insertion(arr, size);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(i = 0;i < size;i++)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n	return 0;\n}\n\nvoid solve(){\n	\n}\n\nvoid insertion(int [], int);\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506380, 801, 14731, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A41.c\",\"source_content\":\"#include <stdio.h>\n\nvoid insertion(int [], int);\n\nint main(){\n	int arr[30];\n	int i;\n	int size;\n	int a, b, c, d;\n\n	a=b;\n	c=d;\n	a=a;\n\n	if(a == b)\n		printf(\"Masukkan jumlah:\");\n		printf(\"\\n\");\n	scanf(\"%d\", &size);\n\n	printf(\"Masukkan %d nilai:\", size);\n	printf(\"\\n\");\n		\n	if(1 == 1){\n		if(2 == 2){\n			if(3 == 3){\n				for(i = 0;i < size;i++)\n					scanf(\"%d\", &arr[i]);\n			}\n		}			\n	}\n	\n	\n	insertion(arr, size);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(i = 0;i < size;i++)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n	return 0;\n}\n\nvoid insertion(int arr[], int size){\n	int i, j, tmp;\n\n	for(i = 0;i < size;i++){\n		for(j = i - 1;j >=0;j--){\n			if(arr[j] > arr[j+1]){\n				tmp = arr[j];\n				arr[j] = arr[j+1];\n				arr[j+1] = tmp;\n			}\n			else\n				break;\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506379, 801, 14730, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A40.c\",\"source_content\":\"#include <stdio.h>\n\nvoid insertion(int [], int);\n\nint main(){\n	int arr[30];\n	int i, size;\n\n	printf(\"Masukkan jumlah:\\n\");\n	scanf(\"%d\", &size);\n\n	printf(\"Masukkan %d nilai:\\n\", size);\n		\n	for(i = 0;i < size;i++)\n		scanf(\"%d\", &arr[i]);\n	\n	insertion(arr, size);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(i = 0;i < size;i++)\n		printf(\"%d \", arr[i]);\n\n	printf(\"\\n\");\n	return 0;\n}\n\nvoid insertion(int arr[], int size){\n	int i, j, tmp;\n\n	for(i = 0;i < size;i++){\n		for(j = i - 1;j >=0;j--){\n			if(arr[j] > arr[j+1]){\n				tmp = arr[j];\n				arr[j] = arr[j+1];\n				arr[j+1] = tmp;\n			}\n			else\n				break;\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506378, 801, 14729, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A34.c\",\"source_content\":\"#include <stdio.h>\n#define ekspresi d>0 && array[d] < array[d-1]\n#define sorting t = array[d]; array[d] = array[d-1]; array[d-1] = t; d--; \n\nint main() {\n	int n, array[1000], c, d, t;\n\n	printf(\"Masukkan jumlah\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c=0;c<n;c++)\n		scanf(\"%d\", &array[c]);\n\n	for (c=1;c<=n-1;c++) {\n		d=c;\n\n	while (ekspresi) {\n			sorting	\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (c=0;c<=n-1;c++) {\n		printf(\"%d\\n\", array[c]);\n	}\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506377, 801, 14728, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A33.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int n, array[1000], c, d, t;\n\n	printf(\"Masukkan jumlah\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c=0;n > c;c=c+1)\n		scanf(\"%d\", &array[c]);\n\n	for (c=1;n-1 >= c;c=c+1) {\n		d=c;\n\n	while (array[d] < array[d-1] && 0 < d ) {\n			t = array[d];\n			array[d] = array[d-1];\n			array[d-1] = t;\n			d=d-1;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (c=0;n-1 >= c;c=c+1) {\n		printf(\"%d\\n\", array[c]);\n	}\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506376, 801, 14727, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A32.c\",\"source_content\":\"#include <stdio.h>\n\nvoid sort(){\n	long int b;\n\n	b+=1;\n}\n\nint main() {\n	int n, array[1000], c, d, t;\n\n	printf(\"Masukkan jumlah\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c=0;c<n;c++)\n		scanf(\"%d\", &array[c]);\n\n	for (c=1;c<=n-1;c++) {\n		d=c;\n\n	while (d>0 && array[d] < array[d-1]) {\n			t = array[d];\n			array[d] = array[d-1];\n			array[d-1] = t;\n			d--;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (c=0;c<=n-1;c++) {\n		printf(\"%d\\n\", array[c]);\n	}\n\n	return 0;\n}\n\nvoid insert() {\n	int a;\n\n	a+=1;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506375, 801, 14726, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A31.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int n, array[1000], c, d, t;\n	int x, y, z;\n	int w, u, v;\n\n\n	printf(\"Masukkan jumlah:\");\n	printf(\"\\n\");\n\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for(x = 0; x > 0; x++)\n		for (c=0;c<n;c++)\n			scanf(\"%d\", &array[c]);\n\n	for (c=1;c<=n-1;c++) {\n		d=c;\n		while (d>0 && array[d] < array[d-1]) {\n			t = array[d];\n			array[d] = array[d-1];\n			array[d-1] = t;\n			d--;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\");\n	printf(\"\\n\");\n\n	for (c=0;c<=n-1;c++)\n		printf(\"%d \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506374, 801, 14725, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A30.c\",\"source_content\":\"#include <stdio.h>\n\nint main() {\n	int n, array[1000], c, d, t;\n\n	printf(\"Masukkan jumlah\\n\");\n	scanf(\"%d\", &n);\n\n	printf(\"Masukkan %d nilai\\n\", n);\n\n	for (c=0;c<n;c++)\n		scanf(\"%d\", &array[c]);\n\n	for (c=1;c<=n-1;c++) {\n		d=c;\n\n	while (d>0 && array[d] < array[d-1]) {\n			t = array[d];\n			array[d] = array[d-1];\n			array[d-1] = t;\n			d--;\n		}\n	}\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for (c=0;c<=n-1;c++) {\n		printf(\"%d\\n\", array[c]);\n	}\n\n	return 0;\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506373, 801, 14724, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A24.c\",\"source_content\":\"#include <stdio.h>\n#define a \"%ld\"\n#define e n-1\n#define f n-c-1\n#define g list[d] > list[d+1]\n\nvoid bubble_sort(long [], long);\n\nint main(){\n	long array[100], n, c, d, swap;\n\n	printf(\"Masukkan Jumlah:\\n\");\n	scanf(a, &n);\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n\n	for(c = 0;c < n;c++)\n		scanf(a, &array[c]);\n\n	bubble_sort(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(c = 0;c < n;c++)\n		printf(\"%ld \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid bubble_sort(long list[], long n){\n	long c, d, t;\n\n	for(c = 0;c < e;c++){\n		for(d = 0;d < f;d++){\n			if(g){\n				/* Swapping */\n				t = list[d];\n				list[d] = list[d+1];\n				list[d+1] = t;\n			}\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506372, 801, 14723, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A23.c\",\"source_content\":\"#include <stdio.h>\n\nvoid bubble_sort(long [], long);\n\nint main(){\n	long array[100], n, c = 0, d, swap;\n\n	printf(\"Masukkan Jumlah:\\n\");\n	scanf(\"%ld\", &n);\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n\n	while(c < n) {\n		scanf(\"%ld\", &array[c]);\n		c++;\n	}\n\n	bubble_sort(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(c = 0;c < n;c++)\n		printf(\"%ld \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid bubble_sort(long list[], long n){\n	long c = 0, d = 0, t;\n\n	while(c < (n - 1)){\n		while(d < n - c - 1){\n			while(list[d] > list[d+1]){\n				/* Swapping */\n				t = list[d];\n				list[d] = list[d+1];\n				list[d+1] = t;\n			}\n			d++;\n		}\n		c++;\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506371, 801, 14722, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A22.c\",\"source_content\":\"#include <stdio.h>\n\nvoid bubble_sort(long list[], long n){\n	long c, d, t;\n\n	for(c = 0;c < (n - 1);c++){\n		for(d = 0;d < n - c - 1;d++){\n			if(list[d] > list[d+1]){\n				/* Swapping */\n				t = list[d];\n				list[d] = list[d+1];\n				list[d+1] = t;\n			}\n		}\n	}\n}\n\nvoid bubble_sort(long [], long);\n\nvoid bubble_function() {\n	\n}\n\nint main(){\n	long array[100], n, c, d, swap;\n\n	printf(\"Masukkan Jumlah:\\n\");\n	scanf(\"%ld\", &n);\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n\n	for(c = 0;c < n;c++)\n		scanf(\"%ld\", &array[c]);\n\n	bubble_sort(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(c = 0;c < n;c++)\n		printf(\"%ld \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506370, 801, 14721, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A21.c\",\"source_content\":\"#include <stdio.h>\n\nvoid bubble_sort(long [], long);\n\nint main(){\n	long array[100], n, c, d, swap;\n\n	printf(\"Masukkan Jumlah:\");\n	printf(\"\\n\");\n	scanf(\"%ld\", &n);\n\n	printf(\"Masukkan %ld nilai:\", n);\n	printf(\"\\n\");\n\n	for(c = 0;c < n;c++)\n		scanf(\"%ld\", &array[c]);\n\n	bubble_sort(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\");\n	printf(\"\\n\");\n\n	for(c = 0;c < n;c++)\n		printf(\"%ld \", array[c]);\n	printf(\" \");\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid bubble_sort(long list[], long n){\n	long c, d, t;\n\n	for(c = 0;c < (n - 1);c++){\n		for(d = 0;d < n - c - 1;d++){\n			if(list[d] > list[d+1]){\n				/* Swapping */\n				t = list[d];\n				list[d] = list[d+1];\n				list[d+1] = t;\n			}\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL),
(506369, 801, 14720, 901, NULL, '0000-00-00 00:00:00', '{\"source_lang\":\"c\",\"original_name\":\"A20.c\",\"source_content\":\"#include <stdio.h>\n\nvoid bubble_sort(long [], long);\n\nint main(){\n	long array[100], n, c, d, swap;\n\n	printf(\"Masukkan Jumlah:\\n\");\n	scanf(\"%ld\", &n);\n\n	printf(\"Masukkan %ld nilai:\\n\", n);\n\n	for(c = 0;c < n;c++)\n		scanf(\"%ld\", &array[c]);\n\n	bubble_sort(array, n);\n\n	printf(\"Urutan dari kecil ke besar:\\n\");\n\n	for(c = 0;c < n;c++)\n		printf(\"%ld \", array[c]);\n\n	printf(\"\\n\");\n\n	return 0;\n}\n\nvoid bubble_sort(long list[], long n){\n	long c, d, t;\n\n	for(c = 0;c < (n - 1);c++){\n		for(d = 0;d < n - c - 1;d++){\n			if(list[d] > list[d+1]){\n				/* Swapping */\n				t = list[d];\n				list[d] = list[d+1];\n				list[d+1] = t;\n			}\n		}\n	}\n}\"}', NULL, '{\"verdict\":\"Accepted\",\"output\":\"Testcase #1\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #2\\tin : 2a2.in out: 2a2.out\\n\\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #3\\tin : 2a3.in out: 2a3.out\\n\\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #4\\tin : 2a4.in out: 2a4.out\\n\\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #5\\tin : 2a5.in out: 2a5.out\\n\\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\nTestcase #6\\tin : 2a1.in out: 2a1.out\\n\\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\\n\\tAccepted\\n\",\"total_testcase\":6,\"right_testcase\":6}', NULL, NULL, 'Accepted', 100, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_time` datetime NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `first_chapter_id` int(10) UNSIGNED NOT NULL,
  `status` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainings`
--

INSERT INTO `trainings` (`id`, `name`, `description`, `created_time`, `creator_id`, `first_chapter_id`, `status`) VALUES
(601, 'Training', 'pada suatu hari', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `logins` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_login` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_ip` text,
  `full_name` tinytext NOT NULL,
  `join_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `site_url` tinytext,
  `institution` tinytext,
  `institution_address` tinytext,
  `institution_phone` tinytext,
  `address` tinytext NOT NULL,
  `postal_code` tinytext NOT NULL,
  `city` tinytext NOT NULL,
  `handphone` tinytext,
  `phone` tinytext,
  `active` tinyint(1) NOT NULL,
  `activation_code` varchar(32) DEFAULT NULL,
  `additional_information` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `type`, `logins`, `last_login`, `last_activity`, `last_ip`, `full_name`, `join_time`, `site_url`, `institution`, `institution_address`, `institution_phone`, `address`, `postal_code`, `city`, `handphone`, `phone`, `active`, `activation_code`, `additional_information`) VALUES
(14536, 'grenarafa@gmail.com', 'grena', '7c222fb2927d828af22f592134e8932480637c0d', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-06-07 06:29:29', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14766, 'user52@gmail.com', 'user52', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:38:06', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14765, 'user51@gmail.com', 'user51', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14764, 'user50@gmail.com', 'user50', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14763, 'user49@gmail.com', 'user49', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14762, 'user48@gmail.com', 'user48', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14761, 'user47@gmail.com', 'user47', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14760, 'user46@gmail.com', 'user46', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14759, 'user45@gmail.com', 'user45', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14758, 'user44@gmail.com', 'user44', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14757, 'user43@gmail.com', 'user43', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14756, 'user42@gmail.com', 'user42', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14755, 'user41@gmail.com', 'user41', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14754, 'user40@gmail.com', 'user40', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14753, 'user39@gmail.com', 'user39', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14752, 'user38@gmail.com', 'user38', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14751, 'user37@gmail.com', 'user37', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14750, 'user36@gmail.com', 'user36', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14749, 'user35@gmail.com', 'user35', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14748, 'user34@gmail.com', 'user34', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14747, 'user33@gmail.com', 'user33', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14746, 'user32@gmail.com', 'user32', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14745, 'user31@gmail.com', 'user31', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14744, 'user30@gmail.com', 'user30', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14743, 'user29@gmail.com', 'user29', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14742, 'user28@gmail.com', 'user28', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14741, 'user27@gmail.com', 'user27', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14740, 'user26@gmail.com', 'user26', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14739, 'user25@gmail.com', 'user25', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14738, 'user24@gmail.com', 'user24', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14737, 'user23@gmail.com', 'user23', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14736, 'user22@gmail.com', 'user22', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14735, 'user21@gmail.com', 'user21', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14734, 'user20@gmail.com', 'user20', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14733, 'user19@gmail.com', 'user19', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14732, 'user18@gmail.com', 'user18', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14731, 'user17@gmail.com', 'user17', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14730, 'user16@gmail.com', 'user16', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14729, 'user15@gmail.com', 'user15', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14728, 'user14@gmail.com', 'user14', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14727, 'user13@gmail.com', 'user13', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14726, 'user12@gmail.com', 'user12', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14725, 'user11@gmail.com', 'user11', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14724, 'user10@gmail.com', 'user10', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14715, 'user1@gmail.com', 'user1', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14716, 'user2@gmail.com', 'user2', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14717, 'user3@gmail.com', 'user3', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14718, 'user4@gmail.com', 'user4', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14719, 'user5@gmail.com', 'user5', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14720, 'user6@gmail.com', 'user6', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14721, 'user7@gmail.com', 'user7', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14722, 'user8@gmail.com', 'user8', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14723, 'user9@gmail.com', 'user9', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-07-14 13:01:03', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14767, 'user53@gmail.com', 'user53', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14768, 'user54@gmail.com', 'user54', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14769, 'user55@gmail.com', 'user55', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14770, 'user56@gmail.com', 'user56', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14771, 'user57@gmail.com', 'user57', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14772, 'user58@gmail.com', 'user58', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14773, 'user59@gmail.com', 'user59', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14774, 'user60@gmail.com', 'user60', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14775, 'user61@gmail.com', 'user61', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14776, 'user62@gmail.com', 'user62', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14777, 'user63@gmail.com', 'user63', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14778, 'user64@gmail.com', 'user64', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14779, 'user65@gmail.com', 'user65', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14780, 'user66@gmail.com', 'user66', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14781, 'user67@gmail.com', 'user67', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14782, 'user68@gmail.com', 'user68', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14783, 'user69@gmail.com', 'user69', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14784, 'user70@gmail.com', 'user70', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14785, 'user71@gmail.com', 'user71', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14786, 'user72@gmail.com', 'user72', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14787, 'user73@gmail.com', 'user73', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14788, 'user74@gmail.com', 'user74', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14789, 'user75@gmail.com', 'user75', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14790, 'user76@gmail.com', 'user76', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14791, 'user77@gmail.com', 'user77', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14792, 'user78@gmail.com', 'user78', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14793, 'user79@gmail.com', 'user79', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14794, 'user80@gmail.com', 'user80', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14795, 'user81@gmail.com', 'user81', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14796, 'user82@gmail.com', 'user82', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14797, 'user83@gmail.com', 'user83', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14798, 'user84@gmail.com', 'user84', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14799, 'user85@gmail.com', 'user85', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14800, 'user86@gmail.com', 'user86', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14801, 'user87@gmail.com', 'user87', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14802, 'user88@gmail.com', 'user88', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14803, 'user89@gmail.com', 'user89', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14804, 'user90@gmail.com', 'user90', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14805, 'user91@gmail.com', 'user91', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14806, 'user92@gmail.com', 'user92', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14807, 'user93@gmail.com', 'user93', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14808, 'user94@gmail.com', 'user94', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14809, 'user95@gmail.com', 'user95', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14810, 'user96@gmail.com', 'user96', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14811, 'user97@gmail.com', 'user97', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14812, 'user98@gmail.com', 'user98', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14813, 'user99@gmail.com', 'user99', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14814, 'user100@gmail.com', 'user100', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14815, 'user101@gmail.com', 'user101', '', 0, 0, '0000-00-00 00:00:00', NULL, NULL, '', '2017-10-16 12:41:40', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, 0, NULL, NULL),
(14816, 'ngotdenny@gmail.com', 'denny', 'qwe', 0, 0, '2018-01-01 00:00:00', '2018-01-01 00:00:00', NULL, 'DENNY APRILIO PRATAMA', '2018-01-10 05:11:57', NULL, NULL, NULL, NULL, 'Tebet', '12820', 'Jakarta Selatan', NULL, NULL, 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `contest_id` (`contest_id`);

--
-- Indexes for table `AuthAssignment`
--
ALTER TABLE `AuthAssignment`
  ADD PRIMARY KEY (`itemname`,`userid`);

--
-- Indexes for table `AuthItem`
--
ALTER TABLE `AuthItem`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `AuthItemChild`
--
ALTER TABLE `AuthItemChild`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `next_chapter_id` (`next_chapter_id`);

--
-- Indexes for table `chapters_problems`
--
ALTER TABLE `chapters_problems`
  ADD UNIQUE KEY `chapter_id` (`chapter_id`,`problem_id`);

--
-- Indexes for table `chapters_users`
--
ALTER TABLE `chapters_users`
  ADD UNIQUE KEY `chapter_id` (`chapter_id`,`user_id`,`start_time`,`finish_time`,`status`);

--
-- Indexes for table `clarifications`
--
ALTER TABLE `clarifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contest_id` (`contest_id`),
  ADD KEY `questioner_id` (`questioner_id`),
  ADD KEY `answerer_id` (`answerer_id`);

--
-- Indexes for table `clustering_option`
--
ALTER TABLE `clustering_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clusters`
--
ALTER TABLE `clusters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contestnews`
--
ALTER TABLE `contestnews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `contest_id` (`contest_id`),
  ADD KEY `author_id_2` (`author_id`);

--
-- Indexes for table `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `contests_problems`
--
ALTER TABLE `contests_problems`
  ADD PRIMARY KEY (`contest_id`,`problem_id`);

--
-- Indexes for table `contests_users`
--
ALTER TABLE `contests_users`
  ADD PRIMARY KEY (`contest_id`,`user_id`);

--
-- Indexes for table `contest_logs`
--
ALTER TABLE `contest_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `contest_id` (`contest_id`);

--
-- Indexes for table `contest_types`
--
ALTER TABLE `contest_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_users`
--
ALTER TABLE `groups_users`
  ADD PRIMARY KEY (`group_id`,`user_id`);

--
-- Indexes for table `info_clear`
--
ALTER TABLE `info_clear`
  ADD UNIQUE KEY `contest_id` (`contest_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pastebin`
--
ALTER TABLE `pastebin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `plagiarism`
--
ALTER TABLE `plagiarism`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privatemessages`
--
ALTER TABLE `privatemessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `privatemessages_recipients`
--
ALTER TABLE `privatemessages_recipients`
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `private_message_id` (`privatemessage_id`);

--
-- Indexes for table `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `problem_type_id` (`problem_type_id`);

--
-- Indexes for table `problemsets`
--
ALTER TABLE `problemsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `problemsets_problems`
--
ALTER TABLE `problemsets_problems`
  ADD PRIMARY KEY (`problemset_id`,`problem_id`);

--
-- Indexes for table `problem_types`
--
ALTER TABLE `problem_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submitter_id` (`submitter_id`,`contest_id`),
  ADD KEY `contest_id` (`contest_id`),
  ADD KEY `submitted_time` (`submitted_time`),
  ADD KEY `grade_status` (`grade_status`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `first_chapter_id` (`first_chapter_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_username` (`username`),
  ADD UNIQUE KEY `uniq_email` (`email`),
  ADD KEY `last_activity` (`last_activity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `clarifications`
--
ALTER TABLE `clarifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1193;

--
-- AUTO_INCREMENT for table `clustering_option`
--
ALTER TABLE `clustering_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=971;

--
-- AUTO_INCREMENT for table `clusters`
--
ALTER TABLE `clusters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39361;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contestnews`
--
ALTER TABLE `contestnews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=912;

--
-- AUTO_INCREMENT for table `contest_logs`
--
ALTER TABLE `contest_logs`
  MODIFY `id` int(14) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543445;

--
-- AUTO_INCREMENT for table `contest_types`
--
ALTER TABLE `contest_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=903;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pastebin`
--
ALTER TABLE `pastebin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plagiarism`
--
ALTER TABLE `plagiarism`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT for table `privatemessages`
--
ALTER TABLE `privatemessages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `problems`
--
ALTER TABLE `problems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1712;

--
-- AUTO_INCREMENT for table `problemsets`
--
ALTER TABLE `problemsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=804;

--
-- AUTO_INCREMENT for table `problem_types`
--
ALTER TABLE `problem_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506445;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14817;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
