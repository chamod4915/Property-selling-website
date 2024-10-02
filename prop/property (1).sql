-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 06, 2024 at 12:27 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `property`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '$2a$12$LUbATTpbKjVkEckILuraVOMesXATq4s1DMCg7UKHXS7/Obafwwc0u');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `content`, `image`, `date`) VALUES
(4, 'Find your perfect apartment!', 'Welcome to your dream home! Nestled in a tranquil neighborhood, this beautiful house offers the perfect blend of comfort, style, and convenience. With 3 bedrooms and 2 bathrooms, it\'s designed to accommodate your lifestyle needs effortlessly.  As you step inside, you\'re greeted by a spacious and inviting living area, perfect for relaxing or entertaining guests. The open layout seamlessly connects the living room to the dining area and kitchen, creating a warm and inviting atmosphere for family gatherings.', 'header2.jpg', '2024-03-13 19:33:04'),
(3, 'How to find a good property?', 'Experience the epitome of modern urban living in this exquisite 2 bedroom apartment, offering breathtaking views and unparalleled comfort. Situated in a prime location, this is your opportunity to indulge in the ultimate cosmopolitan lifestyle.  Upon entering, you\'ll be captivated by the sleek and sophisticated design that defines this space. The open-concept layout seamlessly integrates the living, dining, and kitchen areas, creating a seamless flow perfect for both relaxation and entertainment.  The kitchen is a chef\'s delight, equipped with state-of-the-art appliances, stylish cabinetry, and quartz countertops. Whether you\'re hosting a dinner party or simply enjoying a quiet meal at home, this kitchen is sure to inspire your culinary adventures.  The master bedroom is a tranquil retreat, boasting expansive windows that offer panoramic views of the city skyline. With ample closet space and a luxurious ensuite bathroom, this master suite is designed to pamper and rejuvenate.  The second bedroom is equally spacious and versatile, offering endless possibilities for customization. Whether it\'s a home office, guest room, or personal sanctuary, this space can be tailored to suit your individual needs.', 'header3.jpg', '2024-03-13 19:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `message` varchar(199) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `pid`, `uid`, `date`, `time`, `message`, `status`) VALUES
(3, 1, 25, '2023-05-05', '12:50', 'Requesting for a house tour', 'Approved'),
(5, 1, 25, '2023-05-10', '17:30', 'Need a home tour', 'Approved'),
(6, 10, 24, '2023-05-20', '18:30', 'need to check the property', 'Pending Approval'),
(7, 8, 25, '2023-05-12', '12:25', 'Need a tour', 'Approved'),
(8, 1, 24, '2024-03-11', '13:52', 'need to visit', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `squarefeet` int NOT NULL,
  `nobeds` int NOT NULL,
  `nobathrooms` int NOT NULL,
  `price` int NOT NULL,
  `image` varchar(200) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `ownerID` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `address`, `squarefeet`, `nobeds`, `nobathrooms`, `price`, `image`, `latitude`, `longitude`, `status`, `ownerID`) VALUES
(1, 'Luxury Home Upscale', '27/2 School junction, Thalagala Rd, Homagama. Tel: 0773515314', 1200, 3, 2, 25000, 'house.jpg', '6.819147935179479', '80.03527708053022', 'Approved', 0),
(8, 'Luxury Villa', '29A Thalagala Road, Pitipana, Homagama.   Tel: 0774915064', 300, 4, 4, 45000, 'Accommodation-Brisbane-hotel-rooms-2-min-1.jpg', '6.8243172572848305', '80.03874288155984', 'Approved', 24),
(9, 'Rent House', 'D 113/2 Dampe Rd, Meegoda, Homagama', 1100, 4, 4, 60000, '1682413865_33688248728002466334447709152451820759199846n.jpg', '6.8261495394882', '80.04303441590197', 'Approved', 24),
(10, 'Hostel House', 'No 5, Homagama', 2500, 2, 2, 15000, 'header3.jpg', '6.824264', '80.044515', 'Approved', 0),
(15, 'Brick House', 'Brick House girls hostel, thalagala Rd, pitipana, Homagama. Tel: 0764152692', 360, 8, 8, 12000, 'unnamed.jpg', '6.800503893526637', '80.04299988107758', 'Approved', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contact` varchar(16) NOT NULL,
  `userType` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `contact`, `userType`, `password`) VALUES
(25, 'Thasila Nimesha', '10898536', 'thasila@gmail.com', '773515314', '', '$2y$10$TmAFwf4p0tn3GxfUCzTlO.CY4Tn528a6PzYsPBjMSmPg..mxTsBp6'),
(24, 'chamod thilina', 'chamod', 'chamod@gmail.com', '0774915064', 'Land', '$2y$10$bJ26XojxxPSxlQqKrY2gxO.Y.N.gN3iZaQIUjR6EZMAe/VnMKV.12'),
(29, 'Malmi chamoya', 'malmi', 'chamu@gmail.com', '0764152692', 'Landlord', '$2y$10$msSxtc7zuJAX77S6kdfgbeyDYgILXT0bS2Gv9x2Ppo4aIft7z4KmG');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
