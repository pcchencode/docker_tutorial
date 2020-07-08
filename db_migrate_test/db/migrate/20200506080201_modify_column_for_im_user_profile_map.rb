class ModifyColumnForImUserProfileMap < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `im_user_profile_map`
        MODIFY COLUMN `reg_time` datetime DEFAULT NULL COMMENT 'im註冊時間utc+0';
    SQL

    execute <<-SQL
      ALTER TABLE `lang_abtest_performance_v2`
        ADD COLUMN `cash` int(11) DEFAULT 0 COMMENT '充值金額' AFTER `prod_total_op`,
        ADD COLUMN `cash_num` int(11) DEFAULT 0 COMMENT '充值人數' AFTER `prod_total_op`;
    SQL

    execute <<-SQL
      ALTER TABLE `lang_user_profile_topn_mapping`
        ADD COLUMN `last_update_time` datetime DEFAULT NULL COMMENT '數據最後更新時間' AFTER `key_name`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `im_user_profile_map`
        MODIFY COLUMN `reg_time` datetime DEFAULT NULL COMMENT '';
    SQL
    
    execute <<-SQL
      ALTER TABLE `lang_abtest_performance_v2`
        DROP `cash`,
        DROP `cash_num`;
    SQL

    execute <<-SQL
      ALTER TABLE `lang_user_profile_topn_mapping`
        DROP `last_update_time`;
    SQL
  end
end
