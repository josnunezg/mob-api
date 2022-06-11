module Users
  class LoginService
    include Interactor
    include ::FindUserByEmail

    delegate :user, :password, to: :context

    def call
      context.fail!(error: Error.unauthorized('login')) unless user.authenticate(password)
      context.token = generator.token
    end

    private

    def generator
      @generator ||= Tokenizable::Generate.new(user)
    end
  end
end
