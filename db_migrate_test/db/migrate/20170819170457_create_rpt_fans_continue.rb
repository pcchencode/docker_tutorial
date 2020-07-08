class CreateRptFansContinue < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `rpt_fans_continues` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date NOT NULL COMMENT '續買日期',
        `pfid` int(11) unsigned NOT NULL COMMENT '用戶編號',
        `t_pfid` int(11) unsigned NOT NULL COMMENT '主播編號',
        `continue_counts` mediumint(6) unsigned DEFAULT NULL COMMENT '累積購買總月數',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立日期',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新日期',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_cal_date_pfid_t_pfid` (`cal_date`,`pfid`,`t_pfid`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='粉絲團續買統計';
    SQL
  end

  def down
    drop_table :rpt_fans_continues
  end
end
