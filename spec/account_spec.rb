require "./lib/account.rb"

describe Account do

  context '#balance' do
    it "can store a balance on it" do
      expect(subject).to have_attributes(balance: 0)
    end

    it "has a method to return the balance" do
      subject.deposit(100)
      expect(subject.check_balance).to eq(100)
    end

  end

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

  context "transaction times" do
    before do
      Timecop.freeze(Time.local(2020, 3, 17, 18, 0, 0))
    end

    after do
      Timecop.return
    end

    it "records the time of a deposit" do
      subject.deposit(100)
      expect(subject.transactions.first.keys.to_s).to eq("[2020-03-17 18:00:00 +0000]")
    end

    it "records the time of a withdrawal" do
      subject.withdraw(50)
      expect(subject.transactions.first.keys.to_s).to eq("[2020-03-17 18:00:00 +0000]")
    end
  end

  context '#deposit' do
    it "can deposit money" do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end
  end

  context 'withdraw' do
    it "can withdraw money" do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.balance).to eq(50)
    end
  end
end
