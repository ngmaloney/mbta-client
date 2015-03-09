module Mbta
  class Client
    def stops_by_route(route)
      get "stopsbyroute", {route: route}
    end

    def stops_by_location(location)
      get "stopsbylocation", {lat: location[:lat], lon: location[:lon]}
    end
  end
end
