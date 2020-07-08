class AddTableEatchickenActivity < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `pkchicken_growth_qualify` (
        `pfid` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主播編號',
        `deleted` TINYINT(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否刪除',
        `upstandard_mins` smallint(6) NOT NULL DEFAULT 0 COMMENT '達標時數',
        `upstandard_diamonds` INT(11) NOT NULL DEFAULT 0 COMMENT '達標鑽石數',
        `db_insert_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00',
        PRIMARY KEY (`pfid`),
        KEY `idx_db_update_time` (`db_update_time`),
        KEY `idx_deleted` (`deleted`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='pk吃雞發育賽資格';
    SQL
    execute <<-SQL
      CREATE TABLE `pkchicken_anchor_ratio` (
        `pfid` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主播編號',
        `ratio` float NOT NULL DEFAULT 0 COMMENT '是否刪除',
        `total_mins` smallint(6) NOT NULL DEFAULT 0 COMMENT '七日內開播分鐘數',
        `total_diamond` INT(11) NOT NULL DEFAULT 0 COMMENT '達標鑽石數',
        `db_insert_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT '資料建立時間。時區：UTC±00',
        `db_update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料更新時間。時區：UTC±00',
        PRIMARY KEY (`pfid`),
        KEY `idx_db_update_time` (`db_update_time`)
      ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='pk吃雞賽主播小時收益比值';
    SQL
  end

  def down
    drop_table :pkchicken_growth_qualify
    drop_table :pkchicken_anchor_ratio
  end
end
