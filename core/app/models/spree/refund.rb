module Spree
  class Refund < ActiveRecord::Base
    belongs_to :stock_return, class_name: 'Spree::StockReturn'
    belongs_to :variant, class_name: 'Spree::Variant'

    has_many :items, class_name: 'Spree::RefundItem'

    before_create :create_initial_items
    before_create :set_total_price

    def display_total_price
      Spree::Money.new(total_price, :currency => items.first.currency)
    end

    def add_quantity(amount)
      increment!(:quantity, amount)
      create_items(amount)
      set_total_price
      save
    end

    private

    def create_items(amount)
      amount.to_i.times do
        line_item = stock_return.order.find_line_item_by_variant(variant)
        items.build(
          :variant_id => variant_id, 
          :price => line_item.price,
          :currency => line_item.currency
        )
      end
    end

    def set_total_price
      self.total_price = items.map(&:price).sum
    end

    def create_initial_items
      create_items(quantity)
    end
  end
end
