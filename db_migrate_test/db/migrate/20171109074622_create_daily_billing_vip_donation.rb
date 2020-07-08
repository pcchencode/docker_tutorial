class CreateDailyBillingVipDonation < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `daily_billing_vip_donations` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '日期。',
        `pfid` INT(11) NOT NULL COMMENT 'VIP 浪Live號。',
        `anchor_pfid` INT(11) NOT NULL COMMENT '主播浪Live號。',
        `gold` INT(11) UNSIGNED NOT NULL COMMENT '浪花。',
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_pfid_anchor_pfid` (`date`, `pfid`, `anchor_pfid`)
      ) COMMENT '金流：VIP 用戶貢獻浪花給主播的排名。' ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end

  def down
   drop_table :daily_billing_vip_donations
  end
end
