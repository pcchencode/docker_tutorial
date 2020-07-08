class ChangeUniKeyOnDailyAnchorKpisLogs < ActiveRecord::Migration[5.2]
  def up
    remove_index :daily_anchor_kpis_logs, name: 'pfid'
    add_index :daily_anchor_kpis_logs, [:pfid, :last_cal_date, :month], name: 'uni_pfid_last_cal_date_month', unique: true
  end

  def down
    remove_index :daily_anchor_kpis_logs, name: 'uni_pfid_last_cal_date_month'
    add_index :daily_anchor_kpis_logs, [:pfid, :month], name: 'pfid', unique: true

  end
end
