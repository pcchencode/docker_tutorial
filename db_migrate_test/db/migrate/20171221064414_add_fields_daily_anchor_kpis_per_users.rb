class AddFieldsDailyAnchorKpisPerUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `ace_duration` INT(11) unsigned DEFAULT 0 COMMENT '王牌大主播時數';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `ace_duration` INT(11) unsigned DEFAULT 0 COMMENT '王牌大主播時數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `ace_duration`;
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `ace_duration`;
    SQL
  end
end
