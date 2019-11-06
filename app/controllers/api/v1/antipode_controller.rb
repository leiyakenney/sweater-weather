class Api::V1::AntipodeController < ApplicationController

  def show
    facade = AntipodeFacade.new(params[:location])
    render json: AntipodeSerializer.new(facade)
  end
end
