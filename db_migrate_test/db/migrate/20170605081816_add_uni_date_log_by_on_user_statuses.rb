class AddUniDateLogByOnUserStatuses < ActiveRecord::Migration[5.2]
  def up
    add_index :user_statuses, [:date, :login_by], name: 'uni_date_login_by', unique: true
    remove_index :user_statuses, name: 'idx_date'
  end

  def down
    add_index :user_statuses, :date, name: 'idx_date'
    remove_index :user_statuses, name: 'uni_date_login_by'
  end
end
