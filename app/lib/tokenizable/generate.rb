module Tokenizable
  class Generate
    SECRET = Rails.application.credentials.jwt_secret
    ALGORITHM = 'HS256'

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def token
      ::JWT.encode(payload, SECRET, ALGORITHM)
    end

    def payload
      {
        id: user.id
      }
    end
  end
end
