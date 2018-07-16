require 'test/unit'
require_relative '../../domain/account'

class TestAccount < Test::Unit::TestCase

  def test_create_a_credit_to_account_balance
    account = Account.new(id: 1, balance: 0)

    account.create_credit(1000)

    expected = {
      id: 1,
      balance: 1000
    }

    assert_equal(expected, account.to_h)
  end

  def test_create_a_debit_to_account_balance
    account = Account.new(id: 1, balance: 2000)

    account.create_debit(1000)

    expected = {
      id: 1,
      balance: 1000
    }

    assert_equal(expected, account.to_h)
  end
end
