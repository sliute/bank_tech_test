require 'time'
require_relative 'transaction_log'
require_relative 'transaction'

class BankAccount
  INITIAL_BALANCE = 0
  attr_reader :balance, :transaction_log

  def initialize
    @balance = INITIAL_BALANCE
    @transaction_log = TransactionLog.new({bank_account: self})
  end

  def deposit(amt)
    raise 'Please only use numbers to specify the amount you want to deposit.' unless amt.is_a? Numeric
    raise 'You can only deposit actual credit. To withdraw, use #withdraw(amt)' if amt <= 0
    process_transaction({type: 'deposit', amount: amt})
  end

  def withdraw(amt)
    raise 'Please only use numbers to specify the amount you want to withdraw.' unless amt.is_a? Numeric
    raise 'You can only withdraw actual debit. To deposit, use #deposit(amt)' if amt <= 0
    raise 'Nope. That\'s more money than your current balance. Please contact us for overdraft or credit facilities.' if amt > @balance
    process_transaction({type: 'withdrawal', amount: amt})
  end

  private

  def process_transaction(args = {})
    args[:type] == 'deposit' ? @balance += args[:amount] : @balance -= args[:amount]
    @transaction_log.add(Transaction.new({date: DateTime.now, type: args[:type], amount: args[:amount], balance: @balance}))
  end
end
