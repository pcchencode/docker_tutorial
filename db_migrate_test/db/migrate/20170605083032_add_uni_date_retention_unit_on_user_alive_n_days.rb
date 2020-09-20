class AddUniDateRetentionUnitOnUserAliveNDays < ActiveRecord::Migration[5.2]
  def up
    add_index :user_alive_n_days, [:date, :retention_unit], name: 'uni_date_retention_unit', unique: true
    remove_index :user_alive_n_days, name: 'idx_date'
  end

  def down
    add_index :user_alive_n_days, :date, name: 'idx_date'
    remove_index :user_alive_n_days, name: 'uni_date_retention_unit'
  end
end
