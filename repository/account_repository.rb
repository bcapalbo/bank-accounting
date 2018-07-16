require_relative '../domain/account'
require_relative '../infra/bank_database'

class AccountRepository
  def initialize(database: nil)
    @table = 'account'
    @database = database || BankDatabase.new
  end

  def find(id)
    result = @database.client.query("""
      SELECT
        *
      FROM
        #{@table}
      WHERE
        #{@table}.id = #{id}"""
    ).first

    Account.new(id: result['id'], balance: result['balance'])
  end

  def update_account_balance(account)
    @database.client.query("""
      UPDATE
        #{@table}
      SET
        balance = #{account.balance}
      WHERE
        #{@table}.id = #{account.id}"""
    )
  end
end

