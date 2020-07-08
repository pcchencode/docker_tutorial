class AddColumnToUnsigned < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD COLUMN `voice_diamond` INT(11) NOT NULL DEFAULT 0 COMMENT '音頻收入';
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `voice_diamond` INT(11) NOT NULL DEFAULT 0 COMMENT '音頻收入';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP COLUMN `voice_diamond`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `voice_diamond`;
    SQL
  end
end
