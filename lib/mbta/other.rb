module Mbta
  class Client
    def server_time
      get "servertime"
    end
  end
end

