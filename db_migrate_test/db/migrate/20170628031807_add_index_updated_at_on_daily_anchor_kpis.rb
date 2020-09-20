class AddIndexUpdatedAtOnDailyAnchorKpis < ActiveRecord::Migration[5.2]
  def change
    add_index :daily_anchor_kpis, :updated_at, name: 'uni_updated_at'
  end
end
