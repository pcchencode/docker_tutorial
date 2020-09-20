class AddColumnsUserBehavior < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `register_behavior`
        ADD COLUMN `live_cts` int(11) NOT NULL DEFAULT 0 COMMENT '直播間數' AFTER `platform`,
        ADD COLUMN `ret1` tinyint(3) NOT NULL DEFAULT 0 COMMENT '次留' AFTER `live_cts`,
        ADD COLUMN `ret3` tinyint(3) NOT NULL DEFAULT 0 COMMENT '3留' AFTER `ret1`,
        ADD COLUMN `ret7` tinyint(3) NOT NULL DEFAULT 0 COMMENT '7留' AFTER `ret3`,
        ADD COLUMN `ret14` tinyint(3) NOT NULL DEFAULT 0 COMMENT '14留' AFTER `ret7`,
        ADD COLUMN `ret30` tinyint(3) NOT NULL DEFAULT 0 COMMENT '30留' AFTER `ret14`,
        ADD COLUMN `cash_30` int(11) NOT NULL DEFAULT 0 COMMENT '充值-30d' AFTER `ret30`,
        ADD COLUMN `cash_60` int(11) NOT NULL DEFAULT 0 COMMENT '充值30-60d' AFTER `cash_30`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `register_behavior`
        DROP COLUMN `live_cts`,
        DROP COLUMN `ret1`,
        DROP COLUMN `ret3`,
        DROP COLUMN `ret7`,
        DROP COLUMN `ret14`,
        DROP COLUMN `ret30`,
        DROP COLUMN `cash_30`,
        DROP COLUMN `cash_60`;
    SQL
  end
end
