CREATE TABLE IF NOT EXISTS `nft_assets` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `collection_name` VARCHAR(150) NULL,
  `description` VARCHAR(1000) NULL,
  `network` VARCHAR(80) NOT NULL,
  `token_id` VARCHAR(191) NULL,
  `mint_wallet_address` VARCHAR(255) NOT NULL,
  `current_value` DECIMAL(24,2) NOT NULL DEFAULT 0.00,
  `currency_symbol` VARCHAR(8) NOT NULL DEFAULT '$',
  `image_filename` VARCHAR(255) NOT NULL,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  `created_by` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `nft_assets_active_created_idx` (`is_active`, `created_at`),
  KEY `nft_assets_network_idx` (`network`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
