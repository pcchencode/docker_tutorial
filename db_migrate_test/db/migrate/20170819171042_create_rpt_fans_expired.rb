class CreateRptFansExpired < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `rpt_fans_expireds` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `t_pfid` int(11) unsigned NOT NULL COMMENT '主播編號',
        `cal_date` date NOT NULL COMMENT '到期日期',
        `pfid` int(11) unsigned DEFAULT NULL COMMENT '用戶編號',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立日期',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新日期',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_cal_date_t_pfid` (`cal_date`,`t_pfid`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='粉絲團過期統計';
    SQL
  end

  def down
    drop_table :rpt_fans_expireds
  end
end
