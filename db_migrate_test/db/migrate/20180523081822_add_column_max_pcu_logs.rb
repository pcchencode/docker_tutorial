class AddColumnMaxPcuLogs < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        ADD COLUMN `pv`  int NOT NULL DEFAULT -1 COMMENT 'PV' AFTER `uv`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        DROP COLUMN `pv`;
    SQL
  end
end
