class AddTableUserVipBillingInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `user_vip_billing_infos` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主鍵。',
        `date` DATE NOT NULL COMMENT '日期。',
        `pfid` INT(11) UNSIGNED NOT NULL COMMENT 'VIP 浪號。',
        `balance_gold` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'VIP 剩餘浪花。',
        `consume_gold` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'VIP 消耗浪花。',
        `recharge_gold` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'VIP 儲值浪花。',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_date` (`pfid`,`date`),
        KEY `idx_date` (`date`),
        KEY `idx_dbUpdateTime` (`db_update_time`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='[浪] 用戶：VIP 每日金流總覽。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。';
    SQL
    execute <<-SQL
      ALTER TABLE `user_vip_infos`
        ADD COLUMN `two_month_ago_cash` DECIMAL(12,3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'VIP 上上月充值金額。貨幣：新臺幣。' AFTER `total_cash`,
        ADD COLUMN `last_month_cash` DECIMAL(12,3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'VIP 上月充值金額。貨幣：新臺幣。' AFTER `two_month_ago_cash`,
        ADD COLUMN `yesterday_gold` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'VIP 昨日消耗浪花。' AFTER `currency`;
    SQL
  end

  def down
    drop_table :user_vip_billing_infos
    execute <<-SQL
      ALTER TABLE `user_vip_infos`
        DROP COLUMN `yesterday_gold`,
        DROP COLUMN `last_month_cash`,
        DROP COLUMN `two_month_ago_cash`;
    SQL
  end
end
