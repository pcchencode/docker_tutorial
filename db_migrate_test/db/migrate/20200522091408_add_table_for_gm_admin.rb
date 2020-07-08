class AddTableForGmAdmin < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE `tb_user_revenue_day` (
        `auto_id` int(11) NOT NULL AUTO_INCREMENT,
        `pfid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户pfid',
        `day` date NOT NULL COMMENT '日期utc+8',
        `recharge_total` decimal(11,2) DEFAULT NULL COMMENT '储值金额',
        `balance_total` int(10) unsigned DEFAULT '0' COMMENT '获得浪花',
        `consume_total` int(10) unsigned DEFAULT '0' COMMENT '消耗总数',
        `db_insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据写入时间utc+0',
        `db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间utc+0',
        PRIMARY KEY (`auto_id`),
        UNIQUE KEY `idx_uniq` (`pfid`,`day`),
        KEY `idx_day` (`day`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户每日充值，消费，余额汇总表 gw.yang@langlive.com';
    SQL
  end

  def down
    drop_table :tb_user_revenue_day
  end
end
