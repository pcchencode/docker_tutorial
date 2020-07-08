class AddFieldsToDailyAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `c_income` INT(11) unsigned DEFAULT '0' COMMENT '月累積鑽石收入台幣',
        ADD COLUMN `g_fan` INT(11) unsigned DEFAULT '0' COMMENT '月累積粉絲團人數',
        ADD COLUMN `rank` decimal(2,0) unsigned DEFAULT '0' COMMENT '月主播排名30名以外為0';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `c_income`,
        DROP COLUMN `g_fan`,
        DROP COLUMN `rank`;
    SQL
  end
end
