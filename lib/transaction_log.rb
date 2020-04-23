class TransactionLog

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def record_deposit(value)
    @transactions << { Time.now => [@balance, "deposit", value] }
  end

  def record_withdrawal(value)
    @transactions << { Time.now => [@balance, "withdrawal", value] }
  end
end
