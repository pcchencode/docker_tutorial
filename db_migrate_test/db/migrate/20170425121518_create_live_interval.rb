class CreateLiveInterval < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `live_time_intervals` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '結算時間。',
        `duration` SMALLINT(6) unsigned NOT NULL COMMENT '時間範圍。單位分鐘。',
        `login_user_count` SMALLINT(6) unsigned NOT NULL COMMENT '用戶在當日時段，首次登入的人數。',
        `entering_count` SMALLINT(6) unsigned NOT NULL COMMENT '用戶在當日時段，首次進房的人數。',
        `create_count` SMALLINT(6) unsigned NOT NULL COMMENT '主播在當日時段，有效開播的開播次數。',
        `close_count` SMALLINT(6) unsigned NOT NULL COMMENT '主播在當日時段，有效開播的關播次數。',
        `max_anchor_number` SMALLINT(6) unsigned NOT NULL COMMENT '主播在當日時段，同時直播的最大主播數。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        INDEX `idx_date` (`date`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :live_time_intervals
  end
end
