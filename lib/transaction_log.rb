class TransactionLog
  attr_reader :bank_account, :transactions

  def initialize(args = {})
    @bank_account = args[:bank_account]
    @transactions = []
  end

  def add(transaction)
    @transactions << transaction
  end
end
