class CreateBillingOrderUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `billing_order_users` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATE NOT NULL COMMENT '日期。',
        `new_order_user` SMALLINT(5) unsigned NOT NULL COMMENT '新付費用戶人數。',
        `order_user` SMALLINT(5) unsigned NOT NULL COMMENT '付費用戶人數（不含新付費用戶）。',
        `total_order_user` MEDIUMINT(9) unsigned NOT NULL COMMENT '總付費用戶人數。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date` (`date`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :billing_order_users
  end

end
