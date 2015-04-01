require_relative 'stores'

# Represents hosts
class Host
  def initialize(name)
    @name = name
  end

  def add_offer(offer)
    Stores.offers_store.add_offer(self, offer)
  end

  def total_payout  # FIXME : SRP (move to Accountant or ..), computations rules, ..
    outcome = 0
    offers.each do |offer|
      tmp_payout = 0
      offer.reservations.each do |reservation|
        case offer.type
        when :room
          tmp_payout += offer.nightly_rate * reservation.nights
        when :apartment
          tmp_payout += offer.nightly_rate * reservation.nights * 0.9
        when :entire_house
          tmp_payout += offer.nightly_rate * reservation.nights * 0.8
        end
      end

      outcome += tmp_payout
    end
    outcome
  end

private
  def offers
    Stores.offers_store.offers(self)
  end
end
