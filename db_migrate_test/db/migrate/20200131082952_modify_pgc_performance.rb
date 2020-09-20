class ModifyPgcPerformance < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `pgc_performance_fans`
        MODIFY COLUMN `live_times` smallint(5) NOT NULL COMMENT '開播次數',
        MODIFY COLUMN `live_min` smallint(5) NOT NULL COMMENT '總開播時長(分鐘)',
        MODIFY COLUMN `consume_number` int(11) NOT NULL COMMENT '觀眾送禮人數',
        MODIFY COLUMN `diamond` int(11) NOT NULL COMMENT '主播收到鑽石數(觀眾)',
        MODIFY COLUMN `gold` int(11) NOT NULL COMMENT '觀眾送出浪花數',
        MODIFY COLUMN `consume_number_fans` int(11) NOT NULL COMMENT '粉絲送禮人數',
        MODIFY COLUMN `diamond_fans` int(11) NOT NULL COMMENT '主播收到鑽石數(粉絲)',
        MODIFY COLUMN `gold_fans` int(11) NOT NULL COMMENT '粉絲送出浪花數',
        MODIFY COLUMN `fans_watch_rate` float NOT NULL COMMENT '粉絲觀看率';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `pgc_performance_fans`
        MODIFY COLUMN `live_times` tinyint(5) NOT NULL COMMENT '開播次數',
        MODIFY COLUMN `live_min` tinyint(5) NOT NULL COMMENT '總開播時長(分鐘)',
        MODIFY COLUMN `consume_number` int(10) NOT NULL COMMENT '觀眾送禮人數',
        MODIFY COLUMN `diamond` tinyint(5) NOT NULL COMMENT '主播收到鑽石數(觀眾)',
        MODIFY COLUMN `gold` float NOT NULL COMMENT '觀眾送出浪花數',
        MODIFY COLUMN `consume_number_fans` float NOT NULL COMMENT '粉絲送禮人數',
        MODIFY COLUMN `diamond_fans` float NOT NULL COMMENT '主播收到鑽石數(粉絲)',
        MODIFY COLUMN `gold_fans` int(10) NOT NULL COMMENT '粉絲送出浪花數',
        MODIFY COLUMN `fans_watch_rate` tinyint(5) NOT NULL COMMENT '粉絲觀看率';
    SQL
  end
end
