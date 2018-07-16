require_relative '../repository/account_repository'
require_relative '../exception/destination_account_does_not_exists'
require_relative '../exception/not_enough_money'

class AccountService
  def initialize(account: AccountRepository.new)
    @account_repository = account;
  end

  def get_balance(id)
    account = @account_repository.find(id)

    account.balance
  end

  def transfer(source_account_id, destination_account_id, amount)
    amount = amount.to_f
    source_account = @account_repository.find(source_account_id)

    raise NotEnoughMoney unless source_account.balance >= amount

    begin
      destination_account = @account_repository.find(destination_account_id)
    rescue AccountNotFound
      raise DestinationAccountDoesNotExists.new
    end

    source_account.create_debit(amount)
    destination_account.create_credit(amount)

    @account_repository.update_account_balance(source_account)
    @account_repository.update_account_balance(destination_account)
  end
end
