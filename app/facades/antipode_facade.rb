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
    data = amypode_service.get_antipode_data
  end
end
