require 'statement'

describe Statement do
  let(:bank_account) { instance_double("BankAccount") }
  let(:transaction_log) { instance_double("TransactionLog") }
  subject(:statement) { described_class.new(bank_account) }

  context 'starts with' do
    it 'a transaction log associated with a bank account' do
      allow(bank_account).to receive(:transaction_log) { transaction_log }
      expect(statement.transaction_log).to eq transaction_log
    end
  end

  context 'can' do
    let(:tran_1) { instance_double("Transaction") }
    let(:tran_2) { instance_double("Transaction") }
    let(:tran_3) { instance_double("Transaction") }

    it 'print that transaction log in a given format' do
      populate_transactions
      allow(transaction_log). to receive(:transactions) { [tran_1, tran_2, tran_3] }
      allow(bank_account).to receive(:transaction_log) { transaction_log }
      message = "date       || credit  || debit   || balance\n14/01/2012 ||         ||  500.00 || 2500.00\n13/01/2012 || 2000.00 ||         || 3000.00\n10/01/2012 || 1000.00 ||         || 1000.00"
      expect(statement.list).to eq message
    end
  end
end

def populate_transactions
  allow(tran_1).to receive_messages(date: DateTime.parse("10/01/2012 14:00"), type: 'deposit', amount: 1000, balance: 1000)
  allow(tran_2).to receive_messages(date: DateTime.parse("13/01/2012 15:00"), type: 'deposit', amount: 2000, balance: 3000)
  allow(tran_3).to receive_messages(date: DateTime.parse("14/01/2012 16:00"), type: 'withdrawal', amount: 500, balance: 2500)
end
