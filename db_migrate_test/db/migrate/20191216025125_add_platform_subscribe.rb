class AddPlatformSubscribe < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `platform_subscribe` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `email` varchar(200) NOT NULL COMMENT 'address',
        `groups` int(4) DEFAULT NULL COMMENT 'receive_groups',
        `deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否訂閱',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`groups`, `email`),
        KEY `db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浪日報訂閱表';
    SQL
  end
  
  def down
    drop_table :platform_subscribe
  end
end
