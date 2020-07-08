class CreateDailyAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `daily_anchor_kpis` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` varchar(8) DEFAULT NULL COMMENT '用戶編號',
        `last_cal_date` date DEFAULT NULL,
        `month` int(11) DEFAULT NULL COMMENT '計算月份',
        `monthly_diamond` decimal(14,2) DEFAULT NULL COMMENT '當月累積鑽石',
        `valid_days` tinyint(3) unsigned DEFAULT NULL COMMENT '當月累積有效日',
        `hour_salary` decimal(7,2) DEFAULT NULL COMMENT '時薪',
        `valid_hours` decimal(7,4) DEFAULT NULL COMMENT '當月累積有效時',
        `actural_pay` decimal(10,4) DEFAULT NULL COMMENT '當月累積成本',
        `actural_pay_now` decimal(10,4) DEFAULT NULL COMMENT '當月累積成本至今',
        `KPI` decimal(10,4) DEFAULT NULL COMMENT '達成率',
        `KPI_now` decimal(10,4) DEFAULT NULL COMMENT '達成率至今',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`,`month`),
        KEY `month` (`month`)
      ) ENGINE=InnoDB AUTO_INCREMENT=2579 DEFAULT CHARSET=utf8 COMMENT='主播當月累積營收及指標表';
    SQL
  end

  def down
    drop_table :daily_anchor_kpis
  end
end
