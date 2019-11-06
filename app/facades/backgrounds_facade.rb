class BackgroundsFacade
  attr_reader :id

  def initialize(location)
    @id = rand(0..99)
    @location = location
  end

  def image_url
    UnsplashService.new.background_image(@location)[:urls][:raw]
  end

end
