require 'test/unit'
require 'mocha/test_unit'
require_relative '../../services/account_service'
require_relative '../../exception/account_not_found'
require_relative '../../exception/destination_account_does_not_exists'
require_relative '../../exception/not_enough_money'


class TestAccountService < Test::Unit::TestCase

  def test_getting_balance_for_an_account
    account_repository = mock
    account = mock
    id = 1

    account.expects('balance').returns(3000)
    account_repository.expects('find').with(id).returns(account)

    account_service = AccountService.new(account_repository: account_repository)

    expected = 3000

    assert_equal(expected, account_service.get_balance(id))
  end

  def test_transfer_amount_to_another_account
    account_repository = mock
    source_account_id = 1
    destination_account_id = 9
    amount = 1000
    source_account = mock
    destination_account = mock

    source_account.expects('balance').returns(1000)

    account_repository.stubs('find').returns(source_account, destination_account)

    source_account.expects('create_debit').with(amount)
    destination_account.expects('create_credit').with(amount)

    account_repository.expects('update_account_balance').twice

    account_service = AccountService.new(account_repository: account_repository)

    account_service.transfer(source_account_id, destination_account_id, amount)
  end

  def test_try_to_transfer_amount_to_unexistent_account
    assert_raise(DestinationAccountDoesNotExists) {
      account_repository = mock
      source_account_id = 1
      destination_account_id = 9
      amount = 1000
      source_account = mock

      source_account.expects('balance').returns(1000)

      account_repository.stubs('find').returns(source_account).then.raises(AccountNotFound)

      account_service = AccountService.new(account_repository: account_repository)

      account_service.transfer(source_account_id, destination_account_id, amount)
    }
  end

  def test_try_to_transfer_amount_with_not_enough_balance
    assert_raise(NotEnoughMoney) {
      account_repository = mock
      source_account_id = 1
      destination_account_id = 9
      amount = 1000
      source_account = mock

      account_repository.expects('find').returns(source_account)

      source_account.expects('balance').returns(0)

      account_service = AccountService.new(account_repository: account_repository)

      account_service.transfer(source_account_id, destination_account_id, amount)
    }
  end
end
