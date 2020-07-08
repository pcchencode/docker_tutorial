class AddTableProductInfos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `product_infos` (
        `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主鍵。',
        `date` DATETIME NOT NULL COMMENT '日期。',
        `category` VARCHAR(50) DEFAULT NULL COMMENT '報表名稱。',
        `item_name` VARCHAR(30) DEFAULT NULL COMMENT '項目名稱。',
        `value` DECIMAL(13,2) DEFAULT 0.00 COMMENT '項目價值。',
        `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_category_itemName_date` (`category`,`item_name`,`date`),
        KEY `idx_date` (`date`),
        KEY `idx_dbUpdateTime` (`db_update_time`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='[浪] 產品報表數據。作者：Allen <allen.chang@langlive.com>。';
    SQL
  end

  def down
    drop_table :product_infos
  end
end
