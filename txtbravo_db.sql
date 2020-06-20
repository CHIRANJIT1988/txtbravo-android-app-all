-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2016 at 10:54 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `txtbravo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `reg_id` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_no` (`phone_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `phone_no`, `reg_id`, `api_key`, `device_id`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(2, 'Hrishikesh Das', '8822382723', 'APA91bE_emZZuAoy04Qw6AZQu7Svp0yFCBrs_vQ7xzaUOBsnMLkiYOJuwPzI0okTr5Eq592sdW1iKO1wkPItNO6Q0KKvtW3tVFJLQeDNsiDu0QIoNDmyG76brdC99C03enuJfW0etps2', 'fO8YPYF8byxWy6sE', '70:0b:c0:60:e8:ef', NULL, '4297f44b13955235245b2497399d7a93', NULL, '2016-03-29 22:40:10', '2016-05-17 16:23:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE IF NOT EXISTS `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `valid_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valid_upto` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_category` (`product_category_id`),
  KEY `fk_store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE IF NOT EXISTS `chat_messages` (
  `message_id` varchar(30) NOT NULL,
  `sender_id` varchar(10) NOT NULL,
  `recipient_id` varchar(10) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `timestamp` varchar(255) NOT NULL,
  `read_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `read_status`, `created_at`, `updated_at`, `status`) VALUES
('1463458209770-9864041200', '9864041200', '9954207020', 'hello', NULL, '1463458209770', 0, '2016-05-17 00:10:11', '2016-05-17 00:10:11', 1),
('1463458279866-9864041200', '9864041200', '9954207020', 'ORDER LIST - \n\n1. Basmati Rice 2kg (Qty-2)\n\nDELIVERY DETAILS - \n\nKUNDAN\nSIX MILE GUWAHATI, OPP FLY OVER, GUWAHATI, ASSAM, 781037\nM# 9864041200', NULL, '1463458279866', 0, '2016-05-17 00:11:20', '2016-05-17 00:11:20', 1),
('1463458320226-9954207020', '9954207020', '9864041200', 'Sorry item not availabe ', NULL, '1463458320226', 0, '2016-05-17 00:12:01', '2016-05-17 00:12:01', 1),
('1463458343885-9864041200', '9864041200', '9954207020', 'ha ha', NULL, '1463458343885', 0, '2016-05-17 00:12:25', '2016-05-17 00:12:25', 1),
('1463458366897-9864041200', '9864041200', '9954207020', 'plz send 1 notification from in our location plz', NULL, '1463458366897', 0, '2016-05-17 00:12:48', '2016-05-17 00:12:48', 1),
('1463458400022-9954207020', '9954207020', '9864041200', 'There is no smiley to send...', NULL, '1463458400022', 0, '2016-05-17 00:13:21', '2016-05-17 00:13:21', 1),
('1463458549690-9954207020', '9954207020', '9864041200', 'à¤¸à¥à¤Ÿà¥‹à¤°à¥‡ à¤•à¤¾ à¤¨à¤¾à¤® à¤•à¥à¤¯à¤¾ à¤¹à¥ˆ à¤”à¤° à¤•à¤¹à¤¾ à¤¹à¥ˆ', NULL, '1463458549690', 0, '2016-05-17 00:15:51', '2016-05-17 00:15:51', 1),
('1463458581508-9954207020', '9954207020', '9864041200', 'Sorry!! Your order (ORDER NO: 170516094029-000002) is cancelled by us. For any enquiry feel free to contact with us. Thanks', NULL, '1463458581508', 0, '2016-05-17 00:16:22', '2016-05-17 00:16:22', 1),
('1463458745041-9707930475', '9707930475', '9954207020', 'Gudmrng', NULL, '1463458745041', 0, '2016-05-17 00:19:06', '2016-05-17 00:19:06', 1),
('1463458842970-9706590152', '9706590152', '9706590152', 'hello', NULL, '1463458842970', 0, '2016-05-17 00:20:45', '2016-05-17 00:20:45', 1),
('1463458879530-9706590152', '9706590152', '9706590152', 'hey', NULL, '1463458879530', 0, '2016-05-17 00:21:21', '2016-05-17 00:21:21', 1),
('1463458984111-9706590152', '9706590152', '8399943116', 'hello', NULL, '1463458984111', 0, '2016-05-17 00:23:06', '2016-05-17 00:23:06', 1),
('1463459012439-9706590152', '9706590152', '8399943116', 'ðŸ™‹', NULL, '1463459012439', 0, '2016-05-17 00:23:35', '2016-05-17 00:23:35', 1),
('1463459015112-8399943116', '8399943116', '9706590152', 'fck u', NULL, '1463459015112', 0, '2016-05-17 00:23:36', '2016-05-17 00:23:36', 1),
('1463459027033-8399943116', '8399943116', '9706590152', 'ðŸ˜˜ðŸ˜˜', NULL, '1463459027033', 0, '2016-05-17 00:23:49', '2016-05-17 00:23:49', 1),
('1463459108611-9706590152', '9706590152', '9706590152', 'ghshhs', NULL, '1463459108611', 0, '2016-05-17 00:25:09', '2016-05-17 00:25:09', 1),
('1463459171150-9706590152', '9706590152', '9706590152', 'ugdvg', NULL, '1463459171150', 0, '2016-05-17 00:26:12', '2016-05-17 00:26:12', 1),
('1463459343519-9864041200', '9864041200', '9706590152', 'fucking sweet factory', NULL, '1463459343519', 0, '2016-05-17 00:29:05', '2016-05-17 00:29:05', 1),
('1463468914692-8822382723', '8822382723', '8822382723', 'moi atia', NULL, '1463468914692', 0, '2016-05-17 02:59:03', '2016-05-17 02:59:03', 1),
('1463499919335-9707930475', '9707930475', '8822382723', 'Dear Nitish ji... Aap kya product bikta hai', NULL, '1463499919335', 0, '2016-05-17 11:45:20', '2016-05-17 11:45:20', 1),
('1463501680705-8822382723', '8822382723', '9707930475', 'mur tat dsa j', NULL, '1463501680705', 0, '2016-05-17 12:15:35', '2016-05-17 12:15:35', 1),
('1463638651962-9085717171', '9085717171', '8822382723', 'Your order (ORDER NO: 190516115006-000003) is packed at Store. For any enquiry feel free to contact with us. Thanks', NULL, '1463638651962', 0, '2016-05-19 02:17:34', '2016-05-19 02:17:34', 1),
('1463638663501-9085717171', '9085717171', '8822382723', 'Your order (ORDER NO: 190516115006-000003) is out for delivery. Please be available. Thanks', NULL, '1463638663501', 0, '2016-05-19 02:17:46', '2016-05-19 02:17:46', 1),
('1463638674162-9085717171', '9085717171', '8822382723', 'Your order (ORDER NO: 190516115006-000003) is successfully delivered. Thank you for shopping with us', NULL, '1463638674162', 0, '2016-05-19 02:17:57', '2016-05-19 02:17:57', 1),
('1463638842644-8822382723', '8822382723', '9085717171', 'ORDER LIST - \n\n1. XYZ 1Ltr (Qty-2)\n\nDELIVERY DETAILS - \n\nEJDJDJDJJDHD\nGGAJDJDHKDKDNDFJF, , HHJDNDKDOKF, BHDJFJF, 875139\nM# 8822382723', NULL, '1463638842644', 0, '2016-05-19 02:17:17', '2016-05-19 02:17:17', 1),
('1463640872894-8822382723', '8822382723', '9864050890', 'syshhddj', NULL, '1463640872894', 0, '2016-05-19 02:51:08', '2016-05-19 02:51:08', 1),
('1463642976041-9864306369', '9864306369', '8822382723', 'fghhbyb', NULL, '1463642976041', 0, '2016-05-19 03:29:37', '2016-05-19 03:29:37', 1),
('1463643160417-8822382723', '8822382723', '9864306369', 'ORDER LIST - \n\n1. Doogdoogi 1set (Qty-2)\n\nDELIVERY DETAILS - \n\nEJDJDJDJJDHD\nGGAJDJDHKDKDNDFJF, , HHJDNDKDOKF, BHDJFJF, 875139\nM# 8822382723', NULL, '1463643160417', 0, '2016-05-19 03:29:15', '2016-05-19 03:29:15', 1),
('1463653750527-9864041200', '9864041200', '8134942522', 'hello', NULL, '1463653750527', 0, '2016-05-19 06:29:12', '2016-05-19 06:29:12', 1),
('1463653913538-8134942522', '8134942522', '9864041200', 'hi', NULL, '1463653913538', 0, '2016-05-19 06:31:57', '2016-05-19 06:31:57', 1),
('1463653951414-9864041200', '9864041200', '8134942522', 'how much is a hair cut for male??', NULL, '1463653951414', 0, '2016-05-19 06:32:33', '2016-05-19 06:32:33', 1),
('1463654798669-9706590152', '9706590152', '8134942522', 'ORDER LIST - \n\n1. shampoo 1piece (Qty-2)\n\nDELIVERY DETAILS - \n\nDFGFCF\nXVHFCGBJHVDVVHVDSFCC, GGFVVJGUJVFGNBVVVBV, FVBBVVHJBVDVBJJ, FBBBBBHJBVDCVV, 152368\nM# 9706590152', NULL, '1463654798669', 0, '2016-05-19 06:46:39', '2016-05-19 06:46:39', 1),
('1463654868896-8134942522', '8134942522', '9706590152', 'Your order (ORDER NO: 190516161544-000004) is packed at Store. For any enquiry feel free to contact with us. Thanks', NULL, '1463654868896', 0, '2016-05-19 06:47:50', '2016-05-19 06:47:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE IF NOT EXISTS `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `valid_upto` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `category_id` (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_details`
--

CREATE TABLE IF NOT EXISTS `delivery_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `delivery_charge` decimal(5,2) NOT NULL,
  `distance` decimal(5,1) NOT NULL DEFAULT '2.0',
  `adv_area_distance` decimal(5,1) NOT NULL DEFAULT '5.0',
  `deals_area_distance` decimal(5,1) NOT NULL DEFAULT '5.0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`),
  KEY `fk_store_id` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `delivery_details`
--

INSERT INTO `delivery_details` (`id`, `store_id`, `amount`, `delivery_charge`, `distance`, `adv_area_distance`, `deals_area_distance`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 300, 30.00, 2.0, 5.0, 5.0, '2016-05-16 03:23:30', '2016-05-16 13:57:01', 1),
(2, 2, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-16 04:13:20', '2016-05-19 04:14:42', 2),
(3, 3, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-16 04:31:18', '2016-05-19 05:39:12', 0),
(4, 4, 300, 30.00, 2.0, 5.0, 5.0, '2016-05-16 04:33:12', '2016-05-20 03:25:47', 1),
(12, 8, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-17 04:49:50', '2016-05-17 04:51:20', 0),
(22, 9, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-18 16:28:00', '2016-05-18 16:28:00', 2),
(23, 10, 250, 0.00, 2.0, 5.0, 5.0, '2016-05-19 02:06:47', '2016-05-19 02:06:47', 1),
(24, 11, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-19 02:45:51', '2016-05-19 02:45:51', 0),
(25, 12, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-19 03:19:34', '2016-05-19 03:19:34', 0),
(26, 13, 300, 30.00, 2.0, 5.0, 5.0, '2016-05-19 03:40:18', '2016-05-19 03:42:55', 1),
(32, 14, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-19 06:25:36', '2016-05-19 06:25:36', 2),
(33, 15, 1450, 50.00, 2.0, 5.0, 5.0, '2016-05-19 11:23:15', '2016-05-19 11:23:15', 1),
(36, 16, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-20 03:59:28', '2016-05-20 04:00:48', 0),
(46, 17, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-20 04:24:32', '2016-05-20 04:24:32', 1),
(47, 18, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-20 04:25:28', '2016-05-20 04:54:00', 2),
(54, 19, 0, 0.00, 2.0, 5.0, 5.0, '2016-05-21 07:19:14', '2016-05-21 07:19:14', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `delivery_charge` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_status` varchar(10) NOT NULL DEFAULT 'RECEIVED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`),
  KEY `address_id` (`shipping_address_id`),
  KEY `store_id` (`store_id`),
  KEY `product_category_id` (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_no`, `user_id`, `store_id`, `product_category_id`, `shipping_address_id`, `rating`, `delivery_charge`, `created_at`, `updated_at`, `order_status`) VALUES
(1, '160516224008-000001', 1, 1, 1, 1, NULL, 30.00, '2016-05-16 17:11:09', '2016-05-16 17:11:09', 'RECEIVED'),
(2, '170516094029-000002', 2, 1, 1, 2, NULL, 0.00, '2016-05-17 04:11:19', '2016-05-17 04:11:19', 'CANCELLED'),
(3, '190516115006-000003', 3, 10, 1, 3, NULL, 0.00, '2016-05-19 06:17:16', '2016-05-19 06:17:16', 'DELIVERED'),
(4, '190516130228-000003', 3, 12, 9, 3, NULL, 0.00, '2016-05-19 07:29:14', '2016-05-19 07:29:14', 'RECEIVED'),
(5, '190516161544-000004', 4, 14, 18, 4, NULL, 0.00, '2016-05-19 10:46:37', '2016-05-19 10:46:37', 'PACKED');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_2` (`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `weight`, `unit`, `price`, `discount_price`, `quantity`) VALUES
(1, 1, 1, 'Basmati', 2, 'Kg', 160.00, 150.00, 1),
(2, 2, 1, 'Basmati Rice', 2, 'kg', 160.00, 150.00, 2),
(3, 3, 4, 'XYZ', 1, 'Ltr', 10.00, 9.00, 2),
(4, 4, 5, 'Doogdoogi', 1, 'set', 2000.00, 1500.00, 2),
(5, 5, 8, 'shampoo', 1, 'piece', 300.00, 280.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(30) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_sub_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `weight` int(11) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_code` (`product_code`),
  KEY `product_category_id` (`product_category_id`),
  KEY `store_id` (`store_id`),
  KEY `product_sub_category_id` (`product_sub_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_category_id`, `product_sub_category_id`, `store_id`, `name`, `description`, `image`, `price`, `discount_price`, `weight`, `unit`, `created_at`, `updated_at`, `status`) VALUES
(1, '1463418589646-9954207020', 1, 1, 1, 'Basmati Rice', NULL, 'PRODUCT_160516224923_OJ1BTU79OZKVLPRJCO8N6WBMLB16H3SN2KE220FCV0VBIN8ORR.jpg', 160.00, 150.00, 2, 'kg', '2016-05-16 17:09:50', '2016-05-16 17:09:50', 1),
(4, '1463638550779-9085717171', 1, 3, 10, 'XYZ', NULL, 'PRODUCT_190516114505_41CEVJ85IPMZ331ZZX6TCOKMJNIOZ658260DBXQRAH459SQ6JI.jpg', 10.00, 9.00, 1, 'Ltr', '2016-05-19 06:15:53', '2016-05-19 06:15:53', 1),
(5, '1463642758003-9864306369', 9, 51, 12, 'Doogdoogi', 'silver with gold polish', 'PRODUCT_190516125333_AUSTP2ZN2SSBSQ4954RO4R3GELWQ23KBK7QAGZ8G4QI92END7S.jpg', 2000.00, 1500.00, 1, 'set', '2016-05-19 07:26:02', '2016-05-19 07:26:02', 1),
(8, '1463654702811-8134942522', 18, 60, 14, 'shampoo', NULL, 'PRODUCT_190516161215_ZXCQNU5R2LBMSU5EKZ7YSMF5NAE9CHIEBCHJ3O8K70EZ95FG1X.jpg', 300.00, 280.00, 1, 'piece', '2016-05-19 10:45:06', '2016-05-19 10:45:06', 1),
(9, '1463757950356-8472091659', 7, 49, 15, 'porsche jeans', 'best quality jeans', 'PRODUCT_200516205420_HD2FQR3YDEJ2WM2CN5S9ZA1NV9T75O90ZGDXP4ZFOG54XI3C4D.jpg', 1600.00, 1400.00, 1, '1', '2016-05-19 15:30:28', '2016-05-19 15:30:28', 1),
(10, '1463734330560-9706487799', 18, 60, 18, 'Haircut', NULL, NULL, 400.00, 400.00, 1, 'cut', '2016-05-20 08:52:11', '2016-05-20 08:52:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `image`, `created_at`, `updated_at`, `status`) VALUES
(1, 'grocery', 'grocery.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(2, 'bakery', 'bakery.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(3, 'restaurant', 'restaurant.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(4, 'flower', 'flower.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(5, 'pharmacy', 'pharmacy.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(6, 'doctor', 'doctor.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(7, 'clothing', 'clothes.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(8, 'footware', 'footware.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(9, 'jewellery', 'jewellery.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(10, 'hotel booking', 'hotel-booking.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(11, 'Tours & Travel', 'tours-travel.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(12, 'car rental', 'car-rental.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(13, 'electronics', 'electronics.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(14, 'furniture', 'furniture.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(15, 'logistics', 'logistics.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(16, 'laundry', 'laundry.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(17, 'laboratory', 'laboratory.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(18, 'parlour & spa', 'parlour-spa.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(19, 'books & stationaries', 'books-stationaries.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(20, 'fitness', 'fitness.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(21, 'pet & vet', 'pet-vet.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(22, 'hardware', 'hardware.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(23, 'electrical', 'electrical.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(24, 'printing press', 'printing-press.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(25, 'real estate', 'real-estate.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(26, 'institute', 'institute.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(27, 'catering', 'catering.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(28, 'housekeeping', 'housekeeping.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(29, 'architect & interior designer', 'architect.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(30, 'electrician', 'electrician.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(31, 'plumber', 'plumber.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(32, 'photographer', 'photographer.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1),
(33, 'pest control', 'pest-control.jpg', '2016-02-13 12:11:50', '2016-02-13 12:11:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_categories`
--

CREATE TABLE IF NOT EXISTS `product_sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `product_category_id` (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `product_sub_categories`
--

INSERT INTO `product_sub_categories` (`id`, `product_category_id`, `name`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Rice & flours', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(2, 1, 'pulses', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(3, 1, 'edible oil', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(6, 1, 'personal care', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(10, 2, 'cakes & pastries', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(11, 2, 'breads and cookies ', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(12, 2, 'burgers & hotdogs', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(16, 5, 'meals', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(17, 5, 'fast foods', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(18, 13, 'wash & iron', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(19, 13, 'iron', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(24, 6, 'dry clean', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(26, 7, 'medicines', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(27, 6, 'Wash', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(28, 7, 'Baby items', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(29, 7, 'Daily essentials', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(30, 7, 'Personal and wellness', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(31, 7, 'Pet care', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(32, 1, 'dal & pulses', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(33, 1, 'edible oil & ghee', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(34, 1, 'masala & spices', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(35, 1, 'salt, sugar & milk products', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(36, 1, 'beverages', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(37, 1, 'biscuits & namkeens ', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(38, 1, 'branded foods', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(39, 1, 'Household Goods', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(40, 1, 'others', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(41, 2, 'rolls n sandwich', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(43, 1, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(44, 2, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(45, 3, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(46, 4, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(47, 5, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(48, 6, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(49, 7, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(50, 8, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(51, 9, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(52, 10, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(53, 11, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(54, 12, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(55, 13, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(56, 14, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(57, 15, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(58, 16, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(59, 17, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(60, 18, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(61, 19, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(62, 20, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(63, 21, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(64, 22, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(65, 23, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(66, 24, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(67, 25, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(68, 26, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(69, 27, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(70, 28, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(71, 29, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(72, 30, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(73, 31, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(74, 32, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1),
(75, 33, 'all', '2016-05-17 04:00:00', '2016-05-17 04:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE IF NOT EXISTS `shipping_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL DEFAULT 'india',
  `pincode` varchar(6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`name`,`phone_no`,`landmark`,`address`,`city`,`state`,`country`,`pincode`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `name`, `phone_no`, `landmark`, `address`, `city`, `state`, `country`, `pincode`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Chiranjit Bardhan', '9707930475', NULL, 'Kanya Apartment, chatribari', 'Guwahati', 'Assam', 'india', '781008', '2016-05-16 13:10:59', '2016-05-16 13:10:59', 1),
(2, 2, 'kundan', '9864041200', 'opp fly over', 'six mile guwahati', 'guwahati', 'assam', 'india', '781037', '2016-05-17 00:11:17', '2016-05-17 00:11:17', 1),
(3, 3, 'ejdjdjdjjdhd', '8822382723', NULL, 'ggajdjdhkdkdndfjf', 'hhjdndkdokf', 'bhdjfjf', 'india', '875139', '2016-05-19 02:17:09', '2016-05-19 02:17:09', 1),
(4, 4, 'dfgfcf', '9706590152', 'ggfvvjgujvfgnbvvvbv', 'xvhfcgbjhvdvvhvdsfcc', 'fvbbvvhjbvdvbjj', 'fbbbbbhjbvdcvv', 'india', '152368', '2016-05-19 06:46:29', '2016-05-19 06:46:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `owner_name` varchar(30) DEFAULT NULL,
  `phone_no` varchar(10) NOT NULL,
  `alternate_phone_number` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_id` varchar(255) NOT NULL,
  `api_key` varchar(1000) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `is_online` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_no` (`phone_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `owner_name`, `phone_no`, `alternate_phone_number`, `email`, `reg_id`, `api_key`, `device_id`, `is_online`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chinaki Grocery Mart', 'Chiranjit Bardhan', '9954207020', '9038616815', 'bardhan.jit@gmail.com', 'APA91bF2gXF0tKdu9pqqsJrcEpUxDQLMuPk0r-PrGe5FrLPePtJ9vHpLLGDVpnl7x1DkpAYEUlL7JW5w3LgdhkTh3dmg4qr9_LiFBQLqnt_N2Ontsl0GfYMxG3_SM4nlro1jRPPLv1jv', 'Mb4e7hQPM2yDeRy9', 'bc:d1:d3:b7:c8:ac', 1, '4297f44b13955235245b2497399d7a93', 1, '2016-05-16 07:22:44', '2016-05-19 14:40:23'),
(2, 'Click A Pic', 'Kundan Deka', '8399943116', NULL, NULL, 'APA91bGSVQZbKlwgotKn2qHbHqQsDNIsOISsRFLH5gkd-46QPnnks0xuC-hL3spnHuAXL8ItPitEblvR4SgAExX7DfGJmi52VkDwER6lToVOk1aQPjZGhOMe0gXwg2BdkZOZgjWmqw4W', 'jhn0PQwP1aKUx2cY', '02:00:00:00:00:00', 1, '49732728def3714b28165324286c43ac', 1, '2016-05-16 08:12:56', '2016-05-19 08:14:42'),
(3, 'Food- O', 'Panna', '9706590152', NULL, NULL, 'APA91bFEVgYy4_8_MAR3POtGcsh7llyy8L5RSpeQ_Y7V4gd4llZHbcwD_t2lLsB19ay1tkdOAGZXQU9hAosxsrldsYUvg4JabUcvnk_VMFXevrnq28SaD9XRc1tpOkeJa6rYmYUABuP-', 'RK7Y2FSH5GFM67Pd', 'cc:c3:ea:00:23:e3', 1, '344a1e4ee5c569953d27aebd6e552467', 1, '2016-05-16 08:30:49', '2016-05-19 10:14:13'),
(4, 'Yummz', 'H Das', '8822382723', NULL, NULL, 'APA91bE5eFqDQcZaj_xnlP6GNaQtWDHL5vA3cB2gdGIloT5iV7eJU6F3VsNTENsCacn1abqYO4zN3H6bjTsrHSZ414Wk_n95o0MblzTBcfGbQfEG2RiRr46KcK8srBB2vxy_11DrEzJj', 'OYHKYkxlLuDfALLy', '70:0b:c0:60:e8:ef', 1, '471a963d752aeceb0a68c9142fcb928c', 1, '2016-05-16 08:32:35', '2016-05-20 08:11:35'),
(8, 'Aayavika ', 'Manish Garodia, Rajat Sureka', '8135006151', NULL, NULL, 'APA91bF4GY4Vl1oUnwD4nr_W0UWAC_J7oRg6Qb-5qFIQKyqZyA5X04qMCJP_0lmRt97LuVRWdLL4YstrXk6NThYZRnqUEv0Lr834jwxKY8iB5_zbqOoWedkr1B9JGTX40Xdplm7mt2Km', 'q3eNSeQghQNwovcF', '84:11:9E:BB:1C:2E', 1, '7c4795fec054bbc39daf1cdb54e5ee8d', 1, '2016-05-17 08:48:52', '2016-05-17 08:52:25'),
(9, 'collosus', 'Bonny', '8474078964', NULL, 'bonny.dutta01@gmail.com', 'APA91bEgkpW7sRmxpmOc-zYqwRw7w3fbBmvtwB_icrnImgnIYzwU4yeF3lOasNS8vzGimlSJ25WVg6QHuOwpWKf94noiuP6uX_VjCnu0aYzwa-VUHObwbZsxheDTdLeqGyyiXm012sIt', 'm5Nz1IKlajD8nj6X', 'null', 1, 'a9491e6c1271e36d008e0d1ab3dac42d', 1, '2016-05-18 20:26:42', '2016-05-18 20:28:00'),
(10, 'KROSSMART.IN', 'PARAN', '9085717171', NULL, NULL, 'APA91bG7yZAmmePQI_Y8EEASnbkppe6IGgaGPsa37aUFoQS2-c2NRSpICO1_8-IjLjVPejSA7EFP9AFNdIDKbZT1OCHhOucxmHbsFxJYon-ZrNkgRhzYErvsm6fAlIKj4e3FOwNDfA-O', '9vXfQ4f0zFTwnlob', 'null', 1, 'c2dcdd5a941e1f9cf5c8fcbe41ae2fdb', 1, '2016-05-19 06:06:04', '2016-05-19 12:22:10'),
(11, 'Inconversation', 'kakuli dutta', '9864050890', NULL, NULL, 'APA91bFsuUzGQqJI3KpUlW4RLZR5EVjhwetgeHdvuLpwC-JMabQxsjmTwzRqWecgire4vDor8iZLZEgEwdnFY9geBF8zp6D5F-CvJe6nrLLT7UhXfnYfKj7CkV_prTms0Mk88m6Ok6oR', 'yK9lUGKld3TJLcm6', '64:B8:53:20:D4:61', 1, '95deb5011a8fe1ccf6552bb5bcda2ff0', 1, '2016-05-19 06:43:14', '2016-05-21 14:43:08'),
(12, 'junbiri axomiya gohona', 'ashish bordoloi', '9864306369', NULL, 'ashishbordoloi37@gmail.com', 'APA91bFbEQpDZ3UZaldsw_CDT5rg_o57u2mzyPuKPIgo5vdj3zqTqqoJxMNr1AxIhgPv3Gl1bLImV-rHv-MFtSDJzt0WdNy5ZCeIuhsvcoh-AkJepIPBFs-Ek77QZds4X5044Vsc2vdw', 'pHRPZOnJXid98Q34', 'null', 1, 'e3a5ac469bc3dc187936b36d27277a94', 1, '2016-05-19 07:17:18', '2016-05-19 15:29:42'),
(13, 'Anjali Stores', 'Ajay', '8822110100', NULL, NULL, 'APA91bGmy-lDH4AcHkusr5SdhIuM3ALAvj9v7n77L8bzWTCOoitBFYzcbGB4vk5XA3jTjTlPBlUYQBBMblzTx6zOFjtQ6RtigBvy3ebD9nYN1PA2QJUz7z1CUV4LSeOnuizEiwoO1Y07', 'QhzBIvzryh4M1a3p', '00:0c:e7:82:ff:5f', 1, '344a1e4ee5c569953d27aebd6e552467', 1, '2016-05-19 07:39:32', '2016-05-20 08:00:39'),
(14, 'pure unisex salon', 'Asum Ngomdir', '8134942522', NULL, NULL, 'APA91bGxMdG_w9nGNAVlojkaCa00Drpx5nTQQtqAae65rESruY6a0czWBRueWdkdJmfDU-1OKFzoZxgqHrKs8KpLkPN9Rzu3_zx-KegpwIqXgsi3IueBQMXftrdew2wP0BaQuftnMSN9', 'xwCkHmF6Tm4EwnFE', 'E4:12:1D:CD:1E:A8', 1, '983d4c004840276554db769c3d4eb502', 1, '2016-05-19 10:24:26', '2016-05-21 11:25:36'),
(15, 'kaves', 'nirwan', '8472091659', '9864821379', 'narpatnirwan25@gmail.com', 'APA91bEaq_txnQUblezUOycEzEDQHeK5z-HyH2aCZFFVfs5K2R8Q5zIAwYVYrBySI7MAOsLVZP6w41vXRJX0E_X59Ievjb70QI_-CO7MapHaJNG5ty9mVOUzUbP9QR2wvmOs0r6_Fuhy', 'ks4mlIChgBZ0XMgA', '48:5A:3F:5F:5B:35', 1, '9d022b30606db1202dc577a1c168dfb6', 1, '2016-05-19 15:21:42', '2016-05-19 15:28:39'),
(16, 'Pacific Beauty Zone', 'Purnima Sinha', '9085097030', NULL, NULL, 'APA91bGgSSkM3NoBXVsB0v33oTZdPqaarRiKOXY7g9w7nM-YrXnoerBa8ZkPNt9lRfXpf4kQpRQOuvIfcCj_K4-J6cl86QKNsSnv3s7zUr0wt1lj5VDxYarhRRvRl6xVzUcxBSYXeM7q', 'kCj629X6jL9SWDdM', '00:7f:de:62:02:83', 0, 'a1aeee2c7f8cdda3f0d6940847126c66', 1, '2016-05-20 07:58:21', '2016-05-20 15:55:49'),
(17, 'ANAND', 'Chinmayee Sarma', '9706928718', '8486713431', 'anandchem.sarma@gmail.com', 'APA91bHng2CEZS4zThDl46EItCdKzORUfG8-R5JF0qsczeUaD36JlW4deE_Id9Qfra1ZMiGGoEo1Vs7LlMMllIom1xXNAimRa3lSpPCEJ6HeVxmVYaJ0GyaXaqxja7jOQq1D7aNn1wZO', 'lPeSUGOWAMrLrVhY', '5c:f7:c3:66:5a:9c', 1, 'ff770f9637c0f03ae34a3834b2321f99', 1, '2016-05-20 08:23:08', '2016-05-20 08:24:33'),
(18, 'Pacific Beauty Zone', 'Purnima Sinha', '9706487799', NULL, NULL, 'APA91bEUKV7Rhe3H1bbFd0SQU_UYZmCwdjycmm4akmZDlGH8mWCj2U1k5w3PXdAP6bchtGK9nTpO9ro8yuAj8eK2_I6l9C40DHIS6YEvDAtmZV8wxS7qSCjyde1Db2mgjyQFIam5DLis', '9T5CuaFRGuF8As60', 'B8:5A:73:35:0A:84', 1, 'a1aeee2c7f8cdda3f0d6940847126c66', 1, '2016-05-20 08:24:50', '2016-05-21 03:23:49'),
(19, 'rashidhabibs ', 'rashid Ahmed ', '9707066092', '9707066092', 'rashidhabibs@gmail.com', 'APA91bEHAZwecaC0iaiGIgxKDsW7VUGwuCsUJP8PWBMWZqioGsgI2nV0vA-b0ZIGRLe1i_SJR0kM8CiktPCPDfuacrESoCavor1x9Cjqx_fH6-kmC9U5CdzfTfPqJEO4dvIcGIWvIg5g', '0blz0HBVPzW6b0pe', '9c:df:b1:02:01:97', 1, '7d0ba610dea3dbcc848a97d8dfd767ae', 1, '2016-05-21 11:17:10', '2016-05-21 11:26:45');

-- --------------------------------------------------------

--
-- Table structure for table `store_addresses`
--

CREATE TABLE IF NOT EXISTS `store_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `country` varchar(50) NOT NULL DEFAULT 'india',
  `latitude` varchar(50) NOT NULL DEFAULT '0',
  `longitude` varchar(50) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`),
  KEY `fk_store_id` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `store_addresses`
--

INSERT INTO `store_addresses` (`id`, `store_id`, `address`, `city`, `state`, `pincode`, `country`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chatribari', 'Guwahati', 'Assam', '781008', 'india', '26.1723', '91.7487', '2016-05-16 03:24:30', '2016-05-16 13:59:44'),
(2, 2, 'Six Mile ,near Kalakhetra', 'Guwahati', 'Assam', '781037', 'india', '26.1335', '91.8213', '2016-05-16 04:14:34', '2016-05-19 04:14:42'),
(3, 3, 'Sunderpur Road', 'Guwahati', 'Assam', '781037', 'india', '26.1434', '91.8119', '2016-05-16 04:32:30', '2016-05-19 05:39:32'),
(4, 4, 'Sixmile Byelane 2', 'Guwahati', 'Assam', '781035', 'india', '26.1178', '91.8218', '2016-05-16 04:34:13', '2016-05-20 03:26:00'),
(13, 8, 'Opp. Sohum Shoppe, 1st floor Nilakshi Plaza, Chrstianbasti, G. S. Road ', 'Guwahati ', 'Assam ', '781005', 'india', '26.1552', '91.779', '2016-05-17 04:52:13', '2016-05-17 04:52:13'),
(23, 9, 'lalganesh, odalbakra', 'guwahati', 'assam', '781034', 'india', '26.1402', '91.7503', '2016-05-18 16:29:16', '2016-05-18 16:29:16'),
(24, 10, 'VIP Road, Opp Rahman Hospital', 'Guwahati', 'Assam', '781022', 'india', '26.1434', '91.8123', '2016-05-19 02:10:15', '2016-05-19 02:10:15'),
(25, 11, 'plot no 179,sundarpur near neepco bhawan R G Baruah road.', 'guwahati', 'assam', '781005', 'india', '26.1616', '91.7801', '2016-05-19 02:47:48', '2016-05-19 02:47:48'),
(26, 12, 'Akashi path RGB Road', 'guwahati', 'Assam', '781024', 'india', '26.1668', '91.779', '2016-05-19 03:21:35', '2016-05-19 03:21:35'),
(27, 13, 'ambika nagar', 'guwahati', 'assam', '765885', 'india', '26.1676', '91.7792', '2016-05-19 03:43:35', '2016-05-19 03:43:35'),
(33, 14, 'Dona Planet 2nd floor', 'Guwahati', 'Assam', '781896', 'india', '26.1599', '91.7743', '2016-05-19 06:26:34', '2016-05-19 06:26:34'),
(34, 15, 'rg baruah road', 'guwahati', 'assam', '781024', 'india', '26.1686', '91.7784', '2016-05-19 11:23:57', '2016-05-19 11:23:57'),
(37, 17, 'R.G.Baruah Road, Near Usha Court Apartment', 'Guwahati', 'Assam', '781021', 'india', '26.1768', '91.7761', '2016-05-20 04:26:03', '2016-05-20 04:26:03'),
(38, 19, 'rashidhabibs hair&beauty ', 'guwahati ', 'Assam ', '781005', 'india', '26.1579', '91.783', '2016-05-21 07:21:25', '2016-05-21 07:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `store_categories`
--

CREATE TABLE IF NOT EXISTS `store_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id_2` (`store_id`,`product_category_id`),
  KEY `store_id` (`store_id`),
  KEY `product_category_id` (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=177 ;

--
-- Dumping data for table `store_categories`
--

INSERT INTO `store_categories` (`id`, `store_id`, `product_category_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, '2016-05-16 03:22:48', '2016-05-19 09:54:01', 1),
(4, 2, 32, '2016-05-16 04:13:06', '2016-05-17 00:07:57', 1),
(5, 2, 20, '2016-05-16 04:13:07', '2016-05-17 00:07:58', 0),
(6, 3, 2, '2016-05-16 04:30:55', '2016-05-17 04:34:08', 0),
(7, 4, 3, '2016-05-16 04:33:09', '2016-05-16 04:33:09', 1),
(16, 1, 4, '2016-05-17 01:39:31', '2016-05-19 09:54:01', 1),
(17, 4, 2, '2016-05-17 02:12:27', '2016-05-20 03:25:17', 1),
(19, 3, 10, '2016-05-17 02:32:31', '2016-05-17 02:32:31', 0),
(20, 3, 14, '2016-05-17 02:32:34', '2016-05-17 09:30:25', 0),
(23, 3, 22, '2016-05-17 02:32:41', '2016-05-17 03:00:26', 0),
(28, 3, 18, '2016-05-17 03:00:28', '2016-05-17 03:00:29', 0),
(32, 8, 7, '2016-05-17 04:49:04', '2016-05-17 04:51:17', 1),
(34, 8, 20, '2016-05-17 04:51:16', '2016-05-17 04:51:16', 0),
(36, 3, 3, '2016-05-17 09:30:23', '2016-05-19 05:38:36', 1),
(38, 3, 15, '2016-05-17 09:30:23', '2016-05-17 09:30:23', 0),
(42, 9, 27, '2016-05-18 16:27:03', '2016-05-18 16:27:03', 1),
(43, 9, 19, '2016-05-18 16:27:10', '2016-05-18 16:27:10', 0),
(44, 10, 1, '2016-05-19 02:06:10', '2016-05-19 02:06:10', 1),
(45, 11, 7, '2016-05-19 02:43:30', '2016-05-19 02:44:34', 1),
(46, 11, 8, '2016-05-19 02:43:48', '2016-05-19 02:44:34', 1),
(47, 11, 9, '2016-05-19 02:43:48', '2016-05-19 02:44:33', 1),
(48, 11, 17, '2016-05-19 02:43:49', '2016-05-19 02:44:20', 0),
(49, 11, 14, '2016-05-19 02:43:51', '2016-05-19 02:44:32', 1),
(50, 11, 20, '2016-05-19 02:43:53', '2016-05-19 02:44:22', 0),
(51, 11, 22, '2016-05-19 02:43:53', '2016-05-19 02:44:23', 0),
(52, 11, 19, '2016-05-19 02:43:56', '2016-05-19 02:44:31', 1),
(53, 11, 23, '2016-05-19 02:43:58', '2016-05-19 02:44:23', 0),
(54, 11, 32, '2016-05-19 02:44:01', '2016-05-19 02:44:29', 0),
(58, 11, 5, '2016-05-19 02:44:14', '2016-05-19 02:44:34', 0),
(59, 11, 6, '2016-05-19 02:44:14', '2016-05-19 02:44:34', 0),
(102, 12, 9, '2016-05-19 03:17:31', '2016-05-19 03:17:31', 1),
(103, 13, 1, '2016-05-19 03:39:41', '2016-05-20 04:00:42', 1),
(105, 2, 3, '2016-05-19 04:01:48', '2016-05-19 04:01:49', 0),
(109, 14, 18, '2016-05-19 06:24:38', '2016-05-19 06:24:38', 1),
(110, 14, 11, '2016-05-19 06:24:47', '2016-05-19 06:24:47', 0),
(113, 15, 7, '2016-05-19 11:21:57', '2016-05-19 11:22:20', 1),
(115, 15, 20, '2016-05-19 11:22:08', '2016-05-19 11:22:08', 0),
(119, 4, 10, '2016-05-20 02:47:24', '2016-05-20 03:25:16', 0),
(124, 16, 18, '2016-05-20 03:58:47', '2016-05-20 11:55:44', 1),
(125, 16, 6, '2016-05-20 03:58:51', '2016-05-20 04:00:47', 0),
(146, 16, 26, '2016-05-20 04:00:45', '2016-05-20 11:55:45', 0),
(156, 17, 13, '2016-05-20 04:23:20', '2016-05-20 04:23:30', 1),
(157, 17, 25, '2016-05-20 04:23:23', '2016-05-20 04:23:23', 0),
(158, 17, 5, '2016-05-20 04:23:30', '2016-05-20 04:23:30', 0),
(160, 18, 18, '2016-05-20 04:25:00', '2016-05-20 04:53:54', 1),
(161, 18, 11, '2016-05-20 04:25:01', '2016-05-20 04:53:55', 0),
(165, 18, 25, '2016-05-20 04:53:54', '2016-05-20 04:53:54', 0),
(172, 19, 18, '2016-05-21 07:17:27', '2016-05-21 07:18:13', 1),
(174, 19, 26, '2016-05-21 07:18:03', '2016-05-21 07:18:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `support_chat_messages`
--

CREATE TABLE IF NOT EXISTS `support_chat_messages` (
  `message_id` varchar(30) NOT NULL,
  `sender_id` varchar(10) NOT NULL,
  `recipient_id` varchar(10) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `timestamp` varchar(255) NOT NULL,
  `read_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `support_chat_messages`
--

INSERT INTO `support_chat_messages` (`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `read_status`, `created_at`, `updated_at`, `status`) VALUES
('1463471761248-9706353416', '9706353416', '8822382723', 'wt', NULL, '1463471761248', 0, '2016-05-17 03:56:02', '2016-05-17 03:56:02', 1),
('1463502827201-8822382723', '8822382723', '8822382723', 'hello', NULL, '1463502827201', 0, '2016-05-17 12:24:16', '2016-05-17 12:24:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `latitude` varchar(50) NOT NULL DEFAULT '0',
  `longitude` varchar(50) NOT NULL DEFAULT '0',
  `reg_id` varchar(255) DEFAULT NULL,
  `api_key` varchar(1000) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_no` (`phone_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone_no`, `latitude`, `longitude`, `reg_id`, `api_key`, `device_id`, `email`, `password`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Chiranjit Bardhan', '9707930475', '26.17698', '91.7458916', 'APA91bHUAOoYakv7bczyC21Enj6yvj_t7FOHPELUQx6ySNJMccyN1g5N-nlGUfb86wKBhcd7VjBNDdUaYPKxjbTGsYC73ZAMefRrYsxE1ScX5fkivvbVOxgUwUqDLyDmEtqdmQcXWvRK', 'lHsmfzERdabHpOae', 'bc:d1:d3:b7:c8:ac', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-16 07:39:54', '2016-05-16 17:51:36', 1),
(2, 'Kundan', '9864041200', '26.1614599', '91.7723366', 'APA91bEKCyaqibo1hYuEB6YsrQ1GamL-IUy2x7PKT_RJPoSstyXbKTvwWAmByWH0Z0Gk2_dcPoKkpJRsNIooD08ZeChyvgnH4tgTW99QhRO0urjrPUXXxq7S5mLODsB_zflNybzkqPyw', 'h3B4Tyw46So7YyYC', '02:00:00:00:00:00', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-16 08:05:32', '2016-05-17 04:01:44', 1),
(3, 'hrishikesh das', '8822382723', '26.173525', '91.7771714', 'APA91bHYMKA9iKrvJA-cGuiSk1wa9xviyEa6UIFwtjpoS_EUjQ39hexWZlpitgWDau49yHKvYpHbKV4cpbUFBO21BKIFB9iyiq5u4ZHqzY2YzNEbWX3cW-vweZGhSrNm37fRsEnMI1I2', '6Rag7FZPEP4ppxs2', '70:0b:c0:60:e8:ef', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-16 08:29:04', '2016-05-17 06:08:40', 1),
(4, 'Deb', '9706590152', '0', '0', 'APA91bFTwDdkKc8nXBP-83FHkpPMNFsSU9jzbV_FY46SppuRrUFAwfyvUIkZpY-rJG4BRni51XbgRmmmIsnX2-_lIcaGG3bvPAmg1iUCdcXpCs-Vj0og7o21cTLL_1b7s8qnWBynud4o', 'VUD5N9lmkn2DeVXk', 'cc:c3:ea:00:23:e3', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-16 08:36:28', '2016-05-17 04:19:41', 1),
(14, 'manash', '9706353416', '0', '0', 'APA91bGxGEIp42Or7NCR2o4aFgT3eVoLlOZq9z5qZvlTr8bt_s-TDwO82PQdxK1ncKnlvPA1WCOq6lDs0ed4c2s6qzuDEnL6RfFeQGTypot9As64Sx2oMb9j0hqbo_XA-Z5-vt1qzj3q', '24xcBk91G6iFO82D', '02:00:00:00:00:00', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-17 07:55:31', '2016-05-17 07:55:31', 1),
(15, 'ajay das', '9435129385', '0', '0', 'APA91bGQ6zgHtpbKruYH9qDo4PvFMosJTPrj7WjENodG5FQLmjsDMhyJs3WdpWMGMMLxfh-ov557XPMxV-52_tcyd4_Idood7BqS9G-NMJzNWYfLU7suOpC9uhMfDwp182WPQ2ir5kre', 'Ki02vHGHXQ3jmGuQ', '54:27:58:1f:44:f1', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-17 15:14:22', '2016-05-17 15:14:22', 1),
(16, 'Nitish ', '9706125041', '26.1191707', '91.8019534', 'APA91bEMLelE3mDYaref7xGAEWT4gM-jTuPMegFwecLsDS2wjcLuGl5m3lYyRZ-rOH5MYe_tT0A7eHEXUYq9atjQP-Ip7FSKyMdmbUXDW-W7u3VgmVyS5JzEDxMDgCwNKdPAn867mAE9', 'pwy1iZLVSOQs3f7P', 'f4:8b:32:2c:7c:e3', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-17 15:36:09', '2016-05-17 15:36:09', 1),
(17, 'anil', '9401340330', '0', '0', 'APA91bGEHxda8eBIkrJ_Th3LqDSmUgGuym5mqEXfDI8-mwBZiLBZPq1nWoa_4G6xn6N47q0PP1x-_bVYjbbr2Y_Vd2RXP-pafy8CJ1K3MRSaPLNbZxi8W15qJp6LISE3q7jrxu904i0m', 'DnhiHJtXJMFouYAZ', '14:dd:a9:36:04:e1', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-18 11:55:19', '2016-05-18 11:55:19', 1),
(18, 'bonny ', '8474078964', '0', '0', 'APA91bGr1km4ymisg_1t12otox5muylKD033ykz0-9ObWxrLyouMIPBByKoG0Qes6Pbr_Weg_aES-b9ZyommUKWInocnNQvicG20ROQZR3nX5aF7wSUuVv6qrm2X0CTcIGcTeEY_R21f', 'hTnSsLzmUW0edlSa', 'null', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-18 20:36:52', '2016-05-18 20:36:52', 1),
(19, 'Abhinov Kumbang ', '9508209880', '0', '0', 'APA91bGWkx6XAmAwpWMd1_N-Ds2tBEPi1X2h-gbidYau9-sSOwYPVCI2ZHDX0z6srdBdULQBlwW38xJCTF1I0yrCPP9ZiawSSZY5rf8xUV5kdgPNukjAbD2D2c99tjdwj8ouXCyLEYSE', 'H5z4YkCcIhMq4kfk', '38:94:96:F8:60:57', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-19 07:12:59', '2016-05-19 07:12:59', 1),
(20, 'Vikram', '8822110100', '26.168686666666666', '91.77997833333332', 'APA91bHPEfMMw-_eTGWEWxarQuFi8xW2rT93zNaaBvbTN02gnM-vWGAqh2pMyiFwifQpkWKuyIaEkPig3zTyHKdxCaeaVTDwzeI9qhBHa_KwNJlvPRJGn0fQsrBEa9-LOZ9C822Uljax', 'wxo93H8csgkdUvfs', '00:0c:e7:82:ff:5f', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2016-05-19 07:42:13', '2016-05-19 07:42:13', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advertisements_ibfk_2` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery_details`
--
ALTER TABLE `delivery_details`
  ADD CONSTRAINT `delivery_details_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_addresses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`product_sub_category_id`) REFERENCES `product_sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  ADD CONSTRAINT `product_sub_categories_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store_addresses`
--
ALTER TABLE `store_addresses`
  ADD CONSTRAINT `store_addresses_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store_categories`
--
ALTER TABLE `store_categories`
  ADD CONSTRAINT `store_categories_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `store_categories_ibfk_2` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
