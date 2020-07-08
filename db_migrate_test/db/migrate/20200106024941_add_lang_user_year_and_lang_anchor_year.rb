class AddLangUserYearAndLangAnchorYear < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_user_history_live_story` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `year` int(11) DEFAULT 2019 COMMENT '年度',
        `view_anchors` int(11) DEFAULT NULL COMMENT '看過多少主播',
        `midnight_days` int(11) DEFAULT NULL COMMENT '多少天午夜觀看',
        `special_date` date DEFAULT NULL COMMENT '特別的一天10萬浪花',
        `likes_anchor` varchar(200) DEFAULT NULL COMMENT '喜愛的主播',
        `forget_anchors` varchar(200) DEFAULT NULL COMMENT '前九個月看，近三個月沒看',
        `helped_anchors` varchar(200) DEFAULT NULL COMMENT '幫助過得主播',
        `total_hours` float DEFAULT NULL COMMENT '年度在線時長',
        `live_days` int(11) NOT NULL DEFAULT '0' COMMENT '註冊距2019-12-31多少天',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `first_view_anchor` int(11) DEFAULT NULL COMMENT '第一個觀看主播',
        `follow_anchors_all` int(11) DEFAULT NULL COMMENT '追蹤過主播數',
        `latest_date` datetime DEFAULT NULL COMMENT '最晚日子',
        `earliest_date` datetime DEFAULT NULL COMMENT '最早日子',
        `first_follow_anchor` int(11) DEFAULT NULL COMMENT '第一個關注主播',
        `first_follow_date` datetime DEFAULT NULL COMMENT '第一個關注時間',
        `total_balance` bigint(20) DEFAULT NULL COMMENT '總消費浪花',
        `ranks_percentile` float DEFAULT NULL COMMENT '百分比',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`,`year`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    SQL

    execute <<-SQL
      CREATE TABLE `lang_user_history_tops_10` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `t_pfid` int(11) DEFAULT NULL COMMENT '主播號',
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `ranks` int(11) DEFAULT NULL COMMENT '排名',
        `val` float DEFAULT NULL COMMENT '觀看時長（小時）',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`,`ranks`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='年度用戶喜愛TOP數據表';
    SQL
  end
  
  def down
    drop_table :lang_user_history_live_story
    drop_table :lang_user_history_tops_10
  end
end
