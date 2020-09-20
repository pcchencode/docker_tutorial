class AddColumnToMonthlyAndDaily < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `lang_diamond` DECIMAL(12,3) NOT NULL DEFAULT 0 COMMENT '浪月收禮鑽石' AFTER `donate_income`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `lang_diamond` DECIMAL(12,3) NOT NULL DEFAULT 0 COMMENT '浪日收禮鑽石' AFTER `donate_income`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `lang_diamond`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `lang_diamond`;
    SQL
  end
end
