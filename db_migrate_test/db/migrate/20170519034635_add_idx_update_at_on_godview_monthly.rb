class AddIdxUpdateAtOnGodviewMonthly < ActiveRecord::Migration[5.2]
  def change
    add_index :godview_monthly_anchors, :updated_at
  end
end
