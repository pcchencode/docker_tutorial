class ModifyColumnForVip2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_vip_report_weekly`
        MODIFY COLUMN `cal_date` DATE DEFAULT NULL COMMENT '日期';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_vip_report_weekly`
        MODIFY COLUMN `cal_date` INT(11) NOT NULL DEFAULT 0 COMMENT '用戶編號';
    SQL
  end
end
