-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table miu.detail_transactions
CREATE TABLE IF NOT EXISTS `detail_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint unsigned NOT NULL,
  `ticket_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `total` int NOT NULL,
  `ppn` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticket_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('open','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `scanned` int NOT NULL DEFAULT '0',
  `scanned_at` timestamp NULL DEFAULT NULL,
  `gate` int DEFAULT NULL,
  `is_print` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.detail_transactions: ~0 rows (approximately)
DELETE FROM `detail_transactions`;

-- Dumping structure for table miu.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table miu.gate_accesses
CREATE TABLE IF NOT EXISTS `gate_accesses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gate_access_id` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gate_accesses_gate_access_id_unique` (`gate_access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.gate_accesses: ~0 rows (approximately)
DELETE FROM `gate_accesses`;
INSERT INTO `gate_accesses` (`id`, `gate_access_id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, '1', 'Main GATE', 1, '2026-01-30 07:41:51', '2026-01-30 08:28:04');

-- Dumping structure for table miu.gate_access_membership
CREATE TABLE IF NOT EXISTS `gate_access_membership` (
  `gate_access_id` bigint unsigned NOT NULL,
  `membership_id` bigint unsigned NOT NULL,
  KEY `gate_access_membership_gate_access_id_foreign` (`gate_access_id`),
  KEY `gate_access_membership_membership_id_foreign` (`membership_id`),
  CONSTRAINT `gate_access_membership_gate_access_id_foreign` FOREIGN KEY (`gate_access_id`) REFERENCES `gate_accesses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gate_access_membership_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.gate_access_membership: ~13 rows (approximately)
DELETE FROM `gate_access_membership`;
INSERT INTO `gate_access_membership` (`gate_access_id`, `membership_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15);

-- Dumping structure for table miu.histories
CREATE TABLE IF NOT EXISTS `histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT '0',
  `gate` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `waktu` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.histories: ~0 rows (approximately)
DELETE FROM `histories`;

-- Dumping structure for table miu.history_memberships
CREATE TABLE IF NOT EXISTS `history_memberships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `membership_id` bigint unsigned NOT NULL,
  `member_id` bigint unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `history_memberships_membership_id_foreign` (`membership_id`),
  KEY `history_memberships_member_id_foreign` (`member_id`),
  CONSTRAINT `history_memberships_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `history_memberships_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.history_memberships: ~0 rows (approximately)
DELETE FROM `history_memberships`;

-- Dumping structure for table miu.history_penyewaans
CREATE TABLE IF NOT EXISTS `history_penyewaans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint unsigned NOT NULL,
  `penyewaan_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `history_penyewaans_member_id_foreign` (`member_id`),
  KEY `history_penyewaans_penyewaan_id_foreign` (`penyewaan_id`),
  CONSTRAINT `history_penyewaans_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `history_penyewaans_penyewaan_id_foreign` FOREIGN KEY (`penyewaan_id`) REFERENCES `penyewaans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.history_penyewaans: ~0 rows (approximately)
DELETE FROM `history_penyewaans`;

-- Dumping structure for table miu.jenis_tickets
CREATE TABLE IF NOT EXISTS `jenis_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.jenis_tickets: ~2 rows (approximately)
DELETE FROM `jenis_tickets`;
INSERT INTO `jenis_tickets` (`id`, `nama_jenis`, `created_at`, `updated_at`) VALUES
	(1, 'Reguler', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(2, 'Terusan', '2026-01-30 07:32:23', '2026-01-30 07:32:23');

-- Dumping structure for table miu.limit_members
CREATE TABLE IF NOT EXISTS `limit_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `limit` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.limit_members: ~0 rows (approximately)
DELETE FROM `limit_members`;

-- Dumping structure for table miu.members
CREATE TABLE IF NOT EXISTS `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT '0',
  `membership_id` bigint DEFAULT '0',
  `rfid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_ktp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tgl_register` date NOT NULL,
  `tgl_expired` date NOT NULL,
  `saldo` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '0',
  `jenis_kelamin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int NOT NULL DEFAULT '0',
  `jenis_member` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_used` int NOT NULL DEFAULT '0',
  `member_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_member_code_unique` (`member_code`),
  UNIQUE KEY `members_rfid_unique` (`rfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.members: ~0 rows (approximately)
DELETE FROM `members`;

-- Dumping structure for table miu.memberships
CREATE TABLE IF NOT EXISTS `memberships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration_days` int NOT NULL,
  `price` double NOT NULL,
  `max_person` int NOT NULL DEFAULT '1',
  `is_active` int NOT NULL DEFAULT '1',
  `use_ppn` tinyint(1) NOT NULL DEFAULT '0',
  `ppn` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `max_access` int NOT NULL DEFAULT '0',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.memberships: ~13 rows (approximately)
DELETE FROM `memberships`;
INSERT INTO `memberships` (`id`, `name`, `duration_days`, `price`, `max_person`, `is_active`, `use_ppn`, `ppn`, `created_at`, `updated_at`, `max_access`, `code`) VALUES
	(1, 'FAMILY 4 DEWASA NEW', 31, 1225000, 5, 1, 0, 0.00, '2026-01-30 08:44:15', '2026-03-03 11:51:55', 0, 'FM04'),
	(2, 'FAMILY 3 DEWASA NEW', 31, 1040000, 5, 1, 0, 0.00, '2026-01-30 08:45:02', '2026-03-03 11:50:11', 0, 'FM03'),
	(3, 'FAMILY 2 DEWASA NEW', 31, 875000, 5, 1, 0, 0.00, '2026-02-03 06:43:24', '2026-03-04 01:42:17', 0, 'FM02'),
	(6, 'SINGLE NEW', 31, 575000, 1, 1, 0, 0.00, '2026-03-04 01:43:21', '2026-03-04 01:55:57', 0, 'SG01'),
	(7, 'STUDENT NEW', 31, 375000, 1, 1, 0, 0.00, '2026-03-04 01:44:54', '2026-03-04 01:55:49', 0, 'M01'),
	(8, 'ADMIN FAMILY', 31, 150000, 5, 1, 0, 0.00, '2026-03-04 01:46:19', '2026-03-04 01:46:19', 0, 'FM'),
	(9, 'ADMIN SINGLE', 31, 100000, 1, 1, 0, 0.00, '2026-03-04 01:47:56', '2026-03-04 01:47:56', 0, 'SG'),
	(10, 'ADMIN STUDENT', 31, 75000, 1, 1, 0, 0.00, '2026-03-04 01:48:44', '2026-03-04 01:49:14', 0, 'M'),
	(11, 'FAMILY 2 DEWASA', 31, 725000, 5, 1, 0, 0.00, '2026-03-04 01:53:36', '2026-03-04 01:53:36', 0, 'FM.02'),
	(12, 'FAMILY 3 DEWASA', 31, 890000, 5, 1, 0, 0.00, '2026-03-04 01:54:31', '2026-03-04 01:54:31', 0, 'FM.03'),
	(13, 'FAMILY 4 DEWASA', 31, 1075000, 5, 1, 0, 0.00, '2026-03-04 01:55:26', '2026-03-04 01:55:26', 0, 'FM.04'),
	(14, 'SINGLE', 31, 475000, 1, 1, 0, 0.00, '2026-03-04 01:56:30', '2026-03-04 01:56:30', 0, 'SG.01'),
	(15, 'STUDENT', 31, 300000, 1, 1, 0, 0.00, '2026-03-04 01:57:26', '2026-03-04 01:57:26', 0, 'M.01');

-- Dumping structure for table miu.membership_admin_fees
CREATE TABLE IF NOT EXISTS `membership_admin_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_fee` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.membership_admin_fees: ~0 rows (approximately)
DELETE FROM `membership_admin_fees`;
INSERT INTO `membership_admin_fees` (`id`, `admin_type`, `admin_fee`, `created_at`, `updated_at`) VALUES
	(1, 'Admin Membership', 30000, '2026-03-06 05:48:04', '2026-03-06 05:48:04');

-- Dumping structure for table miu.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.migrations: ~44 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_02_16_091237_create_jenis_tickets_table', 1),
	(6, '2023_02_16_091239_create_tickets_table', 1),
	(7, '2023_02_16_091410_create_transactions_table', 1),
	(8, '2023_04_06_022411_create_members_table', 1),
	(9, '2023_04_06_030149_create_histories_table', 1),
	(10, '2023_04_07_022739_create_sewas_table', 1),
	(11, '2023_04_07_024121_create_penyewaans_table', 1),
	(12, '2023_04_07_024401_create_history_penyewaans_table', 1),
	(13, '2023_04_07_064151_create_permission_tables', 1),
	(14, '2023_04_11_073712_create_terusans_table', 1),
	(15, '2023_04_12_023911_create_detail_transactions_table', 1),
	(16, '2023_04_13_065403_create_terusan_ticket_table', 1),
	(17, '2023_04_15_030043_create_topups_table', 1),
	(18, '2023_04_27_080534_add_user_id_to_penyewaans_table', 1),
	(19, '2023_04_27_085330_add_no_hp_to_members_table', 1),
	(20, '2023_04_27_101521_add_discount_to_transactions_table', 1),
	(21, '2023_05_03_083958_add_metode_to_transactions_table', 1),
	(22, '2023_12_03_210146_add_ticket_code_to_detail_transactions_table', 1),
	(23, '2023_12_05_061401_add_is_print_to_transactions_table', 1),
	(24, '2023_12_05_061824_add_is_print_to_detail_transactions_table', 1),
	(25, '2023_12_05_115018_create_settings_table', 1),
	(26, '2023_12_05_183504_add_use_logo_to_settings_table', 1),
	(27, '2023_12_19_111103_add_bayar_to_transactions_table', 1),
	(28, '2024_06_03_103029_create_limit_members_table', 1),
	(29, '2024_06_04_181135_add_uid_to_users_table', 1),
	(30, '2024_06_07_135533_add_waktu_to_histories_table', 1),
	(31, '2024_06_10_145804_add_bayar_to_penyewaans_table', 1),
	(32, '2024_06_11_144134_add_user_id_to_histories_table', 1),
	(33, '2024_06_25_102231_add_limit_to_members_table', 1),
	(34, '2024_06_25_103327_add_jenis_member_to_members_table', 1),
	(35, '2025_10_31_203329_add_qr_code_to_members_table', 1),
	(36, '2025_10_31_204653_create_memberships_table', 1),
	(37, '2025_11_04_163914_create_gate_accesses_table', 1),
	(38, '2025_11_05_104103_create_gate_access_membership_table', 1),
	(39, '2025_11_10_105325_add_max_person_to_memberships_table', 1),
	(40, '2025_11_10_194953_add_parent_id_to_members_table', 1),
	(41, '2025_11_11_090340_create_history_memberships_table', 1),
	(42, '2025_11_11_141124_add_scanned_at_to_detail_transactions_table', 1),
	(43, '2026_03_06_120000_create_membership_admin_fees_table', 2),
	(44, '2026_03_06_130000_simplify_membership_admin_fees_table', 3);

-- Dumping structure for table miu.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table miu.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.model_has_roles: ~7 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 3),
	(2, 'App\\Models\\User', 4),
	(1, 'App\\Models\\User', 5),
	(1, 'App\\Models\\User', 6),
	(1, 'App\\Models\\User', 7);

-- Dumping structure for table miu.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table miu.penyewaans
CREATE TABLE IF NOT EXISTS `penyewaans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sewa_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `metode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `penyewaans_sewa_id_foreign` (`sewa_id`),
  KEY `penyewaans_user_id_foreign` (`user_id`),
  CONSTRAINT `penyewaans_sewa_id_foreign` FOREIGN KEY (`sewa_id`) REFERENCES `sewa` (`id`),
  CONSTRAINT `penyewaans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.penyewaans: ~0 rows (approximately)
DELETE FROM `penyewaans`;

-- Dumping structure for table miu.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.permissions: ~15 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'master-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(2, 'user-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(3, 'ticket-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(4, 'sewa-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(5, 'member-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(6, 'transaction-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(7, 'penyewaan-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(8, 'topup-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(9, 'report-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(10, 'report-transaction-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(11, 'report-penyewaan-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(12, 'transaction-delete', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(13, 'penyewaan-delete', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(14, 'topup-delete', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(15, 'management-access', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23');

-- Dumping structure for table miu.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table miu.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.roles: ~2 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'web', '2026-01-30 07:32:23', '2026-01-30 07:32:23'),
	(2, 'Kasir', 'web', '2026-01-30 08:29:18', '2026-01-30 08:29:18');

-- Dumping structure for table miu.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.role_has_permissions: ~21 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(9, 2),
	(10, 2);

-- Dumping structure for table miu.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ucapan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ppn` int DEFAULT NULL,
  `member_reminder_days` int NOT NULL DEFAULT '7',
  `member_delete_grace_days` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_logo` int NOT NULL DEFAULT '1',
  `print_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'per_qty',
  `dashboard_metric_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `whatsapp_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.settings: ~22 rows (approximately)
DELETE FROM `settings`;
INSERT INTO `settings` (`id`, `name`, `logo`, `ucapan`, `deskripsi`, `ppn`, `member_reminder_days`, `member_delete_grace_days`, `created_at`, `updated_at`, `use_logo`, `print_mode`, `dashboard_metric_mode`, `whatsapp_enabled`, `key`, `value`) VALUES
	(1, 'ANWA PURI RESIDENCE SPORT CLUB', 'logo/260216042041133.png', 'Terima kasih atas kunjungan anda', 'WA: 0812xxxx | IG: @sportclub_id', 0, 7, 0, NULL, '2026-02-20 07:24:21', 1, 'per_ticket', 'count', 0, '', NULL),
	(2, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 04:22:44', 1, 'per_qty', 'amount', 0, 'name', 'ANWA PURI RESIDENCE SPORT CLUB'),
	(3, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 04:22:44', 1, 'per_qty', 'amount', 0, 'ucapan', 'Terima kasih atas kunjungan anda'),
	(4, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-03-03 11:40:20', 1, 'per_qty', 'amount', 0, 'deskripsi', 'WA: 0821-2222-9358 | IG: @SPORTCLUBANWAPURI'),
	(5, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 04:22:55', 1, 'per_qty', 'amount', 0, 'ppn', '10'),
	(6, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 04:22:44', 1, 'per_qty', 'amount', 0, 'member_suspend_before_days', '7'),
	(7, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 08:22:23', 1, 'per_qty', 'amount', 0, 'member_suspend_after_days', '30'),
	(8, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 04:22:51', 1, 'per_qty', 'amount', 0, 'member_reactivation_admin_fee', '2500'),
	(9, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-03-03 09:33:17', 1, 'per_qty', 'amount', 0, 'print_mode', 'per_ticket'),
	(10, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-03-06 06:28:53', 1, 'per_qty', 'amount', 0, 'ticket_print_orientation', 'with_summary'),
	(11, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 08:22:11', 1, 'per_qty', 'amount', 0, 'dashboard_metric_mode', 'count'),
	(12, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 08:51:37', 1, 'per_qty', 'amount', 0, 'use_logo', '1'),
	(13, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 04:22:44', 1, 'per_qty', 'amount', 0, 'whatsapp_enabled', '0'),
	(14, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-02-26 04:22:44', '2026-02-26 08:51:37', 1, 'per_qty', 'amount', 0, 'logo', 'logo/260226155137829.png'),
	(15, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-03 09:16:09', '2026-03-03 09:16:09', 1, 'per_qty', 'amount', 0, 'renewal_notice_club_name', 'Sport Club Anwa Puri'),
	(16, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-03 09:16:09', '2026-03-03 09:16:09', 1, 'per_qty', 'amount', 0, 'renewal_notice_bank_account', 'TRANSFER BANK: BCA 0289011155 A/N PT KARTUNINDO PERKASA ABADI'),
	(17, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-03 09:16:09', '2026-03-03 09:16:09', 1, 'per_qty', 'amount', 0, 'renewal_notice_admin_phone', '0821 2222 9358'),
	(18, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-03 09:16:09', '2026-03-03 09:16:09', 1, 'per_qty', 'amount', 0, 'renewal_notice_body_template', 'Yth. Bapak/Ibu :member_name,\r\n\r\nKami informasikan bahwa masa aktif membership Anda akan berakhir pada :expired_date.\r\n\r\nAgar tetap dapat menikmati seluruh fasilitas, mohon melakukan perpanjangan dengan rincian:\r\n\r\nTipe Member: :membership_name\r\nBiaya: :total_price\r\nJatuh tempo: :due_date\r\n:note_block\r\nSilakan melakukan pembayaran sebelum jatuh tempo agar membership tetap aktif.\r\n\r\n:bank_account\r\n\r\nJika sudah melakukan pembayaran, harap informasi dan kirim bukti pembayaran ke nomor Admin.\r\nTerima kasih.\r\n\r\nAdmin\r\n:club_name\r\nNo.Hp: :admin_phone'),
	(19, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-06 06:19:32', '2026-03-06 06:30:58', 1, 'per_qty', 'amount', 0, 'ticket_code_mode', 'shared'),
	(20, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-13 06:26:34', '2026-03-13 06:33:50', 1, 'per_qty', 'amount', 0, 'website_status', '1'),
	(21, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-13 07:01:42', '2026-03-13 07:01:42', 1, 'per_qty', 'amount', 0, 'ticket_valid_days', '1'),
	(22, NULL, NULL, NULL, NULL, NULL, 7, 0, '2026-03-13 07:01:42', '2026-03-13 07:01:42', 1, 'per_qty', 'amount', 0, 'ticket_scan_limit', '5');

-- Dumping structure for table miu.settings_legacy
CREATE TABLE IF NOT EXISTS `settings_legacy` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.settings_legacy: ~0 rows (approximately)
DELETE FROM `settings_legacy`;

-- Dumping structure for table miu.sewa
CREATE TABLE IF NOT EXISTS `sewa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int NOT NULL,
  `device` int NOT NULL,
  `use_time` tinyint(1) NOT NULL DEFAULT '1',
  `use_ppn` tinyint(1) NOT NULL DEFAULT '0',
  `ppn` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_nominal_flexible` tinyint(1) NOT NULL DEFAULT '0',
  `print_qr` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.sewa: ~21 rows (approximately)
DELETE FROM `sewa`;
INSERT INTO `sewa` (`id`, `name`, `harga`, `device`, `use_time`, `use_ppn`, `ppn`, `created_at`, `updated_at`, `is_nominal_flexible`, `print_qr`) VALUES
	(1, 'Sewa Loker Renang', 20000, 1, 0, 0, 0.00, '2026-01-30 07:32:23', '2026-03-04 00:17:22', 0, 0),
	(5, 'Sewa Gazebo 1 (2 Jam)', 100000, 1, 1, 0, 0.00, '2026-02-20 08:41:11', '2026-03-04 00:18:15', 0, 0),
	(6, 'Sewa Gazebo 2 (2 jam)', 100000, 1, 1, 0, 0.00, '2026-02-27 03:45:46', '2026-03-04 00:19:11', 0, 0),
	(7, 'Sewa Gazebo 3 (2 jam)', 100000, 1, 1, 0, 0.00, '2026-03-03 10:37:05', '2026-03-04 00:21:26', 0, 0),
	(8, 'Sewa Gazebo 4 (2 Jam)', 100000, 1, 1, 0, 0.00, '2026-03-04 00:03:02', '2026-03-04 00:21:33', 0, 0),
	(9, 'Penambahan Gazebo (1 jam)', 50000, 1, 1, 0, 0.00, '2026-03-04 00:03:44', '2026-03-04 00:21:15', 0, 0),
	(10, 'Lampu Tennis', 30000, 1, 0, 0, 0.00, '2026-03-04 00:04:07', '2026-03-04 02:10:14', 0, 0),
	(11, 'Shower Tennis', 30000, 1, 0, 0, 0.00, '2026-03-04 00:13:57', '2026-03-04 02:10:19', 0, 0),
	(12, 'Shower + Loker Tennis', 50000, 1, 0, 0, 0.00, '2026-03-04 00:22:51', '2026-03-04 00:22:51', 0, 0),
	(13, 'Tennis AYO', 0, 1, 0, 0, 0.00, '2026-03-04 00:23:13', '2026-03-04 00:23:13', 1, 0),
	(14, 'Loker Tennis', 30000, 1, 0, 0, 0.00, '2026-03-04 00:28:01', '2026-03-04 02:10:27', 0, 0),
	(15, 'IMPACT (4x Visit)', 700000, 1, 0, 0, 0.00, '2026-03-04 01:26:02', '2026-03-04 01:26:02', 0, 0),
	(16, 'IMPACT (8x Visit)', 1300000, 1, 0, 0, 0.00, '2026-03-04 01:26:39', '2026-03-04 01:26:39', 0, 0),
	(17, 'Paket Manula', 350000, 1, 0, 0, 0.00, '2026-03-04 01:28:27', '2026-03-04 01:28:27', 0, 0),
	(18, 'Listrik', 0, 1, 0, 0, 0.00, '2026-03-04 01:30:56', '2026-03-04 01:30:56', 1, 0),
	(19, 'Denda Tenant', 25000, 1, 0, 0, 0.00, '2026-03-04 01:31:25', '2026-03-04 01:31:25', 1, 0),
	(20, 'Foodcourt Kecil', 1210000, 1, 0, 0, 0.00, '2026-03-04 01:32:23', '2026-03-04 01:32:23', 0, 0),
	(21, 'Foodcourt Sedang', 1450000, 1, 0, 0, 0.00, '2026-03-04 01:33:11', '2026-03-04 01:33:11', 0, 0),
	(22, 'Foodcourt Besar', 2090000, 1, 0, 0, 0.00, '2026-03-04 01:34:19', '2026-03-04 01:34:19', 0, 0),
	(23, 'Sampah Foodcourt', 50000, 1, 0, 0, 0.00, '2026-03-04 01:35:24', '2026-03-04 01:36:33', 1, 0),
	(24, 'Lain - Lain', 0, 1, 0, 0, 0.00, '2026-03-04 01:37:01', '2026-03-04 01:37:01', 1, 0);

-- Dumping structure for table miu.terusans
CREATE TABLE IF NOT EXISTS `terusans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tripod` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `terusans_tripod_unique` (`tripod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.terusans: ~0 rows (approximately)
DELETE FROM `terusans`;

-- Dumping structure for table miu.terusan_ticket
CREATE TABLE IF NOT EXISTS `terusan_ticket` (
  `terusan_id` bigint unsigned NOT NULL,
  `ticket_id` bigint unsigned NOT NULL,
  KEY `terusan_ticket_terusan_id_foreign` (`terusan_id`),
  KEY `terusan_ticket_ticket_id_foreign` (`ticket_id`),
  CONSTRAINT `terusan_ticket_terusan_id_foreign` FOREIGN KEY (`terusan_id`) REFERENCES `terusans` (`id`),
  CONSTRAINT `terusan_ticket_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.terusan_ticket: ~0 rows (approximately)
DELETE FROM `terusan_ticket`;

-- Dumping structure for table miu.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis_ticket_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int NOT NULL,
  `tripod` int NOT NULL,
  `use_ppn` tinyint(1) NOT NULL DEFAULT '0',
  `ppn` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_jenis_ticket_id_foreign` (`jenis_ticket_id`),
  CONSTRAINT `tickets_jenis_ticket_id_foreign` FOREIGN KEY (`jenis_ticket_id`) REFERENCES `jenis_tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.tickets: ~16 rows (approximately)
DELETE FROM `tickets`;
INSERT INTO `tickets` (`id`, `jenis_ticket_id`, `name`, `harga`, `tripod`, `use_ppn`, `ppn`, `created_at`, `updated_at`) VALUES
	(6, 1, 'Semua Fasilitas Weekday', 75000, 1, 0, 0.00, '2026-02-03 07:19:24', '2026-02-20 04:22:38'),
	(7, 1, 'Semua Fasilitas Weekend', 85000, 1, 0, 0.00, '2026-02-03 07:20:11', '2026-02-03 07:20:11'),
	(8, 1, 'Tiket Renang Weekday', 45000, 1, 0, 0.00, '2026-02-03 07:21:41', '2026-02-03 07:21:41'),
	(9, 1, 'Tiket Renang Weekend', 60000, 1, 0, 0.00, '2026-02-03 07:21:57', '2026-02-03 07:21:57'),
	(13, 1, 'Sewa Loker', 20000, 1, 0, 0.00, '2026-02-03 07:32:04', '2026-02-03 07:32:04'),
	(14, 1, 'Sewa Gazebo (2 Jam)', 100000, 1, 0, 0.00, '2026-02-03 07:32:34', '2026-02-03 07:32:34'),
	(15, 1, 'Sewa Gazebo (1 Jam)', 50000, 1, 0, 0.00, '2026-02-03 07:32:52', '2026-02-03 07:32:52'),
	(17, 1, 'Voucher Renang', 35000, 1, 0, 0.00, '2026-02-03 07:35:40', '2026-02-03 07:35:40'),
	(18, 1, 'Only Pingpong (Weekday)', 45000, 1, 0, 0.00, '2026-02-03 07:44:58', '2026-02-03 07:44:58'),
	(19, 1, 'Only Pingpong (Weekend)', 60000, 1, 0, 0.00, '2026-02-03 07:45:28', '2026-02-03 07:45:28'),
	(20, 1, 'IMPACT (4x Visit)', 700000, 1, 0, 0.00, '2026-02-03 07:46:05', '2026-02-03 07:46:05'),
	(21, 1, 'IMPACT (8x Visit)', 1300000, 1, 0, 0.00, '2026-02-03 07:46:38', '2026-02-03 07:46:38'),
	(22, 1, 'Tiket Rombongan (Weekday)', 35000, 1, 0, 0.00, '2026-02-03 07:47:37', '2026-02-03 07:47:37'),
	(23, 1, 'PROMO RAMADHAN 19 FEB - 6 MAR', 35000, 1, 0, 0.00, '2026-03-03 11:45:28', '2026-03-03 11:45:28'),
	(24, 1, 'Paket Manula', 350000, 1, 0, 0.00, '2026-03-04 01:39:28', '2026-03-04 01:39:28'),
	(25, 1, 'Tiket Lebaran', 75000, 1, 0, 0.00, '2026-03-04 01:40:06', '2026-03-04 01:40:06');

-- Dumping structure for table miu.topups
CREATE TABLE IF NOT EXISTS `topups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint unsigned NOT NULL,
  `jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topups_member_id_foreign` (`member_id`),
  CONSTRAINT `topups_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.topups: ~0 rows (approximately)
DELETE FROM `topups`;

-- Dumping structure for table miu.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned DEFAULT '0',
  `member_id` bigint unsigned DEFAULT NULL,
  `member_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `no_trx` int NOT NULL,
  `ticket_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('renewal','ticket','registration','rental') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ticket',
  `tipe` enum('group','individual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'group',
  `amount` int NOT NULL DEFAULT '0',
  `disc` int NOT NULL DEFAULT '0',
  `metode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int NOT NULL DEFAULT '0',
  `amount_scanned` int NOT NULL DEFAULT '0',
  `status` enum('open','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `gate` int DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `ppn` decimal(12,2) NOT NULL DEFAULT '0.00',
  `admin_fee` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_print` int DEFAULT '0',
  `bayar` double NOT NULL DEFAULT '0',
  `kembali` double NOT NULL DEFAULT '0',
  `nama_kartu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_kartu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.transactions: ~0 rows (approximately)
DELETE FROM `transactions`;

-- Dumping structure for table miu.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uid` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_uid_unique` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.users: ~7 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `username`, `password`, `foto`, `created_at`, `updated_at`, `uid`, `is_active`) VALUES
	(1, 'Super Admin', 'superadmin', '$2y$10$sswDhoSF0XL0ePqzbGcZJOHuLzwe5TezY5l9DYQvXPzdR2iB79EaK', NULL, '2026-01-30 07:32:23', '2026-01-30 08:26:42', NULL, 1),
	(2, 'DIVA', 'DIVA', '$2y$10$mcPSv/7mCO010Go3kGJFOuarb53PATgaMeZi.pOzhe/FCdQkV9eVa', NULL, '2026-02-03 07:07:22', '2026-02-03 07:10:00', NULL, 1),
	(3, 'KEVIN', 'KEVIN', '$2y$10$2C7obZUng.O47ULQdZpxBO3hQHiOS4CxQC2p0UFHe3En4c2UCnIr.', NULL, '2026-02-03 07:07:47', '2026-02-03 07:07:47', NULL, 1),
	(4, 'MAYA', 'MAYA', '$2y$10$A/ZMIBDvb1Z7nFynj7pfYetRXQFzjtdGR/laSgkfb.MghuY.N1A3.', NULL, '2026-02-03 07:08:14', '2026-03-04 02:14:36', NULL, 1),
	(5, 'MULI', 'MULI', '$2y$10$u9cxNuvO57mREpFBdK4NlumQeOluvkvTF/skXYJ4/U4/41N50fXSy', NULL, '2026-02-03 07:15:49', '2026-03-04 02:04:13', NULL, 1),
	(6, 'HERNIE', 'HERNIE', '$2y$10$vM5u5YelgUUGJig/ktVaauElUq9/rIZkKf/A4dHasLabvp1Mlub..', NULL, '2026-02-03 07:16:11', '2026-02-03 07:16:11', NULL, 1),
	(7, 'Vicky', 'vicky', '$2y$10$WbJO3FUzoNnFmtLK15s3.u6qyMXb/BqMh1uURGG1yxq1e8aNbttt2', NULL, '2026-02-20 07:13:46', '2026-02-20 07:13:46', NULL, 1);

-- Dumping structure for table miu.whatsapp_notification_logs
CREATE TABLE IF NOT EXISTS `whatsapp_notification_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'renewal_reminder, invoice',
  `member_id` bigint unsigned DEFAULT NULL,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `recipient_phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','sent','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `retry_count` smallint unsigned NOT NULL DEFAULT '0',
  `provider_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wa_logs_type_status` (`type`,`status`),
  KEY `idx_wa_logs_member_id` (`member_id`),
  KEY `idx_wa_logs_transaction_id` (`transaction_id`),
  KEY `idx_wa_logs_recipient_phone` (`recipient_phone`),
  KEY `idx_wa_logs_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table miu.whatsapp_notification_logs: ~0 rows (approximately)
DELETE FROM `whatsapp_notification_logs`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
