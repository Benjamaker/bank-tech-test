class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def check_balance
    return @balance
  end

  def deposit(money)
    @balance += money
    record_deposit(money)
  end

  def withdraw(money)
    @balance -= money
    record_withdrawal(money)
  end

  def record_deposit(value)
    @transactions << { Time.now => [@balance, "deposit", value] }
  end

  def record_withdrawal(value)
    @transactions << { Time.now => [@balance, "withdrawal", value] }
  end

  def print_statement
    print_statement_header
    @transactions.reverse.each do |transaction|
      transaction.each do |key, value|
        if value.include? "deposit"
          puts "#{key} || #{value.last} || ---- || #{value.first}"
        elsif value.include? "withdrawal"
          puts "#{key} || ---- || #{value.last} || #{value.first}"
        end
      end
    end
  end

  private

  def print_statement_header
    puts "date || credit || debit || balance"
  end
end
