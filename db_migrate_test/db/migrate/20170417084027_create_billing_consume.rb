class CreateBillingConsume < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `billing_consumes` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。',
        `consume_type` VARCHAR(4) NOT NULL COMMENT '消費類型。floating：飄屏；gift：禮物。',
        `total_gold` INT(20) unsigned NOT NULL COMMENT '用戶總消費浪花。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_consume_type` (`date`, `consume_type`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :billing_consumes
  end
end
