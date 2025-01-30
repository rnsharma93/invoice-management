-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 27, 2025 at 06:14 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int UNSIGNED NOT NULL,
  PRIMARY KEY (`key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int UNSIGNED NOT NULL,
  PRIMARY KEY (`key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `gst_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `state_id` (`state_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `city`, `state_id`, `gst_number`, `created_at`, `updated_at`) VALUES
(36, 'manish soni', 'whomanishsoni@gmail.com', '9460966996', 'bhilwara krishna', 'bhilwara', 21, 'asdasd', '2025-01-15 05:10:45', '2025-01-15 06:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `queue` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int UNSIGNED NOT NULL,
  `pending_jobs` int UNSIGNED NOT NULL,
  `failed_jobs` int UNSIGNED NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int UNSIGNED DEFAULT NULL,
  `created_at` int UNSIGNED NOT NULL,
  `finished_at` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hsn_code` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `tax_rate_id` int DEFAULT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tax_rate_id` (`tax_rate_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `hsn_code`, `grade`, `purchase_price`, `tax_rate_id`, `tax_amount`, `sale_price`, `created_at`, `updated_at`) VALUES
(5, 'Product A', 'PRO-A', 'ONE', '100.00', 6, '5.00', '105.00', '2025-01-21 09:32:28', '2025-01-21 09:32:28'),
(6, 'Product B', 'PRO-B', 'TWO', '200.00', 6, '10.00', '210.00', '2025-01-21 09:33:13', '2025-01-21 09:33:13'),
(7, 'Product C', 'PRO-C', 'THREE', '300.00', 2, '36.00', '336.00', '2025-01-21 09:33:45', '2025-01-21 09:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rawana_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `rawana_weight` decimal(10,2) NOT NULL,
  `kanta_weight` decimal(10,2) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `vehicle_id` int DEFAULT NULL,
  `remark` text,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rawana_id` (`rawana_id`),
  KEY `vehicle_id` (`vehicle_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `rawana_id`, `date`, `amount`, `grade`, `rawana_weight`, `kanta_weight`, `rate`, `total`, `vehicle_id`, `remark`, `photo`, `created_at`, `updated_at`) VALUES
(6, 11, '2025-01-26', '100.00', '100', '100.00', '100.00', '100.00', '100.00', 5, '100', 'purchase_11_1737880865.png', '2025-01-26 02:56:34', '2025-01-26 03:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `rawanas`
--

DROP TABLE IF EXISTS `rawanas`;
CREATE TABLE IF NOT EXISTS `rawanas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `eway_bill_no` varchar(255) NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `vehicle_id` bigint UNSIGNED NOT NULL,
  `rawana_weight` decimal(10,2) NOT NULL,
  `kanta_weight` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `customer_id` (`customer_id`),
  KEY `vehicle_id` (`vehicle_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rawanas`
--

INSERT INTO `rawanas` (`id`, `date`, `eway_bill_no`, `vendor_id`, `customer_id`, `vehicle_id`, `rawana_weight`, `kanta_weight`, `created_at`, `updated_at`) VALUES
(11, '2025-01-24', '100', 2, 36, 5, '10000.00', '12000.00', '2025-01-24 09:37:08', '2025-01-24 09:37:08');

-- --------------------------------------------------------

--
-- Table structure for table `rawana_items`
--

DROP TABLE IF EXISTS `rawana_items`;
CREATE TABLE IF NOT EXISTS `rawana_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rawana_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `hsn_code` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `tax_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rawana_id` (`rawana_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rawana_items`
--

INSERT INTO `rawana_items` (`id`, `rawana_id`, `product_id`, `product_name`, `hsn_code`, `grade`, `purchase_price`, `sale_price`, `tax_amount`, `tax_rate`, `created_at`, `updated_at`) VALUES
(26, 11, 5, 'Product A', 'PRO-A', 'ONE', '100.00', '105.00', '5.00', '5.00', '2025-01-24 09:37:09', '2025-01-24 09:37:09'),
(27, 11, 6, 'Product B', 'PRO-B', 'TWO', '200.00', '210.00', '10.00', '5.00', '2025-01-24 09:37:09', '2025-01-24 09:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rawana_id` int NOT NULL,
  `date` date NOT NULL,
  `customer_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `rawana_weight` decimal(10,2) NOT NULL,
  `kanta_weight` decimal(10,2) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `vehicle_id` int NOT NULL,
  `remark` text,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rawana_id` (`rawana_id`),
  KEY `customer_id` (`customer_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `vehicle_id` (`vehicle_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` char(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Andhra Pradesh', '01', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(2, 'Arunachal Pradesh', '02', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(3, 'Assam', '03', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(4, 'Bihar', '04', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(5, 'Chhattisgarh', '05', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(6, 'Goa', '06', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(7, 'Gujarat', '07', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(8, 'Haryana', '08', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(9, 'Himachal Pradesh', '09', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(10, 'Jharkhand', '10', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(11, 'Karnataka', '11', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(12, 'Kerala', '12', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(13, 'Madhya Pradesh', '13', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(14, 'Maharashtra', '14', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(15, 'Manipur', '15', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(16, 'Meghalaya', '16', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(17, 'Mizoram', '17', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(18, 'Nagaland', '18', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(19, 'Odisha', '19', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(20, 'Punjab', '20', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(21, 'Rajasthan', '21', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(22, 'Sikkim', '22', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(23, 'Tamil Nadu', '23', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(24, 'Telangana', '24', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(25, 'Tripura', '25', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(26, 'Uttar Pradesh', '26', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(27, 'Uttarakhand', '27', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(28, 'West Bengal', '28', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(29, 'Andaman and Nicobar Islands', '29', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(30, 'Chandigarh', '30', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(31, 'Dadra and Nagar Haveli and Daman and Diu', '31', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(32, 'Delhi', '32', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(33, 'Jammu and Kashmir', '33', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(34, 'Ladakh', '34', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(35, 'Lakshadweep', '35', '2025-01-15 08:59:16', '2025-01-15 08:59:16'),
(36, 'Puducherry', '36', '2025-01-15 08:59:16', '2025-01-15 08:59:16');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
CREATE TABLE IF NOT EXISTS `taxes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `cgst_rate` decimal(5,2) DEFAULT '0.00',
  `sgst_rate` decimal(5,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `cgst_rate`, `sgst_rate`, `created_at`, `updated_at`) VALUES
(1, '18%', '18.00', '9.00', '9.00', '2025-01-16 08:34:55', '2025-01-16 08:47:41'),
(2, '12%', '12.00', '6.00', '6.00', '2025-01-16 08:43:07', '2025-01-16 08:43:07'),
(6, '5%', '5.00', '2.50', '2.50', '2025-01-16 09:21:57', '2025-01-16 09:21:57'),
(7, 'No Tax', '0.00', '0.00', '0.00', '2025-01-17 01:26:28', '2025-01-17 01:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`(191))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'John', 'Doe', 'admin@gmail.com', '2025-01-14 02:54:59', '$2y$12$cTBTB5BYOEO.H6BZCjJnMODJ8gM5x.mat5KmjMG68x74BEPJXDimq', '6zOZbYuOia2YkY9EtU8o0O7CqZnOIXOWQD4nQblvgBcoEZlbtjyoL689zKux', '2025-01-14 02:55:00', '2025-01-16 01:43:23'),
(6, 'Manish', 'Soni', 'whomanishsoni@gmail.com', '2025-01-14 02:57:36', '$2y$12$T3nM0QE30ArElEq5FCb14uLSI6WlZAij5mgi7PhPFlDP1JkHz221e', 'fmlI7o6dcO', '2025-01-14 02:57:37', '2025-01-14 04:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(20) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `driver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `driver_phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `vehicle_number`, `contact_person`, `contact_phone`, `driver_name`, `driver_phone`, `created_at`, `updated_at`) VALUES
(5, 'RJ06BH6993', 'Kailash Chandra Soni', '9352145340', 'Manish Soni', '9460966996', '2025-01-20 23:33:05', '2025-01-20 23:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_assignments`
--

DROP TABLE IF EXISTS `vehicle_assignments`;
CREATE TABLE IF NOT EXISTS `vehicle_assignments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rawana_id` int NOT NULL,
  `date` date NOT NULL,
  `customer_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `kanta_weight` decimal(10,2) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `vehicle_id` int NOT NULL,
  `remark` text,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rawana_id` (`rawana_id`),
  KEY `customer_id` (`customer_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `vehicle_id` (`vehicle_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle_assignments`
--

INSERT INTO `vehicle_assignments` (`id`, `rawana_id`, `date`, `customer_id`, `vendor_id`, `kanta_weight`, `rate`, `total`, `vehicle_id`, `remark`, `photo`, `created_at`, `updated_at`) VALUES
(2, 11, '2025-01-27', 36, 2, '12000.00', '11.00', '11.00', 5, 'ssss', 'vehicle_assignment_11_1737957908.png', '2025-01-27 00:35:08', '2025-01-27 00:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `gst_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `state_id` (`state_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `phone`, `address`, `city`, `state_id`, `gst_number`, `created_at`, `updated_at`) VALUES
(2, 'asdasd soni', 'whomanishsoni@gmail.com', '9460966996', 'Bhilwata', 'bhilwara', 21, '123456', '2025-01-15 08:48:59', '2025-01-20 05:37:21');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
