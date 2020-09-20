class CreateUserDau < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `user_daus` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。',
        `new_user_count` MEDIUMINT(9) unsigned NOT NULL COMMENT '新註冊用戶數。',
        `dau` MEDIUMINT(9) unsigned NOT NULL COMMENT '每日活躍用戶（daily active user）。包含當日註冊用戶。',
        `login_count` MEDIUMINT(9) unsigned NOT NULL COMMENT '當日登入次數。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date` (`date`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :user_daus
  end
end
