class AddLangFirstViewAnchorReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_first_view_anchor_report` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '統計日期',
        `t_pfid` int(11) DEFAULT NULL COMMENT '主播號',
        `first_view` int(11) NOT NULL DEFAULT '0',
        `first_view_follow` int(11) NOT NULL DEFAULT '0',
        `ratio` decimal(5,2) NOT NULL DEFAULT '0.00',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'utc+0',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'utc+0',
        PRIMARY KEY (`id`),
        UNIQUE KEY `t_pfid` (`t_pfid`,`cal_date`),
        KEY `idx_cal_date` (`cal_date`),
        KEY `idx_t_pfid` (`t_pfid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    SQL
  end
  
  def down
    drop_table :lang_first_view_anchor_report
  end
end
