class AddColumnForVoiceHours < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `voice_hours` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '音頻開播時長(小時)' AFTER `kpi_diamond`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `voice_hours` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '音頻開播時長(小時)' AFTER `kpi_diamond`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD COLUMN `voice_hours` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '音頻開播時長(小時)' AFTER `voice_diamond`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `voice_hours` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '音頻開播時長(小時)' AFTER `voice_diamond`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `voice_hours`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `voice_hours`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP COLUMN `voice_hours`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `voice_hours`;
    SQL
  end
end
