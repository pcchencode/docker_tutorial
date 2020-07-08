class AddTableUserprofile < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_user_profile_topn` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `key_id` tinyint(3) DEFAULT NULL COMMENT '數據欄位定義代碼',
        `rank` tinyint(3) DEFAULT NULL COMMENT 'topn',
        `value` varchar(30) DEFAULT NULL,
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`,`key_id`,`rank`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用戶基本訊息topn';
    SQL
    execute <<-SQL
      CREATE TABLE `lang_user_profile_topn_mapping` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `key_id` tinyint(3) DEFAULT NULL COMMENT '數據欄位代碼',
        `key_name` varchar(255) DEFAULT NULL COMMENT '欄位定義',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`key_id`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用戶基本訊息topn_mapping表';
    SQL
    execute <<-SQL
      CREATE TABLE `lang_user_profile_consume` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `lastday_total_cosume` int(11) DEFAULT NULL COMMENT '最近一天總消耗浪花',
        `lastday_lucky_consume` int(11) DEFAULT NULL COMMENT '最近一天爆擊消耗浪花',
        `lastday_lucky_return` int(11) DEFAULT NULL COMMENT '最近一天爆擊返還浪花',
        `lastday_bt_consume` int(11) DEFAULT NULL COMMENT '最近一天拼團消耗浪花',
        `lastday_bt_return` int(11) DEFAULT NULL COMMENT '最近一天拼團返還浪花',

        `thismon_total_cosume` int(11) DEFAULT NULL COMMENT '當月總消耗浪花',
        `thismon_lucky_consume` int(11) DEFAULT NULL COMMENT '當月爆擊消耗浪花',
        `thismon_lucky_return` int(11) DEFAULT NULL COMMENT '當月爆擊返還浪花',
        `thismon_bt_consume` int(11) DEFAULT NULL COMMENT '當月拼團消耗浪花',
        `thismon_bt_return` int(11) DEFAULT NULL COMMENT '當月拼團返還浪花',

        `lastmon_total_cosume` int(11) DEFAULT NULL COMMENT '上個月總消耗浪花',
        `lastmon_lucky_consume` int(11) DEFAULT NULL COMMENT '上個月爆擊消耗浪花',
        `lastmon_lucky_return` int(11) DEFAULT NULL COMMENT '上個月爆擊返還浪花',
        `lastmon_bt_consume` int(11) DEFAULT NULL COMMENT '上個月拼團消耗浪花',
        `lastmon_bt_return` int(11) DEFAULT NULL COMMENT '上個月拼團返還浪花',

        `last2mon_total_cosume` int(11) DEFAULT NULL COMMENT '上兩個月總消耗浪花',
        `last2mon_lucky_consume` int(11) DEFAULT NULL COMMENT '上兩個月爆擊消耗浪花',
        `last2mon_lucky_return` int(11) DEFAULT NULL COMMENT '上兩個月爆擊返還浪花',
        `last2mon_bt_consume` int(11) DEFAULT NULL COMMENT '上兩個月拼團消耗浪花',
        `last2mon_bt_return` int(11) DEFAULT NULL COMMENT '上兩個月拼團返還浪花',
        
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用戶基本訊息消費相關';
    SQL
  end
  
  def down
    drop_table :lang_user_profile_topn
    drop_table :lang_user_profile_topn_mapping
    drop_table :lang_user_profile_consume
  end
end
