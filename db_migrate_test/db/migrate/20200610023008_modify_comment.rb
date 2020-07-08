class ModifyComment < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        MODIFY COLUMN `voice_hours` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '音頻開播時長(秒)';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        MODIFY COLUMN `voice_hours` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '音頻開播時長(秒)';
    SQL
  end
end
