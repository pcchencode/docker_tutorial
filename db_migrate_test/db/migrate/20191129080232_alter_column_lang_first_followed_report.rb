class AlterColumnLangFirstFollowedReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_first_followed_report`
        MODIFY COLUMN `remd_folow_users` INT(11) NOT NULL DEFAULT 0 COMMENT '有推薦有追蹤主播數';
    SQL

    execute <<-SQL
      ALTER TABLE `lang_first_followed_report`
        MODIFY COLUMN `n_remd_folow_users` INT(11) NOT NULL DEFAULT 0 COMMENT '無推薦有追蹤主播數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_first_followed_report`
        MODIFY COLUMN `remd_folow_users` INT(11) NOT NULL DEFAULT 0 COMMENT '有推薦有追蹤人數';
    SQL

    execute <<-SQL
      ALTER TABLE `lang_first_followed_report`
        MODIFY COLUMN `n_remd_folow_users` INT(11) NOT NULL DEFAULT 0 COMMENT '無推薦有追蹤人數';
    SQL
  end
end
