class AddOpenHourToDailyAnchorKpisPerUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `open_hour` decimal(8,2) DEFAULT '0.00' COMMENT '當日開播時長' AFTER `valid_hour`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `open_hour`;
    SQL
  end

end
