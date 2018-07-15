require_relative '../domain/account'

class AccountRepository
  def find(id)
    account = Account.new(id: id, balance: rand(0...1000));
  end
end

