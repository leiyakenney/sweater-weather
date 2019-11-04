class Antipode
  attr_reader :id,
              :coordinates,
              :summary,
              :temperature

  def initialize(weather, coordinates, antipode_coordinates)
    @id = rand(0..99)
    binding.pry
    @coordinates = "#{weather[:latitude]}, #{weather[:longitude]}"
    @currently = weather[:currently]
    @summary = @currently[:summary]
    @temperature = @currently[:temperature].round
  end
end
