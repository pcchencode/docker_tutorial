class ModifyPgcOrder < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order`
      MODIFY COLUMN `follow_number` smallint(5) NOT NULL COMMENT '追蹤人數',
      MODIFY COLUMN `newregister_follow` smallint(5) NOT NULL COMMENT '追蹤人數(兩天內註冊)',
      MODIFY COLUMN `number_in7` smallint(5) NOT NULL COMMENT '註冊七日內付費人數',
      MODIFY COLUMN `number_in30` smallint(5) NOT NULL COMMENT '註冊30日內付費人數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `pgc_newregister_follower_order`
        MODIFY COLUMN `follow_number` tinyint(5) NOT NULL COMMENT '追蹤人數',
        MODIFY COLUMN `newregister_follow` tinyint(5) NOT NULL COMMENT '追蹤人數(兩天內註冊)',
        MODIFY COLUMN `number_in7` tinyint(5) NOT NULL COMMENT '註冊七日內付費人數',
        MODIFY COLUMN `number_in30` tinyint(5) NOT NULL COMMENT '註冊30日內付費人數';
    SQL
  end
end
