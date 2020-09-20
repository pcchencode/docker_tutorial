class ModifyAnchorPerformance2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        DROP COLUMN `new_view10`,
        DROP COLUMN `newreg_view10`,
        ADD COLUMN `view_time10` int(11) NOT NULL DEFAULT 0 COMMENT '10m 平均觀看時長' AFTER `view_num10`,
        ADD COLUMN `view_time3` int(11) NOT NULL DEFAULT 0 COMMENT '3m 平均觀看時長' AFTER `view_num10`,
        ADD COLUMN `view_time1` int(11) NOT NULL DEFAULT 0 COMMENT '1m 平均觀看時長' AFTER `view_num10`,
        ADD INDEX `idx_pfid` (`pfid`),
        DROP INDEX `uni_key`,
        ADD UNIQUE `uni_key` (`live_id`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        ADD COLUMN `new_view10` int(11) DEFAULT NULL COMMENT '90日內沒看過且看十分鐘用戶數',
        ADD COLUMN `newreg_view10` int(11) DEFAULT NULL COMMENT '新註冊且看十分鐘用戶數',
        DROP COLUMN `view_time10`,
        DROP COLUMN `view_time3`,
        DROP COLUMN `view_time1`,
        DROP INDEX `idx_pfid`,
        DROP INDEX `uni_key`,
        ADD UNIQUE `uni_key` (`pfid`,`live_id`); 
    SQL
  end
end
