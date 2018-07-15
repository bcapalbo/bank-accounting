require_relative '../repository/account_repository'

class AccountService
  def initialize(account: AccountRepository.new)
    @account_repository = account;
  end

  def get_balance(id)
    account = @account_repository.find(id)

    account.balance
  end
end
