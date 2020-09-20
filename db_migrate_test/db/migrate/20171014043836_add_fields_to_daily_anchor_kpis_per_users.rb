class AddFieldsToDailyAnchorKpisPerUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `c_income` INT(11) unsigned DEFAULT '0' COMMENT '鑽石收入台幣',
        ADD COLUMN `g_fan` INT(11) unsigned DEFAULT '0' COMMENT '新增粉絲團人數',
        ADD COLUMN `roi` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '達成率';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `c_income`,
        DROP COLUMN `g_fan`,
        DROP COLUMN `roi`;
    SQL
  end
end
