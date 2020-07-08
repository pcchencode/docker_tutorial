class AddTwoNewColumnToGameReportByLiveIdGuestAll < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        ADD COLUMN `tourist_total_user` INT(11) NOT NULL DEFAULT 0 COMMENT '訪客觀看人數' AFTER `over_ten_min_user_tourist_avg_times`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        DROP COLUMN `tourist_total_user`;
    SQL
  end
end
