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
  end

  context 'withdrawing money works' do
    it 'via #withdraw(amt)' do
      bank_account.deposit(500)
      bank_account.withdraw(50)
      expect(bank_account.balance).to eq 450
    end
  end
end
