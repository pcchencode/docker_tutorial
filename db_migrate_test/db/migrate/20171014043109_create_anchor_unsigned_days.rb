class CreateAnchorUnsignedDays < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `anchor_unsigned_days` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。',
        `t_day` date NOT NULL COMMENT '計算日期',
        `valid_duration` decimal(8,2) DEFAULT '0.00' COMMENT '當日有效開播，單位秒',
        `income` int(11) unsigned DEFAULT '0' COMMENT '當日鑽石收入',
        `c_income` decimal(11,2) unsigned DEFAULT '0.00' COMMENT '當日鑽石收入(台幣)',
        `g_fan` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '新增粉絲團人數',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_t_day` (`pfid`,`t_day`),
        KEY `idx_updated_at` (`updated_at`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日非簽約主播紀錄表';
    SQL
  end

  def down
    drop_table :anchor_unsigned_days
  end
end
