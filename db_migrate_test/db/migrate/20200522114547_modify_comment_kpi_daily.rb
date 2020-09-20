class ModifyCommentKpiDaily < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        MODIFY `kpi_diamond` int(11) NOT NULL DEFAULT 0 COMMENT '秀場:目前無使用 音頻:秀場電競的禮物收益',
        MODIFY `lang_diamond` decimal(12,3) NOT NULL DEFAULT 0.000 COMMENT '秀場:kpi鑽石收益 音頻:kpi鑽石收益';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        MODIFY `kpi_diamond` int(11) NOT NULL DEFAULT 0 COMMENT 'KPI營收',
        MODIFY `lang_diamond` decimal(12,3) NOT NULL DEFAULT 0.000 COMMENT '浪月收禮鑽石';
    SQL
  end
end