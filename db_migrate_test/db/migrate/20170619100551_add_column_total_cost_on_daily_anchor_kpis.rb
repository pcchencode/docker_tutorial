class AddColumnTotalCostOnDailyAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        CHANGE COLUMN `KPI` `kpi` decimal(10,4) DEFAULT NULL COMMENT '達成率',
        CHANGE COLUMN `KPI_now` `kpi_now` decimal(10,4) DEFAULT NULL COMMENT '達成率至今';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `total_cost` decimal(12,2) DEFAULT NULL COMMENT '累積總成本' AFTER `kpi_now`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `total_cost`;
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        CHANGE COLUMN `kpi` `KPI` decimal(10,4) DEFAULT NULL COMMENT '達成率',
        CHANGE COLUMN `kpi_now` `KPI_now` decimal(10,4) DEFAULT NULL COMMENT '達成率至今';
    SQL
  end
end
