class AntipodeFacade
  attr_reader :id

  def initialize(coordinates)
    @id = rand(0..99)
    @coordinates = coordinates
  end

  def darksky_service
    DarkskyService.new(@coordinates)
  end

  def create_forecast
    data = darksky_service.get_forecast_data
  end
end
