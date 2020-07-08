class CreatePlatformStatisticsKeys < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `platform_statistics_keys` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `key_id` tinyint(4) unsigned NOT NULL COMMENT '數據欄位代碼',
        `key_name` varchar(255) NOT NULL COMMENT '欄位定義',
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_platform_statistics_keys` (`key_id`)
      ) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
    SQL
  end

  def down
    drop_table :platform_statistics_keys
  end
end
