class AddActivityBonusDiamondToDailyAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis
        ADD COLUMN activity_bonus_diamond INT(11) NOT NULL DEFAULT 0 COMMENT '活動贈送鑽石';
    SQL

    execute <<-SQL
      ALTER TABLE daily_anchor_kpis_per_users
        ADD COLUMN activity_bonus_diamond INT(11) NOT NULL DEFAULT 0 COMMENT '活動贈送鑽石';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis
        DROP COLUMN activity_bonus_diamond;
    SQL

    execute <<-SQL
      ALTER TABLE daily_anchor_kpis_per_users
        DROP COLUMN activity_bonus_diamond;
    SQL
  end
end
