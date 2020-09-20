class AddIndex < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `max_pcu_logs` 
      ADD INDEX `idx_live_id` (`live_id`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        DROP INDEX `idx_live_id`;
    SQL
  end
end
