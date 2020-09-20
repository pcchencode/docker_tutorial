class AddColumnToLangRecommendPerformance < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_recommend_performance`
        ADD COLUMN `tracked_times` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '追蹤人次' AFTER `tracked_anchor`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_recommend_performance`
        DROP COLUMN `tracked_times`;
    SQL
  end
end
