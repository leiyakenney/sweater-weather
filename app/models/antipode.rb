class Antipode
  attr_reader :id,
              :coordinates,
              :search_location,
              :location_name,
              :forecast

  def initialize(weather, search_location, antipode_location)
    @id = rand(0..99)
    @coordinates = "#{weather[:latitude]}, #{weather[:longitude]}"
    @currently = weather[:currently]
    @search_location = search_location
    @location_name = antipode_location
    @forecast =
      {
        summary: weather[:currently][:summary],
        current_temperature: weather[:currently][:temperature].round
      }
  end
end
