class Statement
  attr_reader :transaction_log

  def initialize(bank_account)
    @transaction_log = bank_account.transaction_log
  end

  def list
    @listing = "date       || credit  || debit   || balance"
    @transaction_log.transactions.each do |transaction|
      if transaction.type == 'deposit'
        @listing.insert(43, "\n" + transaction.date.strftime('%d/%m/%Y') + ' || ' + ('%.02f' % transaction.amount).rjust(7) + ' ||         || ' + ('%.02f' % transaction.balance))
      else
        @listing.insert(43, "\n" + transaction.date.strftime('%d/%m/%Y') + ' ||         || ' + ('%.02f' % transaction.amount).rjust(7) + ' || ' + ('%.02f' % transaction.balance))
      end
    end
    @listing
  end
end
