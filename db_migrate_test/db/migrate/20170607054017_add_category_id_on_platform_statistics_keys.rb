class AddCategoryIdOnPlatformStatisticsKeys < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `platform_statistics_keys`
        ADD COLUMN `category_id` SMALLINT(5) unsigned DEFAULT 1 NOT NULL COMMENT '分類頁面';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `platform_statistics_keys`
        DROP COLUMN `category_id`;
    SQL
  end
end
