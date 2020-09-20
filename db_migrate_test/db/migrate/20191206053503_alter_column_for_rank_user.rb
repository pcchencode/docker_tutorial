class AlterColumnForRankUser < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        ADD COLUMN `back_balance` INT(11) NOT NULL DEFAULT 0 COMMENT '爆擊返還' AFTER `lucky_expend`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        DROP COLUMN `back_balance`;
    SQL
  end
end
