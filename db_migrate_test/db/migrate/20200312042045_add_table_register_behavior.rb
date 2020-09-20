class AddTableRegisterBehavior < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `register_behavior` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `ent` tinyint(3) DEFAULT NULL COMMENT '進房',
        `pv` tinyint(3) DEFAULT NULL COMMENT '點tab',
        `svideo` tinyint(3) DEFAULT NULL COMMENT '短影',
        `small` tinyint(3) DEFAULT NULL COMMENT '小號',
        `sign` tinyint(3) DEFAULT NULL COMMENT '簽到',
        `platform` tinyint(3) DEFAULT NULL COMMENT 'unknow=0, ios=1, andriod=2',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_uni_key` (`pfid`),
        KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新用戶行為表';
    SQL
  end
  
  def down
    drop_table :register_behavior
  end
end
