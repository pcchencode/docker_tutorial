class ModifyColumntmonthAndpfidunsigned < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        MODIFY COLUMN `t_month` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '月份。時區：UTC+08。';
    SQL

    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        MODIFY COLUMN `pfid` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用戶浪Live號。';
    SQL

  end

  def down
    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        MODIFY COLUMN `t_month` INT(10) NOT NULL DEFAULT 0 COMMENT '月份。時區：UTC+08。';
    SQL

    execute <<-SQL
      ALTER TABLE `monthly_anchor_salary`
        MODIFY COLUMN `pfid` INT(10) NOT NULL DEFAULT 0 COMMENT '用戶浪Live號。';
    SQL

  end
end
