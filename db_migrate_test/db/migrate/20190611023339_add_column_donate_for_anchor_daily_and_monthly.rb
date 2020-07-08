class AddColumnDonateForAnchorDailyAndMonthly < ActiveRecord::Migration[5.2]
  def up
  	execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `donate_income` DECIMAL(12,3) NOT NULL DEFAULT 0 COMMENT '動態打賞月' AFTER `income_groups`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `donate_income` DECIMAL(12,3) NOT NULL DEFAULT 0 COMMENT '動態打賞日' AFTER `income_groups`;
    SQL
  end

  def down
  	execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `donate_income`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `donate_income`;
    SQL
  end
end
