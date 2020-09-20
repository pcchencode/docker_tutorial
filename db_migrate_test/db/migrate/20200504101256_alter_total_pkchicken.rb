class AlterTotalPkchicken < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `total_pkchicken_report`
        DROP INDEX uni_key,
        DROP `act_name`,
        ADD COLUMN `serial` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '吃鸡赛期号' AFTER `id`,
        ADD UNIQUE `uni_key` (`serial`,`race_name`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `total_pkchicken_report`
        DROP INDEX uni_key,
        DROP `serial`,
        ADD COLUMN `act_name` varchar(60) NOT NULL DEFAULT '' COMMENT '活動名稱' AFTER `id`,
        ADD UNIQUE `uni_key` (`act_name`,`race_name`);
    SQL
  end
end
