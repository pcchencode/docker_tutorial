class AddTableRegFunnel < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `register_funnel` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '計算日期',
        `dv` varchar(200) DEFAULT NULL COMMENT '渠道',
        `num_reg` int(11) DEFAULT NULL COMMENT '註冊人數',
        `num_ent` int(11) DEFAULT NULL COMMENT '進房人數',
        `num_pv` int(11) DEFAULT NULL COMMENT '點tab人數',
        `num_svideo` int(11) DEFAULT NULL COMMENT '觀看短影人數',
        `num_small` int(11) DEFAULT NULL COMMENT '有小號人數',
        `num_total` int(11) DEFAULT NULL COMMENT '有行為人數',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_uni_key` (`dv`, `cal_date`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='註冊轉換行為';
    SQL
  end
  
  def down
    drop_table :register_funnel
  end
end
