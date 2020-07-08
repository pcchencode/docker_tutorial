class AlterRptFansTablesReindex < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `rpt_fans_expireds`
        DROP INDEX `uni_cal_date_t_pfid`;
    SQL
    execute <<-SQL
      ALTER TABLE `rpt_fans_expireds`
        ADD INDEX `uni_cal_date_t_pfid_pfid` (`cal_date`, `t_pfid`, `pfid`);
    SQL
    execute <<-SQL
      ALTER TABLE `rpt_fans_continues`
        DROP INDEX `uni_cal_date_pfid_t_pfid`;
    SQL
    execute <<-SQL
      ALTER TABLE `rpt_fans_continues`
        ADD INDEX `uni_cal_date_t_pfid_pfid` (`cal_date`, `t_pfid`, `pfid`);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `rpt_fans_continues`
        DROP INDEX `uni_cal_date_t_pfid_pfid`;
    SQL
    execute <<-SQL
      ALTER TABLE `rpt_fans_continues`
        ADD INDEX `uni_cal_date_pfid_t_pfid` (`cal_date`, `pfid`, `t_pfid`);
    SQL
    execute <<-SQL
      ALTER TABLE `rpt_fans_expireds`
        DROP INDEX `uni_cal_date_t_pfid_pfid`;
    SQL
    execute <<-SQL
      ALTER TABLE `rpt_fans_expireds`
        ADD INDEX `uni_cal_date_t_pfid` (`cal_date`, `t_pfid`);
    SQL
  end

end
