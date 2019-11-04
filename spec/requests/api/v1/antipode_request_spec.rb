require 'rails_helper'

describe "Amypode API" do
  it "sends a list of antipodes" do
    create_list(:antipode, 2)

    get '/api/v1/antipode'

    expect(response).to be_successful

    antipode = JSON.parse(response.body)
  end
end
