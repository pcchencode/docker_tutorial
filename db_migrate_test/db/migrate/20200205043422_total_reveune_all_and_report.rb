class TotalReveuneAllAndReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_revenue_monthly` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL COMMENT '用戶編號',
        `cal_month` int(11) DEFAULT 0 COMMENT '月份',
        `total_money` int(11) DEFAULT 0 COMMENT '當月儲值金額',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`pfid`,`cal_month`),
        KEY `idx_cal_month` (`cal_month`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    SQL

    execute <<-SQL
      CREATE TABLE `lang_vip_report_weekly` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` int(11) DEFAULT NULL COMMENT '用戶編號',
        `level1_money` int(11) DEFAULT 0 COMMENT '單筆1萬以上充值',
        `level1_user` int(11) DEFAULT 0 COMMENT '單筆1萬以上人數',
        `level2_money` int(11) DEFAULT 0 COMMENT '單筆5萬以上充值',
        `level2_user` int(11) DEFAULT 0 COMMENT '單筆5萬以上人數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`cal_date`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='VIP客服充值KPI日報';
    SQL
  end
  
  def down
  	drop_table :lang_vip_report_weekly
    drop_table :lang_revenue_monthly
  end
end
