require 'bank_account'

describe BankAccount do
  context 'class accepts #new' do
    subject(:bank_account_class) { described_class }

    it { is_expected.to respond_to(:new) }
  end

  context 'depositing money works' do
    subject(:bank_account) { described_class.new() }

    it 'via #deposit(amt)' do
      bank_account.deposit(500)
      expect(bank_account.balance).to eq 500
    end
  end
end
