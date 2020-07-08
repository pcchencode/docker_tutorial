class AddPlatformKeyMap < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `platform_statistics_keys_mapping` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `key_id` tinyint(4) unsigned NOT NULL COMMENT '數據欄位代碼',
        `key_name` varchar(255) NOT NULL COMMENT '欄位定義',
        `group_id` tinyint(4) unsigned NOT NULL COMMENT '數據分類',
        `order` tinyint(4) unsigned NOT NULL COMMENT '欄位排序',
        `category_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '分類頁面',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        KEY `idx_platform_statistics_keys` (`key_id`),
        KEY `idx_group_id` (`group_id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浪日報欄位對應';
    SQL
  end
  
  def down
    drop_table :platform_statistics_keys_mapping
  end
end
