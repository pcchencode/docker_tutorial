class AddColProfileConsume < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_user_profile_consume`
        ADD COLUMN `last_update_time` datetime DEFAULT NULL COMMENT '數據最後參考時間' AFTER `last2mon_bt_return`,
        ADD INDEX `idx_last_update_time` (`last_update_time`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_user_profile_consume`
        DROP COLUMN `last_update_time`,
        DROP INDEX `idx_last_update_time`;
    SQL
  end
end
