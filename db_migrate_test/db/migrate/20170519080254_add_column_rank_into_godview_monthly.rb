class AddColumnRankIntoGodviewMonthly < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `godview_monthly_anchors`
        ADD COLUMN `rank` SMALLINT(5) unsigned DEFAULT NULL COMMENT '排名';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `godview_monthly_anchors`
        DROP COLUMN `rank`;
    SQL
  end
end
