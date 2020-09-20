class AddKeyAnchorContinueView < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_continue_view`
        DROP INDEX `idx_pfid`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_continue_view` 
      ADD unique `idx_pfid_live_date` (`pfid`, `live_date`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_continue_view`
        DROP INDEX `idx_pfid_live_date`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_continue_view` 
      ADD unique `idx_pfid` (`pfid`);
    SQL
  end
end
