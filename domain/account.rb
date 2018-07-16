require 'json'

class Account
  attr_accessor \
    :id,
    :balance

  def initialize(id:, balance:)
    @id = id
    @balance = balance
  end

  def create_credit(amount)
    @balance = @balance + amount
  end

  def create_debit(amount)
    @balance = @balance - amount
  end

  def to_h
    {
      id: @id,
      balance: @balance
    }
  end
end
