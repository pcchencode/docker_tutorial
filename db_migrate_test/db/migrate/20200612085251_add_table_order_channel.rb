class AddTableOrderChannel < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE `daily_order_channel_stat` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '計算日',
        `chid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '儲值渠道',
        `total_cash` int(11) NOT NULL DEFAULT 0 COMMENT '總金額',
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'utc+0',
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'utc+0',
        PRIMARY KEY (`id`),
        UNIQUE KEY `cal_date` (`chid`,`cal_date`),
        KEY `idx_day` (`cal_date`),
        KEY `db_update_time` (`db_update_time`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='每日渠道儲值金額統計';
    SQL
  end

  def down
    drop_table :daily_order_channel_stat
  end
end
