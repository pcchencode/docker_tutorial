class AddColRegBehavior < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `register_behavior`
        ADD COLUMN `cash_14` int(11) NOT NULL DEFAULT 0 COMMENT '充值-14d' AFTER `ret30`,
        ADD COLUMN `cash_7` int(11) NOT NULL DEFAULT 0 COMMENT '充值-7d' AFTER `ret30`,
        ADD COLUMN `cash_3` int(11) NOT NULL DEFAULT 0 COMMENT '充值-3d' AFTER `ret30`,
        ADD COLUMN `cash_2` int(11) NOT NULL DEFAULT 0 COMMENT '充值-2d' AFTER `ret30`,
        ADD COLUMN `cash_1` int(11) NOT NULL DEFAULT 0 COMMENT '充值-1d' AFTER `ret30`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `register_behavior`
        DROP COLUMN `cash_14`,
        DROP COLUMN `cash_7`,
        DROP COLUMN `cash_3`,
        DROP COLUMN `cash_2`,
        DROP COLUMN `cash_1`;
    SQL
  end
end