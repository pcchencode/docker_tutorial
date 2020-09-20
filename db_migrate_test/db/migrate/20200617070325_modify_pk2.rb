class ModifyPk2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        MODIFY COLUMN `airdrop_num` int(11) DEFAULT 0 COMMENT '空投發放金額',
        MODIFY COLUMN `total_award` int(11) DEFAULT 0 COMMENT '獎金發放金額',
        MODIFY COLUMN `cal_date` datetime DEFAULT NULL COMMENT '比賽開始時間',
        ADD COLUMN `anchor_1st` int(11) DEFAULT 0 COMMENT '50000以下' AFTER `g6`,
        ADD COLUMN `anchor_2nd` int(11) DEFAULT 0 COMMENT '50001-150000' AFTER `g6`,
        ADD COLUMN `anchor_3rd` int(11) DEFAULT 0 COMMENT '150001以上' AFTER `g6`;
    SQL
    execute <<-SQL
      ALTER TABLE `pkchicken_anchor_ratio`
        MODIFY COLUMN `ratio` float NOT NULL DEFAULT 0 COMMENT '無用',
        MODIFY COLUMN `total_mins` smallint(6) NOT NULL DEFAULT 0 COMMENT '無用',
        MODIFY COLUMN `total_diamond` int(11) NOT NULL DEFAULT 0 COMMENT '近十五天鑽石收入';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        DROP COLUMN `anchor_1st`,
        DROP COLUMN `anchor_2nd`,
        DROP COLUMN `anchor_3rd`;
    SQL
  end
end
