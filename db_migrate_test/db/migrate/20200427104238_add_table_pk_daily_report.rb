class AddTablePkDailyReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        CREATE TABLE `daily_pkchicken_report` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `cal_date` datetime DEFAULT NULL COMMENT '計算時間',
          `pk_times` int(11) DEFAULT 0 COMMENT 'pk場次數',
          `mvp` int(11) DEFAULT 0 COMMENT 'mvp數量',
          `kill` int(11) DEFAULT 0 COMMENT '斬殺次數',
          `blood` int(11) DEFAULT 0 COMMENT '首殺次數',
          `blood_g1` int(11) DEFAULT 0 COMMENT '首殺禮物1-500數量',
          `blood_g501` int(11) DEFAULT 0 COMMENT '首殺禮物501-5000數量',
          `blood_g5001` int(11) DEFAULT 0 COMMENT '首殺禮物5001-數量',
          `consume_people` int(11) DEFAULT 0 COMMENT '送禮人數',
          `gold` int(11) DEFAULT 0 COMMENT '消耗浪花',
          `diamond` int(11) DEFAULT 0 COMMENT '主播鑽石收益',
          `g1` int(11) DEFAULT 0 COMMENT '小血包數量',
          `g2` int(11) DEFAULT 0 COMMENT '大血包數量',
          `g3` int(11) DEFAULT 0 COMMENT '迷霧數量',
          `g4` int(11) DEFAULT 0 COMMENT '小彈藥箱數量',
          `g5` int(11) DEFAULT 0 COMMENT '大彈藥箱數量',
          `g6` int(11) DEFAULT 0 COMMENT '空投補給數量',
          `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '系統建立時間',
          `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '系統更新時間',
          PRIMARY KEY (`id`),
          UNIQUE KEY `uni_key` (`cal_date`),
          KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='pk吃雞日報'
    SQL
  end

  def down
    drop_table :daily_pkchicken_report
  end
end
