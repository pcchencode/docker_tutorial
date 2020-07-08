class AddLangRecommendPerformance < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_recommend_performance` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date NOT NULL COMMENT '統計日期',
        `r_type` tinyint(3) DEFAULT NULL COMMENT '推薦類型',
        `user_ent_count` int(10) NOT NULL DEFAULT 0 COMMENT '進房人數',
        `user_ent_times` int(10) NOT NULL DEFAULT 0 COMMENT '進房人次',
        `anchor_count` smallint(5) NOT NULL DEFAULT 0 COMMENT '推薦進房主播數(主播id去重)',
        `tracking_user` smallint(5) NOT NULL DEFAULT 0 COMMENT '當日追蹤觀眾人數',
        `tracked_anchor` smallint(5) NOT NULL DEFAULT 0 COMMENT '當日被追蹤主播數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`r_type`, `cal_date`),
        KEY `idx_cal_date` (`cal_date`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推薦成效報告';
    SQL
  end
  
  def down
    drop_table :lang_recommend_performance
  end
end
