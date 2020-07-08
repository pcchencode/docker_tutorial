class ModifyColPkreport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_user_profile_consume`
        MODIFY COLUMN `lastday_total_cosume` int(11) DEFAULT 0 COMMENT '最近一天總消耗浪花',
        MODIFY COLUMN `lastday_lucky_consume` int(11) DEFAULT 0 COMMENT '最近一天爆擊消耗浪花',
        MODIFY COLUMN `lastday_lucky_return` int(11) DEFAULT 0 COMMENT '最近一天爆擊返還浪花',
        MODIFY COLUMN `lastday_bt_consume` int(11) DEFAULT 0 COMMENT '最近一天拼團消耗浪花',
        MODIFY COLUMN `lastday_bt_return` int(11) DEFAULT 0 COMMENT '最近一天拼團返還浪花',
        MODIFY COLUMN `thismon_total_cosume` int(11) DEFAULT 0 COMMENT '當月總消耗浪花',
        MODIFY COLUMN `thismon_lucky_consume` int(11) DEFAULT 0 COMMENT '當月爆擊消耗浪花',
        MODIFY COLUMN `thismon_lucky_return` int(11) DEFAULT 0 COMMENT '當月爆擊返還浪花',
        MODIFY COLUMN `thismon_bt_consume` int(11) DEFAULT 0 COMMENT '當月拼團消耗浪花',
        MODIFY COLUMN `thismon_bt_return` int(11) DEFAULT 0 COMMENT '當月拼團返還浪花',
        MODIFY COLUMN `lastmon_total_cosume` int(11) DEFAULT 0 COMMENT '上個月總消耗浪花',
        MODIFY COLUMN `lastmon_lucky_consume` int(11) DEFAULT 0 COMMENT '上個月爆擊消耗浪花',
        MODIFY COLUMN `lastmon_lucky_return` int(11) DEFAULT 0 COMMENT '上個月爆擊返還浪花',
        MODIFY COLUMN `lastmon_bt_consume` int(11) DEFAULT 0 COMMENT '上個月拼團消耗浪花',
        MODIFY COLUMN `lastmon_bt_return` int(11) DEFAULT 0 COMMENT '上個月拼團返還浪花',
        MODIFY COLUMN `last2mon_total_cosume` int(11) DEFAULT 0 COMMENT '上兩個月總消耗浪花',
        MODIFY COLUMN `last2mon_lucky_consume` int(11) DEFAULT 0 COMMENT '上兩個月爆擊消耗浪花',
        MODIFY COLUMN `last2mon_lucky_return` int(11) DEFAULT 0 COMMENT '上兩個月爆擊返還浪花',
        MODIFY COLUMN `last2mon_bt_consume` int(11) DEFAULT 0 COMMENT '上兩個月拼團消耗浪花',
        MODIFY COLUMN `last2mon_bt_return` int(11) DEFAULT 0 COMMENT '上兩個月拼團返還浪花';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        DROP COLUMN `blood_g501`,
        ADD COLUMN `blood_g1w` int(10) unsigned DEFAULT 0 COMMENT '首殺禮物10001-數量' AFTER `blood_g5001`,
        MODIFY COLUMN `blood_g1` int(10) unsigned DEFAULT 0 COMMENT '首殺禮物1-5000數量',
        MODIFY COLUMN `blood_g5001` int(10) unsigned DEFAULT 0 COMMENT '首殺禮物5001-10000數量',
        ADD COLUMN `mission_times` int(10) unsigned DEFAULT 0 COMMENT '粉絲任務完成次數' AFTER `mvp`,
        ADD COLUMN `mission_number` int(10) unsigned DEFAULT 0 COMMENT '粉絲任務完成人數' AFTER `mvp`,
        ADD COLUMN `anchor_number` int(10) unsigned DEFAULT 0 COMMENT '參與pk主播人數' AFTER `mvp`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_user_profile_consume`
        MODIFY COLUMN `lastday_total_cosume` int(11) DEFAULT NULL COMMENT '最近一天總消耗浪花',
        MODIFY COLUMN `lastday_lucky_consume` int(11) DEFAULT NULL COMMENT '最近一天爆擊消耗浪花',
        MODIFY COLUMN `lastday_lucky_return` int(11) DEFAULT NULL COMMENT '最近一天爆擊返還浪花',
        MODIFY COLUMN `lastday_bt_consume` int(11) DEFAULT NULL COMMENT '最近一天拼團消耗浪花',
        MODIFY COLUMN `lastday_bt_return` int(11) DEFAULT NULL COMMENT '最近一天拼團返還浪花',
        MODIFY COLUMN `thismon_total_cosume` int(11) DEFAULT NULL COMMENT '當月總消耗浪花',
        MODIFY COLUMN `thismon_lucky_consume` int(11) DEFAULT NULL COMMENT '當月爆擊消耗浪花',
        MODIFY COLUMN `thismon_lucky_return` int(11) DEFAULT NULL COMMENT '當月爆擊返還浪花',
        MODIFY COLUMN `thismon_bt_consume` int(11) DEFAULT NULL COMMENT '當月拼團消耗浪花',
        MODIFY COLUMN `thismon_bt_return` int(11) DEFAULT NULL COMMENT '當月拼團返還浪花',
        MODIFY COLUMN `lastmon_total_cosume` int(11) DEFAULT NULL COMMENT '上個月總消耗浪花',
        MODIFY COLUMN `lastmon_lucky_consume` int(11) DEFAULT NULL COMMENT '上個月爆擊消耗浪花',
        MODIFY COLUMN `lastmon_lucky_return` int(11) DEFAULT NULL COMMENT '上個月爆擊返還浪花',
        MODIFY COLUMN `lastmon_bt_consume` int(11) DEFAULT NULL COMMENT '上個月拼團消耗浪花',
        MODIFY COLUMN `lastmon_bt_return` int(11) DEFAULT NULL COMMENT '上個月拼團返還浪花',
        MODIFY COLUMN `last2mon_total_cosume` int(11) DEFAULT NULL COMMENT '上兩個月總消耗浪花',
        MODIFY COLUMN `last2mon_lucky_consume` int(11) DEFAULT NULL COMMENT '上兩個月爆擊消耗浪花',
        MODIFY COLUMN `last2mon_lucky_return` int(11) DEFAULT NULL COMMENT '上兩個月爆擊返還浪花',
        MODIFY COLUMN `last2mon_bt_consume` int(11) DEFAULT NULL COMMENT '上兩個月拼團消耗浪花',
        MODIFY COLUMN `last2mon_bt_return` int(11) DEFAULT NULL COMMENT '上兩個月拼團返還浪花';
    SQL

    execute <<-SQL
      ALTER TABLE `daily_pkchicken_report`
        ADD COLUMN `blood_g501` int(11) DEFAULT 0 COMMENT '首殺禮物501-5000數量' AFTER `blood_g1`,
        DROP COLUMN `blood_g1w`,
        MODIFY COLUMN `blood_g1` int(11) DEFAULT 0 COMMENT '首殺禮物1-500數量',
        MODIFY COLUMN `blood_g5001` int(11) DEFAULT 0 COMMENT '首殺禮物5001-數量',
        DROP COLUMN `mission_times`,
        DROP COLUMN `mission_number`,
        DROP COLUMN `anchor_number`;
    SQL
  end
end
