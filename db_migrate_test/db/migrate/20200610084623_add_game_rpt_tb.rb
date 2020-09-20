class AddGameRptTb < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE `daily_game_anchor_fans_rpt_overview` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '認定時間',
        `fans_counts` int(10) NOT NULL DEFAULT 0 COMMENT '粉絲團數',
        `users_count` int(11) NOT NULL DEFAULT 0 COMMENT '粉絲團人數',
        `balance` int(11) NOT NULL DEFAULT 0 COMMENT '粉絲團購買浪花數',
        `sun` int(11) NOT NULL DEFAULT 0 COMMENT '粉絲團消費陽光數',
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'utc+0',
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'utc+0',
        PRIMARY KEY (`id`),
        UNIQUE KEY `cal_date` (`cal_date`),
        KEY `db_update_time` (`db_update_time`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='電競粉絲團統計日報';
    SQL
  end

  def down
    drop_table :daily_game_anchor_fans_rpt_overview
  end
end
