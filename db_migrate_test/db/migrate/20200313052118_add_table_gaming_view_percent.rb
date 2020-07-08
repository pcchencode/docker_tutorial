class AddTableGamingViewPercent < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `gaming_view_percent` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `kk_ratio` decimal(5,2) DEFAULT NULL COMMENT '(G,K)觀看比例',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_uni_key` (`pfid`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用戶電競觀看比例';
    SQL
  end

  def down
    drop_table :gaming_view_percent
  end
end
