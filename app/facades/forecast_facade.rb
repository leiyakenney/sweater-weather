class ForecastFacade
  attr_reader :id

  def initialize(coordinates)
    @coordinates = coordinates
    @id = rand(0..99999)
  end

  def darksky_service
    DarkskyService.new(@coordinates)
  end

  def forecast
    data = darksky_service.get_forecast_data
  end
end
