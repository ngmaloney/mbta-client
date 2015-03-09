module Mbta
  class Client
    def schedule_by_stop(stop)
      get "schedulebystop", {stop: stop}
    end

    def schedule_by_route(route)
      get "schedulebyroute", {route: route}
    end

    def schedule_by_trip(trip)
      get "schedulebytrip", {trip: trip}
    end
  end
end
