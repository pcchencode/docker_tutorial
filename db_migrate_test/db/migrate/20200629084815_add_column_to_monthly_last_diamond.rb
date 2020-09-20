class AddColumnToMonthlyLastDiamond < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `diamond_balance` INT NOT NULL DEFAULT 0 COMMENT '月錢包剩餘數';
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `diamond_balance` INT NOT NULL DEFAULT 0 COMMENT '月錢包剩餘數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `diamond_balance`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `diamond_balance`;
    SQL
  end
end
