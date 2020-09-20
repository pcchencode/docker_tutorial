class AddRptDailyRecommendConvert < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `rpt_daily_recommend_convert` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date NOT NULL COMMENT '統計日期',
        `ent_times` int(3) DEFAULT NULL COMMENT '進房人次',
        `ent_members` int(10) NOT NULL DEFAULT 0 COMMENT '進房人數',
        `ent_anchors` int(10) NOT NULL DEFAULT 0 COMMENT '進房主播數',
        `followed` smallint(5) NOT NULL DEFAULT 0 COMMENT '已追蹤用戶數',
        `new_follow` smallint(5) NOT NULL DEFAULT 0 COMMENT '當日追蹤用戶數',
        `non_followed` smallint(5) NOT NULL DEFAULT 0 COMMENT '為追蹤用戶數',
        `user_spend_balance` int(5) NOT NULL DEFAULT 0 COMMENT '消費浪花數',
        `user_spend_members` int(5) NOT NULL DEFAULT 0 COMMENT '消費浪花用戶數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`cal_date`),
        KEY `db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lang短影進房推薦成效報告';
    SQL
  end
  
  def down
    drop_table :rpt_daily_recommend_convert
  end
end
