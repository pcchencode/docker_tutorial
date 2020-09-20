class AddColumnToMaxPcuLog < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        ADD COLUMN `n_max_pcu` INT(11) NOT NULL DEFAULT 0 COMMENT '回推估算最大pcu' AFTER `reg_pcu`,
        ADD COLUMN `n_max_pcu_time` datetime DEFAULT NULL COMMENT '回推估算最大pcu發生時間' AFTER `n_max_pcu`,
        ADD COLUMN `n_max_reg_pcu` INT(11) NOT NULL DEFAULT 0 COMMENT '回推估算最大註冊用戶pcu' AFTER `n_max_pcu_time`,
        ADD COLUMN `n_max_reg_pcu_time` datetime DEFAULT NULL COMMENT '回推估算最大註冊用戶pcu發生時間' AFTER `n_max_reg_pcu`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        DROP COLUMN `n_max_pcu`,
        DROP COLUMN `n_max_pcu_time`,
        DROP COLUMN `n_max_reg_pcu`,
        DROP COLUMN `n_max_reg_pcu_time`;
    SQL
  end
end
