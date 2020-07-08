class NobleLevelCalDay < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `noble_daily` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主鍵ID。',
        `cal_date` date NOT NULL COMMENT '日期。時區：UTC+08。',
        `noble_id` int(11) NOT NULL COMMENT '貴族階級id',
        `members` int(11) unsigned NOT NULL COMMENT '用戶數',
        `db_insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。',
        `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`noble_id`, `cal_date`),
        KEY `cal_date` (`cal_date`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='貴族日報統計表';
    SQL
  end
  
  def down
    drop_table :noble_daily
  end
end
