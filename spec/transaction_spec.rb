require 'transaction'

describe Transaction do
  let(:date) { DateTime.now }
  let(:type) { 'deposit' }
  let(:amount) { 500 }
  let(:balance) { 500 }
  subject(:transaction) { described_class.new({balance: balance, type: type, amount: amount, date: date}) }

  context 'can store' do
    it 'a date' do
      expect(transaction.date).to eq date
    end

    it 'a type' do
      expect(transaction.type).to eq type
    end

    it 'a amount' do
      expect(transaction.amount).to eq amount
    end

    it 'a resulting balance' do
      expect(transaction.balance).to eq balance
    end
  end
end
