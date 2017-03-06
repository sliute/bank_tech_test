class Transaction
  attr_reader :type, :amount, :date, :balance

  def initialize(args = {})
    @date = args[:date]
    @type = args[:type]
    @amount = args[:amount]
    @balance = args[:balance]
  end
end
