class CreateSpreeExchanges < ActiveRecord::Migration
  def change
    create_table :spree_exchanges do |t|
      t.integer :stock_return_id

      t.timestamps
    end
  end
end
