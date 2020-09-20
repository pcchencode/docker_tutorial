class AddColumnOpenHoursToDailyAnchorKpis < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `open_hours` decimal(7,4) DEFAULT NULL COMMENT '實際開播時長' AFTER `valid_hours`;
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        CHANGE COLUMN `actural_pay` `actual_pay` decimal(10,4) DEFAULT NULL COMMENT '當月累積成本',
        CHANGE COLUMN `actural_pay_now` `actual_pay_now` decimal(10,4) DEFAULT NULL COMMENT '當月累積成本至今';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        CHANGE COLUMN `actual_pay` `actural_pay` decimal(10,4) DEFAULT NULL COMMENT '當月累積成本',
        CHANGE COLUMN `actual_pay_now` `actural_pay_now` decimal(10,4) DEFAULT NULL COMMENT '當月累積成本至今';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `open_hours`;
    SQL
  end
end
