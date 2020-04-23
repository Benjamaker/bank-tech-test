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

  context '#print_statement' do
    it "prints with the header" do
      expect{subject.print_statement}.to output("date || credit || debit || balance\n").to_stdout
    end

    it "prints the statement in reverse chronological order" do
      Timecop.freeze(Time.local(2020, 4, 20, 11, 0, 0))
      subject.deposit(100)
      Timecop.freeze(Time.local(2020, 4, 21, 13, 0, 0))
      subject.withdraw(50)
      expect{subject.print_statement}.to output("date || credit || debit || balance\n2020-04-21 13:00:00 +0100 || ---- || 50 || 50\n2020-04-20 11:00:00 +0100 || 100 || ---- || 100\n").to_stdout
    end

  end
end
