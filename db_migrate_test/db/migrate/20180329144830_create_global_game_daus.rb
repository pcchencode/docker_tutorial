class CreateGlobalGameDaus < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `global_game_daus` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '建立日期。',
        `game_type` VARCHAR(45) CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL COMMENT '遊戲類型。',
        `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪ID。',
        `nickname` VARCHAR(190) CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL COMMENT '主播暱稱。',
        `dau` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT '統計人數。',
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_pfid_type` (`date`,`game_type`,`pfid`)
      ) COMMENT '[分析] 遊戲直播 DAU TOP 20：統計每日遊戲直播主的 DAU TOP 30。作者：Allen<allen.chang@langlive.com>。' ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end

  def down
    drop_table :global_game_daus
  end
end
