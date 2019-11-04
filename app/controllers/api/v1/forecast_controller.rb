class Api::V1::ForecastController < ApplicationController

  def show
    coordinates = LocationFacade.new(params[:location]).coordinates
    weather = ForecastFacade.new(coordinates).create_forecast
    forecast = Forecast.new(weather)
    render json: ForecastSerializer.new(forecast)
  end
end
