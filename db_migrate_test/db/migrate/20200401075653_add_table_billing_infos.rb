class AddTableBillingInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `billing_infos` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主鍵。',
        `date` DATE NOT NULL COMMENT '結算日期。時區：UTC±08。',
        `platform` TINYINT(4) NOT NULL COMMENT '平台分類。0：浪；1：金剛。',
        `category` TINYINT(4) NOT NULL COMMENT '虛擬物品流動分類。0：獲得虛擬物品；1：消耗虛擬物品；2：背包類；3：鑽石類；99：快照類。',
        `type` VARCHAR(100) NOT NULL COMMENT '分類代號。',
        `name` VARCHAR(100) NOT NULL COMMENT '分類名稱。',
        `n` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '紀錄筆數。',
        `gold` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浪花數。',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_platform_category_type_name_date` (`platform`,`category`,`type`,`name`,`date`),
        KEY `idx_date` (`date`),
        KEY `idx_category` (`category`),
        KEY `idx_type` (`type`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='[浪] 金流：平台金流總覽。作者：Allen<allen.chang@langlive.com>。';
    SQL
  end

  def down
    drop_table :billing_infos
  end
end
