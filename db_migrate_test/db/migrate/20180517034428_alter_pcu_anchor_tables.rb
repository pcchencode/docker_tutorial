class AlterPcuAnchorTables < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        ADD COLUMN `uv`  int NOT NULL DEFAULT -1 COMMENT 'UV' AFTER `pcu_reg_time`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `c_duration`  int UNSIGNED NULL COMMENT '工商直播时长(秒)' AFTER `pcu`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `c_duration`  int UNSIGNED NULL COMMENT '工商直播时长(秒)' AFTER `pcu_m`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        DROP COLUMN `uv`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `c_duration`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `c_duration`;
    SQL
  end
end
