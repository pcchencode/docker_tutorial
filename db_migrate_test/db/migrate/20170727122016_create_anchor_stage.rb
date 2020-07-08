class CreateAnchorStage < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `anchor_stages` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `pfid` int(11) unsigned NOT NULL COMMENT '主播編號',
        `month` date NOT NULL COMMENT '階段月份',
        `kpi_stage` tinyint(4) unsigned DEFAULT '1' COMMENT '階段',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立時間',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新時間',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_month_pfid` (`month`,`pfid`),
        KEY `idx_pfid` (`pfid`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主播薪資階段記錄表';
    SQL
  end

  def down
    drop_table :anchor_stages
  end
end
