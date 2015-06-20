-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2015 at 10:05 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL,
  `first_name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `phone` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `is_vip` tinyint(1) DEFAULT '0',
  `created_by` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_by` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `phone`, `email`, `is_vip`, `created_by`, `creation_date`, `modified_by`, `modification_date`) VALUES
(1, 'Leonardo', 'Pautasio', '', 'pautasio@gmail.com', 1, 'System', '2012-04-09 14:06:08', 'System', '2012-04-09 18:41:48'),
(3, 'Diego', 'Lucas', '', 'diegolucas@macro.com', 0, 'System', '2012-04-09 14:06:18', 'System', '2012-04-09 14:06:18'),
(4, 'Alam', 'Chaud', '', 'alamchaud@redmedia.com', 0, 'System', '2012-04-09 14:07:04', 'Leonardo Pautasio', '2015-06-14 04:30:52'),
(5, 'Gabriela', 'Pautasio', '', 'gabrielapautasio@gmail.com', 0, 'System', '2012-04-09 14:06:08', 'System', '2012-04-09 14:06:08'),
(6, 'Jorgelina', 'Lucas', '', 'jorgilucas@macro.com', 0, 'System', '2012-04-09 14:06:18', 'System', '2012-04-09 14:06:18'),
(8, 'Silvana', 'Pautasio', '', 'silvanapautasio@gmail.com', 0, 'System', '2012-04-09 14:06:08', 'System', '2012-04-09 14:06:08'),
(9, 'Manuel', 'Guevara', '', 'manuel.guevara@accenture.com', 0, 'System', '2012-04-09 14:06:26', 'System', '2012-04-09 14:06:26'),
(10, 'Pablo', 'Chaud', '', 'pablochaud@redmedia.com', 0, 'System', '2012-04-09 14:07:04', 'System', '2012-04-09 14:07:04'),
(11, 'Juan Jose', 'Pautasio', '', 'juanpautasio@gmail.com', 0, 'System', '2012-04-09 14:06:08', 'System', '2012-04-09 14:06:08'),
(12, 'Norberto', 'Lucas', '', 'norbertlucas@macro.com', 0, 'System', '2012-04-09 14:06:18', 'System', '2012-04-09 14:06:18'),
(14, 'Jose', 'Lucas', '', 'joselucas@macro.com', 0, 'System', '2012-04-09 14:06:18', 'System', '2012-04-09 14:06:18'),
(15, 'Solange', 'Chaud', '', 'solchaud@redmedia.com', 0, 'System', '2012-04-09 14:07:04', 'System', '2012-04-09 14:07:04'),
(16, 'Agustina', 'Conno', '', 'agustina.conno@macro.com.ar', 0, 'Leonardo Pautasio', '2015-04-03 12:58:48', 'Leonardo Pautasio', '2015-04-03 13:38:30'),
(17, 'Constanza', 'Rinaldi', '', 'crinal@hotamail.com', 0, 'Leonardo Pautasio', '2015-04-03 13:59:57', 'Leonardo Pautasio', '2015-04-03 13:59:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
