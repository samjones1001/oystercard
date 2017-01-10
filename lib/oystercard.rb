class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1
    
    attr_reader :balance
    attr_reader :journeys
    
    def initialize
        @entry_station = nil
        @balance = 0
        @journey = {}
        @journeys = []
    end

    def top_up(amount)
        raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
        @balance += amount
    end

    def touch_in(station)
      raise 'Sorry your balance is too low' if balance < MINIMUM_BALANCE
        journey[:entry_station] = station
    end

    def touch_out(station)
        deduct(MINIMUM_FARE)
        journey[:exit_station] = station
        journeys << journey
        @journey = {}
        station
    end
    
    private
    
    attr_reader :journey
    
    #def in_journey?
    #    !!@entry_station
    #end
    
    def deduct(amount)
      @balance -= amount
    end
end