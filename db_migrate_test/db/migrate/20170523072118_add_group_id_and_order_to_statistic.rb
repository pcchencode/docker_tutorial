class AddGroupIdAndOrderToStatistic < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `platform_statistics_keys`
        ADD `group_id` tinyint(4) unsigned NOT NULL COMMENT '數據分類',
        ADD `order` tinyint(4) unsigned NOT NULL COMMENT '欄位排序';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `platform_statistics_keys`
        DROP COLUMN `group_id`,
        DROP COLUMN `order`;
    SQL
  end
end
