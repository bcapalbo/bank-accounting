require_relative '../repository/account_repository'

class AccountService
  def initialize(account: AccountRepository.new)
    @account_repository = account;
  end

  def get_balance(id)
    account = @account_repository.find(id)

    account.balance
  end

  def transfer(source_account_id, destination_account_id, amount)
    source_account = @account_repository.find(source_account_id)
    destination_account = @account_repository.find(destination_account_id)

    source_account.subtract_amount(amount)
    destination_account.add_amount(amount)

    @account_repository.update_account_balance(
      source_account.id,
      source_account.balance
    )

    @account_repository.update_account_balance(
      destination_account.id,
      destination_account.balance
    )

    "a"
  end
end
