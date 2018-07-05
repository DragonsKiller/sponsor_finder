class AuthenticationController < ApplicationController
  def authenticate_trader
    trader = Trader.find_for_database_authentication(email: params[:email])
    if trader.valid_password?(params[:password])
      render json: payload(trader)
    else
      render json: {errors: ['Invalid Trader name/Password']}, status: :unauthorized
    end
  end

  private

  def payload(trader)
    return nil unless trader and trader.id
    {
      auth_token: JsonWebToken.encode({trader_id: trader.id}),
      trader: {id: trader.id, email: trader.email}
    }
  end
end
