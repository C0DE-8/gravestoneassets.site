-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 29, 2026 at 07:11 AM
-- Server version: 11.4.13-MariaDB-cll-lve
-- PHP Version: 8.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `valtfdmq_valtherainvestments`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_upgrades`
--

CREATE TABLE `account_upgrades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `requested_account_type` varchar(80) NOT NULL,
  `current_account_type` varchar(80) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `proof_filename` varchar(255) DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `declined_by` int(10) UNSIGNED DEFAULT NULL,
  `declined_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@valtherainvestments.com', '$2b$12$6cPS1/MPHaaIgBeX7JQSR.KXaqlQ8SimXDkVnLPRnNl6n/NTfbZ3y', '2026-09-05 01:23:53', '2026-09-05 13:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `admin_audit_logs`
--

CREATE TABLE `admin_audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `admin_email` varchar(191) DEFAULT NULL,
  `method` varchar(10) NOT NULL,
  `resource` varchar(200) NOT NULL,
  `status_code` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_audit_logs`
--

INSERT INTO `admin_audit_logs` (`id`, `admin_id`, `admin_email`, `method`, `resource`, `status_code`, `created_at`) VALUES
(1, 1, 'admin@valthera.test', 'POST', '/login', 200, '2026-09-05 02:06:40'),
(2, 1, 'admin@valthera.test', 'PATCH', '/users/5/trading-settings', 200, '2026-09-05 02:06:41'),
(3, 1, 'admin@valthera.test', 'PATCH', '/users/5/trading-settings', 400, '2026-09-05 02:06:41'),
(4, 1, 'admin@valthera.test', 'PATCH', '/users/5/trading-settings', 200, '2026-09-05 02:06:51'),
(5, 1, 'admin@valthera.test', 'PATCH', '/users/5/trading-settings', 200, '2026-09-05 02:06:51'),
(6, 1, 'admin@valthera.test', 'POST', '/deposits/2/approve', 200, '2026-09-05 02:06:51'),
(7, 1, 'admin@valthera.test', 'POST', '/deposits/2/approve', 400, '2026-09-05 02:06:51'),
(8, NULL, NULL, 'POST', '/login', 401, '2026-09-05 02:15:25'),
(9, 1, 'admin@valthera.test', 'POST', '/login', 200, '2026-09-05 02:15:40'),
(10, 1, 'admin@valthera.test', 'POST', '/login', 200, '2026-09-05 12:41:51'),
(11, 1, 'admin@valthera.test', 'PATCH', '/profile', 200, '2026-09-05 13:00:00'),
(12, 1, 'admin@valtherainvestments.com', 'PATCH', '/profile', 200, '2026-09-05 13:00:07'),
(13, 1, 'admin@valtherainvestments.com', 'PATCH', '/profile', 200, '2026-09-05 13:00:40'),
(14, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-05 15:36:39'),
(15, 1, 'admin@valtherainvestments.com', 'PUT', '/wallet-addresses/1', 200, '2026-09-05 15:38:41'),
(16, 1, 'admin@valtherainvestments.com', 'POST', '/wallet-addresses', 200, '2026-09-05 15:39:54'),
(17, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-22 17:13:38'),
(18, 1, 'admin@valtherainvestments.com', 'POST', '/users/10/balance-adjustments', 500, '2026-09-22 17:15:12'),
(19, 1, 'admin@valtherainvestments.com', 'POST', '/users/10/balance-adjustments', 500, '2026-09-22 17:15:22'),
(20, 1, 'admin@valtherainvestments.com', 'POST', '/users/10/balance-adjustments', 500, '2026-09-22 17:22:42'),
(21, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-22 17:38:48'),
(22, 1, 'admin@valtherainvestments.com', 'PATCH', '/users/10/trading-settings', 200, '2026-09-22 17:54:45'),
(23, 1, 'admin@valtherainvestments.com', 'POST', '/users/10/balance-adjustments', 200, '2026-09-22 17:55:47'),
(24, 1, 'admin@valtherainvestments.com', 'POST', '/users/10/balance-adjustments', 200, '2026-09-22 17:56:36'),
(25, 1, 'admin@valtherainvestments.com', 'POST', '/users/10/balance-adjustments', 200, '2026-09-22 17:57:21'),
(26, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-23 11:34:06'),
(27, 1, 'admin@valtherainvestments.com', 'PATCH', '/withdrawal-pin-settings', 200, '2026-09-23 11:36:52'),
(28, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-24 11:55:55'),
(29, 1, 'admin@valtherainvestments.com', 'POST', '/investments', 400, '2026-09-24 13:00:45'),
(30, 1, 'admin@valtherainvestments.com', 'POST', '/investments', 201, '2026-09-24 13:00:52'),
(31, 1, 'admin@valtherainvestments.com', 'POST', '/users/11/balance-adjustments', 200, '2026-09-24 13:01:49'),
(32, 1, 'admin@valtherainvestments.com', 'POST', '/users/11/balance-adjustments', 200, '2026-09-24 13:02:10'),
(33, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-24 13:37:36'),
(34, 1, 'admin@valtherainvestments.com', 'POST', '/users/12/balance-adjustments', 200, '2026-09-24 13:39:05'),
(35, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-24 14:07:31'),
(36, 1, 'admin@valtherainvestments.com', 'POST', '/deposits/4/approve', 200, '2026-09-24 14:09:19'),
(37, 1, 'admin@valtherainvestments.com', 'POST', '/login', 200, '2026-09-28 16:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `balance_adjustments`
--

CREATE TABLE `balance_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `balance_key` varchar(32) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `before_balance` decimal(28,8) NOT NULL,
  `after_balance` decimal(28,8) NOT NULL,
  `reason` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `balance_adjustments`
--

INSERT INTO `balance_adjustments` (`id`, `user_id`, `admin_id`, `balance_key`, `amount`, `before_balance`, `after_balance`, `reason`, `created_at`) VALUES
(1, 10, 1, 'profit_balance', 500000.00000000, 0.00000000, 500000.00000000, 'Trade profit', '2026-09-22 17:55:47'),
(2, 10, 1, 'main_balance', 10000.00000000, 0.00000000, 10000.00000000, 'balance', '2026-09-22 17:56:36'),
(3, 10, 1, 'investment_balance', 200000.00000000, 0.00000000, 200000.00000000, 'overall investment log', '2026-09-22 17:57:21'),
(4, 11, 1, 'BTC', 1.00000000, 0.00000000, 1.00000000, 'overall investment log', '2026-09-24 13:01:49'),
(5, 11, 1, 'main_balance', 15000.00000000, 0.00000000, 15000.00000000, 'investment', '2026-09-24 13:02:10'),
(6, 12, 1, 'BTC', 500.00000000, 0.00000000, 500.00000000, 'credit', '2026-09-24 13:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `binary_trades`
--

CREATE TABLE `binary_trades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `asset` varchar(10) NOT NULL,
  `side` varchar(10) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `entry_price` decimal(28,8) NOT NULL,
  `exit_price` decimal(28,8) DEFAULT NULL,
  `payout_percent` decimal(5,2) NOT NULL DEFAULT 80.00,
  `pnl` decimal(18,2) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'open',
  `opened_at_ms` bigint(20) NOT NULL,
  `expires_at_ms` bigint(20) NOT NULL,
  `settled_at_ms` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `copy_traders`
--

CREATE TABLE `copy_traders` (
  `id` int(10) UNSIGNED NOT NULL,
  `trader_name` varchar(150) NOT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  `specialty` varchar(150) DEFAULT NULL,
  `win_rate_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `profit_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `followers` int(11) NOT NULL DEFAULT 0,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `copy_traders`
--

INSERT INTO `copy_traders` (`id`, `trader_name`, `image_filename`, `specialty`, `win_rate_percent`, `profit_percent`, `followers`, `status`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Local Demo Trader', NULL, NULL, 50.00, 0.00, 0, 'active', '2026-09-05 01:23:53', '2026-09-05 01:23:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crypto_conversions`
--

CREATE TABLE `crypto_conversions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `direction` enum('buy','sell') NOT NULL,
  `asset` varchar(16) NOT NULL,
  `source_amount` decimal(28,8) NOT NULL,
  `received_amount` decimal(28,8) NOT NULL,
  `price_usd` decimal(28,8) NOT NULL,
  `price_source` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crypto_conversions`
--

INSERT INTO `crypto_conversions` (`id`, `user_id`, `direction`, `asset`, `source_amount`, `received_amount`, `price_usd`, `price_source`, `created_at`) VALUES
(1, 12, 'sell', 'BTC', 1.00000000, 84260.94000000, 84260.94000000, 'Binance', '2026-09-24 14:10:11'),
(2, 12, 'sell', 'BTC', 1.00000000, 84258.01000000, 84258.01000000, 'Binance', '2026-09-24 14:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `asset` varchar(16) NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `proof_filename` varchar(255) DEFAULT NULL,
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `declined_by` int(10) UNSIGNED DEFAULT NULL,
  `declined_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `asset`, `amount`, `status`, `admin_note`, `proof_filename`, `approved_by`, `approved_at`, `declined_by`, `declined_at`, `created_at`, `updated_at`) VALUES
(4, 12, 'BTC', 500.00, 'approved', NULL, 'deposit_1790256984529_81856ef11e762.jpg', 1, '2026-09-24 10:09:19', NULL, NULL, '2026-09-24 13:36:24', '2026-09-24 14:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `to_email` varchar(191) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `error` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_otps`
--

CREATE TABLE `email_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investment_plans`
--

CREATE TABLE `investment_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `roi_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `accuracy_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `min_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_amount` decimal(24,2) DEFAULT NULL,
  `duration_days` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `investment_plans`
--

INSERT INTO `investment_plans` (`id`, `name`, `description`, `roi_percent`, `accuracy_percent`, `price`, `min_amount`, `max_amount`, `duration_days`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Foundation Yield', NULL, 8.50, 82.00, 250.00, 0.00, NULL, 7, 1, '2026-09-05 01:22:42', '2026-09-05 01:22:42'),
(2, 'Market Access', NULL, 14.00, 86.00, 500.00, 0.00, NULL, 14, 1, '2026-09-05 01:22:42', '2026-09-05 01:22:42'),
(3, 'Growth Strategy', NULL, 22.50, 89.00, 1000.00, 0.00, NULL, 21, 1, '2026-09-05 01:22:42', '2026-09-05 01:22:42'),
(4, 'Prime Momentum', NULL, 35.00, 92.00, 2500.00, 0.00, NULL, 30, 1, '2026-09-05 01:22:42', '2026-09-05 01:22:42'),
(5, 'Executive Reserve', NULL, 55.00, 95.00, 5000.00, 0.00, NULL, 45, 1, '2026-09-05 01:22:42', '2026-09-05 01:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `mining_levels`
--

CREATE TABLE `mining_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `power_watts` int(10) UNSIGNED NOT NULL,
  `price` decimal(24,2) NOT NULL,
  `hourly_earning` decimal(24,4) NOT NULL,
  `battery_hours` int(10) UNSIGNED NOT NULL,
  `battery_price` decimal(24,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mining_levels`
--

INSERT INTO `mining_levels` (`id`, `name`, `description`, `power_watts`, `price`, `hourly_earning`, `battery_hours`, `battery_price`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Starter Miner', 'Entry equipment for learning the mining workspace.', 100, 25.00, 0.0100, 12, 2.00, 1, 1, '2026-09-24 11:56:25', '2026-09-24 11:56:25'),
(2, 'Growth Miner', 'Mid-tier equipment with higher wattage and hourly accrual.', 500, 100.00, 0.0500, 24, 8.00, 1, 2, '2026-09-24 11:56:25', '2026-09-24 11:56:25'),
(3, 'Pro Miner', 'High-power equipment with the highest hourly accrual.', 1000, 250.00, 0.1000, 48, 20.00, 1, 3, '2026-09-24 11:56:25', '2026-09-24 11:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `mining_transactions`
--

CREATE TABLE `mining_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `miner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('equipment_purchase','battery_purchase','earning','transfer') NOT NULL,
  `amount` decimal(24,4) NOT NULL,
  `mining_balance_after` decimal(24,2) NOT NULL,
  `account_balance_key` enum('main_balance','profit_balance','investment_balance') DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(40) NOT NULL DEFAULT 'notice',
  `title` varchar(180) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `expires_at` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `title`, `message`, `is_read`, `expires_at`, `created_by`, `created_at`) VALUES
(1, 1, 'notification', 'Local testing account', 'This local account contains test funds only. No real funds or deposits are required.', 0, NULL, NULL, '2026-09-05 01:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `platform_settings`
--

CREATE TABLE `platform_settings` (
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platform_settings`
--

INSERT INTO `platform_settings` (`setting_key`, `setting_value`, `updated_by`, `updated_at`) VALUES
('withdrawal_pin_fee', '890.00', 1, '2026-09-23 11:36:52'),
('withdrawal_pin_message', 'Contact your account manager to receive your withdrawal PIN.', 1, '2026-09-23 11:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `symbol` varchar(40) NOT NULL,
  `side` varchar(10) NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `duration_seconds` int(11) NOT NULL DEFAULT 60,
  `entry_price` decimal(28,8) DEFAULT NULL,
  `exit_price` decimal(28,8) DEFAULT NULL,
  `pnl` decimal(24,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) NOT NULL DEFAULT '1m',
  `status` varchar(30) NOT NULL DEFAULT 'open',
  `pnl_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `opened_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `closes_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `username` varchar(80) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `zipcode` varchar(40) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'user',
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `main_balance` decimal(24,2) NOT NULL DEFAULT 0.00,
  `profit_balance` decimal(24,2) NOT NULL DEFAULT 0.00,
  `investment_balance` decimal(24,2) NOT NULL DEFAULT 0.00,
  `currency_symbol` varchar(8) NOT NULL DEFAULT '$',
  `withdraw_hold` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pin_hash` varchar(255) DEFAULT NULL,
  `account_type` varchar(50) NOT NULL DEFAULT 'individual',
  `trade_progress` decimal(5,2) NOT NULL DEFAULT 0.00,
  `signal_strength` decimal(5,2) NOT NULL DEFAULT 0.00,
  `account_status` varchar(30) NOT NULL DEFAULT 'active',
  `copy_trading_status` varchar(30) NOT NULL DEFAULT 'inactive',
  `trading_status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `copied_trader_id` int(10) UNSIGNED DEFAULT NULL,
  `mining_balance` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `address`, `city`, `zipcode`, `country`, `phone`, `email`, `password_hash`, `role`, `is_verified`, `main_balance`, `profit_balance`, `investment_balance`, `currency_symbol`, `withdraw_hold`, `pin_hash`, `account_type`, `trade_progress`, `signal_strength`, `account_status`, `copy_trading_status`, `trading_status`, `created_at`, `updated_at`, `copied_trader_id`, `mining_balance`) VALUES
(1, 'Local Test Investor', 'tester', '1 Test Street', 'Test City', NULL, 'United States', '0000000000', 'tester@valtherainvestments.com', '$2b$12$cIdDnfN7ed3qZ.lduqB2BukjzOGHlRDscnngM67bFAIfOrcpa3/Ui', 'user', 1, 10000.00, 0.00, 0.00, '$', 100.00, '123456', 'individual', 0.00, 0.00, 'active', 'inactive', 'active', '2026-09-05 01:23:53', '2026-09-05 13:03:45', NULL, 0.00),
(7, 'David Panama', 'davidpanama001', '1st street', 'Austin Texas', NULL, 'United States', '+12254851458', 'ka3915186@gmail.com', '$2b$12$V9uNVY12EQgIAyk6wxdWMeDnigVURzSuWCNHBMZYPSv/gmjn2pSaq', 'user', 0, 0.00, 0.00, 0.00, '$', 0.00, NULL, 'individual', 0.00, 0.00, 'active', 'inactive', 'active', '2026-09-06 15:15:57', '2026-09-06 15:15:57', NULL, 0.00),
(8, 'Evelyn oghenechovwe', 'evelynoghenechovwe493@gmail.com', 'No.9 emmalane opposite alegbo road', 'Delta State', NULL, 'Nigeria', '08147500915', 'evelynoghenechovwe493@gmail.com', '$2b$12$yvZwUYmMeh9K/Uy5Vjc1xOpsOuedtxsHysh8LFmnsxyUhaPZY4Ecm', 'user', 0, 0.00, 0.00, 0.00, '$', 0.00, NULL, 'individual', 0.00, 0.00, 'active', 'inactive', 'active', '2026-09-06 18:29:56', '2026-09-06 18:29:56', NULL, 0.00),
(9, 'Splej Cruz', 'splejcruz@gmail.com', 'No. 9 emmalane', 'Delta', NULL, 'Nigeria', '09035318525', 'splejcruz@gmail.com', '$2b$12$hr1BCX8WWEq.BIX6vpRxx.2tteJMUPXdSzB.Z3H6KgVmeXZj02AgK', 'user', 0, 0.00, 0.00, 0.00, '$', 0.00, NULL, 'individual', 0.00, 0.00, 'active', 'inactive', 'active', '2026-09-06 18:47:22', '2026-09-06 18:47:22', NULL, 0.00),
(10, 'Samantha Hawkins', 'Samantha110', '24 Willow Crescent', 'Manchester', 'M1 1AA', 'United Kingdom', '07700 900456', 'samhawkins1973@yahoo.co.uk', '$2b$12$ZPA/4.TycXXpdrKLvl4xFOZzbaiIX4fRSJtx1GafxXCnmYztxBarK', 'user', 0, 10000.00, 500000.00, 200000.00, '£', 0.00, NULL, 'individual', 90.00, 61.00, 'active', 'inactive', 'active', '2026-09-22 14:01:07', '2026-09-22 17:57:21', NULL, 0.00),
(11, 'habibi', 'habibi', 'Pti road', 'Warri', '332211', 'Nigeria', '07065785436', '8amlight@gmail.com', '$2b$12$sgIDt8pDM6dXHriJN7snreEhrdWRfhwbyEqX6dQ2X3mZoHAkcfuAa', 'user', 0, 15000.00, 0.00, 250.00, '$', 0.00, NULL, 'individual', 0.00, 0.00, 'active', 'inactive', 'active', '2026-09-23 02:07:57', '2026-09-24 13:02:10', NULL, 0.00),
(12, 'billions', 'billions', '2402 Belmont Blvd', 'Delaware, US', '332211', 'usa', '+2347065785436', 'billions@gmail.com', '$2b$12$ZVK0DNwvV6fNhf4d4OsfiOw1EDcGUYB43IKkM1Icbqqvne5mV83h2', 'user', 0, 169018.95, 0.00, 0.00, '$', 0.00, NULL, 'individual', 0.00, 0.00, 'active', 'inactive', 'active', '2026-09-24 13:03:53', '2026-09-24 14:10:34', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user_crypto_balances`
--

CREATE TABLE `user_crypto_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `asset` varchar(16) NOT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_crypto_balances`
--

INSERT INTO `user_crypto_balances` (`id`, `user_id`, `asset`, `balance`, `updated_at`) VALUES
(1, 11, 'BTC', 1.00000000, '2026-09-24 13:01:49'),
(2, 12, 'BTC', 498.00000000, '2026-09-24 14:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_investments`
--

CREATE TABLE `user_investments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `roi_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `expected_profit` decimal(24,2) NOT NULL DEFAULT 0.00,
  `expected_total` decimal(24,2) NOT NULL DEFAULT 0.00,
  `duration_days` int(11) NOT NULL DEFAULT 1,
  `actual_profit_loss` decimal(24,2) NOT NULL DEFAULT 0.00,
  `final_total` decimal(24,2) NOT NULL DEFAULT 0.00,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `started_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `settled_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_investments`
--

INSERT INTO `user_investments` (`id`, `user_id`, `plan_id`, `amount`, `roi_percent`, `expected_profit`, `expected_total`, `duration_days`, `actual_profit_loss`, `final_total`, `status`, `started_at`, `ends_at`, `completed_at`, `admin_note`, `settled_by`, `created_at`, `updated_at`) VALUES
(4, 11, 1, 250.00, 8.50, 21.25, 271.25, 7, 0.00, 0.00, 'active', '2026-09-24 09:00:52', '2026-10-01 09:00:52', NULL, 'Added by administrator', NULL, '2026-09-24 13:00:52', '2026-09-24 13:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_kyc`
--

CREATE TABLE `user_kyc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `id_type` varchar(80) DEFAULT NULL,
  `id_number` varchar(120) DEFAULT NULL,
  `id_front_filename` varchar(255) DEFAULT NULL,
  `id_back_filename` varchar(255) DEFAULT NULL,
  `selfie_filename` varchar(255) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `reviewed_by` int(10) UNSIGNED DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `declined_by` int(10) UNSIGNED DEFAULT NULL,
  `declined_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_miners`
--

CREATE TABLE `user_miners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `status` enum('stopped','running','depleted') NOT NULL DEFAULT 'stopped',
  `battery_seconds_remaining` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_accrued_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `stopped_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_addresses`
--

CREATE TABLE `wallet_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset` varchar(16) NOT NULL,
  `address` varchar(255) NOT NULL,
  `qr_filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_addresses`
--

INSERT INTO `wallet_addresses` (`id`, `asset`, `address`, `qr_filename`, `created_at`, `updated_at`) VALUES
(1, 'BTC', 'bc1qh3jps9377rmgtv68sxgm3m5uq7aclwgw83jh88', 'qr_1788622721008_38d5633fa23988.jpeg', '2026-09-05 01:29:13', '2026-09-05 15:38:41'),
(3, 'ETH', '0x62B66B0417b69a9aa108eD8458a58820507f23E2', 'qr_1788622794418_dbda8694a5797.jpeg', '2026-09-05 15:39:54', '2026-09-05 15:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `method` varchar(20) NOT NULL,
  `asset` varchar(16) DEFAULT NULL,
  `crypto_address` varchar(255) DEFAULT NULL,
  `crypto_network` varchar(80) DEFAULT NULL,
  `bank_name` varchar(150) DEFAULT NULL,
  `bank_account_number` varchar(80) DEFAULT NULL,
  `bank_account_name` varchar(150) DEFAULT NULL,
  `bank_country` varchar(80) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `declined_by` int(10) UNSIGNED DEFAULT NULL,
  `declined_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `amount`, `method`, `asset`, `crypto_address`, `crypto_network`, `bank_name`, `bank_account_number`, `bank_account_name`, `bank_country`, `status`, `admin_note`, `approved_by`, `approved_at`, `declined_by`, `declined_at`, `created_at`, `updated_at`) VALUES
(2, 1, 100.00, 'crypto', 'ETH', 'LOCAL-TEST-ONLY-NO-BLOCKCHAIN-ADDRESS', 'TRC', NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-09-05 01:54:47', '2026-09-05 01:54:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_upgrades`
--
ALTER TABLE `account_upgrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_upgrades_user_idx` (`user_id`),
  ADD KEY `account_upgrades_status_idx` (`status`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_audit_logs`
--
ALTER TABLE `admin_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_admin_created` (`admin_id`,`created_at`);

--
-- Indexes for table `balance_adjustments`
--
ALTER TABLE `balance_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_adjustments_user_id_id_idx` (`user_id`,`id`);

--
-- Indexes for table `binary_trades`
--
ALTER TABLE `binary_trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binary_user_status` (`user_id`,`status`),
  ADD KEY `binary_expiry` (`status`,`expires_at_ms`);

--
-- Indexes for table `copy_traders`
--
ALTER TABLE `copy_traders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_conversions`
--
ALTER TABLE `crypto_conversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crypto_conversions_user_idx` (`user_id`,`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_idx` (`user_id`),
  ADD KEY `deposits_status_idx` (`status`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_logs_user_idx` (`user_id`);

--
-- Indexes for table `email_otps`
--
ALTER TABLE `email_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_otps_email_idx` (`email`),
  ADD KEY `email_otps_user_idx` (`user_id`);

--
-- Indexes for table `investment_plans`
--
ALTER TABLE `investment_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mining_levels`
--
ALTER TABLE `mining_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mining_levels_name_uq` (`name`),
  ADD KEY `mining_levels_active_idx` (`is_active`,`sort_order`);

--
-- Indexes for table `mining_transactions`
--
ALTER TABLE `mining_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mining_transactions_user_idx` (`user_id`,`id`),
  ADD KEY `mining_transactions_miner_idx` (`miner_id`,`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_idx` (`user_id`);

--
-- Indexes for table `platform_settings`
--
ALTER TABLE `platform_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trades_user_idx` (`user_id`),
  ADD KEY `trades_status_idx` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_crypto_balances`
--
ALTER TABLE `user_crypto_balances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_asset_unique` (`user_id`,`asset`);

--
-- Indexes for table `user_investments`
--
ALTER TABLE `user_investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_investments_user_idx` (`user_id`),
  ADD KEY `user_investments_plan_idx` (`plan_id`);

--
-- Indexes for table `user_kyc`
--
ALTER TABLE `user_kyc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_kyc_user_unique` (`user_id`);

--
-- Indexes for table `user_miners`
--
ALTER TABLE `user_miners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_miners_user_idx` (`user_id`,`id`),
  ADD KEY `user_miners_status_idx` (`status`,`last_accrued_at`),
  ADD KEY `user_miners_level_fk` (`level_id`);

--
-- Indexes for table `wallet_addresses`
--
ALTER TABLE `wallet_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_asset_unique` (`asset`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawals_user_idx` (`user_id`),
  ADD KEY `withdrawals_status_idx` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_upgrades`
--
ALTER TABLE `account_upgrades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_audit_logs`
--
ALTER TABLE `admin_audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `balance_adjustments`
--
ALTER TABLE `balance_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `binary_trades`
--
ALTER TABLE `binary_trades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `copy_traders`
--
ALTER TABLE `copy_traders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crypto_conversions`
--
ALTER TABLE `crypto_conversions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_otps`
--
ALTER TABLE `email_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investment_plans`
--
ALTER TABLE `investment_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mining_levels`
--
ALTER TABLE `mining_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mining_transactions`
--
ALTER TABLE `mining_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_crypto_balances`
--
ALTER TABLE `user_crypto_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_investments`
--
ALTER TABLE `user_investments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_kyc`
--
ALTER TABLE `user_kyc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_miners`
--
ALTER TABLE `user_miners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_addresses`
--
ALTER TABLE `wallet_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `crypto_conversions`
--
ALTER TABLE `crypto_conversions`
  ADD CONSTRAINT `crypto_conversions_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mining_transactions`
--
ALTER TABLE `mining_transactions`
  ADD CONSTRAINT `mining_transactions_miner_fk` FOREIGN KEY (`miner_id`) REFERENCES `user_miners` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `mining_transactions_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_miners`
--
ALTER TABLE `user_miners`
  ADD CONSTRAINT `user_miners_level_fk` FOREIGN KEY (`level_id`) REFERENCES `mining_levels` (`id`),
  ADD CONSTRAINT `user_miners_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
