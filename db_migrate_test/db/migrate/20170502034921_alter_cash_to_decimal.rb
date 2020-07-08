class AlterCashToDecimal < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_order_ranks` MODIFY COLUMN `cash` DECIMAL(10,3) NOT NULL COMMENT '用戶充值金額（新台幣；TWD）。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_first_orders` MODIFY COLUMN `cash` DECIMAL(10,3) NOT NULL COMMENT '用戶首次充值金額。';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_first_orders` MODIFY COLUMN `cash` DECIMAL(11,3) NOT NULL COMMENT '用戶首次充值金額。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_order_ranks` MODIFY COLUMN `cash` MEDIUMINT(20) unsigned NOT NULL COMMENT '用戶充值金額（新台幣；TWD）。'
    SQL
  end
end
