require_relative '../../infra/bank_database'

class BankMigration
  def self.migrate()
    @database = BankDatabase.new

    self.accounts
  end

  private
  def self.accounts()
    tables = @database.client.query('SHOW TABLES')
    tables.each do |row|
      return if row.has_value?('account')
    end

    @database.client.query("""
      CREATE TABLE account (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        balance FLOAT NOT NULL
      )
    """)

    @database.client.query("""
      INSERT INTO `account` (`id`, `balance`) VALUES (NULL, '3000');
    """)

    @database.client.query("""
      INSERT INTO `account` (`id`, `balance`) VALUES (NULL, '0');
    """)

    @database.client.query("""
      INSERT INTO `account` (`id`, `balance`) VALUES (NULL, '20000');
    """)

    @database.client.query("""
      INSERT INTO `account` (`id`, `balance`) VALUES (NULL, '500');
    """)
  end
end
