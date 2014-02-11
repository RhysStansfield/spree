module Spree
  class Exchange < ActiveRecord::Base
    belongs_to :stock_return, class_name: 'Spree::StockReturn'
    belongs_to :variant, class_name: 'Spree::Variant'

    has_one :return_item, class_name: 'Spree::ReturnItem'

    before_create :create_return_item

    private

    def create_return_item
      line_item = stock_return.order.find_line_item_by_variant(variant)
      self.return_item = ReturnItem.create(
        :variant_id => variant_id, 
        :price => line_item.price,
        :currency => line_item.currency
      )
    end
  end
end