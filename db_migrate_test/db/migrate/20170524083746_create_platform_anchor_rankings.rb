class CreatePlatformAnchorRankings < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `platform_anchor_rankings` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `report_date` date NOT NULL COMMENT '結算日期',
        `rank` tinyint(4) unsigned NOT NULL COMMENT '排名',
        `pfid` varchar(8) NOT NULL COMMENT '用戶浪代號。主播。',
        `nickname` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '暱稱',
        `income` int(11) unsigned NOT NULL  COMMENT '收入',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_platform_anchor_rankings` (`report_date`, `rank`),
        KEY `idx_updated_at` (`updated_at`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日主播榜';
    SQL
  end

  def down
    drop_table :platform_anchor_rankings
  end
end
