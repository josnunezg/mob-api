module Users
  class LoginService
    include Interactor

    delegate :email, :password, to: :context

    def call
      context.fail!(error: Error.unauthorized('login')) unless user.authenticate(password)
      context.token = generator.token
    end

    private

    def generator
      @generator ||= Tokenizable::Generate.new(user)
    end

    def user
      @user ||= ::User.find_by!(email: email)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User', 'email', email))
    end
  end
end
