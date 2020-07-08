class AddBillingAnswerCashier < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE `billing_answer_cashier` (
      `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
      `fund_day` date DEFAULT NULL COMMENT '预计打款日',
      `pfid` int(10) unsigned NOT NULL COMMENT '数字ID',
      `cash` decimal(10,2) DEFAULT NULL COMMENT '提現金額',
      `cash_real` decimal(10,2) DEFAULT NULL COMMENT '真实到账',
      `db_insert_time` datetime NOT NULL DEFAULT current_timestamp(),
      `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
      PRIMARY KEY (`id`),
      UNIQUE KEY `uni_key` (`pfid`,`fund_day`),
      KEY `idx_cal_date` (`fund_day`),
      KEY `idx_db_update_time` (`db_update_time`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='巨浪淘金智付通提現記錄_by人日group';
    SQL
  end

  def down
    drop_table :billing_answer_cashier
  end
end
