module Mbta
  class Client
    def routes
      get "routes"
    end

    def routes_by_stop(stop)
      get "routesbystop", {stop: stop}
    end
  end
end
