require 'spec_helper'

describe "predictions resource" do
  let(:client) { Mbta::Client.new( api_key: ENV["API_KEY"] ) }

  describe "#predictions_by_stop" do
    let(:stop) { "Providence" }

    it "retrieves the predictions" do
      skip "No data seems to be available on Sunday"
      #VCR.use_cassette("mbta_client_predictions_by_stop") do
      #  expect(client.predictions_by_stop(stop)).to eq "FOO"
      #end
    end

    context "when there isn't any data available" do
      it "raises an api error" do
        VCR.use_cassette("mbta_client_predictions_by_stop_no_data") do
          expect{client.predictions_by_stop(stop)}.to raise_error Mbta::Client::ApiError
        end
      end
    end
  end

  describe "#predictionsbyroute" do
    let(:route) { "CR-Needham" }

    skip "No data seems to be available on Sunday"

    context "when there isn't any data available" do
      it "raises an api error" do
        VCR.use_cassette("mbta_client_predictions_by_route_no_data") do
          expect{client.predictions_by_route(route)}.to raise_error Mbta::Client::ApiError
        end
      end
    end
  end

  describe "#predictionsbytrip" do
    let(:trip) { "CR-Needham-CR-Saturday-Needham-Dec14-1611" }

    skip "No data seems to be available on Sunday"

    context "when there isn't any data available" do
      it "raises an api error" do
        VCR.use_cassette("mbta_client_predictions_by_trip_no_data") do
          expect{client.predictions_by_trip(trip)}.to raise_error Mbta::Client::ApiError
        end
      end
    end
  end
end
