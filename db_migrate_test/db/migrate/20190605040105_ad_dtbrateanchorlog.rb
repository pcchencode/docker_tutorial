class AdDtbrateanchorlog < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_rate_anchor_log` (
        `t_month` date NOT NULL COMMENT '計算月份',
        `pfid` int(10) unsigned NOT NULL COMMENT '主播id',
        `rate_income` tinyint(3) unsigned DEFAULT NULL COMMENT '收入等级',
        `score_income` tinyint(4) DEFAULT NULL COMMENT '收入得分',
        `rate_adnc` tinyint(3) unsigned DEFAULT NULL COMMENT '观众等级',
        `score_adnc` tinyint(4) DEFAULT NULL COMMENT '观众得分',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`t_month`, `pfid`),
        KEY `idx_pfid` (`pfid`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级表月份log表 --created by Wendell.huang;';
    SQL
  end
  
  def down
    drop_table :tb_rate_anchor_log
  end
end
