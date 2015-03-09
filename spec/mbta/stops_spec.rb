require 'spec_helper'

describe "stops resource" do

  let(:client) { Mbta::Client.new( api_key: ENV["API_KEY"] ) }

  describe "#stops_by_route" do

    let(:route) { "CR-Needham" }

    it "retrieves a list of stops by route" do
      VCR.use_cassette("mbta_client_stops") do
        client.stops_by_route(route).tap do |stops|
          expect(stops["direction"][0]["direction_name"]).to eq "Outbound"
          expect(stops["direction"][1]["direction_name"]).to eq "Inbound"
        end
      end
    end
  end

  describe "#stops_by_location" do

    let(:location) { {lat: "42.2816", lon: "-71.159932"} }

    it "retrieves a list of stops by location" do
      VCR.use_cassette("mbta_client_stops_by_location") do
        client.stops_by_location(location).tap do |stops|
          expect(stops["stop"][0]["stop_id"]).to eq "West Roxbury"
        end
      end
    end
  end
end
