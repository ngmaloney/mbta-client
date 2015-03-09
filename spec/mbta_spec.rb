require 'spec_helper'

describe Mbta do
  subject(:client) { Mbta::Client.new(api_key: ENV["API_KEY"]) }

  it "Sets the api key" do
    expect(client.api_key).to eq ENV["API_KEY"]
  end
end
