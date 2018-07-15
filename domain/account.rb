require 'json'

class Account
  attr_accessor \
    :id,
    :balance

  def initialize(id:, balance:)
    @id = id
    @balance = balance
  end

  def add_amount(amount)
    @balance = @balance + amount
  end

  def subtract_amount(amount)
    @balance = @balance - amount
  end
end
