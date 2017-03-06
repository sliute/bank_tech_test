class BankAccount
  attr_reader :balance

  def initialize()
    @balance = 0
  end

  def deposit(amt)
    @balance += amt
  end

  def withdraw(amt)
    @balance -= amt
  end
end
