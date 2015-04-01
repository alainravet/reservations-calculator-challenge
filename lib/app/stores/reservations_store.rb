module Store
  # where we store the Offers' Reservations
  class ReservationsStore
    def initialize
      @reservations = {}
    end

    def add(offer, reservation)
      @reservations[offer] ||= []
      @reservations[offer] << reservation
    end

    def get(offer)
      @reservations[offer] || []
    end
  end
end
