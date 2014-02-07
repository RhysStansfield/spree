module Spree
  module Api
    class RefundsController < Spree::Api::BaseController
      before_filter :load_order_and_stock_return

      def create
        authorize! :create, Refund
        @refund = @stock_return.refunds.build(refund_params)
        @refund.save
        render "spree/api/refunds/show"
      end

      private

      def load_order_and_stock_return
        @order = Spree::Order.find_by(number: params[:order_id])
        @stock_return = Spree::StockReturn.find(params[:stock_return_id])
      end

      def refund_params
        params.require(:refund).permit!
      end
    end
  end
end