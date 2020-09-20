class CreateFriendAnchorFan < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `friend_anchor_fans` (
        `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
        `date` DATETIME NOT NULL COMMENT '日期。',
        `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。主播。',
        `nickname` VARCHAR(190) NOT NULL COMMENT '用戶暱稱。主播。',
        `new_fans` SMALLINT(6) unsigned NOT NULL COMMENT '主播新增粉絲數。',
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_pfid_date` (`pfid`, `date`)
      ) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end

  def down
    drop_table :friend_anchor_fans
  end
end
