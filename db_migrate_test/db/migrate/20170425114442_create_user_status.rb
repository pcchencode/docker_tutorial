class CreateUserStatus < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `user_statuses` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。',
        `login_by` VARCHAR(4) NOT NULL COMMENT '用戶登入來源。GG for Google; WX for WeChat; FB for Facebook; CELL for cellphone',
        `new_user_count` INT(11) unsigned NOT NULL COMMENT '新註冊用戶數。',
        `login_count` INT(11) unsigned NOT NULL COMMENT '用戶登入次數。',
        `uniq_login_count` INT(11) unsigned NOT NULL COMMENT '登入用戶數（去重）。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        INDEX `idx_date` (`date`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :user_statuses
  end
end
