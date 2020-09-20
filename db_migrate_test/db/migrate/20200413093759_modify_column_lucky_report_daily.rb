class ModifyColumnLuckyReportDaily < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lucky_report_daily`
        MODIFY COLUMN `today_first_users` int(11) NOT NULL DEFAULT 0 COMMENT '今日歷史第一次抽人數',
        MODIFY COLUMN `yest_first_users` int(11) NOT NULL DEFAULT 0 COMMENT '昨日歷史第一次抽人數',
        MODIFY COLUMN `yest_first_and_today_continue` int(11) NOT NULL DEFAULT 0 COMMENT '昨日首抽且今日有抽用戶數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lucky_report_daily`
        MODIFY COLUMN `today_first_users` int(11) NOT NULL DEFAULT 1 COMMENT '今日歷史第一次抽人數',
        MODIFY COLUMN `yest_first_users` int(11) NOT NULL DEFAULT 1 COMMENT '昨日歷史第一次抽人數',
        MODIFY COLUMN `yest_first_and_today_continue` int(11) NOT NULL DEFAULT 1 COMMENT '昨日首抽且今日有抽用戶數';
    SQL
  end
end
