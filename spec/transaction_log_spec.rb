require 'transaction_log'

describe TransactionLog do
  let(:bank_account) { instance_double("BankAccount") }
  let(:transaction) { instance_double("Transaction") }
  subject(:transaction_log) { described_class.new({bank_account: bank_account}) }

  context "starts with" do
    it 'an associated bank account' do
      expect(transaction_log.bank_account).to eq bank_account
    end

    it 'an empty transactions array' do
      expect(transaction_log.transactions).to be_empty
    end
  end

  context "can" do
    it "add a transaction to its transactions array" do
      transaction_log.add(transaction)
      expect(transaction_log.transactions).to eq [transaction]
    end
  end
end
