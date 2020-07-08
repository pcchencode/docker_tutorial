class AddColumnsAbtest2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_abtest_performance`
        ADD COLUMN `num_consume_c` smallint(6) DEFAULT NULL COMMENT '消費人數-比較頁面進入直播間' AFTER `prod_total_s`,
        ADD COLUMN `prod_total_c` int(10) DEFAULT NULL COMMENT '消費浪花-比較頁面進入直播間' AFTER `num_consume_c`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_abtest_performance`
        DROP COLUMN `num_consume_c`,
        DROP COLUMN `prod_total_c`;
    SQL
  end
end
