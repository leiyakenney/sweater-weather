class Antipode
  attr_reader :id,
              :coordinates,
              :summary,
              :temperature

  def initialize(weather)
    @id = rand(0..99)
    @coordinates = "#{weather[:latitude]}, #{weather[:longitude]}"
    @currently = weather[:currently]
    @summary = @currently[:summary]
    @temperature = @currently[:temperature].round
  end
end
