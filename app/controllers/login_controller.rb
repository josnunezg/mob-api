class LoginController < ApplicationController
  skip_before_action :authorize_user!

  def create
    service = Users::LoginService.call(login_params)

    if service.success?
      render json: { token: service.token }, status: :ok
    else
      render json: service.error.as_json, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
