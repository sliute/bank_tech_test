class BankAccount
  attr_reader :balance

  def initialize()
    @balance = 0
  end

  def deposit(amt)
    raise 'Please only use numbers to specify the amount you want to deposit.' unless amt.is_a? Numeric
    raise 'You can only deposit actual credit. To withdraw, use #withdraw(amt)' if amt <= 0
    @balance += amt
  end

  def withdraw(amt)
    raise 'Please only use numbers to specify the amount you want to withdraw.' unless amt.is_a? Numeric
    raise 'You can only withdraw actual debit. To deposit, use #deposit(amt)' if amt <= 0
    raise 'Nope. That\'s more money than your current balance. Please contact us for overdraft or credit facilities.' if amt > @balance
    @balance -= amt
  end
end
