class ModifyTableBillingOrderUsersTotalCash < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_order_users`
        MODIFY `total_cash` decimal(11,2) NOT NULL COMMENT '用戶充值金額(新台幣；TWD)。';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_order_users`
        MODIFY `total_cash` decimal(10,3) NOT NULL COMMENT '用戶充值金額(新台幣；TWD)。';
    SQL
  end
end
