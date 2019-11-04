class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :coordinates,
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
end
