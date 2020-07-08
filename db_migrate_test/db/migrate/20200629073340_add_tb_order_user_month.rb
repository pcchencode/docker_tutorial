class AddTbOrderUserMonth < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_order_user_month` (
        `auto_id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
        `t_month` INT (10) UNSIGNED NOT NULL COMMENT '月份',
        `pfid` INT (10) UNSIGNED NOT NULL COMMENT 'id',
        `s_gold` INT DEFAULT '0' COMMENT '当月储值的浪花和 sum(gold +extra_gold)',
        `db_insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (auto_id),
        UNIQUE KEY unq_idx (`t_month`, `pfid`),
        KEY `idx_update` (`db_update_time`)
        ) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT = '用户储值浪花月表';
    SQL
  end

  def down
    drop_table :tb_order_user_month
  end
end
