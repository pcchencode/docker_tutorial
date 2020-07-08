class ModifyBillingOrderRanksCashAndRefund < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        MODIFY COLUMN `cash` DECIMAL(11,2) NOT NULL DEFAULT 0.00 COMMENT '用戶充值金額（新台幣；TWD）。',
        ADD COLUMN `refund` DECIMAL(11,2) NOT NULL DEFAULT 0.00 COMMENT '用戶退款金額（新台幣；TWD）。' AFTER `cash`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        DROP COLUMN `refund`,
      MODIFY COLUMN `cash` DECIMAL(11,2) NOT NULL COMMENT '用戶充值金額（新台幣；TWD）。';
    SQL
  end
end
