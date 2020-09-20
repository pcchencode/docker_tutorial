class ModifyBillingFirstOrders < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_first_orders` DROP INDEX `idx_cash`
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` DROP INDEX `idx_pay_date`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` ADD UNIQUE `uni_pfid` (`pfid`);
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` DROP INDEX `idx_pfid`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` DROP COLUMN `nickname`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `pay_date` `pay_time` datetime NOT NULL COMMENT '用戶首次充值時間。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `ch_name` `channel_name` varchar(20) NOT NULL COMMENT '充值渠道名稱。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` MODIFY `gold` INT(11) UNSIGNED NOT NULL COMMENT '用戶充值所獲得的浪花。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` DROP COLUMN `extra_gold`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `gold`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。';
    SQL

    execute <<-SQL
      ALTER TABLE `billing_order_users` ADD COLUMN `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `total_order_user`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_order_users` ADD COLUMN `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。' AFTER `db_create_time`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_order_users` DROP COLUMN `db_update_time`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_order_users` DROP COLUMN `db_create_time`;
    SQL

    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp();
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp() AFTER `updated_at`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` ADD COLUMN `extra_gold` mediumint(9) unsigned NOT NULL COMMENT '用戶充值所獲得的額外浪花。' AFTER `gold`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` MODIFY `gold` mediumint(9) unsigned NOT NULL COMMENT '用戶充值所獲得的浪花。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `channel_name` `ch_name` varchar(20) NOT NULL COMMENT '充值渠道名稱。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` CHANGE COLUMN `pay_time` `pay_date` datetime NOT NULL COMMENT '用戶首次充值時間。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` ADD COLUMN `nickname` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用戶暱稱。' AFTER `pfid`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` ADD UNIQUE `idx_pfid` (`pfid`);
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` DROP INDEX `uni_pfid`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` ADD INDEX `idx_pay_date` (`pay_date`);
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` ADD INDEX `idx_cash` (`cash`);
    SQL
  end
end
