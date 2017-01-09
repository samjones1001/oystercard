class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1
    
    attr_reader :entry_station
    attr_reader :balance


    def initialize
        @entry_station = nil
        @balance = 0
    end

    def top_up(amount)
        raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def touch_in(station)
      raise 'Sorry your balance is too low' if balance < MINIMUM_BALANCE
        @entry_station = station
    end

    def touch_out
        deduct(MINIMUM_FARE)
        @entry_station = nil
    end
    
    private
    
    def in_journey?
        !!@entry_station
    end
    
    def deduct(amount)
      @balance -= amount
    end
end