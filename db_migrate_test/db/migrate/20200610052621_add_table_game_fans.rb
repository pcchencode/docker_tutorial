class AddTableGameFans < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE `daily_game_anchor_fans_rpt` (
        `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL,
        `pfid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用戶pfid',
        `number_fans` int(10) unsigned DEFAULT '0' COMMENT '粉絲團人數',
        `new_fans` int(10) unsigned DEFAULT '0' COMMENT '新增人數',
        `expire_fans` int(10) unsigned DEFAULT '0' COMMENT '到期人數',
        `total_subtime` int(10) unsigned DEFAULT '0' COMMENT '總訂閱時間(日)',
        `fans_month_1` int(10) unsigned DEFAULT '0' COMMENT '購買1個月人數',
        `fans_month_3` int(10) unsigned DEFAULT '0' COMMENT '購買3個月人數',
        `fans_month_6` int(10) unsigned DEFAULT '0' COMMENT '購買6個月人數',
        `fans_month_12` int(10) unsigned DEFAULT '0' COMMENT '購買12個月人數',
        `consume_sun` int(10) unsigned DEFAULT '0' COMMENT '消費陽光',
        `consume` int(10) unsigned DEFAULT '0' COMMENT '消費浪花',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'utc+0',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'utc+0',
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_unikey` (`pfid`,`cal_date`),
        KEY `idx_day` (`cal_date`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='遊戲主播粉絲團狀況 日表';
    SQL
  end

  def down
    drop_table :daily_game_anchor_fans_rpt
  end
end
