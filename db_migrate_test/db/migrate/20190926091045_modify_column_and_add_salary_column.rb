class ModifyColumnAndAddSalaryColumn < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        ADD COLUMN `hour_salary` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '月計算升降後時薪' AFTER `t_month`;
    SQL

    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        MODIFY COLUMN `t_month` INT(10) NOT NULL DEFAULT 0 COMMENT '月份。時區：UTC+08。';
    SQL

  end

  def down
    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        DROP COLUMN `hour_salary`;
    SQL

    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        MODIFY COLUMN `t_month` INT(10) NOT NULL DEFAULT 0 COMMENT '日期。時區：UTC+08。';
    SQL

  end
end
