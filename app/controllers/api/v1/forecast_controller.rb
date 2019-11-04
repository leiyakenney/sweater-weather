class Api::V1::ForecastController < ApplicationController

  def show
    coordinates = LocationFacade.new(params[:location]).coordinates
    weather = ForecastFacade.new(coordinates).forecast
    forecast = Forecast.new(weather)
    binding.pry
    render json: ForecastSerializer.new(forecast)
  end
end
