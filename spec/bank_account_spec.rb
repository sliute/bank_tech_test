require 'bank_account'

describe BankAccount do
  subject(:bank_account) { described_class.new() }
  let(:transaction_log) { instance_double("TransactionLog") }

  context 'starts with' do
    it 'a default balance' do
      expect(bank_account.balance).to eq described_class::INITIAL_BALANCE
    end

    it 'an associated transaction log' do
      expect(bank_account.transaction_log).to be_a TransactionLog
    end
  end

  context 'can be used to deposit money' do
    it 'via #deposit(amt)' do
      bank_account.deposit(500)
      expect(bank_account.balance).to eq 500
      expect(bank_account.transaction_log.transactions[0].balance).to eq 500
    end

    it 'and only with numbers' do
      message = 'Please only use numbers to specify the amount you want to deposit.'
      expect{ bank_account.deposit('twenty quid') }.to raise_error(message)
    end

    it 'and only with positive amounts' do
      message = 'You can only deposit actual credit. To withdraw, use #withdraw(amt)'
      expect{ bank_account.deposit(-100) }.to raise_error(message)
    end
  end

  context 'can be used to withdraw money' do
    it 'via #withdraw(amt)' do
      bank_account.deposit(500)
      bank_account.withdraw(50)
      expect(bank_account.balance).to eq 450
      expect(bank_account.transaction_log.transactions[1].balance).to eq 450
    end

    it 'and only with numbers' do
      message = 'Please only use numbers to specify the amount you want to withdraw.'
      expect{ bank_account.withdraw(:dinero) }.to raise_error(message)
    end

    it 'and only with positive amounts' do
      message = 'You can only withdraw actual debit. To deposit, use #deposit(amt)'
      expect{ bank_account.withdraw(-100) }.to raise_error(message)
    end

    it 'and only within your balance limit' do
      message = 'Nope. That\'s more money than your current balance. Please contact us for overdraft or credit facilities.'
      bank_account.deposit(500)
      expect{ bank_account.withdraw(501) }.to raise_error(message)
    end
  end
end
