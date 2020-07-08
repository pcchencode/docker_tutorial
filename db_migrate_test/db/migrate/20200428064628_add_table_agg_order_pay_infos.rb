class AddTableAggOrderPayInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        CREATE TABLE `agg_order_pay_infos` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪ID。',
          `first_pay_time` datetime NOT NULL COMMENT '用戶首次付費時間。時區：UTC±08。',
          `channel_name` varchar(45) NOT NULL COMMENT '充值渠道名稱。',
          `currency` varchar(3) NOT NULL COMMENT '國際貨幣別。參照 ISO 4217。',
          `cash` decimal(11,2) NOT NULL COMMENT '用戶首次充值金額。',
          `gold` int(11) unsigned NOT NULL COMMENT '用戶充值所獲得的浪花。',
          `last_pay_time` datetime NOT NULL COMMENT '用戶最後付費時間。時區：UTC±08。',
          `last_pay_channel_name` varchar(45) DEFAULT NULL COMMENT '最後退款渠道名稱。',
          `last_pay_currency` varchar(3) DEFAULT NULL COMMENT '最後退款渠道名稱。',
          `total_cash` decimal(11,2) unsigned NOT NULL COMMENT '用戶付費總金額(新臺幣)。',
          `total_refund` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '總退款',
          `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。',
          `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
          PRIMARY KEY (`id`),
          UNIQUE KEY `uni_pfid` (`pfid`)
        ) ENGINE=InnoDB AUTO_INCREMENT=4730652 DEFAULT CHARSET=utf8 COMMENT='[浪-聚合] 金流：用戶付費總覽。包含首次付費、最後付費及付費總金額。作者：Allen<allen.chang@langlive.com>。'
    SQL
  end

  def down
    drop_table :agg_order_pay_infos
  end
end
