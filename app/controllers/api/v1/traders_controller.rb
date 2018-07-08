module Api::V1
  class TradersController < ApplicationController
    def index
      @traders = Trader.all
      render json: @traders
    end
  end
end
