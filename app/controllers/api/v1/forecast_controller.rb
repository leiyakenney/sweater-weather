class Api::V1::ForecastController < ApplicationController

  def show
    coordinates = LocationFacade.new(params[:location]).coordinates
    forecast = ForecastFacade.new(coordinates).forecast
    render json: ForecastSerializer.new(forecast)
  end
end
