class CreateDailyBillingVip < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `daily_billing_vips` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '日期。',
        `type` TINYINT(4) UNSIGNED NOT NULL COMMENT '1.潛力VIP; 2.每日充值前20名; 3.註冊即充值前20名; 4.用戶生涯首充前20名',
        `pfid` INT(11) NOT NULL COMMENT '浪Live號。',
        `cash` DECIMAL(11,3) NOT NULL COMMENT '用戶充值金額(新臺幣)。',
        `cumulative_cash` DECIMAL(11,3) UNSIGNED NOT NULL COMMENT '用戶充值總金額(新臺幣)。',
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_type_pfid` (`date`, `type`, `pfid`)
      ) COMMENT '金流：VIP 評鑑總覽表。' ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end

  def down
    drop_table :daily_billing_vips
  end
end
