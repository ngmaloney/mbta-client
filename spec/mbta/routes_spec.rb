require 'spec_helper'

describe "routes resource" do

  let(:client) { Mbta::Client.new( api_key: ENV["API_KEY"] ) }

  describe "#routes" do
    it "retrieves a list of routes" do
      VCR.use_cassette("mbta_client_routes") do
        client.routes.tap do |data|
          expect(data.keys).to include "mode"
          expect(data["mode"].map{|data| data["mode_name"]}).to eq ["Subway", "Subway", "Commuter Rail", "Bus", "Boat"]
        end
      end
    end
  end

  describe "#routesbystop" do

    let(:stop) { "West Roxbury" }

    it "retrieves a list of routes that serve a stop" do
      VCR.use_cassette("mbta_client_routes_by_stop") do
        client.routes_by_stop(stop).tap do |data|
          expect(data["mode"]).to eq([{"route_type"=>"2", "mode_name"=>"Commuter Rail", "route"=>[{"route_id"=>"CR-Needham", "route_name"=>"Needham Line"}]}])
        end
      end
    end
  end
end
