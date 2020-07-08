class AddColumnsAbtest < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_abtest_performance`
        ADD COLUMN `num_consume_s` smallint(6) DEFAULT NULL COMMENT '消費人數-預設頁面進入直播間' AFTER `prod_total`,
        ADD COLUMN `prod_total_s` int(10) DEFAULT NULL COMMENT '消費浪花-預設頁面進入直播間' AFTER `num_consume_s`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_abtest_performance`
        DROP COLUMN `num_consume_s`,
        DROP COLUMN `prod_total_s`;
    SQL
  end
end
