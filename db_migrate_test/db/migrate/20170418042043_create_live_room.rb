class CreateLiveRoom < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `live_rooms` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。主播關播日期。',
        `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。主播。',
        `nickname` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用戶暱稱。主播。',
        `live_no` TINYINT(4) NOT NULL COMMENT '有效開播第幾次' COMMENT '主播第幾次有效開播。',
        `start_time` DATETIME NOT NULL COMMENT '主播開播時間。',
        `end_time` DATETIME NOT NULL COMMENT '主播關播時間。',
        `max_heat` MEDIUMINT(9) unsigned NOT NULL COMMENT '直播間在開播期間的最大熱度。',
        `gold` MEDIUMINT(9) unsigned NOT NULL COMMENT '主播在該次直播間的鑽石總收入。',
        `view_times` SMALLINT(5) unsigned NOT NULL COMMENT '直播間被觀看次數（包含回放被觀看）。',
        `uniq_user_view_times` SMALLINT(5) unsigned NOT NULL COMMENT '直播間在開播期間的觀看人數（去重）。',
        `app_version` VARCHAR(10) NOT NULL COMMENT '主播在開播時，所使用「浪Live」的版本號。',
        `device_model` VARCHAR(32) NOT NULL COMMENT '主播在開播時，所使用的手機模型。',
        `device_platform` VARCHAR(10) NOT NULL COMMENT '主播在開播時，所使用手機的軟體系統。Android 或 IOS 。',
        `device_platform_version` VARCHAR(9) NOT NULL COMMENT '主播在開播時，所使用手機的軟體系統版本。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_pfid_live_no` (`date`, `pfid`, `live_no`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :live_rooms
  end
end
