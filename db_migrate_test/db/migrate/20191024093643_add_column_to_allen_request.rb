class AddColumnToAllenRequest < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `rs_user_similar_preferences`
        ADD COLUMN `recom_reason` INT(11) UNSIGNED DEFAULT NULL COMMENT '推薦原因。一般是用戶過去最愛的主播。' AFTER `anchor_pfid`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `rs_user_similar_preferences`
        DROP COLUMN `recom_reason`;
    SQL
  end
end
