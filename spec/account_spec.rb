require "./lib/account.rb"

describe Account do

  context '#balance' do
    it "can store a balance on it" do
      expect(subject).to have_attributes(balance: 0)
    end
  end
end
