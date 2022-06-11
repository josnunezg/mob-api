class ApplicationController < ActionController::API
  before_action :authorize_user!

  def current_user
    @current_user = Tokenizable::Decode.new(token).user
  end

  def token
    request.headers['Authorization']
  end

  def logged?
    current_user.present?
  end

  def authorize_user!
    return if logged?

    error = Error.unauthorized({ controller: params[:controller], action: params[:action] })

    render json: error.as_json, status: :unauthorized
  end
end
