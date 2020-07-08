class AlterTables < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `pcu_m` INT(11) UNSIGNED COMMENT '當月最大峰值人數' AFTER `category`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `pcu` INT(11) UNSIGNED COMMENT '當日最大峰值人數' AFTER `category`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD COLUMN `pcu` INT(11) UNSIGNED COMMENT '當日最大峰值人數' AFTER `category`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `pcu_m` INT(11) UNSIGNED COMMENT '當月最大峰值人數' AFTER `category`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `pcu_m`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP COLUMN `pcu`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `pcu`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `pcu_m`;
    SQL
  end
end
