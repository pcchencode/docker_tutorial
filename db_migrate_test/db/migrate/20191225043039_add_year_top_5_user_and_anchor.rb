class AddYearTop5UserAndAnchor < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_anchor_history_tops` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `t_pfid` int(11) DEFAULT NULL COMMENT '主播編號',
        `favor_type` tinyint(4) DEFAULT NULL COMMENT '0:Top粉, 1:Top5送禮, 2:Top10在線',
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `ranks` int(11) DEFAULT NULL COMMENT '名次',
        `values` int(11) DEFAULT NULL COMMENT '浪花數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`t_pfid`,`favor_type`,`ranks`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='年度主播收禮TOP數據表';
    SQL

    execute <<-SQL
      CREATE TABLE `lang_user_history_tops` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `t_pfid` int(11) DEFAULT NULL COMMENT '主播編號',
        `favor_type` tinyint(4) DEFAULT NULL COMMENT '0:Top粉, 1:Top5送禮, 2:Top10在線',
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `ranks` int(11) DEFAULT NULL COMMENT '名次',
        `values` int(11) DEFAULT NULL COMMENT '浪花數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`,`favor_type`,`ranks`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='年度用戶送禮TOP數據表';
    SQL
  end
  
  def down
    drop_table :lang_anchor_history_tops
    drop_table :lang_user_history_tops
  end
end
