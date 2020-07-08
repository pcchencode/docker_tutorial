class AddAnchorContinueView < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `anchor_continue_view` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `live_date` date NOT NULL COMMENT '開播日期',
        `pfid` int(11) DEFAULT NULL COMMENT '主播編號',
        `last_ent` int(11) DEFAULT -1 COMMENT '上次開播日也有進房人數',
        `today_ent` int(11) DEFAULT NULL COMMENT '當日開播去重總進房人數',
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp(),
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_pfid` (`pfid`),
        KEY `idx_live_date` (`live_date`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='連續觀看率';
    SQL
  end
  
  def down
    drop_table :anchor_continue_view
  end
end
