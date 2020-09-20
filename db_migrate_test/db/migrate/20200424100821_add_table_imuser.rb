class AddTableImuser < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        CREATE TABLE `im_user_profile_map` (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `pfid` int(11) DEFAULT NULL,
          `moyin_id` int(11) DEFAULT NULL,
          `nickname` varchar(256) DEFAULT NULL,
          `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别：0未知1男2女',
          `sex_judged` tinyint(1) NOT NULL DEFAULT 0 COMMENT '判定性別:0-未判定 1-男 2-女',
          `birthday` date DEFAULT NULL,
          `mobile` varchar(50) DEFAULT NULL,
          `reg_time` datetime DEFAULT NULL,
          `origin` tinyint(3) DEFAULT NULL COMMENT '註冊来源，1wechat，2fb，3g+，4手机，5line',
          `upload_cts` smallint(6) unsigned NOT NULL DEFAULT 0 COMMENT '影片上傳總數',
          `last_upload_time` datetime DEFAULT NULL COMMENT '最後上傳時間',
          `last_login_time` datetime DEFAULT NULL COMMENT '最後登入時間',
          `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '系統建立時間',
          `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '系統更新時間',
          PRIMARY KEY (`id`),
          UNIQUE KEY `uni_key` (`pfid`),
          KEY `idx_moyin_id` (`moyin_id`),
          KEY `idx_last_upload_time` (`last_upload_time`),
          KEY `idx_last_login_time` (`last_login_time`),
          KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='IM用戶訊息+浪對應表'
    SQL
  end
  
  def down
    drop_table :im_user_profile_map
  end
end
