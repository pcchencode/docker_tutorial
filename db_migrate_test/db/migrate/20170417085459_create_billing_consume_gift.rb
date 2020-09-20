class CreateBillingConsumeGift < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
       CREATE TABLE `billing_consume_gifts` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。',
        `prod_name` VARCHAR(20) NOT NULL COMMENT '禮物名稱。',
        `prod_price` INT(10) unsigned NOT NULL COMMENT '禮物價格。',
        `person_number` MEDIUMINT(9) unsigned NOT NULL COMMENT '使用禮物人數。',
        `used_count` MEDIUMINT(9) unsigned NOT NULL COMMENT '使用禮物次數。',
        `total_gold` INT(20) unsigned NOT NULL COMMENT '使用禮物總浪花。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_prod_name` (`date`, `prod_name`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :billing_consume_gifts
  end
end
