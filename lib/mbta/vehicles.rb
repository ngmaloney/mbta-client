module Mbta
  class Client
    def vehicles_by_route(route)
      get "vehiclesbyroute", {route: route}
    end

    def vehicles_by_trip(trip)
      get "vehiclesbytrip", {trip: trip}
    end
  end
end

