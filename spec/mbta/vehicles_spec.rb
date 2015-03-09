require 'spec_helper'

describe "vehicles resource" do

  let(:client) { Mbta::Client.new( api_key: ENV["API_KEY"] ) }

  describe "vehicles_by_route" do

    let(:route) { "810_" }

    it "retrieves the vehicles" do
      skip "No data found on Sunday"
      #VCR.use_cassette("mbta_client_vehicles_by_route") do
      #  expect(client.vehicles_by_route(route)).to eq "foo"
      #end
    end

    context "when there isn't any data available" do
      it "raises an api error" do
        VCR.use_cassette("mbta_client_vehicles_by_route_no_data") do
          expect{client.vehicles_by_route(route)}.to raise_error Mbta::Client::ApiError
        end
      end
    end
  end

  describe "vehicles_by_trip" do

    let(:trip) { "CR-Providence-CR-Weekday-807" }

    it "retrieves the vehicles" do
      skip "No data found on Sunday"
      #VCR.use_cassette("mbta_client_vehicles_by_trip") do
      #  expect(client.vehicles_by_trip(trip)).to eq "foo"
      #end
    end

    context "when there isn't any data available" do
      it "raises an api error" do
        VCR.use_cassette("mbta_client_vehicles_by_trip_no_data") do
          expect{client.vehicles_by_trip(trip)}.to raise_error Mbta::Client::ApiError
        end
      end
    end
  end
end

