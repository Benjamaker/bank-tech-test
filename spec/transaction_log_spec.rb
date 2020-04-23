require "./lib/transaction_log.rb"

describe TransactionLog do

  # let(:account) { double("account") }

  context '#transactions' do
    it "initializes with an empty list of transactions" do
      expect(subject).to have_attributes(transactions: [])
    end

    it "records a deposit" do
      expect{subject.record_deposit(100)}.to change{subject.transactions.length}.by 1
    end

    it "records a withdrawal" do
      expect{subject.record_withdrawal(100)}.to change{subject.transactions.length}.by 1
    end
  end

  context 'transaction times' do
    before do
      Timecop.freeze(Time.local(2020, 3, 17, 18, 0, 0))
      # allow(account).to receive(:deposit)
      # allow(account).to receive(:withdraw)
    end

    after do
      Timecop.return
    end


    it "records the time of a deposit" do
      subject.record_deposit(100)
      expect(subject.transactions.first.keys.to_s).to eq("[2020-03-17 18:00:00 +0000]")
    end

    it "records the time of a withdrawal" do
      subject.record_withdrawal(50)
      expect(subject.transactions.first.keys.to_s).to eq("[2020-03-17 18:00:00 +0000]")
    end
  end
end
