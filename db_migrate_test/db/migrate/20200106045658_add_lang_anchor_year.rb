class AddLangAnchorYear < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_anchor_history_live_story` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) NOT NULL DEFAULT '0' COMMENT '主播號',
        `year` int(11) DEFAULT NULL COMMENT '年份',
        `days` int(11) DEFAULT NULL COMMENT '開播天數',
        `hours` int(11) DEFAULT NULL COMMENT '開播時數',
        `view_users` int(11) DEFAULT NULL COMMENT '直播間人數',
        `increase_fans` int(11) DEFAULT NULL COMMENT '新增關注',
        `favotite_discover` varchar(250) DEFAULT NULL COMMENT '用最多次封面照',
        `top_hot_dynamic` varchar(200) DEFAULT NULL COMMENT '多人感兴趣的文章',
        `live_days` int(11) NOT NULL DEFAULT '0' COMMENT '註冊距2019-12-31多少天',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統寫入時間',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        `h_date` date DEFAULT NULL COMMENT '開播最久的日期',
        `f_date` date DEFAULT NULL COMMENT '被追蹤最多的日期',
        `hour_est` int(11) DEFAULT NULL COMMENT '開播最久的時數',
        `follow_est` int(11) DEFAULT NULL COMMENT '最多追蹤的次數',
        `anchor_score` int(11) DEFAULT NULL COMMENT '主播數值',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`year`,`pfid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    SQL

    execute <<-SQL
      CREATE TABLE `lang_anchor_history_tops_10` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `t_pfid` int(11) DEFAULT NULL,
        `pfid` int(11) DEFAULT NULL,
        `ranks` int(11) DEFAULT NULL,
        `val` int(11) DEFAULT NULL,
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`t_pfid`,`ranks`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='年度主播收禮TOP數據表';
    SQL
  end
  
  def down
    drop_table :lang_anchor_history_live_story
    drop_table :lang_anchor_history_tops_10
  end
end
