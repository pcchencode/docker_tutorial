class CreateDailyAnchorKpisPerUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `daily_anchor_kpis_per_users` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) unsigned NOT NULL COMMENT '浪編號',
        `cal_date` date NOT NULL COMMENT '計算日期',
        `valid_hour` decimal(8,2) DEFAULT '0' COMMENT '當日有效開播時',
        `diamond` int(11) unsigned DEFAULT '0' COMMENT '當日鑽石收入',
        `incremental_fans` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '新增粉絲數',
        `share_counts` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '被分享數',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_cal_date` (`pfid`,`cal_date`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日主播開播時長粉絲數及分享數紀錄表';
    SQL
  end

  def down
    drop_table :daily_anchor_kpis_per_users
  end
end
