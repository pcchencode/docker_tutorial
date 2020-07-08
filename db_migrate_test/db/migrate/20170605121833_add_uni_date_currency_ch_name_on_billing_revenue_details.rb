class AddUniDateCurrencyChNameOnBillingRevenueDetails < ActiveRecord::Migration[5.2]
  def up
    add_index :billing_revenue_details, [:date, :currency, :ch_name], name: 'uni_date_currency_ch_name', unique: true
    remove_index :billing_revenue_details, name: 'idx_date_currency'
  end

  def down
    add_index :billing_revenue_details, [:date, :currency], name: 'idx_date_currency'
    remove_index :billing_revenue_details, name: 'uni_date_currency_ch_name'
  end
end
