class AddColumnsNewregisterFollowerOrder < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order`
        ADD COLUMN `order_in60` int(10) NOT NULL COMMENT '註冊60日內總花費' AFTER `ARPPU_in30`,
        ADD COLUMN `number_in60` smallint(5) NOT NULL COMMENT '註冊60日內付費人數' AFTER `ARPPU_in30`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order`
        DROP COLUMN `order_in60`,
        DROP COLUMN `number_in60`;
    SQL
  end
end
