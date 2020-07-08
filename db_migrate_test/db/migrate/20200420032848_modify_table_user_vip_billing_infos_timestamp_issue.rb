class ModifyTableUserVipBillingInfosTimestampIssue < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `user_vip_billing_infos`
        MODIFY COLUMN `db_create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00。',
        MODIFY COLUMN `db_update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00。';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `user_vip_billing_infos`
        MODIFY COLUMN `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00。',
        MODIFY COLUMN `db_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00。';
    SQL
  end
end
