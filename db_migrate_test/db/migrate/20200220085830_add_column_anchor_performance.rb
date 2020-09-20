class AddColumnAnchorPerformance < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        ADD COLUMN `new_view10` INT(11) DEFAULT NULL COMMENT '90日內沒看過且看十分鐘用戶數' AFTER `view_num10`,
        ADD COLUMN `newreg_view10` INT(11) DEFAULT NULL COMMENT '新註冊且看十分鐘用戶數' AFTER `new_view10`,
        ADD COLUMN `newreg_follow` INT(11) DEFAULT NULL COMMENT '新註冊開播追蹤數' AFTER `new_follow`;
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        MODIFY COLUMN `ent_time` int(11) DEFAULT NULL COMMENT '進房人次',
        MODIFY COLUMN `ent_number` int(11) DEFAULT NULL COMMENT '進房人數',
        MODIFY COLUMN `view_num1` int(11) DEFAULT NULL COMMENT '有效觀看人數1m',
        MODIFY COLUMN `view_num3` int(11) DEFAULT NULL COMMENT '有效觀看人數3m',
        MODIFY COLUMN `view_num10` int(11) DEFAULT NULL COMMENT '有效觀看人數10m',
        MODIFY COLUMN `new_follow` int(11) DEFAULT NULL COMMENT '開播新增追蹤數',
        MODIFY COLUMN `cum_follow` int(11) DEFAULT NULL COMMENT '累積追蹤用戶數',
        MODIFY COLUMN `newreg_view` int(11) DEFAULT NULL COMMENT '新用戶觀看數',
        MODIFY COLUMN `fans_ent` int(11) DEFAULT NULL COMMENT '粉絲進房人數',
        MODIFY COLUMN `fans_act3` int(11) DEFAULT NULL COMMENT '三月活躍粉絲',
        MODIFY COLUMN `ent_fans_act3` int(11) DEFAULT NULL COMMENT '三月活躍粉絲進房人數',
        MODIFY COLUMN `fans_act6` int(11) DEFAULT NULL COMMENT '六月活躍粉絲',
        MODIFY COLUMN `ent_fans_act6` int(11) DEFAULT NULL COMMENT '六月活躍粉絲進房人數',
        MODIFY COLUMN `gold` float DEFAULT NULL COMMENT '觀眾送出浪花',
        MODIFY COLUMN `diamond` int(11) DEFAULT NULL COMMENT '主播收到鑽石',
        MODIFY COLUMN `consume_number` int(11) DEFAULT NULL COMMENT '觀眾送禮人數',
        MODIFY COLUMN `gold_fans` int(11) DEFAULT NULL COMMENT '粉絲送出浪花',
        MODIFY COLUMN `diamond_fans` float DEFAULT NULL COMMENT '主播收到粉絲鑽石',
        MODIFY COLUMN `consume_number_fans` float DEFAULT NULL COMMENT '粉絲送禮人數',
        MODIFY COLUMN `pcu` int(11) DEFAULT NULL COMMENT 'pcu';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        DROP COLUMN `new_view10`,
        DROP COLUMN `newreg_view10`,
        DROP COLUMN `newreg_follow`;
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        MODIFY COLUMN `ent_time` int(11) NOT NULL COMMENT '進房人次',
        MODIFY COLUMN `ent_number` int(11) NOT NULL COMMENT '進房人數',
        MODIFY COLUMN `view_num1` int(11) NOT NULL COMMENT '有效觀看人數1m',
        MODIFY COLUMN `view_num3` int(11) NOT NULL COMMENT '有效觀看人數3m',
        MODIFY COLUMN `view_num10` int(11) NOT NULL COMMENT '有效觀看人數10m',
        MODIFY COLUMN `new_follow` int(11) NOT NULL COMMENT '開播新增追蹤數',
        MODIFY COLUMN `cum_follow` int(11) NOT NULL COMMENT '累積追蹤用戶數',
        MODIFY COLUMN `newreg_view` int(11) NOT NULL COMMENT '新用戶觀看數',
        MODIFY COLUMN `fans_ent` int(11) NOT NULL COMMENT '粉絲進房人數',
        MODIFY COLUMN `fans_act3` int(11) NOT NULL COMMENT '三月活躍粉絲',
        MODIFY COLUMN `ent_fans_act3` int(11) NOT NULL COMMENT '三月活躍粉絲進房人數',
        MODIFY COLUMN `fans_act6` int(11) NOT NULL COMMENT '六月活躍粉絲',
        MODIFY COLUMN `ent_fans_act6` int(11) NOT NULL COMMENT '六月活躍粉絲進房人數',
        MODIFY COLUMN `gold` float NOT NULL COMMENT '觀眾送出浪花',
        MODIFY COLUMN `diamond` int(11) NOT NULL COMMENT '主播收到鑽石',
        MODIFY COLUMN `consume_number` int(11) NOT NULL COMMENT '觀眾送禮人數',
        MODIFY COLUMN `gold_fans` int(11) NOT NULL COMMENT '粉絲送出浪花',
        MODIFY COLUMN `diamond_fans` float NOT NULL COMMENT '主播收到粉絲鑽石',
        MODIFY COLUMN `consume_number_fans` float NOT NULL COMMENT '粉絲送禮人數',
        MODIFY COLUMN `pcu` int(11) NOT NULL COMMENT 'pcu';
    SQL
  end
end
