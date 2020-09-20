class CreateIndexOnMaxPcuLogs < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE INDEX `idx_updated_at` ON `max_pcu_logs` (`updated_at`);
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX `idx_updated_at` ON `max_pcu_logs`;
    SQL
  end
end
