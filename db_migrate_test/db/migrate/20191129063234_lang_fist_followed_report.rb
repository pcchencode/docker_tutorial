class LangFistFollowedReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_first_followed_report` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date NOT NULL COMMENT '日期。時區：UTC+08',
        `new_users` int(11) NOT NULL DEFAULT 0 COMMENT '新用戶註冊數',
        `keep_user` int(11) NOT NULL DEFAULT 0 COMMENT '留存人數',
        `s_view_times` int(11) NOT NULL DEFAULT 0 COMMENT '觀看人次',
        `s_view_user` int(11) NOT NULL DEFAULT 0 COMMENT '觀看人數',
        `s_view_anchor` int(11) NOT NULL DEFAULT 0 COMMENT '觀看主播人數',
        `s_view_n_follow_anchor` int(11) NOT NULL DEFAULT 0 COMMENT '觀看未追蹤主播人數',
        `ns_view_times` int(11) NOT NULL DEFAULT 0 COMMENT '非秀場觀看人次',
        `ns_view_user` int(11) NOT NULL DEFAULT 0 COMMENT '非秀場觀看人數',
        `n_view_user` int(11) NOT NULL DEFAULT 0 COMMENT '無觀看人數',
        `remd_folow_times` int(11) NOT NULL DEFAULT 0 COMMENT '有推薦有追蹤人次',
        `remd_folow_users` int(11) NOT NULL DEFAULT 0 COMMENT '有推薦有追蹤人數',
        `remd_folow_ration` decimal(5,2) NOT NULL DEFAULT 0 COMMENT '有推薦有追蹤平均用戶追蹤率',
        `n_remd_folow_times` int(11) NOT NULL DEFAULT 0 COMMENT '無推薦有追蹤人次',
        `n_remd_folow_users` int(11) NOT NULL DEFAULT 0 COMMENT '無推薦有追蹤人數',
        `n_remd_folow_ration` decimal(5,2) NOT NULL DEFAULT 0 COMMENT '無推薦有追蹤平均用戶追蹤率',
		`db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`cal_date`),
        KEY `idx_db_insert_time` (`db_insert_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播首次被追蹤率報表';
    SQL
  end
  
  def down
    drop_table :lang_first_followed_report
  end
end
