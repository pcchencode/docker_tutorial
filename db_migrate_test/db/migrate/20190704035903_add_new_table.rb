class AddNewTable < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `anchor_pgc_performances` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主鍵ID。',
        `date` datetime NOT NULL COMMENT '日期。時區：UTC+08。',
        `pfid` int(11) NOT NULL COMMENT '用戶浪Live號。',
        `max_heat` int(11) unsigned NOT NULL COMMENT '最大火熱值。',
        `diamond` int(11) unsigned NOT NULL COMMENT '鑽石收益。',
        `pcu` smallint(6) unsigned NOT NULL COMMENT '最高同時在線用戶人數(Peak Concurrent Users)。',
        `unique_user` mediumint(9) unsigned NOT NULL COMMENT '用戶觀看人數。',
        `new_user` smallint(6) unsigned NOT NULL COMMENT '當日新用戶觀看人數。',
        `sequencial_viewing` mediumint(9) unsigned NOT NULL COMMENT '用戶連續觀看人數。',
        `fans_before_live` mediumint(9) unsigned NOT NULL COMMENT '開播前，主播粉絲數。',
        `fans_viewing` mediumint(9) unsigned NOT NULL COMMENT '粉絲觀看數。',
        `new_follower` smallint(6) unsigned NOT NULL COMMENT '當日新增追蹤用戶。',
        `new_follower_in_live` smallint(6) unsigned NOT NULL COMMENT '當日直播時新增追蹤用戶。',
        `user_viewing_times` mediumint(9) unsigned NOT NULL COMMENT '當日用戶進直播間觀看次數。',
        `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '資料建立時間。時區：UTC±00。',
        `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料更新時間。時區：UTC±00。',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_date_pfid` (`date`,`pfid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[日報] 主播：PGC(Professionally-generated Content)直播表現表。';
    SQL
  end
  
  def down
    drop_table :anchor_pgc_performances
  end
end
