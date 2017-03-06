class BankAccount
  attr_reader :balance, :log, :statement

  def initialize(args = {})
    @balance = 0
    @log = []
    @statement = "date       || credit || debit   || balance"
  end

  def deposit(amt)
    raise 'Please only use numbers to specify the amount you want to deposit.' unless amt.is_a? Numeric
    raise 'You can only deposit actual credit. To withdraw, use #withdraw(amt)' if amt <= 0
    process_transaction(1, amt)
  end

  def withdraw(amt)
    raise 'Please only use numbers to specify the amount you want to withdraw.' unless amt.is_a? Numeric
    raise 'You can only withdraw actual debit. To deposit, use #deposit(amt)' if amt <= 0
    raise 'Nope. That\'s more money than your current balance. Please contact us for overdraft or credit facilities.' if amt > @balance
    process_transaction(2, amt)
  end

  private

  def process_transaction(transaction_id, amt)
    if transaction_id == 1
      @balance += amt
      @log << [Time.now, amt, '', @balance]
    else
      @balance -= amt
      @log << [Time.now, '', amt, @balance]
    end
    @statement.insert(42, "\n" + @log.last[0].strftime('%d/%m/%Y') + ' || ' + @log.last[1].to_s + ' || ' + @log.last[2].to_s + ' || ' + @log.last[3].to_s)
  end
end
