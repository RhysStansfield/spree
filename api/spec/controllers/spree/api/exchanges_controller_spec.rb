require 'spec_helper'

describe Spree::Api::ExchangesController do
  render_views

  before do
    stub_authentication!
  end

  let(:order) { create(:shipped_order) }
  let(:stock_return) { create(:stock_return, order: order) }

  context "as a user" do
    it "cannot create an exchange" do
      api_post :create, order_id: order.number, stock_return_id: stock_return.id
      response.status.should == 401
    end
  end

  context "as an admin" do
    sign_in_as_admin!

    it "can create an exchange" do
      api_post :create,
        order_id: order.number,
        stock_return_id: stock_return.id,
        exchange: {
          variant_id: order.variants.first.id
        }
      response.should be_success
    end
  end
end