class AddAppsflyerRpt < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `newregister_retention_order_bypartner` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `reg_time` datetime DEFAULT NULL COMMENT '註冊時間',
        `partner` varchar(11) DEFAULT NULL COMMENT '媒體渠道',
        `num_people` int(11) DEFAULT NULL COMMENT '媒體註冊數',
        `num_people_30` int(11) DEFAULT NULL COMMENT '30天內付費人數',
        `cash_30` int(11) DEFAULT NULL COMMENT '30天內付費金額',
        `num_people_60` int(11) DEFAULT NULL COMMENT '60天內付費人數',
        `cash_60` int(11) DEFAULT NULL COMMENT '60天內付費金額',
        `retention_0` int(11) DEFAULT NULL COMMENT '當日行為人數',
        `retention_1` int(11) DEFAULT NULL COMMENT '次留存',
        `retention_3` int(11) DEFAULT NULL COMMENT '3留存',
        `retention_7` int(11) DEFAULT NULL COMMENT '7留存',
        `retention_14` int(11) DEFAULT NULL COMMENT '14留存',
        `retention_30` int(11) DEFAULT NULL COMMENT '30留存',
        `daily_online_time` DECIMAL(10,2) DEFAULT NULL COMMENT '日在線時長',
        `weekly_online_time` DECIMAL(10,2) DEFAULT NULL COMMENT '週在線時長',
        `monthly_online_time` DECIMAL(10,2) DEFAULT NULL COMMENT '月在線時長',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`reg_time`,`partner`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新註冊用戶留存付費分析by渠道';
    SQL

    execute <<-SQL
      CREATE TABLE `newregister_retention_order_bycity` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `reg_time` datetime DEFAULT NULL COMMENT '註冊時間',
        `country_code` varchar(11) DEFAULT NULL COMMENT '國家',
        `city` varchar(11) DEFAULT NULL COMMENT '城市',
        `num_people` int(11) DEFAULT NULL COMMENT '媒體註冊數',
        `num_people_30` int(11) DEFAULT NULL COMMENT '30天內付費人數',
        `cash_30` int(11) DEFAULT NULL COMMENT '30天內付費金額',
        `num_people_60` int(11) DEFAULT NULL COMMENT '60天內付費人數',
        `cash_60` int(11) DEFAULT NULL COMMENT '60天內付費金額',
        `retention_0` int(11) DEFAULT NULL COMMENT '當日行為人數',
        `retention_1` int(11) DEFAULT NULL COMMENT '次留存',
        `retention_3` int(11) DEFAULT NULL COMMENT '3留存',
        `retention_7` int(11) DEFAULT NULL COMMENT '7留存',
        `retention_14` int(11) DEFAULT NULL COMMENT '14留存',
        `retention_30` int(11) DEFAULT NULL COMMENT '30留存',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`reg_time`,`country_code`,`city`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新註冊用戶留存付費分析by渠道';
    SQL
  end
  
  def down
    drop_table :newregister_retention_order_bypartner
    drop_table :newregister_retention_order_bycity
  end
end
