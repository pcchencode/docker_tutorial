class CreateUserAliveNDay < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `user_alive_n_days` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。結算日。',
        `retention_unit` TINYINT(4) unsigned NOT NULL COMMENT '第 n 天用戶留存。從結算日往前追朔 3、7、30 日（不含結算日）。',
        `retaintion` MEDIUMINT(9) unsigned NOT NULL COMMENT '留存人數。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        INDEX `idx_date` (`date`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :user_alive_n_days
  end
end
