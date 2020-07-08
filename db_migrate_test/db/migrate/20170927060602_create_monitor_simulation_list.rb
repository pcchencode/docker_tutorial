class CreateMonitorSimulationList < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `monitor_simulation_lists` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) unsigned DEFAULT NULL,
        `reg_date` datetime DEFAULT NULL,
        `ent_ip` varchar(15) DEFAULT NULL,
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_reg_date` (`pfid`,`reg_date`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end

  def down
    drop_table :monitor_simulation_lists
  end
end
