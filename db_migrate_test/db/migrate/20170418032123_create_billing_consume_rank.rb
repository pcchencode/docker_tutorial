class CreateBillingConsumeRank < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `billing_consume_ranks` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。',
        `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。',
        `nickname` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用戶暱稱。',
        `total_gold` MEDIUMINT(9) unsigned NOT NULL COMMENT '用戶總消費浪花。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_pfid` (`date`, `pfid`),
        INDEX `idx_date_total_gold` (`date`, `total_gold`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :billing_consume_ranks
  end
end
