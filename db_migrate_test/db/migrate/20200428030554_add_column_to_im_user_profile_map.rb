class AddColumnToImUserProfileMap < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `im_user_profile_map`
        ADD COLUMN `lrfm_update_time` datetime DEFAULT NULL COMMENT 'im_lrfm 更新時間' AFTER `last_login_time`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `im_user_profile_map`
        DROP COLUMN `lrfm_update_time`;
    SQL
  end
end
