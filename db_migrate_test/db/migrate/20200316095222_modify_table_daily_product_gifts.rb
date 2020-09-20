class ModifyTableDailyProductGifts < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_product_gifts`
        MODIFY `prod_id` INT(11) UNSIGNED NOT NULL COMMENT '禮物代號。',
        MODIFY `prod_name` VARCHAR(44) NOT NULL COMMENT '禮物名稱。',
        MODIFY `prod_price` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '禮物價格。',
        MODIFY `used_count` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用禮物次數。',
        MODIFY `total_gold` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用禮物總浪花。',
        CHANGE `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。',
        CHANGE `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
        ADD UNIQUE `uni_prodId_date` (`prod_id`,`date`),
        ADD INDEX `idx_date` (`date`),
        DROP INDEX `uni_date_prod_id`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_product_gifts`
        ADD INDEX `uni_date_prod_id` (`date`,`prod_id`),
        DROP INDEX `idx_date`,
        DROP INDEX `uni_prodId_date`,
        CHANGE COLUMN `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        CHANGE COLUMN `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
        MODIFY `total_gold` INT(20) UNSIGNED NOT NULL COMMENT '使用禮物總浪花。',
        MODIFY `used_count` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT '使用禮物次數。',
        MODIFY `prod_price` INT(10) UNSIGNED NOT NULL COMMENT '禮物價格。',
        MODIFY `prod_name` VARCHAR(20) NOT NULL COMMENT '禮物名稱。',
        MODIFY `prod_id` INT(10) UNSIGNED NOT NULL COMMENT '禮物代號。';
    SQL
  end
end
