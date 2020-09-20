class AddLangVipReport2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_rate_anchor_day` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '逻辑主键',
        `t_day` date NOT NULL COMMENT '日期',
        `pfid` int(10) unsigned NOT NULL COMMENT '主播id',
        `duration` int(10) unsigned DEFAULT '0' COMMENT '直播时长-秒',
        `is_signed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=unsigned, 1=signed.',
        `rate_income` tinyint(3) unsigned DEFAULT NULL COMMENT '收入等级',
        `rate_adnc` tinyint(3) unsigned DEFAULT NULL COMMENT '观众等级',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `unq_idx` (`t_day`,`pfid`),
        KEY `idx_pfid` (`pfid`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级数据日表 --created by xiaoyi.shen;';
    SQL
  end

  def down
    drop_table :tb_rate_anchor_day
  end
end
