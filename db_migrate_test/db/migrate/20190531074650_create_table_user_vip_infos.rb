class CreateTableUserVipInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE IF NOT EXISTS `user_vip_infos` (
		  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
		  `pfid` INT(11) NOT NULL COMMENT 'VIP 浪號。',
		  `vip_level` TINYINT(4) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'VIP 等級。',
		  `vip_time` DATETIME NOT NULL COMMENT '用戶成為 VIP 的時間。時區：UTC±08。',
		  `last_login_time` DATETIME NOT NULL COMMENT 'VIP 最後登錄時間。時區：UTC±08。',
		  `last_pay_time` DATETIME NOT NULL COMMENT 'VIP 最後儲值時間。時區：UTC±08。',
		  `last_consume_time` DATETIME DEFAULT NULL COMMENT 'VIP 最後消費時間。時區：UTC±08。',
		  `total_cash` DECIMAL(12,3) UNSIGNED NOT NULL COMMENT 'VIP 總充值金額。貨幣：新臺幣。',
		  `mthly_cash` DECIMAL(12,3) UNSIGNED NOT NULL COMMENT 'VIP 月充值金額。貨幣：新臺幣。',
		  `wkly_cash` DECIMAL(12,3) UNSIGNED NOT NULL COMMENT 'VIP 週充值金額。貨幣：新臺幣。',
		  `daily_cash` DECIMAL(12,3) UNSIGNED NOT NULL COMMENT 'VIP 日充值金額。貨幣：新臺幣。',
		  `currency` VARCHAR(3) NOT NULL DEFAULT 'TWD' COMMENT 'VIP 最常使用的國際貨幣別(ISO 4217)。',
		  `balance` INT(11) UNSIGNED NOT NULL COMMENT 'VIP 剩餘浪花。',
		  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
		  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `uni_pfid` (`pfid`),
		  KEY `idx_vipLevel` (`vip_level`),
		  KEY `idx_lastLoginTime` (`last_login_time`),
		  KEY `idx_updateTime` (`update_time`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[浪] 用戶：VIP 總覽。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。';
    SQL
    execute <<-SQL
		CREATE TABLE IF NOT EXISTS `user_vip_donate_infos` (
		  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
		  `pfid` INT(11) NOT NULL COMMENT 'VIP 浪號。',
		  `rank_type` TINYINT(4) UNSIGNED NOT NULL COMMENT 'VIP 貢獻榜類型。0：總榜；1：週榜。',
		  `rank` TINYINT(4) UNSIGNED NOT NULL COMMENT '貢獻榜序號。',
		  `anchor_pfid` INT(11) NOT NULL COMMENT '主播浪號。',
          `anchor_nickname` VARCHAR(190) CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL COMMENT '主播暱稱。',
		  `diamond` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'VIP 貢獻主播的鑽石數。',
		  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
		  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `uni_pfid_rankType_rank` (`pfid`,`rank_type`,`rank`),
		  KEY `idx_updateTime` (`update_time`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[浪] 用戶：VIP 貢獻總覽。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。';
	SQL
  end

  def down
    drop_table :user_vip_donate_infos
    drop_table :user_vip_infos
  end
end
