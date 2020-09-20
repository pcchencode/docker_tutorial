class ModifyTableBillingConsumeRanks < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_consume_ranks`
        MODIFY `date` DATE NOT NULL COMMENT '日期。',
        DROP COLUMN `nickname`,
        MODIFY `total_gold` INT(11) UNSIGNED NOT NULL COMMENT '用戶總消費浪花。',
        CHANGE `created_at` `db_create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。' AFTER `total_gold`,
        CHANGE `updated_at` `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
        ADD UNIQUE `uni_pfid` (`pfid`,`date`),
        ADD INDEX `idx_date` (`date`),
        DROP INDEX `uni_date_pfid`,
        DROP INDEX `idx_date_total_gold`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_consume_ranks`
        ADD INDEX `idx_date_total_gold` (`date`,`total_gold`),
        ADD UNIQUE `uni_date_pfid` (`date`,`pfid`),
        DROP INDEX `idx_date`,
        DROP INDEX `uni_pfid`,
        CHANGE COLUMN `db_update_time` `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        CHANGE COLUMN `db_create_time` `created_at` timestamp NOT NULL DEFAULT current_timestamp() AFTER `updated_at`,
        MODIFY `total_gold` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT '用戶總消費浪花。',
        ADD COLUMN `nickname` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用戶暱稱。',
        MODIFY `date` DATETIME NOT NULL COMMENT '日期。';
    SQL
  end
end
