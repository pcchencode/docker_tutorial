class AddColumnPaymentToBillingOrderRank < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_order_ranks` 
      ADD COLUMN `payments` SMALLINT(6) UNSIGNED DEFAULT NULL COMMENT '付費次數。' AFTER `date`;
    SQL

    execute <<-SQL
      ALTER TABLE `billing_order_ranks` 
      ADD COLUMN `exp` INT(11) UNSIGNED DEFAULT NULL COMMENT '用戶經驗。' AFTER `cash`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        DROP COLUMN `exp`;
    SQL

    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        DROP COLUMN `payments`;
    SQL
  end
end
