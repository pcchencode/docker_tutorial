class AddColumnToMaxPcuLogs < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        ADD COLUMN `fix_uv` int NOT NULL DEFAULT 0 COMMENT '修正uv - 修正重複IP等等' AFTER `n_max_reg_pcu_time`,
        ADD COLUMN `o_m_user` int NOT NULL DEFAULT 0 COMMENT '一分鐘觀看人數' AFTER `fix_uv`,
        ADD COLUMN `v_duration` decimal(10, 2) NOT NULL DEFAULT 0.0 COMMENT '總觀看時長(分)' AFTER `o_m_user`,
        ADD COLUMN `n_u_follow` int NOT NULL DEFAULT 0 COMMENT '新用戶追蹤數' AFTER `v_duration`,
        MODIFY COLUMN `n_max_reg_pcu` int(11) NOT NULL DEFAULT 0  COMMENT '回推估算最大註冊用戶pcu(最高同時在線註冊用戶數)';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `max_pcu_logs`
        DROP COLUMN `fix_uv`,
        DROP COLUMN `o_m_user`,
        DROP COLUMN `v_duration`,
        DROP COLUMN `n_u_follow`,
        MODIFY COLUMN `n_max_reg_pcu` int(11) NOT NULL DEFAULT 0  COMMENT '回推估算最大註冊用戶pcu';
    SQL
  end
end
