class ModifyOrderChannel < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_order_channel_stat`
        MODIFY COLUMN `total_cash` DECIMAL(15,3) NOT NULL DEFAULT 0 COMMENT '總金額';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_order_channel_stat`
        MODIFY COLUMN `total_cash` int(11) NOT NULL DEFAULT 0 COMMENT '總金額';
    SQL
  end
end
