class IncreaseFieldOnTableAnchorUnisgnedMonths < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        MODIFY `valid_duration` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT '累積當月有效開播，單位秒';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        MODIFY `valid_duration` DECIMAL(8,2) NOT NULL DEFAULT '0.00' COMMENT '累積當月有效開播，單位秒';
    SQL
  end
end
