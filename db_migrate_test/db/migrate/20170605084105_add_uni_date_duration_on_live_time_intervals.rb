class AddUniDateDurationOnLiveTimeIntervals < ActiveRecord::Migration[5.2]
  def up
    add_index :live_time_intervals, [:date, :duration], name: 'uni_date_duration', unique: true
    remove_index :live_time_intervals, name: 'idx_date'
  end

  def down
    add_index :live_time_intervals, :date, name: 'idx_date'
    remove_index :live_time_intervals, name: 'uni_date_duration'
  end
end
