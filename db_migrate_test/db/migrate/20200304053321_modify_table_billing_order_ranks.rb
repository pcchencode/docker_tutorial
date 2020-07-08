class ModifyTableBillingOrderRanks < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        MODIFY `date` DATE NOT NULL COMMENT '日期。' AFTER `id`,
        MODIFY `cash` DECIMAL(11,2) NOT NULL COMMENT '用戶充值金額（新台幣；TWD）。',
        CHANGE `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `exp`,
        CHANGE `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
        DROP INDEX `idx_cash`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        ADD INDEX `idx_cash` (`cash`),
        CHANGE COLUMN `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        CHANGE COLUMN `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp() AFTER `updated_at`,
        MODIFY `cash` DECIMAL(10,3) NOT NULL COMMENT '用戶充值金額（新台幣；TWD）。',
        MODIFY `date` DATETIME NOT NULL COMMENT '日期。' AFTER `pfid`;
    SQL
  end
end
