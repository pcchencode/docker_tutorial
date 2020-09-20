class ModifyTableFriends < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans`
        MODIFY `date` DATE NOT NULL COMMENT '日期。',
        DROP COLUMN `nickname`,
        CHANGE `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `new_fans`,
        CHANGE `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
        ADD INDEX `idx_date` (`date`);
    SQL
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans_ranks`
        MODIFY `date` DATE NOT NULL COMMENT '日期。',
        DROP COLUMN `nickname`,
        CHANGE `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `total_fans`,
        CHANGE `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans_ranks`
        CHANGE COLUMN `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        CHANGE COLUMN `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp() AFTER `updated_at`,
        ADD COLUMN `nickname` VARCHAR(190) DEFAULT NULL COMMENT '用戶暱稱。主播。',
        MODIFY `date` DATETIME NOT NULL COMMENT '日期。';
    SQL
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans`
        DROP INDEX `idx_date`,
        CHANGE COLUMN `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        CHANGE COLUMN `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp() AFTER `updated_at`,
        ADD COLUMN `nickname` VARCHAR(190) DEFAULT NULL COMMENT '用戶暱稱。主播。',
        MODIFY `date` DATETIME NOT NULL COMMENT '日期。';
    SQL
  end
end
