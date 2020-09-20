class AddColumnToGameReportByLiveId < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        ADD COLUMN `over_ten_min_user` INT(11) NOT NULL DEFAULT 0 COMMENT '超過10分鐘觀看人數' AFTER `pcu`,
        ADD COLUMN `over_ten_min_avg_times` float NOT NULL DEFAULT 0.0 COMMENT '超過10分鐘平均觀看時長' AFTER `over_ten_min_user`,
        ADD COLUMN `over_ten_min_user_valid` INT(11) NOT NULL DEFAULT 0 COMMENT '超過10分鐘觀看人數排除異常' AFTER `over_ten_min_avg_times`,
        ADD COLUMN `over_ten_min_avg_times_valid` float NOT NULL DEFAULT 0.0 COMMENT '超過10分鐘平均觀看時長排除異常' AFTER `over_ten_min_user_valid`
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        DROP COLUMN `over_ten_min_user`,
        DROP COLUMN `over_ten_min_avg_times`,
        DROP COLUMN `over_ten_min_user_valid`,
        DROP COLUMN `over_ten_min_avg_times_valid`;
    SQL
  end
end
