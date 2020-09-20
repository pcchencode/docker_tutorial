class ModifyColumnForAnchorKpi < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `voice_diamond` int(11) NOT NULL DEFAULT 0 COMMENT '音頻營收' AFTER `lang_diamond`,
        ADD COLUMN `kpi_diamond` int(11) NOT NULL DEFAULT 0 COMMENT 'KPI營收' AFTER `voice_diamond`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `voice_diamond` int(11) NOT NULL DEFAULT 0 COMMENT '音頻營收' AFTER `lang_diamond`,
        ADD COLUMN `kpi_diamond` int(11) NOT NULL DEFAULT 0 COMMENT 'KPI營收' AFTER `voice_diamond`;
    SQL
  end

  def down
  	execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `voice_diamond`,
        DROP COLUMN `kpi_diamond`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `voice_diamond`,
        DROP COLUMN `kpi_diamond`;
    SQL
  end
end
