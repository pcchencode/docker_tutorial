class AddTwoTableForShortvideo < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_shortvideo_lrfm` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL COMMENT '主播編號',
        `first_date` datetime DEFAULT NULL COMMENT '第一次觀看短影時間',
        `L` int(11) NOT NULL DEFAULT '0' COMMENT '距上一次登入天數',
        `last_time` datetime DEFAULT NULL COMMENT '最後觀看時間',
        `total_video_counts` int(11) NOT NULL DEFAULT '0' COMMENT '總觀看影片數',
        `total_view_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '總觀看時長',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`),
        KEY `idx_last_time` (`last_time`),
        KEY `idx_first_date` (`first_date`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='浪短視頻LRFM';
    SQL
    execute <<-SQL
      CREATE TABLE `lang_shortvideo_report_daily` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '統計日期',
        `sv_dau` int(11) NOT NULL DEFAULT '0' COMMENT '短視頻DAU',
        `avg_duration` float DEFAULT '0' COMMENT '平均觀看秒數',
        `avg_duration_valid` float DEFAULT '0' COMMENT '平均有效觀看秒數',
        `sv_avg_view_video` float NOT NULL DEFAULT '0' COMMENT '人均觀看影片數',
        `new_user_keep_ratio` float NOT NULL DEFAULT '0' COMMENT '短視頻新用戶次留',
        `sv_only_member` int(11) NOT NULL DEFAULT '0' COMMENT '只看短視頻用戶數',
        `live_only_member` int(11) NOT NULL DEFAULT '0' COMMENT '只看秀場用戶數',
        `sv_and_live_member` int(11) NOT NULL DEFAULT '0' COMMENT '短視頻與秀場交集用戶數',
        `o_sv_avg_vt` float DEFAULT '0' COMMENT '只看短視頻人均觀看時長',
        `o_sv_avg_vc` float DEFAULT '0' COMMENT '只看短視頻人均觀看視頻數',
        `o_sv_likes` float DEFAULT '0' COMMENT '只看短視頻按讚視頻數',
        `o_sv_comment` float DEFAULT '0' COMMENT '只看短視頻評論視頻數',
        `valid_view_recording` float NOT NULL DEFAULT '0' COMMENT '人均有效觀看影片數',
        `valid_view_user` float NOT NULL DEFAULT '0' COMMENT '影均有效觀看用戶數',
        `complete_view_recording` float NOT NULL DEFAULT '0' COMMENT '人均完整觀看影片數',
        `complete_view_user` float NOT NULL DEFAULT '0' COMMENT '影均完整觀看用戶數',
        `like_recording` int(11) NOT NULL DEFAULT '0' COMMENT '按讚視頻數',
        `like_member` int(11) NOT NULL DEFAULT '0' COMMENT '按讚用戶數',
        `comment_recording` int(11) NOT NULL DEFAULT '0' COMMENT '評論視頻數',
        `comment_member` int(11) NOT NULL DEFAULT '0' COMMENT '評論用戶數',
        `lang_sv_likes` int(11) DEFAULT '0' COMMENT '浪短視頻點讚數',
        `lang_sv_comments` int(11) DEFAULT '0' COMMENT '浪短視頻評論數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統寫入時間 utc+0',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間 utc+0',
        PRIMARY KEY (`id`),
        UNIQUE KEY `cal_date` (`cal_date`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='浪短視頻日報';
    SQL
  end

  def down
    drop_table :lang_shortvideo_lrfm
    drop_table :lang_shortvideo_report_daily
  end
end
