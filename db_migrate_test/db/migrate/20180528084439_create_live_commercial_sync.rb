class CreateLiveCommercialSync < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_live_commercial_sync` (
        `id` int(10) unsigned NOT NULL,
        `duration` int(11) DEFAULT NULL COMMENT '时长，单位：秒',
        `pcu_max` int(11) DEFAULT NULL COMMENT 'MAX PCU值',
        `max_at` datetime DEFAULT NULL COMMENT 'MAX PCU发生时刻',
        `dw_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `dw_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`),
        KEY `idx_dw_update` (`dw_updated_at`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播工商同步表’;'
    SQL
  end

  def down
    drop_table :tb_live_commercial_sync
  end
end
