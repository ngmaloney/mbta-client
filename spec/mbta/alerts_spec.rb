require 'spec_helper'

describe "alerts resource" do
  let(:client) { Mbta::Client.new( api_key: ENV["API_KEY"] ) }

  describe "#alerts" do
    it "retrieves alerts" do
      VCR.use_cassette("mbta_client_alerts") do
        expect(client.alerts["alerts"].length).to eq 32
      end
    end
  end

  describe "#alertsbyroute" do
    let(:route) { 73 }

    it "retrieves alerts" do
      VCR.use_cassette("mbta_client_alerts_by_route") do
        expect(client.alerts_by_route(route).keys).to eq ["alerts", "route_id", "route_name"]
      end
    end
  end

  describe "#alerts_by_stop" do
    let(:stop) { 1094 }

    it "retrieves alerts" do
      VCR.use_cassette("mbta_client_alerts_by_stop") do
        expect(client.alerts_by_stop(stop).keys).to eq ["alerts", "stop_id", "stop_name"]
      end
    end
  end

  describe "#alert_by_id" do
    let(:alert_id) { 67858 }
    it "retrieves alert" do
      VCR.use_cassette("mbta_client_alert_by_id") do
        expect(client.alert_by_id(alert_id).keys).to eq ["alert_id", "effect_name", "effect", "cause", "header_text", "short_header_text", "url", "description_text", "severity", "created_dt", "last_modified_dt", "service_effect_text", "timeframe_text", "alert_lifecycle", "effect_periods", "affected_services"]
      end
    end
  end

  describe "#alertheaders" do
    it "retrieves alert headers" do
      VCR.use_cassette("mbta_client_alert_headers") do
        expect(client.alert_headers.keys).to eq ["alert_headers"]
      end
    end

  end

  describe "#alertheadersbyroute" do
    let(:route) { 73 }

    it "retrieves alert headers" do
      VCR.use_cassette("mbta_client_alert_headers_by_route") do
        expect(client.alert_headers_by_route(route).keys).to eq ["alert_headers", "route_id", "route_name"]
      end
    end
  end

  describe "#alertheadersbystop" do
    let(:stop) { 1094 }

    it "retrieves alert headers" do
      VCR.use_cassette("mbta_client_alert_headers_by_stop") do
        expect(client.alert_headers_by_stop(stop).keys).to eq ["alert_headers", "stop_id", "stop_name"]
      end
    end

  end
end
