class CreateUserAlive < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `user_retentions` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。結算日期。',
        `register_date` DATETIME NOT NULL COMMENT '用戶註冊日期。',
        `retention` SMALLINT(6) unsigned NOT NULL COMMENT '用戶留存數。',
        `register_count` SMALLINT(6) unsigned NOT NULL COMMENT '用戶註冊數。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_register_date` (`date`, `register_date`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :user_retentions
  end
end
