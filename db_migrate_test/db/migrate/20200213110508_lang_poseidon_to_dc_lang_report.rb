class LangPoseidonToDcLangReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `anchor_kpi` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '日期。時區：UTC±08。',
        `pfid` INT(11) UNSIGNED NOT NULL COMMENT '用戶浪ID。',
        `user_last_viewing` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT '用戶上次觀看直播間人數。',
        `user_sequential_viewing` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT '用戶連續觀看直播間人數。',
        `real_fans` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT '主播於是日開播前，真實粉絲(追蹤主播狀態、近一個月有登入浪Live、近一個月進主播直播間)人數。',
        `real_fans_view` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT '主播於是日開播時，真實粉絲的觀看人數。',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_pfid` (`date`,`pfid`),
        KEY `idx_dbUpdateTime` (`db_update_time`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='[浪-月報] 主播 KPI: 1.用戶連續觀看; 2.主播真實粉絲觀看。作者：Allen<allen.chang@langlive.com>。';
    SQL

    execute <<-SQL
      CREATE TABLE `daily_product_daily_task_invitee_stats` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '計算日期。時區：UTC±08。',
        `n_invitee` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '當日被邀請用戶總數。',
        `n_paid` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用戶被成功邀請後，30日內有充值用戶總數。',
        `cash` DECIMAL(10,2) DEFAULT '0.00' COMMENT '用戶被成功邀請後，30日內充值金額(新臺幣)總數。',
        `n_consume` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用戶被成功邀請後，30日內有消耗浪花用戶總數。',
        `gold` INT(11) DEFAULT NULL COMMENT '用戶被成功邀請後，30日內消耗浪花總數。',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date` (`date`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='[浪-日報] 每日任務：成功受邀用戶金流總覽。作者：Allen<allen.chang@langlive.com>。';
    SQL

    execute <<-SQL
      CREATE TABLE `daily_product_daily_task_stats` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '計算日期。時區：UTC±08。',
        `task_id` VARCHAR(6) NOT NULL COMMENT '每日任務系統代號。',
        `value` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '任務統計數量。',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_taskId` (`date`,`task_id`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='[浪-日報] 每日任務：任務系統統計總覽。作者：Allen<allen.chang@langlive.com>。';
    SQL
  end
  def down
    drop_table :daily_product_daily_task_stats
    drop_table :daily_product_daily_task_invitee_stats
    drop_table :anchor_kpi
  end
end
