class AddLuckyReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lucky_report_daily` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date NOT NULL COMMENT '開播日期',
        `lottery_user`int(11) NOT NULL COMMENT '抽獎人數',
        `ones_user` int(11) NOT NULL COMMENT '抽1次人數',
        `day_3_order` DECIMAL(15,3) NOT NULL COMMENT '抽1次人數近3天儲值',
        `day_7_order` DECIMAL(15,3) NOT NULL COMMENT '抽1次人數近7天儲值',
        `ten_user` int(11) NOT NULL COMMENT '10連抽人數',
        `ten_3_order` DECIMAL(15,3) NOT NULL COMMENT '10連抽進三天儲值',
        `ten_7_order` DECIMAL(15,3) NOT NULL COMMENT '10連抽進七天儲值',
        `h_user` int(11) NOT NULL COMMENT '100連抽人數',
        `h_3_order` DECIMAL(15,3) NOT NULL COMMENT '100連抽進三天儲值',
        `h_7_order` DECIMAL(15,3) NOT NULL COMMENT '100連抽進七天儲值',
        `keep_ratio` float NOT NULL COMMENT '昨日第一次抽獎今日有抽留存',
        `avg_gold` float NOT NULL COMMENT '月均儲值',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`cal_date`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轉盤日報1';
    SQL

    execute <<-SQL
      CREATE TABLE `lucky_report_daily_2` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date NOT NULL COMMENT '開播日期',
        `level1_user`int(11) NOT NULL DEFAULT 0 COMMENT 'vip等級1人數',
        `level2_user`int(11) NOT NULL DEFAULT 0 COMMENT 'vip等級2人數',
        `level3_user`int(11) NOT NULL DEFAULT 0 COMMENT 'vip等級3人數',
        `level4_user`int(11) NOT NULL DEFAULT 0 COMMENT 'vip等級4人數',
        `level5_user`int(11) NOT NULL DEFAULT 0 COMMENT 'vip等級5人數',
        `level6_user`int(11) NOT NULL DEFAULT 0 COMMENT 'vip等級6人數',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`cal_date`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轉盤日報2';
    SQL
  end
  
  def down
    drop_table :lucky_report_daily
    drop_table :lucky_report_daily_2
  end
end
