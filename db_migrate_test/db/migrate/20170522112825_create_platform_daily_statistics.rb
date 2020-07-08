class CreatePlatformDailyStatistics < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `platform_daily_statistics` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `report_date` date DEFAULT NULL COMMENT '結算日期',
        `key_id` tinyint(4) unsigned NOT NULL COMMENT '數據欄位定義代碼',
        `group_id` tinyint(4) unsigned NOT NULL COMMENT '數據分類',
        `order` tinyint(4) unsigned NOT NULL COMMENT '欄位排序',
        `value` decimal(13,3) DEFAULT NULL,
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_platform_statistics` (`key_id`,`report_date`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台日報數據(單欄位)';
    SQL
  end

  def down
    drop_table :platform_daily_statistics
  end
end
