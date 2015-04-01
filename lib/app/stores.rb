require_relative 'stores/offers_store'
require_relative 'stores/reservations_store'

# centralize the way to access/reset the misc. stores.
class Stores
  class << self
    attr_reader :offers_store, :reservations_store

    def reset_stores
      @offers_store       = Store::OffersStore.new
      @reservations_store = Store::ReservationsStore.new
    end
  end
end

Stores.reset_stores
