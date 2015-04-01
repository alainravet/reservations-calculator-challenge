module Store
  # where we store the Hosts' Offers
  class OffersStore
    def initialize
      @offers = {}
    end

    def add(host, offer)
      @offers[host] ||= []
      @offers[host] << offer
    end

    def get(host)
      @offers[host] || []
    end
  end
end
