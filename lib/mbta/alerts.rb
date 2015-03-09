module Mbta
  class Client
    def alerts
      get "alerts"
    end

    def alerts_by_route(route)
      get "alertsbyroute", {route: route}
    end

    def alerts_by_stop(stop)
      get "alertsbystop", {stop: stop}
    end

    def alert_by_id(id)
      get "alertbyid", {id: id}
    end

    def alert_headers
      get "alertheaders"
    end

    def alert_headers_by_route(route)
      get "alertheadersbyroute", {route: route}
    end

    def alert_headers_by_stop(stop)
      get "alertheadersbystop", {stop: stop}
    end

  end
end

