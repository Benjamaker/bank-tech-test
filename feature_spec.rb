require "./lib/account.rb"

account = Account.new

account.deposit(1000)

account.deposit(2000)

account.withdraw(500)

account.check_balance
