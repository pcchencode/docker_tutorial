class AddColumnToTopsTable < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `platform_anchor_rankings`
        ADD COLUMN `normal_income` INT(11) NOT NULL DEFAULT 0 COMMENT '一般送禮浪花' AFTER `income`,
        ADD COLUMN `lucky_income` INT(11) NOT NULL DEFAULT 0 COMMENT '爆擊禮物浪花' AFTER `normal_income`,
        ADD COLUMN `diamond` INT(11) NOT NULL DEFAULT 0 COMMENT '主播收鑽' AFTER `lucky_income`,
        MODIFY COLUMN `income` INT(11) NOT NULL DEFAULT 0 COMMENT '用戶送禮浪花';
    SQL

    execute <<-SQL
      ALTER TABLE `lang_abtest_performance`
        ADD COLUMN `ent_people` smallint(6) DEFAULT NULL COMMENT '進入該tab總人數' AFTER `slip_times`,
        ADD COLUMN `ent_people2` smallint(6) DEFAULT NULL COMMENT '進入相反tab總人數' AFTER `slip_times`; 
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `platform_anchor_rankings`
        DROP COLUMN `normal_income`,
        DROP COLUMN `lucky_income`
        DROP COLUMN `diamond`,
        MODIFY COLUMN `income` INT(11) NOT NULL DEFAULT 0 COMMENT '收入';;
    SQL

    execute <<-SQL
      ALTER TABLE `lang_abtest_performance`
        DROP COLUMN `ent_people`,
        DROP COLUMN `ent_people2`;
    SQL
  end
end
