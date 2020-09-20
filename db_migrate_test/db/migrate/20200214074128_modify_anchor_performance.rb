class ModifyAnchorPerformance < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        MODIFY COLUMN `live_min` int(11) NOT NULL COMMENT '總開播時長(分鐘)';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_performance`
        MODIFY COLUMN `live_min` tinyint(5) NOT NULL COMMENT '總開播時長(分鐘)';
    SQL
  end
end
