class AddColumnsOnDailyAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis
        ADD COLUMN `incremental_fans` MEDIUMINT(8) unsigned DEFAULT 0 COMMENT '新增粉絲數',
        ADD COLUMN `share_counts` INT(11) unsigned DEFAULT 0 COMMENT '被分享數';
    SQL
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis_logs
        ADD COLUMN `incremental_fans` MEDIUMINT(8) unsigned DEFAULT 0 COMMENT '新增粉絲數',
        ADD COLUMN `share_counts` INT(11) unsigned DEFAULT 0 COMMENT '被分享數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis_logs
        DROP COLUMN `incremental_fans`,
        DROP COLUMN `share_counts`;
    SQL
    execute <<-SQL
      ALTER TABLE daily_anchor_kpis
        DROP COLUMN `incremental_fans`,
        DROP COLUMN `share_counts`;
    SQL
  end
end
