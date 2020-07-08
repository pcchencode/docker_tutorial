class AddColumnToAggOrderPayInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `agg_order_pay_infos`
        ADD COLUMN `last_pay_cash` decimal(11,2) DEFAULT 0.00 COMMENT '用戶最近一次充值金額(原幣別)。' AFTER `last_pay_currency`;
    SQL
    execute <<-SQL
          ALTER TABLE `lang_user_profile_topn`
        ADD COLUMN `value2` varchar(30) DEFAULT '' AFTER `value`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_user_profile_topn`
        DROP COLUMN `value2`;
    SQL
    execute <<-SQL
      ALTER TABLE `agg_order_pay_infos`
        DROP COLUMN `last_pay_cash`;
    SQL
  end
end
