class DailyProductGift < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `daily_product_gifts` (
        `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '日期。',
        `prod_id` int(10) UNSIGNED NOT NULL COMMENT '禮物代號。',
        `prod_name` varchar(20) NOT NULL COMMENT '禮物名稱。',
        `prod_price` int(10) unsigned NOT NULL COMMENT '禮物價格。',
        `person_number` mediumint(9) unsigned NOT NULL COMMENT '使用禮物人數。',
        `used_count` mediumint(9) unsigned NOT NULL COMMENT '使用禮物次數。',
        `total_gold` int(20) unsigned NOT NULL COMMENT '使用禮物總浪花。',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_prod_id` (`date`,`prod_id`)
        ) COMMENT '[日報] 商品-禮物：禮物統計。' ENGINE=InnoDB DEFAULT CHARSET=utf8;
    SQL
  end

  def down
    drop_table :daily_product_gifts
  end
end
