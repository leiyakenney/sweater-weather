require 'rails_helper'

describe 'Background Endpoint' do
  it "can return a city-specific background image" do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq('application/json')
    expect(background.class).to eq(Hash)
    expect(background.count).to eq(1)
  end
end
