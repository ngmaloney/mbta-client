require 'spec_helper'

describe "other resource" do
  let(:client) { Mbta::Client.new( api_key: ENV["API_KEY"] ) }

  describe "#servertime" do
    it "retrieves the server time" do
      VCR.use_cassette("mbta_client_other") do
         expect(client.server_time).to eq({"server_dt"=>"1425859013"})
      end
    end
  end

end

