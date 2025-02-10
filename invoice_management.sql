-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2025 at 06:57 AM
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
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `gst_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customers_state_id_foreign` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `city`, `state_id`, `gst_number`, `created_at`, `updated_at`) VALUES
(1, 'manish soni', 'whomanishsoni@gmail.com', '9460966996', 'Krishna Mohlla, Mangala Chouk, Bhilwara', 'Bhilwara', 21, '27ABCDE1234F1Z5', '2025-02-04 05:48:18', '2025-02-04 05:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_13_093052_create_states_table', 1),
(5, '2025_01_14_084025_create_customers_table', 1),
(6, '2025_01_15_133700_create_vendors_table', 1),
(7, '2025_01_16_002744_create_taxes_table', 1),
(8, '2025_01_16_060749_create_products_table', 1),
(9, '2025_01_20_061313_create_vehicles_table', 1),
(10, '2025_01_20_084735_create_rawanas_table', 1),
(11, '2025_01_21_071607_create_rawana_items_table', 1),
(12, '2025_01_24_153247_create_purchases_table', 1),
(13, '2025_01_26_133530_create_sales_table', 1),
(14, '2025_01_26_134428_create_vehicle_assignments_table', 1),
(15, '2025_01_31_084023_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hsn_code` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `tax_rate_id` bigint UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_tax_rate_id_foreign` (`tax_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `hsn_code`, `grade`, `purchase_price`, `tax_rate_id`, `tax_amount`, `sale_price`, `created_at`, `updated_at`) VALUES
(5, 'Product A', 'PRO-A', 'ONE', '100.00', 6, '5.00', '105.00', '2025-01-21 04:02:28', '2025-01-21 04:02:28'),
(6, 'Product B', 'PRO-B', 'TWO', '200.00', 6, '10.00', '210.00', '2025-01-21 04:03:13', '2025-01-21 04:03:13'),
(7, 'Product C', 'PRO-C', 'THREE', '300.00', 2, '36.00', '336.00', '2025-01-21 04:03:45', '2025-01-21 04:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rawana_id` bigint UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `rawana_weight` decimal(8,2) DEFAULT NULL,
  `kanta_weight` decimal(8,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_id` bigint UNSIGNED DEFAULT NULL,
  `remark` text,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_rawana_id_foreign` (`rawana_id`),
  KEY `purchases_vendor_id_foreign` (`vendor_id`),
  KEY `purchases_vehicle_id_foreign` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `rawana_id`, `date`, `rawana_weight`, `kanta_weight`, `rate`, `total`, `vendor_id`, `vehicle_id`, `remark`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-02-04', '1000.00', '2000.00', '100.00', '200000.00', 1, 1, 'Noting', NULL, '2025-02-04 06:06:58', '2025-02-04 06:06:58'),
(4, 4, '2025-02-05', '1000.00', '1200.00', '100.00', '120000.00', 1, 1, 'ssssss', NULL, '2025-02-05 01:37:47', '2025-02-05 01:37:47');

-- --------------------------------------------------------

--
-- Table structure for table `rawanas`
--

DROP TABLE IF EXISTS `rawanas`;
CREATE TABLE IF NOT EXISTS `rawanas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `eway_bill_no` varchar(255) NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_rate` decimal(10,2) DEFAULT NULL,
  `rawana_weight` decimal(8,2) DEFAULT NULL,
  `kanta_weight` decimal(8,2) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rawanas_eway_bill_no_unique` (`eway_bill_no`),
  KEY `rawanas_vendor_id_foreign` (`vendor_id`),
  KEY `rawanas_customer_id_foreign` (`customer_id`),
  KEY `rawanas_vehicle_id_foreign` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `rawanas`
--

INSERT INTO `rawanas` (`id`, `date`, `eway_bill_no`, `vendor_id`, `customer_id`, `vehicle_id`, `vehicle_rate`, `rawana_weight`, `kanta_weight`, `status`, `created_at`, `updated_at`) VALUES
(1, '2025-02-04', '111', 1, 1, 1, '100.00', '1000.00', '2000.00', 'SALE', '2025-02-04 06:04:58', '2025-02-04 06:04:58'),
(4, '2025-02-05', '112', 1, 1, 1, '100.00', '1000.00', '1200.00', 'SALE', '2025-02-05 01:27:18', '2025-02-07 00:15:03'),
(5, '2025-02-05', '113', 1, 1, 1, '100.00', '1200.00', '1500.00', 'PENDING', '2025-02-05 01:28:25', '2025-02-05 01:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `rawana_items`
--

DROP TABLE IF EXISTS `rawana_items`;
CREATE TABLE IF NOT EXISTS `rawana_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rawana_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `hsn_code` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(5,2) NOT NULL DEFAULT '0.00',
  `purchase_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rawana_items_rawana_id_foreign` (`rawana_id`),
  KEY `rawana_items_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `rawana_items`
--

INSERT INTO `rawana_items` (`id`, `rawana_id`, `product_id`, `product_name`, `hsn_code`, `grade`, `tax_rate`, `purchase_price`, `sale_price`, `tax_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'Product A', 'PRO-A', 'ONE', '5.00', '100.00', '105.00', '5.00', '2025-02-04 06:04:59', '2025-02-04 06:04:59'),
(2, 1, 7, 'Product C', 'PRO-C', 'THREE', '12.00', '300.00', '336.00', '36.00', '2025-02-04 06:04:59', '2025-02-04 06:04:59'),
(6, 4, 5, 'Product A', 'PRO-A', 'ONE', '5.00', '100.00', '105.00', '5.00', '2025-02-05 01:27:18', '2025-02-05 01:27:18'),
(7, 4, 7, 'Product C', 'PRO-C', 'THREE', '12.00', '300.00', '336.00', '36.00', '2025-02-05 01:27:18', '2025-02-05 01:27:18'),
(9, 5, 5, 'Product A', 'PRO-A', 'ONE', '5.00', '100.00', '105.00', '5.00', '2025-02-06 09:24:29', '2025-02-06 09:24:29'),
(10, 5, 6, 'Product B', 'PRO-B', 'TWO', '5.00', '200.00', '210.00', '10.00', '2025-02-06 09:24:29', '2025-02-06 09:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rawana_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `rawana_weight` double NOT NULL,
  `kanta_weight` double NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `vehicle_id` bigint UNSIGNED NOT NULL,
  `reverse_charges` enum('Y','N') DEFAULT NULL,
  `transport_name` varchar(255) DEFAULT NULL,
  `date_of_supply` date DEFAULT NULL,
  `place_of_supply` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `rawana_id`, `date`, `customer_id`, `vendor_id`, `rawana_weight`, `kanta_weight`, `rate`, `total`, `vehicle_id`, `reverse_charges`, `transport_name`, `date_of_supply`, `place_of_supply`, `remark`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-02-04', 1, 1, 1000, 2000, '100.00', '200000.00', 1, 'Y', 'LandMark', '2025-02-04', 'Jaipur', 'Supply', NULL, '2025-02-04 06:10:25', '2025-02-04 06:10:25'),
(2, 4, '2025-02-07', 1, 1, 1000, 1200, '100.00', '120000.00', 1, 'Y', 'shivhvvv', '2025-02-07', 'pune', 'sss', NULL, '2025-02-07 00:15:03', '2025-02-07 00:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Andhra Pradesh', '37', NULL, NULL),
(2, 'Arunachal Pradesh', '12', NULL, NULL),
(3, 'Assam', '18', NULL, NULL),
(4, 'Bihar', '10', NULL, NULL),
(5, 'Chhattisgarh', '22', NULL, NULL),
(6, 'Goa', '30', NULL, NULL),
(7, 'Gujarat', '24', NULL, NULL),
(8, 'Haryana', '06', NULL, NULL),
(9, 'Himachal Pradesh', '02', NULL, NULL),
(10, 'Jharkhand', '20', NULL, NULL),
(11, 'Karnataka', '29', NULL, NULL),
(12, 'Kerala', '32', NULL, NULL),
(13, 'Madhya Pradesh', '23', NULL, NULL),
(14, 'Maharashtra', '27', NULL, NULL),
(15, 'Manipur', '14', NULL, NULL),
(16, 'Meghalaya', '17', NULL, NULL),
(17, 'Mizoram', '15', NULL, NULL),
(18, 'Nagaland', '13', NULL, NULL),
(19, 'Odisha', '21', NULL, NULL),
(20, 'Punjab', '03', NULL, NULL),
(21, 'Rajasthan', '08', NULL, NULL),
(22, 'Sikkim', '11', NULL, NULL),
(23, 'Tamil Nadu', '33', NULL, NULL),
(24, 'Telangana', '36', NULL, NULL),
(25, 'Tripura', '16', NULL, NULL),
(26, 'Uttar Pradesh', '09', NULL, NULL),
(27, 'Uttarakhand', '05', NULL, NULL),
(28, 'West Bengal', '19', NULL, NULL),
(29, 'Andaman and Nicobar Islands', '92', NULL, NULL),
(30, 'Chandigarh', '04', NULL, NULL),
(31, 'Dadra and Nagar Haveli and Daman and Diu', '26', NULL, NULL),
(32, 'Delhi', '07', NULL, NULL),
(33, 'Jammu and Kashmir', '33', NULL, NULL),
(34, 'Ladakh', '34', NULL, NULL),
(35, 'Lakshadweep', '31', NULL, NULL),
(36, 'Puducherry', '34', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
CREATE TABLE IF NOT EXISTS `taxes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `cgst_rate` decimal(8,2) DEFAULT NULL,
  `sgst_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `cgst_rate`, `sgst_rate`, `created_at`, `updated_at`) VALUES
(1, '18%', '18.00', '9.00', '9.00', '2025-01-16 03:04:55', '2025-01-16 03:17:41'),
(2, '12%', '12.00', '6.00', '6.00', '2025-01-16 03:13:07', '2025-01-16 03:13:07'),
(6, '5%', '5.00', '2.50', '2.50', '2025-01-16 03:51:57', '2025-01-16 03:51:57'),
(7, 'No Tax', '0.00', '0.00', '0.00', '2025-01-16 19:56:28', '2025-01-16 19:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(20) NOT NULL,
  `method` varchar(20) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `remark` text,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_customer_id_foreign` (`customer_id`),
  KEY `transactions_vendor_id_foreign` (`vendor_id`),
  KEY `transactions_vehicle_id_foreign` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `date`, `amount`, `type`, `method`, `reference`, `remark`, `customer_id`, `vendor_id`, `vehicle_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '2025-02-05', '1000.00', 'in', 'cash', NULL, NULL, 1, NULL, NULL, 'COMPLETED', '2025-02-05 03:11:20', '2025-02-05 03:11:20'),
(2, '2025-02-05', '1000.00', 'out', 'cash', NULL, NULL, NULL, 1, NULL, 'COMPLETED', '2025-02-05 03:17:44', '2025-02-05 03:17:44'),
(3, '2025-02-06', '100.00', 'out', 'cash', NULL, NULL, NULL, 1, NULL, 'COMPLETED', '2025-02-06 09:31:39', '2025-02-06 09:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Manish', 'Soni', 'admin@gmail.com', '2025-02-04 04:51:22', '$2y$12$XRDm0AiUDaytsV10iRD8yOVEDae9RWHF4zTIgtfkpVNb6MhZjUEQi', 'jT6OyFH1M6TWiNonE12fFYD6NY9MuTVFTBmf0CKevRNnliRGk10vqXRKwsXk', '2025-02-04 04:51:22', '2025-02-04 04:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `driver_phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicles_vehicle_number_unique` (`vehicle_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `vehicle_number`, `contact_person`, `contact_phone`, `driver_name`, `driver_phone`, `created_at`, `updated_at`) VALUES
(1, 'RJ06BH6993', 'Krishna Devi Soni', '9352145340', 'Manish Soni', '94609966996', '2025-02-04 06:04:17', '2025-02-04 06:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_assignments`
--

DROP TABLE IF EXISTS `vehicle_assignments`;
CREATE TABLE IF NOT EXISTS `vehicle_assignments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rawana_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `kanta_weight` double NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `vehicle_id` bigint UNSIGNED NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_assignments_rawana_id_foreign` (`rawana_id`),
  KEY `vehicle_assignments_customer_id_foreign` (`customer_id`),
  KEY `vehicle_assignments_vendor_id_foreign` (`vendor_id`),
  KEY `vehicle_assignments_vehicle_id_foreign` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `gst_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_email_unique` (`email`),
  KEY `vendors_state_id_foreign` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `phone`, `address`, `city`, `state_id`, `gst_number`, `created_at`, `updated_at`) VALUES
(1, 'Kailash Chandra Soni', 'kailashchandrasoni0801@gmail.com', '9352145340', 'Surana Bhawan, Gulmandi, Bhilwara', 'Bhilwara', 21, '29ABCDE1234F1X6', '2025-02-04 05:53:40', '2025-02-04 05:53:40'),
(2, 'somesh chobay', 'chobaysomesh@gmail.com', '9352145450', 'sdddd', 'bhilwara', 21, '27ABCDE1234F1Z5', '2025-02-06 05:55:38', '2025-02-06 05:55:38'),
(3, 'ABC Traders', 'abc@example.com', '9876543210', '123 Market Street', 'Mumbai', 1, '27ABCDE1234F1Z5', '2025-02-06 11:28:29', '2025-02-06 11:28:29'),
(4, 'XYZ Suppliers', 'xyz@example.com', '9123456789', '456 Industrial Area', 'Delhi', 2, '07XYZDE5678K2Z9', '2025-02-06 11:28:29', '2025-02-06 11:28:29'),
(5, 'Global Exports', 'global@example.com', '9988776655', '789 Commercial Road', 'Bangalore', 3, '29GLOBE7890L3X7', '2025-02-06 11:28:29', '2025-02-06 11:28:29'),
(6, 'Sunrise Pvt Ltd', 'sunrise@example.com', NULL, '12 Sunrise Tower', 'Pune', 4, NULL, '2025-02-06 11:28:29', '2025-02-06 11:28:29'),
(7, 'Metro Distributors', 'metro@example.com', '9871234567', '34 Metro Plaza', 'Kolkata', 5, '19METRO4567Q4Z8', '2025-02-06 11:28:29', '2025-02-06 11:28:29'),
(8, 'Elite Traders', 'elite@example.com', '9812345678', '45 Elite Avenue', 'Chennai', 6, '33ELITE1234P1Z6', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(9, 'Rapid Suppliers', 'rapid@example.com', '9900112233', '78 Rapid Tower', 'Hyderabad', 7, '36RAPID5678Q2Z7', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(10, 'Omni Exports', 'omni@example.com', '9001122334', '98 Omni Park', 'Ahmedabad', 8, '24OMNI7890R3Z9', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(11, 'NextGen Pvt Ltd', 'nextgen@example.com', NULL, '23 NextGen Hub', 'Jaipur', 9, NULL, '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(12, 'Universal Distributors', 'universal@example.com', '9700456123', '11 Universal Plaza', 'Lucknow', 10, '27UNIVER4567S4Z5', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(13, 'Skyline Enterprises', 'skyline@example.com', '9654321789', '56 Skyline Road', 'Bhopal', 11, '23SKYLINE6789T5Z6', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(14, 'Vertex Traders', 'vertex@example.com', '9876543211', '89 Vertex Street', 'Surat', 12, '25VERTEX1234U6Z7', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(15, 'Infinity Suppliers', 'infinity@example.com', NULL, '101 Infinity Plaza', 'Nagpur', 13, NULL, '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(16, 'Grand Exports', 'grand@example.com', '9023456781', '14 Grand Lane', 'Patna', 14, '21GRAND5678V7Z8', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(17, 'Mega Distributors', 'mega@example.com', '9801234567', '32 Mega Square', 'Chandigarh', 15, '04MEGA7890W8Z9', '2025-02-06 11:29:11', '2025-02-06 11:29:11'),
(18, 'Prime Traders', 'prime@example.com', '9811122233', '67 Prime Street', 'Indore', 16, '22PRIME1234X1Z1', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(19, 'BlueWave Suppliers', 'bluewave@example.com', '9900345678', '88 BlueWave Tower', 'Thane', 17, '27BLUEWAVE5678Y2Z2', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(20, 'Pioneer Exports', 'pioneer@example.com', '9788899900', '77 Pioneer Hub', 'Vishakhapatnam', 18, '29PIONEER7890Z3Z3', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(21, 'Sunbeam Pvt Ltd', 'sunbeam@example.com', NULL, '66 Sunbeam Plaza', 'Ludhiana', 19, NULL, '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(22, 'Everest Distributors', 'everest@example.com', '9700876543', '12 Everest Park', 'Agra', 20, '08EVEREST4567A4Z4', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(23, 'Zenith Enterprises', 'zenith@example.com', '9654012345', '78 Zenith Lane', 'Varanasi', 21, '15ZENITH6789B5Z5', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(24, 'Cosmos Traders', 'cosmos@example.com', '9876123456', '102 Cosmos Road', 'Ranchi', 22, '18COSMOS1234C6Z6', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(25, 'Galaxy Suppliers', 'galaxy@example.com', NULL, '50 Galaxy Square', 'Guwahati', 23, NULL, '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(26, 'Summit Exports', 'summit@example.com', '9023123456', '99 Summit Colony', 'Bhubaneswar', 24, '09SUMMIT5678D7Z7', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(27, 'Titan Distributors', 'titan@example.com', '9809456123', '39 Titan Plaza', 'Coimbatore', 25, '07TITAN7890E8Z8', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(28, 'Aurora Traders', 'aurora@example.com', '9845672310', '23 Aurora Street', 'Mysore', 26, '14AURORA5678F9Z9', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(29, 'Neptune Suppliers', 'neptune@example.com', '9933345566', '67 Neptune Road', 'Jodhpur', 27, '21NEPTUNE1234G1Z1', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(30, 'Orion Exports', 'orion@example.com', '9877766554', '87 Orion Park', 'Raipur', 28, '10ORION5678H2Z2', '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(31, 'Starlight Pvt Ltd', 'starlight@example.com', NULL, '45 Starlight Tower', 'Dehradun', 29, NULL, '2025-02-06 11:31:34', '2025-02-06 11:31:34'),
(32, 'Horizon Distributors', 'horizon@example.com', '9700001234', '89 Horizon Square', 'Shimla', 30, '12HORIZON6789I3Z3', '2025-02-06 11:31:34', '2025-02-06 11:31:34');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `taxes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_rawana_id_foreign` FOREIGN KEY (`rawana_id`) REFERENCES `rawanas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchases_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchases_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rawanas`
--
ALTER TABLE `rawanas`
  ADD CONSTRAINT `rawanas_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rawanas_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rawanas_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rawana_items`
--
ALTER TABLE `rawana_items`
  ADD CONSTRAINT `rawana_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rawana_items_rawana_id_foreign` FOREIGN KEY (`rawana_id`) REFERENCES `rawanas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vehicle_assignments`
--
ALTER TABLE `vehicle_assignments`
  ADD CONSTRAINT `vehicle_assignments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_assignments_rawana_id_foreign` FOREIGN KEY (`rawana_id`) REFERENCES `rawanas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_assignments_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_assignments_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
