class AddColumnNameOnUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `users`
        ADD COLUMN `name` VARCHAR(50) DEFAULT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE `users`
        ADD INDEX `idx_name` (`name`);
    SQL
  end

  def down
    remove_index :users, name: 'idx_name'
    execute <<-SQL
      ALTER TABLE `users`
        DROP COLUMN `name`;
    SQL
  end
end
