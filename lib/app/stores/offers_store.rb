module Store
  # where we store the Hosts' Offers
  class OffersStore
    def initialize
      @offers = {}
    end

    def add_offer(host, offer)
      @offers[host] ||= []
      @offers[host] << offer
    end

    def offers(host)
      @offers[host]
    end
  end
end
