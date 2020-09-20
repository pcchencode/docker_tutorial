class ModifyGameReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        ADD COLUMN `uv_fix` int(11) NOT NULL DEFAULT 0 COMMENT 'uv去除重複超過五個ip' AFTER `uv`,
        ADD COLUMN `over_5s_user_valid` int(11) NOT NULL DEFAULT 0 COMMENT '超過5s觀看人數排除異常',
        ADD COLUMN `over_5s_times_valid` float NOT NULL DEFAULT 0 COMMENT '超過5s平均觀看時長排除異常',
        ADD COLUMN `login_user_valid` int(11) NOT NULL DEFAULT 0 COMMENT '登入觀看人數排除異常',
        ADD COLUMN `total_user_valid` int(11) NOT NULL DEFAULT 0 COMMENT '全部觀看人數排除異常',
        ADD COLUMN `cum_follow` int(11) NOT NULL DEFAULT 0 COMMENT '累積追蹤用戶數',
        ADD COLUMN `ent_fans_act3` int(11) NOT NULL DEFAULT 0 COMMENT '三月活躍粉絲進房人數',
        ADD COLUMN `newreg_follow` int(11) NOT NULL DEFAULT 0 COMMENT '新註冊開播追蹤數',
        ADD COLUMN `follow_cancel` int(11) NOT NULL DEFAULT 0 COMMENT '開播取消追蹤用戶數',
        ADD COLUMN `share_cts` int(11) NOT NULL DEFAULT 0 COMMENT '分享次數'
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        DROP COLUMN `uv_fix`,
        DROP COLUMN `over_5s_user_valid`,
        DROP COLUMN `over_5s_times_valid`,
        DROP COLUMN `login_user_valid`,
        DROP COLUMN `total_user_valid`,
        DROP COLUMN `cum_follow`,
        DROP COLUMN `ent_fans_act3`,
        DROP COLUMN `newreg_follow`,
        DROP COLUMN `follow_cancel`,
        DROP COLUMN `share_cts`;
    SQL
  end
end
