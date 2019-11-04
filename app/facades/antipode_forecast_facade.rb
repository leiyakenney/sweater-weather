class AntipodeForecastFacade
  attr_reader :id

  def initialize(antipode_coordinates)
    @id = rand(0..99)
    @antipode_coords = antipode_coordinates
  end

  def darksky_service
    DarkskyAmypodeService.new(@antipode_coords)
  end

  def create_forecast
    data = darksky_service.get_forecast_data
  end
end
