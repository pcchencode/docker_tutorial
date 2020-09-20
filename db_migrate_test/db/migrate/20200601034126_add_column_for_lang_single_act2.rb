class AddColumnForLangSingleAct2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_single_act`
        ADD COLUMN `types` tinyint DEFAULT 0 COMMENT '活動類型' AFTER `cal_date`,
        ADD INDEX `idx_types` (`types`);
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE `lang_single_act`
        DROP INDEX `idx_types`,
        DROP COLUMN `types`;
      SQL
  end
end
