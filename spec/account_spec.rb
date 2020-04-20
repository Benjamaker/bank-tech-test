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
