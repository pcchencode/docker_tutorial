class CreatePermissions < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
       CREATE TABLE `permissions` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `role` VARCHAR(15) NOT NULL,
        `role_id` SMALLINT(5) unsigned NOT NULL,
        `key_id` TINYINT(4) unsigned NOT NULL,
        `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        CONSTRAINT `fk_statistic_permission` FOREIGN KEY (`key_id`) REFERENCES `platform_statistics_keys` (`key_id`),
        KEY `idx_role_id` (`role_id`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
    execute <<-SQL
      ALTER TABLE `users`
        ADD `role_id` SMALLINT(5) unsigned NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE `users`
        ADD CONSTRAINT `fk_user_permission`
        FOREIGN KEY (`role_id`) REFERENCES `permissions` (`role_id`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `users`
        DROP FOREIGN KEY `fk_user_permission`;
    SQL

    execute <<-SQL
      ALTER TABLE `users`
        DROP COLUMN `role_id`;
    SQL

    drop_table :permissions
  end
end
