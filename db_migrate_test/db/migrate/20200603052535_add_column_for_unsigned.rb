class AddColumnForUnsigned < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD COLUMN `audio_extra_bonus` INT NOT NULL DEFAULT 0 COMMENT '音頻流水獎勵' AFTER `voice_hours`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `audio_extra_bonus` INT NOT NULL DEFAULT 0 COMMENT '音頻流水獎勵' AFTER `voice_hours`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP COLUMN `audio_extra_bonus`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `audio_extra_bonus`;
    SQL
  end
end
