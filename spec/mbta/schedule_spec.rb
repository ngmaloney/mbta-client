require 'spec_helper'

describe "schedule resource" do

  let(:client) { Mbta::Client.new( api_key: ENV["API_KEY"] ) }

  describe "schedulebystop" do

    let(:stop) { "West Roxbury" }

    it "retrieves the schedule" do
      VCR.use_cassette("mbta_schedule_schedule_by_stop") do
        client.schedule_by_stop(stop).tap do |data|
          expect(data["mode"][0]["route_type"]).to eq("2")
          expect(data["mode"][0].keys).to eq(["route_type", "mode_name", "route"])
        end
      end
    end
  end

  describe "schedulebyroute" do

    let(:route) { "CR-Needham" }

    it "retrieves the schedule" do
      VCR.use_cassette("mbta_schedule_schedule_by_route") do
        client.schedule_by_route(route).tap do |data|
          expect(data["direction"][0]["direction_name"]).to eq("Outbound")
          expect(data["direction"][1]["direction_name"]).to eq("Inbound")
        end
      end
    end
  end

  describe "schedulebytrip" do

    let(:trip) { "CR-Needham-CR-Saturday-Needham-Dec14-1611" }

    it "retrieves the schedule" do
      VCR.use_cassette("mbta_schedule_schedule_by_trip") do
        client.schedule_by_trip(trip).tap do |data|
          expect(data["stop"].length).to eq(12)
        end
      end
    end
  end
end
