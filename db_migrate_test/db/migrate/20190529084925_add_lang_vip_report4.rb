class AddLangVipReport4 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_rate_anchor_month_kpi` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '逻辑主键',
        `t_month` date NOT NULL COMMENT '月份日期,每月的第一天.',
        `pfid` int(10) unsigned NOT NULL COMMENT '主播id',
        `key_id` tinyint(3) unsigned NOT NULL COMMENT '数据定义代码',
        `key_value` decimal(11,2) DEFAULT NULL COMMENT '数据',
        `increase` decimal(11,2) DEFAULT NULL COMMENT '涨幅，可以负',
        `weight` tinyint(3) unsigned DEFAULT NULL COMMENT '权重',
        `rate` tinyint(3) unsigned DEFAULT NULL COMMENT '等级',
        `account` tinyint(3) unsigned NOT NULL COMMENT '评级得分',
        `score` decimal(11,2) DEFAULT NULL COMMENT '单项得分',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `unq_idx` (`t_month`,`pfid`,`key_id`),
        KEY `idx_pfid` (`pfid`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级数据月明细表 --created by xiaoyi.shen;';
    SQL
  end

  def down
    drop_table :tb_rate_anchor_month_kpi 
  end
end
