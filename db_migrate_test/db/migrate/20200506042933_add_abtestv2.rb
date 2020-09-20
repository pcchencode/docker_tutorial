class AddAbtestv2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE `lang_abtest_performance_v2` (
      `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
      `cal_date` date DEFAULT NULL COMMENT '計算日期',
      `type` smallint(6) DEFAULT 1 COMMENT '日範圍',
      `start_app` smallint(6) DEFAULT 0 COMMENT '當日註冊且進入直播主頁人數',
      `stay_time` float DEFAULT 0 COMMENT '平均停留主頁時間',
      `stay_time_op` float DEFAULT 0 COMMENT '平均停留相對主頁時間',
      `slip_times` float DEFAULT 0 COMMENT '平均主頁向下滑動格數',
      `slip_times_op` float DEFAULT 0 COMMENT '平均相對主頁向下滑動格數',
      `ent_people` int(11) DEFAULT 0 COMMENT '進入該tab總人數',
      `ent_people_op` int(11) DEFAULT 0 COMMENT '進入相對tab總人數',
      `ent_times` int(11) DEFAULT 0 COMMENT '進入該tab總次數',
      `ent_times_op` int(11) DEFAULT 0 COMMENT '進入相反tab總次數',
      `retention` float DEFAULT 0 COMMENT '留存(跟著type)',
      `view_time` float DEFAULT 0 COMMENT '由tab進入直播間觀看平均時長',
      `view_time_op` float DEFAULT 0 COMMENT '由相反tab進入直播間觀看平均時長',
      `follow_number` smallint(6) DEFAULT 0 COMMENT '主要頁面追蹤主播次數',
      `follow_number_op` smallint(6) DEFAULT 0 COMMENT '相反頁面追蹤主播次數',
      `prod_total` int(11) DEFAULT 0 COMMENT '主頁頁面進房花費浪花',
      `prod_total_op` int(11) DEFAULT 0 COMMENT '相反頁面進房花費浪花',
      `db_insert_time` datetime NOT NULL DEFAULT current_timestamp(),
      `db_update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
      PRIMARY KEY (`id`),
      UNIQUE KEY `uni_key` (`type`,`cal_date`),
      KEY `idx_cal_date` (`cal_date`),
      KEY `idx_db_update_time` (`db_update_time`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='abtest_v2 評估表';
    SQL
  end

  def down
    drop_table :lang_abtest_performance_v2
  end
end
