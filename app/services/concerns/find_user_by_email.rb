module FindUserByEmail
  extend ActiveSupport::Concern

  included do
    before do
      user = User.find_by(email: context.email)
      context.fail!(error: Error.record_not_found('User', 'email', context.email)) if user.nil?
      context.user = user
    end
  end
end
