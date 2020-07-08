class AddTableForLangAct < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE `lang_single_act` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '活動日期',
        `act_id` int(11) DEFAULT NULL COMMENT '活動id',
        `prod_id` int(11) DEFAULT NULL COMMENT '禮物id',
        `islucky` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否為爆擊禮物',
        `prod_price` int(11) NOT NULL DEFAULT 0 COMMENT '禮物牌價',
        `prod_name` varchar(50) DEFAULT NULL COMMENT '名稱',
        `times` int(11) DEFAULT NULL COMMENT '抽獎次數',
        `generate_count` int(11) DEFAULT NULL COMMENT '中獎道具數',
        `members` int(11) DEFAULT NULL COMMENT '中獎人數',
        `fragment_id` int(11) DEFAULT NULL COMMENT '碎片id',
        `fragment_name` varchar(40) DEFAULT NULL COMMENT '碎片名稱',
        `block` int(11) DEFAULT NULL COMMENT '兌換需求碎片數',
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '系統建立時間 utc+0',
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '系統更新時間 utc+0',
        PRIMARY KEY (`id`),
        KEY `idx_act_id_prod_id` (`act_id`,`prod_id`),
        KEY `idx_act_id_fragment_id` (`act_id`,`fragment_id`),
        KEY `idx_db_update_time` (`db_update_time`),
        KEY `idx_cal_date` (`cal_date`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='浪單日活動成效表';
    SQL

    execute <<-SQL
    CREATE TABLE `lang_single_act_master` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '活動日期',
        `act_id` int(11) DEFAULT NULL,
        `act_name` varchar(50) DEFAULT NULL COMMENT '活動名稱',
        `total_user` int(11) DEFAULT NULL COMMENT '總抽獎人數',
        `total_lucky_time` int(11) NOT NULL DEFAULT 0 COMMENT '總抽獎次數',
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '系統建立時間 utc+0',
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '系統更新時間 utc+0',
        PRIMARY KEY (`id`),
        UNIQUE KEY `act_id` (`act_id`),
        KEY `idx_db_update_time` (`db_update_time`),
        KEY `idx_cal_date` (`cal_date`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='浪單日活動成效主檔表';
    SQL
  end

  def down
    drop_table :lang_single_act
    drop_table :lang_single_act_master
  end
end
