class AddColumnsIntoDailyKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `income_groups` INT(10) unsigned DEFAULT 0 NOT NULL COMMENT '粉絲團收入' AFTER income_n;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `income_groups` INT(10) unsigned DEFAULT 0 NOT NULL COMMENT '粉絲團收入' AFTER income_n;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD COLUMN `income_groups` INT(10) unsigned DEFAULT 0 NOT NULL COMMENT '粉絲團收入' AFTER income_n;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `income_groups` INT(10) unsigned DEFAULT 0 NOT NULL COMMENT '粉絲團收入' AFTER income_n;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `income_groups`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP COLUMN `income_groups`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `income_groups`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `income_groups`;
    SQL
  end
end
