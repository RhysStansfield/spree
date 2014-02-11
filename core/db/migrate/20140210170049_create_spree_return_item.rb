class CreateSpreeReturnItem < ActiveRecord::Migration
  def change
    create_table :spree_return_items do |t|
      t.integer :exchange_id
      t.integer :variant_id
      t.string :state
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
