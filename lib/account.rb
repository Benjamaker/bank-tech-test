require_relative "transaction_log"
require_relative "statement"

class Account

  attr_reader :balance

  def initialize(transaction_log = TransactionLog.new, statement = Statement.new)
    @balance = 0
    @transaction_log = transaction_log
    @statement = statement
  end

  def check_balance
    return @balance
  end

  def deposit(money)
    @balance += money
    @transaction_log.record_deposit(money)
  end

  def withdraw(money)
    @balance -= money
    @transaction_log.record_withdrawal(money)
  end



  def print_statement
    print_statement_header
    @statement.print_statement
  end

  def print_statement_header
    puts "date || credit || debit || balance"
  end
end
