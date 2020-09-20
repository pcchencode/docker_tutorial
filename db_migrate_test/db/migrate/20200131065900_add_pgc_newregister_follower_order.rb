class AddPgcNewregisterFollowerOrder < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `pgc_newregister_follower_order` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid`int(11) NOT NULL COMMENT 'pgc編號',
        `follow_date` date NOT NULL COMMENT '追蹤日期',
        `follow_number` tinyint(5) NOT NULL COMMENT '追蹤人數',
        `newregister_follow` tinyint(5) NOT NULL COMMENT '追蹤人數(兩天內註冊)',
        `order_in7` int(10) NOT NULL COMMENT '註冊七日內總花費',
        `number_in7` tinyint(5) NOT NULL COMMENT '註冊七日內付費人數',
        `conversion_rate_in7` float NOT NULL COMMENT '七日付費轉化率',
        `ARPU_in7` float NOT NULL COMMENT '七日ARPU',
        `ARPPU_in7` float NOT NULL COMMENT '七日ARPPU',
        `order_in30` int(10) NOT NULL COMMENT '註冊30日內總花費',
        `number_in30` tinyint(5) NOT NULL COMMENT '註冊30日內付費人數',
        `conversion_rate_in30` float NOT NULL COMMENT '30日付費轉化率',
        `ARPU_in30` float NOT NULL COMMENT '30日ARPU',
        `ARPPU_in30` float NOT NULL COMMENT '30日ARPPU',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`,`follow_date`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='pgc新註冊用戶追蹤付費成效日表';
    SQL
  end
  
  def down
    drop_table :pgc_newregister_follower_order
  end
end
