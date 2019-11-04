class ForecastFacade
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def darksky_service
    DarkskyService.new(@coordinates)
  end

  def forecast
    data = darksky_service.get_forecast_data
  end
end
