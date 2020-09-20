class AddTableForVoiceReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_audio_daily` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `cal_date` date DEFAULT NULL COMMENT '計算日期(關播)',
        `pfid` int(11) DEFAULT NULL COMMENT '主播編號',
        `live_id` varchar(200) DEFAULT NULL COMMENT 'Live_id',
        `duration` float NOT NULL DEFAULT 0 COMMENT '總開播時長（分鐘)',
        `diamond` int(11) NOT NULL DEFAULT 0 COMMENT '主播收入鑽石數',
        `balance` int(11) NOT NULL DEFAULT 0 COMMENT '用戶花費浪花數',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `idx_uni_key` (`live_id`, `cal_date`),
        KEY `idx_cal_date` (`cal_date`),
        KEY `idx_pfid` (`pfid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='音頻場次數據表';
    SQL
  end
  
  def down
    drop_table :lang_audio_daily
  end
end
