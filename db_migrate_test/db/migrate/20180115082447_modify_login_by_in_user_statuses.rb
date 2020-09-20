class ModifyLoginByInUserStatuses < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `user_statuses` MODIFY `login_by` VARCHAR(32);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `user_statuses` MODIFY `login_by` VARCHAR(4);
    SQL
  end
end
