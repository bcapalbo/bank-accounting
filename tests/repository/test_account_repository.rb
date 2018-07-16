require 'test/unit'
require 'mocha/test_unit'
require_relative '../../repository/account_repository'
require_relative '../../exception/account_not_found'

class TestAccountRepository < Test::Unit::TestCase

  def test_find_an_unexistent_account
    assert_raise(AccountNotFound) {
      database = mock
      database_query = mock
      query_result = mock

      database.expects('client').returns(database_query)
      database_query.expects('query').returns(query_result)
      query_result.expects('first').returns(nil)

      account_repository = AccountRepository.new(database: database)

      account_repository.find(99999)
    }
  end

  def test_find_an_existent_account
    database = mock
    database_query = mock
    query_result = mock

    database.expects('client').returns(database_query)
    database_query.expects('query').returns(query_result)
    query_result.expects('first').returns(
      {
        'id' => 1,
        'balance' => 1300
      }
    )

    expected = {
      'id': 1,
      'balance': 1300
    }

    account_repository = AccountRepository.new(database: database)

    actual = account_repository.find(1)

    assert_equal(expected, actual.to_h)
  end
end
