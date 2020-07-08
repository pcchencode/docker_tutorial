class AddLangAbtestPerformance < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `lang_abtest_performance` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `type` char(5) DEFAULT NULL COMMENT 'tab名稱',
        `cal_date` date DEFAULT NULL COMMENT '計算日期',
        `start_app` smallint(6) DEFAULT NULL COMMENT '當日註冊且進入直播主頁人數',
        `stay_time` float DEFAULT NULL COMMENT '平均停留主頁時間',
        `slip_times` float DEFAULT NULL COMMENT '平均主頁向下滑動格數',
        `ent_times` smallint(6) DEFAULT NULL COMMENT '進入該tab總次數',
        `ent_times2` smallint(6) DEFAULT NULL COMMENT '進入相反tab總次數',
        `retention2` smallint(6) DEFAULT NULL COMMENT '次留 需進入直播主頁',
        `retention3` smallint(6) DEFAULT NULL COMMENT '三留 需進入直播主頁',
        `view_time` float DEFAULT NULL COMMENT '由tab進入直播間觀看平均時長',
        `fan_anchor` smallint(6) DEFAULT NULL COMMENT '加入粉絲團主播數',
        `fan_pfid` smallint(6) DEFAULT NULL COMMENT '加入粉絲團用戶數',
        `fan` smallint(6) DEFAULT NULL COMMENT '加入粉絲團次數',
        `follow_anchor` smallint(6) DEFAULT NULL COMMENT '追蹤主播主播數',
        `follow_pfid` smallint(6) DEFAULT NULL COMMENT '追蹤主播用戶數',
        `follow` smallint(6) DEFAULT NULL COMMENT '追蹤主播次數',
        `num_share` smallint(6) DEFAULT NULL COMMENT '分享直播間次數',
        `share_pfid` smallint(6) DEFAULT NULL COMMENT '分享直播間人數',
        `num_order` smallint(6) DEFAULT NULL COMMENT '首充人數',
        `cash` int(10) DEFAULT NULL COMMENT '充值金額',
        `gold` int(10) DEFAULT NULL COMMENT '充值浪花',
        `extra_gold` int(10) DEFAULT NULL COMMENT '充值額外浪花',
        `num_consume` smallint(6) DEFAULT NULL COMMENT '花費浪花人數',
        `prod_total` int(10) DEFAULT NULL COMMENT '花費浪花',
        `db_insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
          PRIMARY KEY (`id`),
          UNIQUE KEY `uni_key` (`type`,`cal_date`),
          KEY `idx_cal_date` (`cal_date`),
          KEY `idx_db_update_time` (`db_update_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='abtest 評估表';
    SQL
  end
  
  def down
    drop_table :lang_abtest_performance
  end
end
