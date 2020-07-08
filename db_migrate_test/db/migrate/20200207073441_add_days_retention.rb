class AddDaysRetention < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_monthly_retention` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `reg_time` datetime DEFAULT NULL,
        `diff_month` int(11) DEFAULT NULL,
        `val` int(11) DEFAULT NULL,
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`reg_time`,`diff_month`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    SQL

    execute <<-SQL
      CREATE TABLE `lang_weekly_retention` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `reg_time` datetime DEFAULT NULL,
        `diff_week` int(11) DEFAULT NULL,
        `val` int(11) DEFAULT NULL,
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`reg_time`,`diff_week`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    SQL

    execute <<-SQL
      CREATE TABLE `lang_daily_retention` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `reg_time` datetime DEFAULT NULL,
        `diff_day` int(11) DEFAULT NULL,
        `val` int(11) DEFAULT NULL,
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`reg_time`,`diff_day`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    SQL
  end
  
  def down
    drop_table :lang_daily_retention
    drop_table :lang_weekly_retention
    drop_table :lang_monthly_retention
  end
end
