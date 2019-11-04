require 'rails_helper'

describe "Google Geocode API" do
  it "sends a list of forecasts" do
    create_list(:forecast, 2)

    get '/api/v1/forecast'

    expect(response).to be_successful

    forecast = JSON.parse(response.body)
  end
end
