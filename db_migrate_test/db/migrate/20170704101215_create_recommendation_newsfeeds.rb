class CreateRecommendationNewsfeeds < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `recommendation_newsfeeds` (
        `pfid` varchar(8) NOT NULL COMMENT '用戶浪代號。',
        `recom_pfid` varchar(8) NOT NULL COMMENT '推薦主播浪代號。',
        `rank` tinyint(4) unsigned NOT NULL COMMENT '推薦主播名單的排序。',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`pfid`,`recom_pfid`),
        INDEX `idx_updated_at` (`updated_at`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end

  def down
    drop_table :recommendation_newsfeeds
  end

end
