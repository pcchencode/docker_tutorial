class ModifyColumnGm2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `tb_user_revenue_day`
        MODIFY COLUMN `recharge_total` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '储值金额';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `tb_user_revenue_day`
        MODIFY COLUMN `recharge_total` decimal(11,2) DEFAULT 0.00 COMMENT '储值金额';
    SQL
  end
end
