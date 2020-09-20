class AddLangFirstFollowedRecommend < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_first_followed_recommend` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `t_pfid` int(11) DEFAULT NULL COMMENT '主播號',
        `ratio` decimal(5,2) DEFAULT NULL COMMENT '粉絲追蹤率',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_key` (`t_pfid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播首次被追蹤率報表';
    SQL
  end
  
  def down
    drop_table :lang_first_followed_recommend
  end
end
