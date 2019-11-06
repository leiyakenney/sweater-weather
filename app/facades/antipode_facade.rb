class AntipodeFacade
  attr_reader :id, :location, :antipode_city_name, :antipode_darksky

  def initialize(location)
    @id = rand(0..99)
    @location = location
  end

  def get_coordinates
    GoogleService.new.location_data(@location)
  end

  def latlong
    get_coordinates[:results][0][:geometry][:location]
  end

  def antipode_coords
    AmypodeService.new(latlong).coordinates
  end

  def get_antipode_info
    coords = "#{antipode_coords[:lat]},#{antipode_coords[:long]}"
    GoogleService.new.city_data(coords)
  end

  def antipode_city_name
    get_antipode_info[:results][0][:address_components][2][:long_name]
  end

  def antipode_darksky
    data = DarkskyService.new(antipode_coords[:lat], antipode_coords[:long]).get_forecast_data
    hour_one = data[:hourly][:data].first
    # create PORO instead of the hash 
    hash = {}
    hash[:summary] = hour_one[:summary]
    hash[:current_temperature] = hour_one[:temperature].round
    hash
  end
end
