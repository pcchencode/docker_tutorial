class CreateMaxPcuLogs < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `max_pcu_logs` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
        `pfid` int(8) DEFAULT NULL COMMENT '主播編號',
        `live_id` varchar(18) DEFAULT NULL COMMENT '房間編號',
        `max_pcu` int(11) DEFAULT NULL COMMENT '最大PCU',
        `pcu_reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最大PCU發生時間點（擇一）',
        `commercial_duration` int(11) DEFAULT NULL COMMENT '總工商時間',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_live_id` (`pfid`,`live_id`),
        KEY `idx_pcu_reg_time` (`pcu_reg_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每個房間最大pcu紀錄表';
    SQL
  end

  def down
    drop_table :max_pcu_logs
  end
end
