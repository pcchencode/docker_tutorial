class AddcolLangPrfile < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_user_profile`
        ADD COLUMN `last_msg_time` datetime DEFAULT NULL COMMENT '最後私信時間' AFTER `msg_users`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_user_profile`
        DROP COLUMN `last_msg_time`;
    SQL
  end
end
