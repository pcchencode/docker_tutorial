class AddtablePktotal < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        CREATE TABLE `total_pkchicken_report` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `act_name` varchar(60) NOT NULL DEFAULT '' COMMENT '活動名稱',
          `race_name` tinyint(1) DEFAULT NULL COMMENT '0:發育, 1決賽:',
          `pk` int(11) DEFAULT 0 COMMENT '主播pk場次',
          `consume` int(11) DEFAULT 0 COMMENT '用戶消耗浪花',
          `diamonds` int(11) DEFAULT 0 COMMENT '主播收益',
          `anchor_users` int(11) DEFAULT 0 COMMENT '參與主播數量',
          `consume_users` int(11) DEFAULT 0 COMMENT '送禮用戶數',
          `half_cash` int(11) DEFAULT 0 COMMENT '拿一半現金的金額',
          `half_cash_users` int(11) DEFAULT 0 COMMENT '拿一半現金的人數',
          `cash` int(11) DEFAULT 0 COMMENT '總發放金額',
          `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '系統建立時間',
          `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '系統更新時間',
          PRIMARY KEY (`id`),
          UNIQUE KEY `uni_key` (`act_name`,`race_name`),
          KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='pk吃雞總報'
    SQL
  end

  def down
    drop_table :total_pkchicken_report
  end
end
