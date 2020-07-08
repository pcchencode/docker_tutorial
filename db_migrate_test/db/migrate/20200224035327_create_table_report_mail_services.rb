class CreateTableReportMailServices < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `report_mail_services` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `report_name` VARCHAR(50) NOT NULL COMMENT '報表名稱。',
        `frequency` VARCHAR(15) NOT NULL COMMENT '報表週期。',
        `mail_dept` VARCHAR(30) NOT NULL COMMENT '郵件寄送部門或群體。',
        `mail_form` VARCHAR(15) NOT NULL COMMENT '郵件表格名稱。',
        `mail_content` VARCHAR(3000) NOT NULL COMMENT '郵件表格內容。',
        `status` TINYINT(4) NOT NULL COMMENT '最近一次發送狀態。0：失敗；1：成功。',
        `enable` TINYINT(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '啟用狀態。0：關閉；1：啟用。',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_reportName_mailDept_mailForm` (`report_name`,`mail_dept`,`mail_form`),
        KEY `idx_dbUpdateTime` (`db_update_time`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='[浪] 報表郵件權限總覽。作者：Allen<allen.chang@langlive.com>。';
    SQL
  end

  def down
    drop_table :report_mail_services
  end
end
