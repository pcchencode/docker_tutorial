class AddDataSalarytoMonthlykpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `data_salary` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '月計算升降後時薪' AFTER `lang_diamond`;
    SQL

  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `data_salary`;
    SQL

  end
end
