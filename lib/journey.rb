class Journey

	attr_reader :new_journey

	def start_journey(entry_station)
		@new_journey = {:start => entry_station, :end => nil}
		@new_journey
	end

	def finish_journey(exit_station)
		@new_journey[:end] = exit_station
		@new_journey
	end

end