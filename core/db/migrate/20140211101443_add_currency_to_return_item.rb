class AddCurrencyToReturnItem < ActiveRecord::Migration
  def change
    add_column :spree_return_items, :currency, :string
  end
end
