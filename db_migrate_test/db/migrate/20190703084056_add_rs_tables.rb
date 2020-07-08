class AddRsTables < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE IF NOT EXISTS `rs_anchor_similar_faces` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `anchor_pfid` int(11) unsigned NOT NULL COMMENT '主播浪號。',
        `similarity_rank` smallint(6) unsigned NOT NULL COMMENT '相似排序。1：第1相似；2：第2相似⋯⋯依此類推。',
        `similar_face_pfid` int(11) unsigned NOT NULL COMMENT '相似臉的主播浪號。',
        `available` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '數據可用狀態。0：不可用；1：可用。',
        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '資料建立時間。時區：UTC±00。',
        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_anchorPfid_similarityRank` (`anchor_pfid`,`similarity_rank`),
        KEY `idx_anchorPfid_available` (`anchor_pfid`,`available`),
        KEY `idx_createTime` (`create_time`),
        KEY `idx_updateTime` (`update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[浪] 熱門頁推薦系統：主播的相似臉排名。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。';
    SQL
    execute <<-SQL
      CREATE TABLE IF NOT EXISTS `rs_user_preferences` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪號。',
        `preference_rank` smallint(6) unsigned NOT NULL COMMENT '偏好排序。1：第1偏好；2：第2偏好⋯⋯依此類推。',
        `anchor_pfid` int(11) unsigned NOT NULL COMMENT '主播浪號。',
        `available` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '數據可用狀態。0：不可用；1：可用。',
        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '資料建立時間。時區：UTC±00。',
        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_preferenceRank` (`pfid`,`preference_rank`),
        KEY `idx_anchorPfid_available` (`anchor_pfid`,`available`),
        KEY `idx_createTime` (`create_time`),
        KEY `idx_updateTime` (`update_time`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[浪] 熱門頁推薦系統：用戶對主播的偏好排名。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。';
    SQL
  end

  def down
    drop_table :rs_user_preferences
    drop_table :rs_anchor_similar_faces
  end
end
