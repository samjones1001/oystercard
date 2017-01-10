class Station
  attr_reader :name
  attr_reader :zone

  def initialize(station)
    @name = station[:name]
    @zone = station[:zone]

  end
end
