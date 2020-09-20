class AddTwoNewColumnToGameReportByLiveIdGuest < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        ADD COLUMN `over_min_user_tourist` INT(11) NOT NULL DEFAULT 0 COMMENT '超過1分鐘觀看人數訪客' AFTER `over_avg_times_valid`,
        ADD COLUMN `over_min_user_tourist_avg_times` float NOT NULL DEFAULT 0.0 COMMENT '超過1分鐘平均觀看時長訪客' AFTER `over_min_user_tourist`,
        ADD COLUMN `over_ten_min_user_tourist` INT(11) NOT NULL DEFAULT 0 COMMENT '超過10分鐘觀看人數訪客' AFTER `over_min_user_tourist_avg_times`,
        ADD COLUMN `over_ten_min_user_tourist_avg_times` float NOT NULL DEFAULT 0.0 COMMENT '超過10分鐘平均觀看時長訪客' AFTER `over_ten_min_user_tourist`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        DROP COLUMN `over_min_user_tourist`,
        DROP COLUMN `over_min_user_tourist_avg_times`
        DROP COLUMN `over_ten_min_user_tourist`,
        DROP COLUMN `over_ten_min_user_tourist_avg_times`;
    SQL
  end
end
