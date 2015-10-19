class Oystercard
  attr_reader :balance, :in_journey
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "This would take the balance over #{LIMIT}" if (balance + amount) > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    in_journey
  end

  def touch_in
    raise "Insufficient balance" if balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
