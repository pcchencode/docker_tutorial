class AddColumnLastSixDurationOnMonthlyKpi < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `last_six_m_duration` DECIMAL(11,2) NOT NULL DEFAULT 0 COMMENT '近六個月開播時長' AFTER `lang_diamond`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `last_six_m_duration`;
    SQL
  end
end
