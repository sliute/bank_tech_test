require 'bank_account'

describe BankAccount do
  context '#new works' do
    subject(:bank_account_class) { described_class }
    it { is_expected.to respond_to(:new) }
  end
end
