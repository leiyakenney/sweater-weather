class Antipode
  attr_reader :id,
              :coordinates,
              :summary,
              :current_temperature,
              :search_location,
              :location_name

  def initialize(weather, search_location, antipode_location)
    @id = rand(0..99)
    @coordinates = "#{weather[:latitude]}, #{weather[:longitude]}"
    @currently = weather[:currently]
    @summary = @currently[:summary]
    @current_temperature = @currently[:temperature].round
    @search_location = search_location
    @location_name = antipode_location
  end
end
