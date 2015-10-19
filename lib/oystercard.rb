class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "This would take the balance over #{LIMIT}" if (balance + amount) > LIMIT
    @balance += amount
  end

end
