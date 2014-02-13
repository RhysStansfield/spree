module Spree
  module Api
    class ExchangesController < Spree::Api::BaseController
      before_filter :load_order_and_stock_return

      def create
        authorize! :create, Exchange
        @exchange = @stock_return.exchanges.create(exchange_params)
        render "spree/api/exchanges/show"
      end

      private

      def load_order_and_stock_return
        @order = Spree::Order.find_by(number: params[:order_id])
        @stock_return = Spree::StockReturn.find(params[:stock_return_id])
      end

      def exchange_params
        params.require(:exchange).permit!
      end
    end
  end
end