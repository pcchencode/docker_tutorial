class AddColumnForDailyAndMonth < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `audio_extra_bonus` INT NOT NULL DEFAULT 0 COMMENT '音頻流水獎勵' AFTER `last_six_m_duration`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `audio_extra_bonus` INT NOT NULL DEFAULT 0 COMMENT '音頻流水獎勵' AFTER `voice_hours`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `audio_extra_bonus`;
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `audio_extra_bonus`;
    SQL
  end
end
