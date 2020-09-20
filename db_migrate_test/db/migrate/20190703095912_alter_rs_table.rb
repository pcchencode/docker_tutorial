class AlterRsTable < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE IF NOT EXISTS `rs_user_similar_preferences` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `pfid` INT(11) UNSIGNED NOT NULL COMMENT '用戶浪號。',
        `preference_rank` SMALLINT(6) UNSIGNED NOT NULL COMMENT '推薦排序。1：第1推薦；2：第2推薦⋯⋯依此類推。',
        `anchor_pfid` INT(11) UNSIGNED NOT NULL COMMENT '主播浪號。',
        `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '資料建立時間。時區：UTC±00。',
        `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_preferenceRank` (`pfid`,`preference_rank`),
        KEY `idx_createTime` (`create_time`),
        KEY `idx_updateTime` (`update_time`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[浪] 熱門頁推薦系統：用戶相似偏好推薦。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。';
    SQL

    execute <<-SQL
        ALTER TABLE rs_user_preferences DROP INDEX idx_anchorPfid_available 
    SQL

    execute <<-SQL
        ALTER TABLE rs_anchor_similar_faces DROP INDEX idx_anchorPfid_available 
    SQL

    remove_column :rs_user_preferences, :available
    remove_column :rs_anchor_similar_faces, :available

    execute <<-SQL
      ALTER TABLE `rs_anchor_similar_faces` ADD COLUMN `distance` DECIMAL(8,6) DEFAULT NULL COMMENT '相似度距離。'
    SQL

  end

  def down
    remove_column :rs_anchor_similar_faces, :distance

    execute <<-SQL
      ALTER TABLE `rs_user_preferences` ADD COLUMN `available` tinyint(4) unsigned NOT NULL DEFAULT '0' AFTER `anchor_pfid` COMMENT '數據可用狀態。0：不可用；1：可用。'
    SQL

    execute <<-SQL
      ALTER TABLE `rs_anchor_similar_faces` ADD COLUMN `available` tinyint(4) unsigned NOT NULL DEFAULT '0' AFTER `similar_face_pfid` COMMENT '數據可用狀態。0：不可用；1：可用。'
    SQL

    execute <<-SQL
      CREATE INDEX `idx_anchorPfid_available` ON rs_anchor_similar_faces(`anchor_pfid`,`similarity_rank`) 
    SQL

    execute <<-SQL
      CREATE INDEX idx_anchorPfid_available ON rs_user_preferences(`anchor_pfid`,`similarity_rank`) 
    SQL
    
    drop_table :rs_user_similar_preferences
  end
end
