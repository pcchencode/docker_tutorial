class AddStatusOnAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '狀態(0, 正常, 1,合約結束 )';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_logs`
        ADD COLUMN `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '狀態(0, 正常, 1,合約結束 )';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_logs`
        DROP COLUMN `status`;
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `status`;
    SQL
  end
end
