module Tokenizable
  class Decode
    SECRET = Generate::SECRET
    ALGORITHM = Generate::ALGORITHM

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def user
      return if token.nil?

      @user ||= ::User.find_by(id: user_id)
    rescue StandardError => e
      Rails.logger.error e
      nil
    end

    def decoded
      @decoded ||= ::JWT.decode(token, SECRET, true, { algorithm: ALGORITHM })
    end

    def user_id
      decoded.first['id']
    end
  end
end
