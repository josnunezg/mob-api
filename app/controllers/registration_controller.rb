class RegistrationController < ApplicationController
  skip_before_action :authorize_user!

  def create
    service = Users::CreateService.call(params: registration_params)

    if service.success?
      head :ok
    else
      render json: service.error.as_json, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user)
          .permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
