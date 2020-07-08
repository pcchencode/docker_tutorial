class AddTotalFansToDailyAnchorKpisPerUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis_per_users ADD COLUMN total_fans INT(11) UNSIGNED DEFAULT 0 COMMENT '總粉絲數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis_per_users DROP COLUMN total_fans;
    SQL
  end
end
