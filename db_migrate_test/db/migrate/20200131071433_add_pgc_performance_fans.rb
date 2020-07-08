class AddPgcPerformanceFans < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `pgc_performance_fans` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid`int(11) NOT NULL COMMENT 'pgc編號',
        `live_date` date NOT NULL COMMENT '開播日期',
        `live_times` tinyint(5) NOT NULL COMMENT '開播次數',
        `live_min` tinyint(5) NOT NULL COMMENT '總開播時長(分鐘)',
        `consume_number` int(10) NOT NULL COMMENT '觀眾送禮人數',
        `diamond` tinyint(5) NOT NULL COMMENT '主播收到鑽石數(觀眾)',
        `gold` float NOT NULL COMMENT '觀眾送出浪花數',
        `consume_number_fans` float NOT NULL COMMENT '粉絲送禮人數',
        `diamond_fans` float NOT NULL COMMENT '主播收到鑽石數(粉絲)',
        `gold_fans` int(10) NOT NULL COMMENT '粉絲送出浪花數',
        `fans_watch_rate` tinyint(5) NOT NULL COMMENT '粉絲觀看率',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`,`live_date`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='pgc粉絲收益開播表';
    SQL
  end
  
  def down
    drop_table :pgc_performance_fans
  end
end
