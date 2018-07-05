class ApplicationController < ActionController::API
  attr_reader :current_trader

  protected
  def authenticate_request!
    unless trader_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_trader = Trader.find(auth_token[:trader_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private
  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def trader_id_in_token?
    http_token && auth_token && auth_token[:trader_id].to_i
  end
end
