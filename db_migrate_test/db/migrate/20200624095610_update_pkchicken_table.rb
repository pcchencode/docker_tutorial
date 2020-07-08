class UpdatePkchickenTable < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        ADD COLUMN `prod_cnt_bag` int(11) DEFAULT 0 COMMENT '每日消耗道具數_bag',
        ADD COLUMN `consume_people_bag` int(11) DEFAULT 0 COMMENT '送禮人數_bag',
        ADD COLUMN `gold_bag` int(11) DEFAULT 0 COMMENT '消耗浪花_bag',
        ADD COLUMN `diamond_bag` int(11) DEFAULT 0 COMMENT '主播鑽石收益_bag';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        DROP COLUMN `prod_cnt_bag`,
        DROP COLUMN `consume_people_bag`,
        DROP COLUMN `gold_bag`,
        DROP COLUMN `diamond_bag`;
    SQL
  end
end
