class OrderHistoryAllOrderHistoryAllNew < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `order_history_all` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL,
        `last_month` int(11) DEFAULT NULL,
        `total_money` decimal(14,3) DEFAULT NULL,
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp(),
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_pfid` (`pfid`),
        KEY `idx_last_month` (`last_month`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用戶累積儲值表（換算台幣）';
    SQL

    execute <<-SQL
      CREATE TABLE `order_history_all_new` (
        `pfid` int(11) NOT NULL DEFAULT 0,
        `last_month` int(11) DEFAULT NULL,
        `total_money` decimal(14,3) DEFAULT NULL,
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp(),
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        PRIMARY KEY (`pfid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用戶累積儲值表（日暫存表）';
    SQL
  end
  
  def down
    drop_table :order_history_all
    drop_table :order_history_all_new
  end
end
