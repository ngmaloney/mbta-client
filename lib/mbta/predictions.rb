module Mbta
  class Client
    def predictions_by_stop(stop)
      get "predictionsbystop", {stop: stop}
    end

    def predictions_by_route(route)
      get "predictionsbyroute", {route: route}
    end

    def predictions_by_trip(trip)
      get "predictionsbytrip", {trip: trip}
    end
  end
end
