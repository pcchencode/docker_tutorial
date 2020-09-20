class DeleteColumndataSalaryAndAddNewSalaryTable < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `data_salary`;
    SQL

    execute <<-SQL
      CREATE TABLE `monthly_anchor_salary` (
        `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主鍵ID。',
        `pfid` int(10) NOT NULL COMMENT '用戶浪Live號。',
        `t_month` int(10) NOT NULL COMMENT '日期。時區：UTC+08。',
        `currency` VARCHAR (20) NOT NULL DEFAULT 'TWD' COMMENT '货币单位',
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY uni_key (t_month, pfid),
        KEY idx_update (db_update_time)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='數據中心計算主播月升降時薪表';
    SQL

  end

  def down
  	execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `data_salary` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '月計算升降後時薪' AFTER `lang_diamond`;
    SQL
    
    drop_table :monthly_anchor_salary

  end
end
