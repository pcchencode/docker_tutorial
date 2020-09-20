class ModifyColumnToMonthlyDiamond < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        MODIFY COLUMN `diamond_balance` bigint NOT NULL DEFAULT 0 COMMENT '月錢包剩餘數';
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        MODIFY COLUMN `diamond_balance` bigint NOT NULL DEFAULT 0 COMMENT '月錢包剩餘數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        MODIFY COLUMN `diamond_balance` INT NOT NULL DEFAULT 0 COMMENT '月錢包剩餘數';
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        MODIFY COLUMN `diamond_balance` INT NOT NULL DEFAULT 0 COMMENT '月錢包剩餘數';
    SQL
  end
end
