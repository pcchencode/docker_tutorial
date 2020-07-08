class ModifyPk < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        ADD COLUMN `prod_cnt` int(11) DEFAULT 0 COMMENT '每日消耗道具數' AFTER `blood_g1w`,
        ADD COLUMN `airdrop_num` int(11) DEFAULT 0 COMMENT '每日消耗道具數' AFTER `g6`,
        ADD COLUMN `total_award` int(11) DEFAULT 0 COMMENT '每日消耗道具數' AFTER `g6`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        DROP COLUMN `prod_cnt`,
        DROP COLUMN `airdrop_num`,
        DROP COLUMN `total_award`;
    SQL
  end
end
