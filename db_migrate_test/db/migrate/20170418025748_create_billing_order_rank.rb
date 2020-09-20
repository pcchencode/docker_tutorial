class CreateBillingOrderRank < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `billing_order_ranks` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` VARCHAR(7) NOT NULL COMMENT '用戶浪代號。',
        `date` DATETIME NOT NULL COMMENT '日期。',
        `cash` MEDIUMINT(20) unsigned NOT NULL COMMENT '用戶充值金額（新台幣；TWD）。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_date` (`pfid`, `date`),
        INDEX `idx_cash` (`cash`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :billing_order_ranks
  end
end
