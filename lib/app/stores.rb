require_relative 'stores/offers_store'

# centralize the way to access/reset the misc. stores.
class Stores
  class << self
    attr_reader :offers_store

    def reset_stores
      @offers_store = Store::OffersStore.new
    end
  end
end

Stores.reset_stores
