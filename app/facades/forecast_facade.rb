class ForecastFacade
  attr_reader :id

  def initialize(antipode_coordinates)
    @id = rand(0..99)
    @anti_coords = antipode_coordinates
  end

  def darksky_service
    DarkskyService.new(@anti_coords)
  end

  def create_forecast
    data = darksky_service.get_forecast_data
  end
end
