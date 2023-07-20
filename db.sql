-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 28, 2022 at 10:54 PM
-- Server version: 8.0.27-18
-- PHP Version: 7.3.33-1+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
	
--
-- Database: ``
--

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id_todo` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id_todo`, `title`, `description`, `deadline`, `created_at`, `id_user`) VALUES
(6, 'title', ' testing testing lorem', NULL, '2022-05-22 07:27:03', 32),
(7, 'title', ' testing testing lorem', NULL, '2022-05-22 07:27:03', 32),
(8, 'title', ' testing testing lorem', NULL, '2022-05-22 07:27:04', 32),
(9, 'title', ' testing testing lorem', NULL, '2022-05-22 07:27:05', 32);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `password`, `created_at`) VALUES
(32, 'Fajri Rinaldi Chan', 'fajri@farindev.my.id', '$2a$10$amDMqaYQZWbxlGxUr8k1k.LoCZVjDv6GrzwGFELIikSxQ/8f1eq0C', '2022-05-22 03:36:20'),
(33, 'master', 'master@farindev.my.id', '$2a$10$FviWM79Qlno4B1aFor/8VON2rji9fVt3l8jUohuvP1HVojUMrrCdO', '2022-05-22 05:07:15'),
(34, 'master', 'master1@farindev.my.id', '$2a$10$oW/0Zum5vxoKN7EeA7hvduVShIb.5E3tWtsAcWAkI2RuVvzVG0a/a', '2022-05-22 06:53:08'),
(35, 'master', 'master2@farindev.my.id', '$2a$10$8zB7j/iBg0U/AHsoXv6Vkeuo6YtFuu.wXbNniamRHdCPyzz4lGLpa', '2022-05-22 06:54:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id_todo`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id_todo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
