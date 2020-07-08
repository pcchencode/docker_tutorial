class CreateDailyBigRInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `daily_big_r_infos` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` varchar(8) NOT NULL COMMENT '用戶編號',
        `cal_date` date NOT NULL,
        `locale` varchar(8) NOT NULL COMMENT '幣值',
        `cash` decimal(10,2) NOT NULL COMMENT '儲值金額',
        `total_cash` decimal(10,2) NOT NULL COMMENT '總儲值金額台幣',
        `last_order_time` timestamp NULL DEFAULT NULL COMMENT '最近一次儲值時間',
        `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最近一次登入時間',
        `last_consume_time` timestamp NULL DEFAULT NULL COMMENT '最近一次送禮時間',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `pfid` (`pfid`,`cal_date`,`locale`)
      ) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8 COMMENT='10萬大R分析';
    SQL
  end

  def down
    drop_table :daily_big_r_infos
  end
end
