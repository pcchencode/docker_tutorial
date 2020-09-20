class AlterColumnForKpiAndKpiDay < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        MODIFY COLUMN `diamond` INT(11) DEFAULT 0 COMMENT '當日鑽石收入';
    SQL

  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        MODIFY COLUMN `diamond` INT(11) unsigned DEFAULT 0 COMMENT '當日鑽石收入';
    SQL
  end
end