class CreateUvCoe < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `tb_uv_coe` (
        `tp` int(10) unsigned NOT NULL COMMENT '计算类型,1=uv.',
        `wd` tinyint(3) unsigned NOT NULL COMMENT 'weekday index(0 = Monday, 1 = Tuesday, … 6 = Sunday).',
        `coe` tinyint(4) NOT NULL DEFAULT '1' COMMENT '系数',
        `notes` varchar(255) DEFAULT NULL COMMENT '注释',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入时间',
        `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`tp`,`wd`),
        KEY `idx_update` (`updated_at`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计计算参数表';
    SQL

    execute <<-SQL
      INSERT INTO `tb_uv_coe` VALUES
        ('1', '0', '4', null, '2018-06-05 14:12:29', '2018-06-05 14:12:29'),
        ('1', '1', '5', null, '2018-06-05 14:12:29', '2018-06-05 14:12:29'),
        ('1', '2', '4', null, '2018-06-05 14:12:29', '2018-06-05 14:12:29'),
        ('1', '3', '4', null, '2018-06-05 14:12:29', '2018-06-05 14:12:29'),
        ('1', '4', '5', null, '2018-06-05 14:12:29', '2018-06-05 14:12:29'),
        ('1', '5', '5', null, '2018-06-05 14:12:29', '2018-06-05 14:12:29'),
        ('1', '6', '5', null, '2018-06-05 14:12:29', '2018-06-05 14:12:29');
    SQL
  end

  def down
    drop_table :tb_uv_coe
  end
end
