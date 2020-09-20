class AddColumnsNewregister < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `newregister_retention_order_bypartner`
        ADD COLUMN `daily_online_count` INT(11) DEFAULT NULL COMMENT '日在線人數' AFTER `daily_online_time`,
        ADD COLUMN `weekly_online_count` INT(11) DEFAULT NULL COMMENT '週在線人數' AFTER `weekly_online_time`,
        ADD COLUMN `monthly_online_count` INT(11) DEFAULT NULL COMMENT '月在線人數' AFTER `monthly_online_time`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `newregister_retention_order_bypartner`
        DROP COLUMN `daily_online_count`,
        DROP COLUMN `weekly_online_count`,
        DROP COLUMN `monthly_online_count`;
    SQL
  end
end
