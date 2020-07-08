class CreateDailyAnchorSocialMembers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `daily_anchor_social_members` (
        `pfid` varchar(8) NOT NULL COMMENT '浪編號',
        `duration` decimal(10,2) DEFAULT NULL COMMENT '累積開播',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`pfid`),
        KEY `idx_update` (`updated_at`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='廣場用戶表';
    SQL
  end

  def down
    drop_table :daily_anchor_social_members
  end
end
