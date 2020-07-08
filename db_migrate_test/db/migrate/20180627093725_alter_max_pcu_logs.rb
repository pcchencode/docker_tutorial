class AlterMaxPcuLogs < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        ADD COLUMN `reg_pcu` int NOT NULL DEFAULT 0 COMMENT 'reg_pcu' AFTER `commercial_duration`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        DROP COLUMN `reg_pcu`;
    SQL
  end
end
