class AddVariantIdToExchanges < ActiveRecord::Migration
  def change
    add_column :spree_exchanges, :variant_id, :integer
  end
end
