require 'spec_helper'

describe Spree::Exchange do

  let(:order) { create(:shipped_order) }
  let(:stock_return) { create(:stock_return, :order => order) }
  let(:variant) { order.variants.first }
  let(:exchange) { stock_return.exchanges.create(:variant_id => variant.id) }

  it 'creates an item to be exchanged' do
    expect(exchange.return_item.variant).to eq(variant)
  end

  it 'knows the price of the item to be exchanged' do
    expect(exchange.return_item.price).to eq(order.line_items.find_by(variant.id).price)
  end

end