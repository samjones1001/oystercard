class Journey
    attr_reader :trip
    
    def initialize
        @trip = {}
    end
    
    def start_journey(entry_station)
        trip[:entry_station] = entry_station
    end
    
    def finish_journey(exit_station)
        trip[:exit_station] = exit_station
    end
end