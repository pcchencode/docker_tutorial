class CreateAnchorUnsignedMonths < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `anchor_unsigned_months` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。',
        `t_day` date NOT NULL COMMENT '當月最後計算日期',
        `t_month` int(11) NOT NULL COMMENT '計算月份',
        `valid_duration` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '累積當月有效開播，單位秒',
        `income` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '當月累積鑽石收入',
        `c_income` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '當月累積鑽石收入（台幣）',
        `g_fan` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '當月新增粉絲團人數',
        `rank` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排名, 30名以外則為0',
        `gold` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '本月（提現）',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_t_day` (`pfid`,`t_month`),
        KEY `idx_updated_at` (`updated_at`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每月非簽約主播紀錄表';
    SQL
  end

  def down
    drop_table :anchor_unsigned_months
  end
end
