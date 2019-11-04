class AntipodeFacade
  attr_reader :id

  def initialize(coordinates)
    @id = rand(0..99)
    @coordinates = coordinates
  end

  def amypode_service
    AmypodeService.new(@coordinates)
  end

  def antipode_coordinates
    data = amypode_service.coordinates
  end

  def antipode_city
    amypode_service.city_name
  end
end
