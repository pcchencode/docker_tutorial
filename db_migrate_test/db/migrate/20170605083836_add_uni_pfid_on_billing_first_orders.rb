class AddUniPfidOnBillingFirstOrders < ActiveRecord::Migration[5.2]
  def up
    add_index :billing_first_orders, :pfid, name: 'idx_pfid', unique: true
  end

  def down
    remove_index :billing_first_orders, name: 'idx_pfid'
  end
end
