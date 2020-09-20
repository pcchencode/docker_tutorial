class AddUserProfileLast < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_user_profile` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL COMMENT '主播編號',
        `sex_judged` tinyint(1) NOT NULL DEFAULT 0 COMMENT '判定性別:0-未判定 1-男 2-女',
        `last_ent_time` datetime DEFAULT NULL COMMENT '最後進房時間',
        `ent_anchor` int(11) DEFAULT NULL COMMENT '最後進房主播',
        `lastday_view_time` int(11) NOT NULL DEFAULT 0 COMMENT '最近一天觀看時長',
        `lastweek_view_time` int(11) NOT NULL DEFAULT 0 COMMENT '最近七日觀看時長',
        `lastweek_view_day` tinyint(1) NOT NULL DEFAULT 0 COMMENT '最近七日觀看天數',
        `last_live_time` datetime DEFAULT NULL COMMENT '最後開播時間',
        `last_dynamic_time` datetime DEFAULT NULL COMMENT '最後發佈動態時間',
        `dynamic_cts` int(11) NOT NULL DEFAULT 0 COMMENT '發佈動態總數',
        `msg_cts` int(11) NOT NULL DEFAULT 0 COMMENT '最近七日私信量',
        `msg_users` int(11) NOT NULL DEFAULT 0 COMMENT '最近七日私信人數',
        `last_task_gold_time` datetime DEFAULT NULL COMMENT '最後任務兌換浪花時間',
        `total_task_gold` int(11) NOT NULL DEFAULT 0 COMMENT '任務兌換浪花總數',
        `last_task_gold` int(11) NOT NULL DEFAULT 0 COMMENT '最後任務兌換浪花數量',
        `last_task_cash_time` datetime DEFAULT NULL COMMENT '最後任務提現時間',
        `total_task_cash` int(11) NOT NULL DEFAULT 0 COMMENT '任務提領總金額',
        `last_task_cash` int(11) NOT NULL DEFAULT 0 COMMENT '最後任務提領金額',
        `last_consume_time` datetime DEFAULT NULL COMMENT '最後送禮時間',
        `consume_anchor` int(11) DEFAULT NULL COMMENT '最後送禮主播',
        `last_noble_time` datetime DEFAULT NULL COMMENT '貴族最後購買時間',
        `noble_id` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1~7(騎士、勛爵、子爵、伯爵、侯爵、公爵、國王) 0:無貴族',
        `fans_number` int(11) NOT NULL DEFAULT 0 COMMENT '有效未過期粉絲團數',
        `total_gold` bigint(20) NOT NULL DEFAULT 0 COMMENT '歷史消耗浪花數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`),
        KEY `idx_last_ent_time` (`last_ent_time`),
        KEY `idx_last_consume_time` (`last_consume_time`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用戶基本訊息';
    SQL
  end
  
  def down
    drop_table :lang_user_profile
  end
end
