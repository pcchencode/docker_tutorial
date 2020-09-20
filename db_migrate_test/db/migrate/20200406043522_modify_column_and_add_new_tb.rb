class ModifyColumnAndAddNewTb < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lucky_report_daily`
        DROP INDEX `uni_key`,
        ADD COLUMN `typ` INT NOT NULL DEFAULT 1 COMMENT '1:幸運,2:黃金,3:日抽' AFTER `cal_date`,
        ADD UNIQUE `uni_key` (`typ`,`cal_date`);
    SQL

    execute <<-SQL
      ALTER TABLE `lucky_report_daily_2`
        DROP INDEX `uni_key`,
        ADD COLUMN `typ` INT NOT NULL DEFAULT 1 COMMENT '1:幸運,2:黃金,3:日抽' AFTER `cal_date`,
        ADD UNIQUE `uni_key` (`typ`,`cal_date`);
    SQL

  end

  def down
    execute <<-SQL
      ALTER TABLE `lucky_report_daily_2`
        DROP INDEX `uni_key`,
        DROP COLUMN `typ`,
        ADD UNIQUE `uni_key` (`cal_date`);
    SQL

    execute <<-SQL
      ALTER TABLE `lucky_report_daily`
        DROP INDEX `uni_key`,
        DROP COLUMN `typ`,
        ADD UNIQUE `uni_key` (`cal_date`);
    SQL

  end
end
