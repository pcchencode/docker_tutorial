class ModifyLenghtByKeyId < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `platform_statistics_keys_mapping`
        MODIFY COLUMN `key_id` int(11) NOT NULL COMMENT '數據欄位代碼';
    SQL
    
    execute <<-SQL
      ALTER TABLE `platform_daily_statistics`
        MODIFY COLUMN `key_id` int(11) NOT NULL COMMENT '數據欄位定義代碼';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `platform_statistics_keys_mapping`
        MODIFY COLUMN `key_id` tinyint(4) NOT NULL COMMENT '數據欄位代碼';
    SQL

    execute <<-SQL
      ALTER TABLE `platform_daily_statistics`
        MODIFY COLUMN `key_id` tinyint(4) NOT NULL COMMENT '數據欄位定義代碼';
    SQL
  end
end
