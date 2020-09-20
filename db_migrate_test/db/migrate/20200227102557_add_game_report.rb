class AddGameReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `game_report_by_live_id` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '計算日期',
        `topic_title` varchar(200) DEFAULT NULL COMMENT '遊戲類別',
        `pfid` int(11) DEFAULT NULL COMMENT '主播編號',
        `live_id` varchar(200) DEFAULT NULL COMMENT 'Live_id',
        `open_duration` float DEFAULT NULL COMMENT '總開播時長（分鐘)',
        `revenue` int(11) DEFAULT NULL COMMENT '主播收入鑽石數',
        `user_diamond` int(11) DEFAULT NULL COMMENT '用戶花費鑽石數',
        `user_total` int(11) DEFAULT NULL COMMENT '總觀看人數',
        `total_duration` float DEFAULT NULL COMMENT '總觀看時長（分鐘)',
        `total_duration_avg` float DEFAULT NULL COMMENT '平均觀看時長（分鐘)',
        `user_total_over_min` int(11) DEFAULT NULL COMMENT '超過一分鐘觀看人數',
        `total_duration_over_min` float DEFAULT NULL COMMENT '超過一分鐘觀看時長（分鐘)',
        `total_duration_over_min_avg` float DEFAULT NULL COMMENT '超過一分鐘平均觀看時長（分鐘)',
        `pcu` int(11) DEFAULT NULL COMMENT 'PCU',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        `sub_topic_id` int(11) DEFAULT NULL COMMENT '遊戲類別id',
        `uv` int(11) NOT NULL DEFAULT '0' COMMENT '不重複累積觀看人數',
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_uni_key` (`live_id`, `cal_date`),
        KEY `idx_cal_date` (`cal_date`),
        KEY `idx_pfid` (`pfid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end
  
  def down
    drop_table :game_report_by_live_id
  end
end
