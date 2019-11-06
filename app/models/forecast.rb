class Forecast
  attr_reader :id,
              :coordinates,
              :icon,
              :current_summary,
              :current_temp,
              :current_time,
              :feels_like,
              :humidity,
              :uv,
              :today,
              :tonight,
              :hourly_weather,
              :daily_weather

  def initialize(weather)
    @id = rand(0..99)
    @coordinates = "#{weather[:latitude]}, #{weather[:longitude]}"
    @currently = weather[:currently]
    @icon = @currently[:icon]
    @current_summary = @currently[:summary]
    @current_temp = @currently[:temperature]
    @current_time = format_time(@currently[:time])
    @feels_like = @currently[:apparentTemperature]
    @humidity = @currently[:humidity]
    @visibility = @currently[:visibility]
    @uv = @currently[:uvIndex]
    @today = weather[:hourly][:data][10][:summary]
    @tonight = weather[:hourly][:data][21][:summary]
    @hourly_weather = weather[:hourly][:data].first(8).map do |hour|
      {
        icon: hour[:icon],
        temp: hour[:temperature],
        summary: hour[:summary],
        time: Time.at(hour[:time]).strftime("%l%p")
    }
    end
    @daily_weather = weather[:daily][:data].first(5).map do |day|
      {
      day: Time.at(day[:time]).strftime("%A"),
      icon: day[:icon],
      summary: day[:summary],
      precip: day[:precipProbability],
      high: day[:temperatureHigh],
      low: day[:temperatureLow],
    }
    end
  end

  def format_time(weather)
    time = Time.at(@currently[:time])
    time.strftime("%l:%M %p, %m/%d")
  end
end
