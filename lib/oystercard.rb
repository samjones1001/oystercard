class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1

    attr_reader :balance
    attr_reader :in_journey
    
    def initialize
        @in_journey = false
        @balance = 0
    end

    def top_up(amount)
        raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def touch_in
      raise 'Sorry your balance is too low' if balance < MINIMUM_BALANCE
        @in_journey = true
    end

    def touch_out
        deduct(MINIMUM_FARE)
        @in_journey = false
    end
    
    private
    
    def deduct(amount)
      @balance -= amount
    end
end