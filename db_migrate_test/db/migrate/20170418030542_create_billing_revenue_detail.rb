class CreateBillingRevenueDetail < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `billing_revenue_details` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。',
        `ch_name` VARCHAR(20) NOT NULL COMMENT '充值渠道名稱。',
        `currency` VARCHAR(3) NOT NULL COMMENT '國際貨幣別。參照 ISO 4217。',
        `person_number` SMALLINT(5) unsigned NOT NULL COMMENT '人數。',
        `cash` DECIMAL(11,3) NOT NULL COMMENT '金額。',
        `gold` MEDIUMINT(9) unsigned NOT NULL COMMENT '用戶充值所獲得的浪花。',
        `extra_gold` MEDIUMINT(9) unsigned NOT NULL COMMENT '用戶充值所獲得的額外浪花。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        INDEX `idx_date_currency` (`date`, `currency`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :billing_revenue_details
  end
end
