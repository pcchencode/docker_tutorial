class AddColumnToLuckyReportDaily < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lucky_report_daily`
        ADD COLUMN `today_first_users` INT NOT NULL DEFAULT 1 COMMENT '今日歷史第一次抽人數' AFTER `avg_gold`,
        ADD COLUMN `yest_first_users` INT NOT NULL DEFAULT 1 COMMENT '昨日歷史第一次抽人數' AFTER `today_first_users`,
        ADD COLUMN `yest_first_and_today_continue` INT NOT NULL DEFAULT 1 COMMENT '昨日首抽且今日有抽用戶數' AFTER `yest_first_users`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lucky_report_daily`
        DROP COLUMN `yest_first_and_today_continue`,
        DROP COLUMN `yest_first_users`,
        DROP COLUMN `today_first_users`;
    SQL
  end
end
