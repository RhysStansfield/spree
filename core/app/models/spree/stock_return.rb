module Spree
  class StockReturn < ActiveRecord::Base
    belongs_to :order, class_name: 'Spree::Order'
    has_many :refunds, class_name: 'Spree::Refund'
    has_many :exchanges, class_name: 'Spree::Exchange'
  end
end
