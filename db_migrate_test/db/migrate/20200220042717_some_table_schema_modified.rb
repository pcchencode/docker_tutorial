class SomeTableSchemaModified < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` MODIFY `gold` INT(11) UNSIGNED NOT NULL COMMENT '用戶充值所獲得的浪花。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` MODIFY `extra_gold` INT(11) UNSIGNED NOT NULL COMMENT '用戶充值所獲得的額外浪花。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` CHANGE `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `extra_gold`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` CHANGE `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。';
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms` MODIFY `max_heat` INT(11) UNSIGNED NOT NULL COMMENT '直播間在開播期間的最大熱度。';
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms` CHANGE `gold` `diamond` INT(11) UNSIGNED NOT NULL COMMENT '主播在該次直播間的鑽石總收入。';
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms` CHANGE `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `device_platform_version`;
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms` CHANGE `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。';
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE `live_rooms` CHANGE `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp();
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms` CHANGE `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp() AFTER `updated_at`;
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms` CHANGE `diamond` `gold` mediumint(9) unsigned NOT NULL COMMENT '主播在該次直播間的鑽石總收入。';
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms` MODIFY `max_heat` mediumint(9) unsigned NOT NULL COMMENT '直播間在開播期間的最大熱度。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` CHANGE `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp();
    SQL
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` CHANGE `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp() AFTER `updated_at`;
    SQL
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` MODIFY `extra_gold` mediumint(9) unsigned NOT NULL COMMENT '用戶充值所獲得的額外浪花。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_revenue_details` MODIFY `gold` mediumint(9) unsigned NOT NULL COMMENT '用戶充值所獲得的浪花。';
    SQL
  end
end
