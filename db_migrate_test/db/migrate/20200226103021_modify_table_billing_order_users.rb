class ModifyTableBillingOrderUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_order_users`
        ADD COLUMN `total_cash` decimal(10,3) NOT NULL COMMENT '用戶充值金額(新台幣；TWD)。' AFTER `total_order_user`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_order_users`
        DROP COLUMN `total_cash`;
    SQL
  end
end
