class ModifyRankOnRecommandationNewsfeeds < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `recommendation_newsfeeds`
        MODIFY `rank` SMALLINT(5) unsigned NOT NULL COMMENT '推薦主播名單的排序。';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `recommendation_newsfeeds`
        MODIFY `rank` TINYINT(4) unsigned NOT NULL COMMENT '推薦主播名單的排序。';
    SQL
  end

end
