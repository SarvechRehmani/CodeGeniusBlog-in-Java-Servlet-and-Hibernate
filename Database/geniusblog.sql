-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2023 at 12:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geniusblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `catName`) VALUES
(1, 'Java Programing'),
(2, 'Python Programing'),
(3, 'Data Structure'),
(4, 'CSS'),
(5, 'C#');

-- --------------------------------------------------------

--
-- Table structure for table `liketable`
--

CREATE TABLE `liketable` (
  `likeId` int(11) NOT NULL,
  `post_pId` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liketable`
--

INSERT INTO `liketable` (`likeId`, `post_pId`, `user_id`) VALUES
(265, 7, 1),
(266, 7, 1),
(267, 7, 1),
(268, 7, 1),
(269, 7, 1),
(270, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `pId` int(11) NOT NULL,
  `pContent` varchar(1500) DEFAULT NULL,
  `pDate` date DEFAULT NULL,
  `pPic` varchar(255) DEFAULT NULL,
  `pTitle` varchar(255) DEFAULT NULL,
  `pCatId_catId` int(11) DEFAULT NULL,
  `uPId_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`pId`, `pContent`, `pDate`, `pPic`, `pTitle`, `pCatId_catId`, `uPId_id`) VALUES
(1, 'sdasdad', '2023-07-08', 'DefaultBlog.jpg', 'What is java?', 1, 1),
(2, 'python is most popular programming language it is use for machine learning.', '2023-07-09', 'DefaultBlog.jpg', 'What is Python?', 2, 1),
(3, 'A data structure is a specialized format for organizing, processing, retrieving and storing data.', '2023-07-09', 'DefaultBlog.jpg', 'what is data Structure?', 3, 1),
(4, 'Java was designed to be easy to use and is therefore easy to write, compile, debug, and learn than other programming languages.', '2023-07-09', 'DefaultBlog.jpg', 'Why java?', 1, 1),
(5, 'As an interpreted language, Python has simpler, more concise syntax than Java. It can perform the same function as Java in fewer lines of code.', '2023-07-09', 'DefaultBlog.jpg', 'why python is better than java?', 2, 1),
(6, 'Java is a widely used programming language for coding web applications. It has been a popular choice among developers for over two decades,', '2023-07-10', 'java.webp', 'About java', 1, 1),
(7, 'CSS stands for Cascading Style Sheets Â· CSS describes how HTML elements are to be displayed on screen, paper, or in other media Â· CSS saves a lot of work.', '2023-07-10', 'css.jpg', 'About Css', 4, 1),
(8, 'WebC# (C-Sharp) is a programming language developed by Microsoft that runs on the .NET Framework. C# is used to develop web apps, desktop apps, mobile apps, games and', '2023-08-03', 'c.jpeg', 'About c#', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `date`, `email`, `gender`, `name`, `password`, `profile`) VALUES
(1, '2023-07-07 01:04:22', 'sarwech99@gmail.com', 'Male', 'Sarvech Rehmani', 'saroo', 'champion-ultron-720x720.jpg'),
(2, '2023-07-08 18:03:19', 'saroreh@gmail.com', 'Male', 'sarvech', 'sarvech', '11601.jpeg'),
(3, '2023-08-03 20:28:28', 'h@gmail.com', 'Male', 'hammad', 'hammad', 'ImgCreator.ai  dark formal 3 piece suit with tie.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `liketable`
--
ALTER TABLE `liketable`
  ADD PRIMARY KEY (`likeId`),
  ADD KEY `FKs9avra0syiy6wupvqw1l5mlde` (`post_pId`),
  ADD KEY `FKn7cevegcpxcdxqnqpw5mqda8a` (`user_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`pId`),
  ADD KEY `FKgyhc5od34s499kcc7mhui4lbl` (`pCatId_catId`),
  ADD KEY `FKj2mh0bc8p2e1s4cx0owh4rkix` (`uPId_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `liketable`
--
ALTER TABLE `liketable`
  MODIFY `likeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
