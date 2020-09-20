class CreateBillingFirstOrder < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `billing_first_orders` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。',
        `nickname` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用戶暱稱。',
        `pay_date` DATETIME NOT NULL COMMENT '用戶首次充值時間。',
        `ch_name` VARCHAR(20) NOT NULL COMMENT '充值渠道名稱。',
        `currency` VARCHAR(3) NOT NULL COMMENT '國際貨幣別。參照 ISO 4217。',
        `cash` DECIMAL(11,3) NOT NULL COMMENT '用戶首次充值金額。',
        `gold` MEDIUMINT(9) unsigned NOT NULL COMMENT '用戶充值所獲得的浪花。',
        `extra_gold` MEDIUMINT(9) unsigned NOT NULL COMMENT '用戶充值所獲得的額外浪花。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        INDEX `idx_pay_date` (`pay_date`),
        INDEX `idx_cash` (`cash`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :billing_first_orders
  end
end
