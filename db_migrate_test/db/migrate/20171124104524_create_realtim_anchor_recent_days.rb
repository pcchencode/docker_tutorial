class CreateRealtimAnchorRecentDays < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `realtime_anchor_recent_days` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL,
        `diamond` int(11) DEFAULT NULL,
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL

    execute <<-SQL
      CREATE TABLE `realtime_anchor_recent_hours` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL,
        `diamond` int(11) DEFAULT NULL,
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL

    execute <<-SQL
      CREATE TABLE `realtime_audience_recent_days` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL,
        `diamond` int(11) DEFAULT NULL,
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL

    execute <<-SQL
      CREATE TABLE `realtime_audience_recent_hours` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) DEFAULT NULL,
        `diamond` int(11) DEFAULT NULL,
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end

  def down
    drop_table :realtime_audience_recent_hours
    drop_table :realtime_audience_recent_days
    drop_table :realtime_anchor_recent_hours
    drop_table :realtime_anchor_recent_days
  end
end
