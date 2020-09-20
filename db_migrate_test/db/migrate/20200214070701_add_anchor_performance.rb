class AddAnchorPerformance < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `anchor_performance` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid`int(11) NOT NULL COMMENT '主播編號',
        `live_id` varchar(20) DEFAULT NULL,
        `live_date` date NOT NULL COMMENT '開播日期',
        `live_min` tinyint(5) NOT NULL COMMENT '總開播時長(分鐘)',
        `ent_time` int(11) NOT NULL COMMENT '進房人次',
        `ent_number` int(11) NOT NULL COMMENT '進房人數',
        `view_num1` int(11) NOT NULL COMMENT '有效觀看人數1m',
        `view_num3` int(11) NOT NULL COMMENT '有效觀看人數3m',
        `view_num10` int(11) NOT NULL COMMENT '有效觀看人數10m',
        `new_follow` int(11) NOT NULL COMMENT '開播新增追蹤數',
        `cum_follow` int(11) NOT NULL COMMENT '累積追蹤用戶數',
        `newreg_view` int(11) NOT NULL COMMENT '新用戶觀看數',
        `fans_ent` int(11) NOT NULL COMMENT '粉絲進房人數',
        `fans_act3` int(11) NOT NULL COMMENT '三月活躍粉絲',
        `ent_fans_act3` int(11) NOT NULL COMMENT '三月活躍粉絲進房人數',
        `fans_act6` int(11) NOT NULL COMMENT '六月活躍粉絲',
        `ent_fans_act6` int(11) NOT NULL COMMENT '六月活躍粉絲進房人數',
        `gold` float NOT NULL COMMENT '觀眾送出浪花',
        `diamond` int(11) NOT NULL COMMENT '主播收到鑽石',
        `consume_number` int(11) NOT NULL COMMENT '觀眾送禮人數',
        `gold_fans` int(11) NOT NULL COMMENT '粉絲送出浪花',
        `diamond_fans` float NOT NULL COMMENT '主播收到粉絲鑽石',
        `consume_number_fans` float NOT NULL COMMENT '粉絲送禮人數',
        `pcu` int(11) NOT NULL COMMENT 'pcu',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`,`live_id`),
        KEY `idx_live_date` (`live_date`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主播開播表';
    SQL
  end
  
  def down
    drop_table :anchor_performance
  end
end
