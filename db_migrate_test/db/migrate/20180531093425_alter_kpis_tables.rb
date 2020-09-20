class AlterKpisTables < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD `income_n` bigint(20) unsigned DEFAULT '0' COMMENT '贵族收益';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD `income_n` bigint(20) unsigned DEFAULT '0' COMMENT '贵族收益';
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD `income_n` bigint(20) unsigned DEFAULT '0' COMMENT '贵族收益';
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD `income_n` bigint(20) unsigned DEFAULT '0' COMMENT '贵族收益';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP `income_n`;
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP `income_n`;
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP `income_n`;
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP `income_n`;
    SQL
  end
end
