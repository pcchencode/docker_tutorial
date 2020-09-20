class AddtbRateStatDayAdnc < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_rate_stat_day_adnc` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '逻辑主键',
        `t_day` date NOT NULL COMMENT '日期',
        `dau` int(10) unsigned DEFAULT NULL COMMENT 'Daily Active User',
        `num_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `num_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `num_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `s_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `s_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `s_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `a_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `a_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `a_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `b_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `b_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `b_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `c_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `c_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `c_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `d_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `d_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `d_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `unq_idx` (`t_day`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级日统计表(观众) --created by xiaoyi.shen;';
    SQL

    execute <<-SQL
      CREATE TABLE `tb_rate_stat_day_income` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '逻辑主键',
        `t_day` date NOT NULL COMMENT '日期',
        `dau` int(10) unsigned DEFAULT NULL COMMENT 'Daily Active User',
        `num_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `num_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `num_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `s_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `s_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `s_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `a_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `a_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `a_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `b_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `b_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `b_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `c_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `c_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `c_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `d_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `d_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `d_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `unq_idx` (`t_day`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级日统计表(收入) --created by xiaoyi.shen;';
    SQL

    execute <<-SQL
      CREATE TABLE `tb_rate_stat_month_adnc` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '逻辑主键',
        `t_month` date NOT NULL COMMENT '月份日期,每月的第一天.',
        `num_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `num_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `num_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `s_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `s_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `s_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `a_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `a_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `a_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `b_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `b_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `b_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `c_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `c_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `c_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `d_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `d_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `d_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `unq_idx` (`t_month`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级月统计表(观众) --created by xiaoyi.shen;';
    SQL

    execute <<-SQL
      CREATE TABLE `tb_rate_stat_month_income` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '逻辑主键',
        `t_month` date NOT NULL COMMENT '月份日期,每月的第一天.',
        `num_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `num_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `num_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `s_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `s_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `s_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `a_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `a_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `a_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `b_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `b_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `b_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `c_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `c_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `c_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `d_signed` int(10) unsigned DEFAULT NULL COMMENT '签约主播数',
        `d_unsigned` int(10) unsigned DEFAULT NULL COMMENT '未签约主播数',
        `d_total` int(10) unsigned DEFAULT NULL COMMENT '主播总数',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `unq_idx` (`t_month`),
        KEY `idx_insert` (`db_insert_time`),
        KEY `idx_update` (`db_update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播评级月统计表(收入) --created by xiaoyi.shen;';
    SQL
  end

  def down
    drop_table :tb_rate_stat_month_income
    drop_table :tb_rate_stat_month_adnc
    drop_table :tb_rate_stat_day_income
    drop_table :tb_rate_stat_day_adnc
  end
end
