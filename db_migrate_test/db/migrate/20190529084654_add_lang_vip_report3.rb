class AddLangVipReport3 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_rate_anchor_month` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '逻辑主键',
        `t_month` date NOT NULL COMMENT '月份,每月的第一天.',
        `pfid` int(10) unsigned NOT NULL COMMENT '主播id',
        `is_signed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=unsigned, 1=signed.',
        `company_id` int(10) unsigned DEFAULT NULL COMMENT '经纪公司id',
        `income_rate` tinyint(3) unsigned DEFAULT NULL COMMENT '收入等级',
        `income_increase` tinyint(4) DEFAULT NULL COMMENT '收入等级增长',
        `income_score` decimal(11,2) DEFAULT NULL COMMENT '收入得分',
        `income_sc_increase` tinyint(4) DEFAULT NULL COMMENT '收入得分增长',
        `adnc_rate` tinyint(3) unsigned DEFAULT NULL COMMENT '观众等级',
        `adnc_increase` tinyint(4) DEFAULT NULL COMMENT '观众等级增长',
        `adnc_score` decimal(11,2) DEFAULT NULL COMMENT '观众得分',
        `adnc_sc_increase` tinyint(4) DEFAULT NULL COMMENT '观众得分增长',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `unq_idx` (`t_month`,`pfid`),
        KEY `idx_pfid` (`pfid`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级数据月表 --created by xiaoyi.shen;';
    SQL
  end

  def down
    drop_table :tb_rate_anchor_month
  end
end
