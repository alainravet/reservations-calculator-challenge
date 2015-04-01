require_relative 'stores'

# Represents offers created by host.
class Offer
  attr_accessor :type, :title, :nightly_rate

  def initialize(type, title, nightly_rate)
    @type, @title, @nightly_rate = type, title, nightly_rate
  end

  # FIXME : enforce SRP (move to a ReservationStore)
  def add_reservation(reservation)
    Stores.reservations_store.add(self, reservation)
  end

  def reservations
    Stores.reservations_store.get(self)
  end
end
