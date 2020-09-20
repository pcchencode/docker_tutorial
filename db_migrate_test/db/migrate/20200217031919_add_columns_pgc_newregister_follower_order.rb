class AddColumnsPgcNewregisterFollowerOrder < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order`
        ADD COLUMN `ltv_people` INT(11) DEFAULT NULL COMMENT 'ltv180天付費人數' AFTER `ARPPU_in30`,
        ADD COLUMN `ltv_cash` INT(11) DEFAULT NULL COMMENT 'ltv180天付費金額' AFTER `ARPPU_in30`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order`
        DROP COLUMN `ltv_people`,
        DROP COLUMN `ltv_cash`;
    SQL
  end
end
