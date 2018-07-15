require_relative '../domain/account'
require_relative '../infra/bank_database'

class AccountRepository
  def initialize(database: nil)
    @database = database || BankDatabase.new
  end
  def find(id)
    result = @database.client.query("""
      SELECT
        *
      FROM
        account
      WHERE
        account.id = #{id}"""
    ).first

    Account.new(id: result['id'], balance: result['balance'])
  end
end

