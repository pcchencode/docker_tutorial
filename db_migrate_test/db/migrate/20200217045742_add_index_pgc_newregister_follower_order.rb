class AddIndexPgcNewregisterFollowerOrder < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order` 
      ADD INDEX `idx_follow_date` (`follow_date`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order`
        DROP INDEX `idx_follow_date`;
    SQL
  end
end
