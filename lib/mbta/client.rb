module Mbta
  class Client
    attr_reader :api_key

    RESP_FORMAT = "json".freeze

    def initialize(opts)
      @api_key = opts[:api_key]
    end

    private

    def get(resource, params={})
      parse connection.get(path_for(resource), params_for(params)).body
    end

    def url
      "http://realtime.mbta.com"
    end

    def path_for(resource)
      "/developer/api/v2/#{resource}"
    end

    def params_for(params)
      params.merge({api_key: api_key, format: RESP_FORMAT})
    end

    def connection
      @connection ||= Faraday.new(url: url)
    end

    def parse(resp)
      begin
        JSON.parse(resp)
      rescue JSON::ParserError
        try_xml_error(resp)
      end
    end

    def try_xml_error(resp)
      data = REXML::Document.new(resp)
      message = data.get_elements("//error//message")
      if message.length > 0
        raise Mbta::Client::ApiError, message.first.text
      end
      raise JSON::ParserError #Return the original parser error
    end
  end
end
