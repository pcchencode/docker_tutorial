class AddColumnsToAggOrderPayInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `agg_order_pay_infos`
        ADD COLUMN `last_subscription_time` datetime DEFAULT NULL COMMENT '最後訂閱時間' AFTER `total_refund`,
        ADD COLUMN `subscriptions_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '目前訂閱狀態 0:無訂閱 1:訂閱中' AFTER `total_refund`;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE `agg_order_pay_infos`
        DROP COLUMN `subscriptions_status`,
        DROP COLUMN `last_subscription_time`;
      SQL
  end
end
