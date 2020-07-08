class AddNewFieldsInAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `company_id` INT(11) unsigned DEFAULT NULL COMMENT '經紀公司',
        ADD COLUMN `op_team` INT(11) unsigned DEFAULT NULL COMMENT '所屬團隊',
        ADD COLUMN `tmp_salary_system` TINYINT(3) unsigned DEFAULT NULL COMMENT '薪資制度';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `company_id`,
        DROP COLUMN `op_team`,
        DROP COLUMN `tmp_salary_system`;
    SQL
  end
end
