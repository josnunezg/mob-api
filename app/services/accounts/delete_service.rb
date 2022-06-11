module Accounts
  class DeleteService
    include Interactor

    delegate :id, :user, to: :context

    def call
      context.fail!(error: Error.record_invalid(account.errors)) unless account.destroy
      context.result = true
    end

    private

    def account
      @account ||= user.accounts.find(id)
    rescue ActiveRecord::RecordNotFound
      context.fail!(error: Error.record_not_found('User::Budget::Account', 'id', id))
    end
  end
end
