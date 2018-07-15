require 'json'

class Account
  attr_accessor \
    :id,
    :balance

  def initialize(id:, balance:)
    @id = id
    @balance = balance
  end

  def to_json
    to_h.to_json
  end

  def to_h
    {
      id: @id,
      balance: @balance
    }
  end
end
