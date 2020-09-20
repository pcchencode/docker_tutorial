class AddTableMonthlyAnchorDiamondRevenue < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        CREATE TABLE `monthly_anchor_diamond_revenue` (
          `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主鍵。',
          `pfid` int(10) unsigned NOT NULL COMMENT '簽約主播浪ID。',
          `nickname` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主播暱稱',
          `agency_company` varchar(45) NOT NULL COMMENT '經紀公司',
          `guarantee` int(10) unsigned DEFAULT NULL COMMENT '保底鑽石數',
          `salary_type` tinyint(3) unsigned DEFAULT 1 COMMENT '薪资制度(临时字段),0:旧制度,1:新制度,2:月薪制,3:保底制,5=特殊保底,8=扶持金制(CN),10=一般瞬升,11=瞬升保底,12=新制個人/經紀30,13=新制個人/經紀60,14=音頻瞬升降,15=音頻保底.',
          `max_hour` int(10) unsigned NOT NULL COMMENT '最大開播時數',
          `start_time_contract` datetime DEFAULT NULL COMMENT '合約起始時間。時區：UTC±08。',
          `end_time_contract` datetime DEFAULT NULL COMMENT '合約結束時間。時區：UTC±08。',
          `start_time_cal` datetime DEFAULT NULL COMMENT '結算起始時間。時區：UTC±08。',
          `end_time_cal` datetime DEFAULT NULL COMMENT '結算結束時間。時區：UTC±08。',
          `cal_year_month` int(10) unsigned DEFAULT NULL COMMENT '統計年月份。時區：UTC±08。',
          `diamond_left` int(10) NOT NULL COMMENT '錢包數',
          `diamond_freeze` int(10) NOT NULL COMMENT '凍結鑽石數',
          `lastupdtime_left_freeze` datetime DEFAULT NULL COMMENT '錢包數與鑽石凍結數最後更新時間',
          `diamond_income` int(10) unsigned NOT NULL COMMENT '收益',
          `diamond_withdraw` int(10) unsigned NOT NULL COMMENT '提領鑽石數',
          `diamond_exchange` int(10) unsigned NOT NULL COMMENT '兌換浪花',
          `activity_income` int(10) unsigned NOT NULL COMMENT '活動收益',
          `fans_group_income` int(10) unsigned NOT NULL COMMENT '粉絲團收益',
          `noble_income` int(10) unsigned NOT NULL COMMENT '貴族收益',
          `other_income` int(10) unsigned NOT NULL COMMENT '其他收益',
          `diamond_balance` int(10) NOT NULL COMMENT '結算',
          `cash` int(10) unsigned NOT NULL COMMENT '請款金額',
          `diamond_deduction` int(10) unsigned NOT NULL COMMENT '實際扣除鑽石數',
          `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。',
          `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
          PRIMARY KEY (`id`),
          UNIQUE KEY `uni_pfid` (`pfid`),
          KEY `idx_start_time_contract` (`start_time_contract`),
          KEY `idx_end_time_contract` (`end_time_contract`),
          KEY `idx_start_time_cal` (`start_time_cal`),
          KEY `idx_end_time_cal` (`end_time_cal`),
          KEY `idx_cal_year_month` (`cal_year_month`),
          KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='簽約主播鑽石收益月報。作者：Jerry<jerry.chen@langlive.com>。';
    SQL
  end

  def down
    drop_table :monthly_anchor_diamond_revenue
  end
end
