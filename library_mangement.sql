-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2023 at 07:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library mangement`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors_ritee`
--

CREATE TABLE `authors_ritee` (
  `authors_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors_ritee`
--

INSERT INTO `authors_ritee` (`authors_id`, `first_name`, `last_name`, `email`, `phone_number`, `address`) VALUES
(1, 'Coco', 'Chanel', 'CocoChanel@gmail.com', '2573612687', 'Buddha park'),
(2, 'Thomas', 'Alva Edison', 'ThomasAlvaEdison@gmail.com', '56787656776', 'swoyambhu'),
(3, 'Usha', 'Uthup', 'UshaUthup@gmail.com', '6586587879', 'Newroad'),
(4, 'Amitav', ' Ghosh', 'AmitavGhosh@gmail.com', '3545767857', 'kalinchowk'),
(5, ' Amartya', 'Sen', ' AmartyaSen@gmail.com', '7892792928', 'Thamel');

-- --------------------------------------------------------

--
-- Table structure for table `bookauthor_ritee`
--

CREATE TABLE `bookauthor_ritee` (
  `book_title` varchar(255) DEFAULT NULL,
  `book_author` varchar(255) DEFAULT NULL,
  `publication_year` date DEFAULT NULL,
  `books_id` int(11) DEFAULT NULL,
  `authors_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookauthor_ritee`
--

INSERT INTO `bookauthor_ritee` (`book_title`, `book_author`, `publication_year`, `books_id`, `authors_id`) VALUES
('The Queen of Indian Pop', 'Coco Chanel', '2021-07-01', 6, 1),
('Tomb of Sand', 'Thomas Alva Edison', '2020-07-07', 7, 2),
('Operation Khatma', 'Usha Uthup', '2021-07-07', 8, 3),
('Life in the Clock Tower Valley', 'Amartya Sen', '2020-07-22', 9, 5),
('Nehru, Tibet and China', 'Amitav Ghosh', '2019-07-23', 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `books_ritee`
--

CREATE TABLE `books_ritee` (
  `books_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ISBN` varchar(255) DEFAULT NULL,
  `publication_year` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `availability` enum('available','unavailable') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books_ritee`
--

INSERT INTO `books_ritee` (`books_id`, `title`, `ISBN`, `publication_year`, `category`, `availability`) VALUES
(6, 'The Queen of Indian Pop', 'ISBN7623564876', '2021-03-11', 'Fiction', 'available'),
(7, 'Tomb of Sand', 'ISBN9562187299', '2023-08-11', 'Fiction', 'unavailable'),
(8, 'Operation Khatma', 'ISBN53724872638', '0000-00-00', 'inspiring', 'unavailable'),
(9, 'Life in the Clock Tower Valley', 'ISBN117139827', '2015-09-16', ' Fiction', 'available'),
(10, 'Nehru, Tibet and China', 'ISBN62186981248', '1974-11-26', 'Romance', 'unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `borrowedbooks_ritee`
--

CREATE TABLE `borrowedbooks_ritee` (
  `borrowed_id` int(11) NOT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `borrowed_book` varchar(255) DEFAULT NULL,
  `borrowed_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `borrowed_staff_name` varchar(255) DEFAULT NULL,
  `members_id` int(11) DEFAULT NULL,
  `books_id` int(11) DEFAULT NULL,
  `staffs_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowedbooks_ritee`
--

INSERT INTO `borrowedbooks_ritee` (`borrowed_id`, `member_name`, `borrowed_book`, `borrowed_date`, `return_date`, `borrowed_staff_name`, `members_id`, `books_id`, `staffs_id`) VALUES
(1, 'Nelson Mandela', 'The Queen of Indian Pop', '2021-01-09', '2021-02-11', 'Michael Jackson', 1, 6, 11),
(2, 'Abraham Lincoln', 'Tomb of Sand', '2022-01-11', '2022-03-20', 'Leo Tolstoy', 2, 7, 12),
(4, 'Anne Frank', 'Life in the Clock Tower Valley', '2022-05-28', '2022-06-27', 'Marilyn Monroe', 4, 9, 14);

-- --------------------------------------------------------

--
-- Table structure for table `members_ritee`
--

CREATE TABLE `members_ritee` (
  `members_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `borrowed_status` enum('borrowed','returned') DEFAULT NULL,
  `join_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members_ritee`
--

INSERT INTO `members_ritee` (`members_id`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `borrowed_status`, `join_date`) VALUES
(1, 'Nelson', 'Mandela', 'NelsonMandela@gmail.com', '2345678909', 'Sitapila', 'borrowed', '2022-10-23'),
(2, 'Abraham', 'Lincoln', 'Abraham Lincoln@gmail.com', '4567890990', 'Kalanki', 'returned', '2021-01-25'),
(4, 'Anne', 'Frank', 'AnneFrank@gmail.com', '3456879806', 'Bagbazzar', 'returned', '2023-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `shifts_ritee`
--

CREATE TABLE `shifts_ritee` (
  `shifts_id` int(11) NOT NULL,
  `shift_time` enum('morning','day','evening') DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shifts_ritee`
--

INSERT INTO `shifts_ritee` (`shifts_id`, `shift_time`, `staff_name`) VALUES
(6, 'day', 'Michael Jackson'),
(7, 'day', 'Leo Tolstoy'),
(8, 'morning', 'Rosa Parks'),
(9, 'evening', 'Marilyn Monroe'),
(10, 'day', 'Albert Einstein');

-- --------------------------------------------------------

--
-- Table structure for table `staffs_ritee`
--

CREATE TABLE `staffs_ritee` (
  `staffs_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `hired_date` date DEFAULT NULL,
  `shifts_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffs_ritee`
--

INSERT INTO `staffs_ritee` (`staffs_id`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `position`, `hired_date`, `shifts_id`) VALUES
(11, 'Nelson', ' Mandela', 'NelsonMandela@gmail.com', '4568765689', 'Chhauni', 'Director', '2022-05-16', 6),
(12, 'Abraham', 'Lincoln', 'AbrahamLincoln@gmail.com', '7627582728', 'Balaju', 'Manager', '2020-11-21', 7),
(13, 'Walt', 'Disney', 'WaltDisney@gmail.com', '6253862823', 'Gangabu', 'secretary', '2021-09-13', 8),
(14, 'Anne', 'Frank', 'AnneFrank@gmail.com', '8623687326', 'Bafal', 'Supervisor', '2019-03-11', 9),
(15, 'Walt', 'Disney', 'WaltDisney@gmail.com', '7364276433', 'Ramkot', 'Associate', '2021-05-15', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors_ritee`
--
ALTER TABLE `authors_ritee`
  ADD PRIMARY KEY (`authors_id`);

--
-- Indexes for table `bookauthor_ritee`
--
ALTER TABLE `bookauthor_ritee`
  ADD KEY `books_id` (`books_id`),
  ADD KEY `authors_id` (`authors_id`);

--
-- Indexes for table `books_ritee`
--
ALTER TABLE `books_ritee`
  ADD PRIMARY KEY (`books_id`);

--
-- Indexes for table `borrowedbooks_ritee`
--
ALTER TABLE `borrowedbooks_ritee`
  ADD PRIMARY KEY (`borrowed_id`),
  ADD KEY `members_id` (`members_id`),
  ADD KEY `books_id` (`books_id`),
  ADD KEY `staffs_id` (`staffs_id`);

--
-- Indexes for table `members_ritee`
--
ALTER TABLE `members_ritee`
  ADD PRIMARY KEY (`members_id`);

--
-- Indexes for table `shifts_ritee`
--
ALTER TABLE `shifts_ritee`
  ADD PRIMARY KEY (`shifts_id`);

--
-- Indexes for table `staffs_ritee`
--
ALTER TABLE `staffs_ritee`
  ADD PRIMARY KEY (`staffs_id`),
  ADD KEY `shifts_id` (`shifts_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors_ritee`
--
ALTER TABLE `authors_ritee`
  MODIFY `authors_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `books_ritee`
--
ALTER TABLE `books_ritee`
  MODIFY `books_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `borrowedbooks_ritee`
--
ALTER TABLE `borrowedbooks_ritee`
  MODIFY `borrowed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `members_ritee`
--
ALTER TABLE `members_ritee`
  MODIFY `members_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shifts_ritee`
--
ALTER TABLE `shifts_ritee`
  MODIFY `shifts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staffs_ritee`
--
ALTER TABLE `staffs_ritee`
  MODIFY `staffs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookauthor_ritee`
--
ALTER TABLE `bookauthor_ritee`
  ADD CONSTRAINT `bookauthor_ritee_ibfk_1` FOREIGN KEY (`books_id`) REFERENCES `books_ritee` (`books_id`),
  ADD CONSTRAINT `bookauthor_ritee_ibfk_2` FOREIGN KEY (`authors_id`) REFERENCES `authors_ritee` (`authors_id`);

--
-- Constraints for table `borrowedbooks_ritee`
--
ALTER TABLE `borrowedbooks_ritee`
  ADD CONSTRAINT `borrowedbooks_ritee_ibfk_1` FOREIGN KEY (`members_id`) REFERENCES `members_ritee` (`members_id`),
  ADD CONSTRAINT `borrowedbooks_ritee_ibfk_2` FOREIGN KEY (`books_id`) REFERENCES `books_ritee` (`books_id`),
  ADD CONSTRAINT `borrowedbooks_ritee_ibfk_3` FOREIGN KEY (`staffs_id`) REFERENCES `staffs_ritee` (`staffs_id`);

--
-- Constraints for table `staffs_ritee`
--
ALTER TABLE `staffs_ritee`
  ADD CONSTRAINT `staffs_ritee_ibfk_1` FOREIGN KEY (`shifts_id`) REFERENCES `shifts_ritee` (`shifts_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
