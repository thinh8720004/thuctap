-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2024 at 11:20 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_trung_tt`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('cfFFhNjzhb5njw8K', 'a:1:{s:11:\"valid_until\";i:1731134827;}', 1731154986),
('votrung@gmail.com|127.0.0.1', 'i:3;', 1730533127),
('votrung@gmail.com|127.0.0.1:timer', 'i:1730533127;', 1730533127);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL COMMENT 'Mã danh mục',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên danh mục',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Hình ảnh',
  `role` int DEFAULT NULL COMMENT 'Hiển thị',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Danh mục sản phẩm';

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `role`, `created_at`, `updated_at`) VALUES
(4, 'Bóng đá', 'bongda.png', 1, '2024-11-10 06:12:35', '2024-11-09 23:12:35'),
(7, 'Bàn', '', 1, '2024-11-02 10:11:04', '2024-11-02 10:11:04'),
(9, 'admin', '', 0, '2024-11-06 22:51:12', '2024-11-06 22:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `pro_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rate` int NOT NULL DEFAULT '1',
  `status` int DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `pro_id`, `user_id`, `content`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 15, 'adu', 5, 1, '2024-11-11 01:24:57', '2024-11-11 01:24:57'),
(2, 6, 15, 'demo2update', 3, 2, '2024-11-10 18:38:44', '2024-11-10 18:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` int NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `value` double(8,2) NOT NULL,
  `time` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount_codes`
--

INSERT INTO `discount_codes` (`id`, `code`, `value`, `time`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'giangsinhupdate', 10000.00, '2024-11-11', 1, NULL, '2024-11-10 19:55:51', '2024-11-10 19:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_products`
--

CREATE TABLE `favorite_products` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `pro_id` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorite_products`
--

INSERT INTO `favorite_products` (`id`, `user_id`, `pro_id`, `updated_at`, `created_at`) VALUES
(2, 15, 6, '2024-11-10 18:59:15', '2024-11-10 18:59:15'),
(3, 14, 6, '2024-11-10 18:59:28', '2024-11-10 18:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_10_26_124754_create_password_reset_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `view` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `image`, `content`, `status`, `view`, `created_at`, `updated_at`) VALUES
(1, 'demo update', 'demo update', 'demoupdate.png', 'demoupdate', 1, 0, '2024-11-11 04:15:33', '2024-11-11 04:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `total_amount` int NOT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `id_discount` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `total_amount`, `fullname`, `email`, `address`, `phone`, `note`, `status`, `user_id`, `payment_id`, `id_discount`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 100000, 'nguyen van trung', 'trung@gmail.com', 'tam ki', '081237233', 'boom', 1, 15, 1, NULL, NULL, '2024-11-11 03:17:09', '2024-11-11 03:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `amount` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `quantity`, `amount`, `order_id`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 100000, 1, 6, NULL, '2024-11-11 03:20:01', '2024-11-11 03:20:01');

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
('haudang02.it@gmail.com', '$2y$12$pqABEqW443NmoQaDPC6GEu6Bn7QKHoZEnIiA7H/xvN/rvqpTczSy2', '2024-10-26 06:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `payment_method_id` int NOT NULL,
  `payment_method_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`payment_method_id`, `payment_method_name`, `status`) VALUES
(1, 'COD', '1'),
(2, 'MoMo', '1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL COMMENT 'Mã sản phẩm',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên sản phẩm',
  `cate_id` int NOT NULL COMMENT 'Mã danh mục sản phẩm',
  `price` int NOT NULL COMMENT 'Giá bán sản phẩm',
  `discount` int DEFAULT '0' COMMENT '% giảm giá',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Ảnh sản phẩm',
  `view` int DEFAULT '0' COMMENT 'Lượt xem',
  `quantity` int NOT NULL COMMENT 'Số lượng sản phẩm',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Chi tiết sản phẩm',
  `hot` int NOT NULL DEFAULT '1' COMMENT 'Sản phẩm nổi bật',
  `status` int NOT NULL DEFAULT '1' COMMENT 'Ẩn hiển',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Ngày đăng',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Ngày cập nhật'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Sản phẩm';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `cate_id`, `price`, `discount`, `image`, `view`, `quantity`, `detail`, `hot`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Bàn 1', 7, 10000000, NULL, '', 0, 1111, 'vfssfafa', 0, 1, '2024-11-02 17:11:32', '2024-11-02 17:11:32'),
(7, 'Bàn 2', 7, 110000, NULL, '', 0, 11111, '1qsassss', 0, 0, '2024-11-02 17:12:53', '2024-11-02 17:12:53'),
(8, 'Thể thao', 4, 10000000, NULL, '', 0, 22, 'aaaaaaaaaaaaaaaaaa', 0, 0, '2024-11-02 17:14:48', '2024-11-02 17:14:48'),
(10, 'demo2', 7, 10000, 12, 'demo.png', 0, 2, 'demo', 1, 1, '2024-11-09 23:35:54', '2024-11-09 23:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `pro_color`
--

CREATE TABLE `pro_color` (
  `id` int NOT NULL COMMENT 'Mã biến thể',
  `id_products` int NOT NULL COMMENT 'Mã sản phẩm',
  `color` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Màu sắc',
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ảnh',
  `price` int NOT NULL COMMENT 'Giá'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Biến thể màu sản phẩm';

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8h4wFWOIwHN5RTPixZ9xlnWGs846bOlxVqGKeRGf', 14, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDF5cVNsVXI1SGtyb2VONHhHSmlISkdrUTdxSG9WdUNQOWlYNDEwViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731323771),
('i739yVdM391ECmFsOnJyE93nuGpwRViVRyu0pWdm', 14, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRERWNTNvenlUWEw1U0ZIdkZsOGRza0hpeFhKVmlYU203SXIxRGNLNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731295828),
('sT5nj4nXI2dWyiu08jiZj7GMo3yLaFLddZQNEXys', 14, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUlZY1d3aUFhdmRhaU1zRTNmb1ZOZDlid0tBbzhXNUF1Wm1waUZUTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731220681),
('vfcpRD9GyV2x0IvQIrBC6F4k1sbi401ZxbHS2iLq', 14, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczBONmJHc0tCaTNuTml3MDZ6RHFGUUh1cDJWbkhUZ0xDMHVxQXZHVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731169410),
('xpKulrzY6xW2EtDjHfICNShLgdyW7Ywnqn70khiT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjBCNnZxMG5PYlFna1g1WWliUUMzcFhCRHJXS214TXNDOVVFUEdtcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731168206);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slide_status` int NOT NULL,
  `slide_desc` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `name`, `image`, `slide_status`, `slide_desc`, `created_at`, `updated_at`) VALUES
(1, 'Men Fasshion Shop', 'slides/TO9Gxs2ZzPwKOa9bGeFFs74nAstuSH0iMKx6u9hO.png', 1, 'e2dq3wq32', '2024-11-06 14:14:40', '2024-11-06 07:14:40'),
(2, 'Men Fasshion Shop', 'slides/a0Lm8KhnfcCoX0SJuV7Y8iebhPIKRzRicJZ5R5Oj.png', 1, 'e2dq3wq32', '2024-11-05 14:36:14', '2024-11-05 14:37:49'),
(3, 'Men Fasshion Shop', 'slides/ztKZyfj5wAmlATpPmoqanZ2GyhGeA8cEK2Iz4riH.png', 1, 'e2dq3wq32', '2024-11-05 07:38:18', '2024-11-05 07:38:18'),
(4, 'admin', 'slides/vlVkRdfAB0ctHMPcirsi5xDWP3yDpsbLAqz6aekl.png', 0, 'sssss', '2024-11-05 07:38:56', '2024-11-05 07:38:56'),
(5, 'nguyễn trung', 'slides/BxWEP7tZEZtPt84YeH7saowqiUKGATZfPkpWzfZn.jpg', 1, 'aaaa', '2024-11-05 07:44:10', '2024-11-05 07:44:10'),
(6, 'admin', 'slides/qlhZqoeodlyuHfgBvvaylHjzvUB4CX5OUPAl43vg.png', 0, 'qffefqw', '2024-11-06 07:14:27', '2024-11-06 07:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT 'Mã người dùng',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên người dùng',
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email',
  `email_verified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Xách minh email',
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Số điện thoại người dùng',
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Mật khẩu',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Hình ảnh',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Địa chỉ',
  `status` int NOT NULL DEFAULT '1' COMMENT 'Trạng thái',
  `role` int NOT NULL DEFAULT '1' COMMENT 'Vai trò',
  `remember_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày cập nhật'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone`, `password`, `image`, `address`, `status`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(14, 'Test User', 'admin@gmail.com', '2024-11-08 00:17:17', NULL, '$2y$12$SVybBrym4HsoBpS8HlacZuu1m86F7oO1B0QEHrLZVCWkdkKwc7x9m', NULL, NULL, 1, 1, 'IvF9BpUUis', '2024-11-08 00:17:17', '2024-11-08 00:17:17'),
(15, 'demo2', 'demo2@gmail.com', '2024-11-09 06:45:05', '0779440918', '$2y$12$1AQmMYifkuuKbKYwuFpynOlW13zFRJPvrwfXsiDBnIIPSLCrxdWyi', NULL, 'demo2update', 1, 1, NULL, '2024-11-08 23:45:05', '2024-11-09 07:52:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`pro_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorite_products`
--
ALTER TABLE `favorite_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_payment` (`payment_id`),
  ADD KEY `fk_discount_codes` (`id_discount`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products` (`cate_id`);

--
-- Indexes for table `pro_color`
--
ALTER TABLE `pro_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pro_color` (`id_products`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_products`
--
ALTER TABLE `favorite_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `payment_method_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pro_color`
--
ALTER TABLE `pro_color`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã biến thể';

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã người dùng', AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`pro_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `favorite_products`
--
ALTER TABLE `favorite_products`
  ADD CONSTRAINT `favorite_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorite_products_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_discount_codes` FOREIGN KEY (`id_discount`) REFERENCES `discount_codes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment_methods` (`payment_method_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `pro_color`
--
ALTER TABLE `pro_color`
  ADD CONSTRAINT `fk_pro_color` FOREIGN KEY (`id_products`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
