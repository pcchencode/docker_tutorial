class ModifyColumnForVip < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_revenue_monthly`
        MODIFY COLUMN `total_money` DECIMAL(12,3) NOT NULL DEFAULT 0 COMMENT '當月儲值(202001是歷史儲值)';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_revenue_monthly`
        MODIFY COLUMN `total_money` INT(11) NOT NULL DEFAULT 0 COMMENT '當月儲值(202001是歷史儲值)';
    SQL
  end
end