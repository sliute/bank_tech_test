require 'bank_account'

describe BankAccount do
  subject(:bank_account) { described_class.new() }

  context 'class accepts #new' do
    subject(:bank_account_class) { described_class }

    it { is_expected.to respond_to(:new) }
  end

  context 'depositing money works' do
    it 'via #deposit(amt)' do
      bank_account.deposit(500)
      expect(bank_account.balance).to eq 500
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

  context 'withdrawing money works' do
    it 'via #withdraw(amt)' do
      bank_account.deposit(500)
      bank_account.withdraw(50)
      expect(bank_account.balance).to eq 450
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
