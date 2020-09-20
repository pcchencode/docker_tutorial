class RecreateGodviewTables < ActiveRecord::Migration[5.2]
  def up
    drop_table :godview_daily_anchors

    execute <<-SQL
      CREATE TABLE `godview_daily_anchors` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `report_date` date DEFAULT NULL COMMENT '結算日期',
        `pfid` varchar(8) DEFAULT NULL COMMENT '主播編號',
        `duration` decimal(6,1) DEFAULT NULL COMMENT '開播時長',
        `times` smallint(5) unsigned DEFAULT NULL COMMENT '開播次數',
        `revenue` int(11) unsigned DEFAULT NULL COMMENT '開播收入',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_report_date` (`pfid`,`report_date`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上帝模式報告第一部分';
    SQL
    drop_table :godview_monthly_anchors
    execute <<-SQL
      CREATE TABLE `godview_monthly_anchors` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `report_month` mediumint(11) unsigned DEFAULT NULL COMMENT '累積當月',
        `pfid` varchar(8) DEFAULT NULL COMMENT '主播編號',
        `duration` decimal(6,1) DEFAULT NULL COMMENT '開播時長',
        `times` smallint(11) unsigned DEFAULT NULL COMMENT '開播次數',
        `revenue` int(11) unsigned DEFAULT NULL COMMENT '開播收入',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_report_month` (`pfid`,`report_month`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上帝模式報告第一部分';
    SQL
  end

  def down
    drop_table :godview_monthly_anchors
    execute <<-SQL
      CREATE TABLE `godview_monthly_anchors` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `report_month` int(11) DEFAULT NULL COMMENT '累積當月',
        `pfid` varchar(8) DEFAULT NULL COMMENT '主播編號',
        `duration` decimal(3,1) DEFAULT NULL COMMENT '開播時長',
        `times` int(11) DEFAULT NULL COMMENT '開播次數',
        `revenue` int(11) DEFAULT NULL COMMENT '開播收入',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        KEY `idx_pfid` (`pfid`),
        KEY `idx_report_month` (`pfid`,`report_month`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上帝模式報告第一部分';
    SQL

    drop_table :godview_daily_anchors
    execute <<-SQL
      CREATE TABLE `godview_daily_anchors` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `report_date` date DEFAULT NULL COMMENT '結算日期',
        `pfid` varchar(8) DEFAULT NULL COMMENT '主播編號',
        `duration` decimal(3,1) DEFAULT NULL COMMENT '開播時長',
        `times` int(11) DEFAULT NULL COMMENT '開播次數',
        `revenue` int(11) DEFAULT NULL COMMENT '開播收入',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        KEY `idx_pfid` (`pfid`),
        KEY `idx_report_date` (`pfid`,`report_date`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上帝模式報告第一部分';
    SQL

  end
end
