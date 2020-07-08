class AddColumnForYear < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_anchor_history_live_story`
        ADD COLUMN `img_cnt` INT(11) DEFAULT NULL COMMENT '封面照使用次數' AFTER `anchor_score`;
    SQL

    execute <<-SQL
      ALTER TABLE `lang_anchor_history_live_story`
        ADD COLUMN `post_comment` INT(11) DEFAULT NULL COMMENT '動態評論數' AFTER `img_cnt`;
    SQL

    execute <<-SQL
      ALTER TABLE `lang_anchor_history_live_story`
        ADD COLUMN `post_like` INT(11) DEFAULT NULL COMMENT '動態讚數' AFTER `post_comment`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_anchor_history_live_story`
        DROP COLUMN `img_cnt`;
    SQL

    execute <<-SQL
      ALTER TABLE `lang_anchor_history_live_story`
        DROP COLUMN `post_comment`;
    SQL

    execute <<-SQL
      ALTER TABLE `lang_anchor_history_live_story`
        DROP COLUMN `post_like`;
    SQL
  end
end
