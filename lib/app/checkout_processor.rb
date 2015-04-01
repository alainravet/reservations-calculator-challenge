# is in charge computing the cost of ..
class CheckoutProcessor
  def initialize(client)
    @client = client
  end

  def payout_for_all_offers
    @client.offers.map { |offer|
      offer_payout(offer)
    }.reduce(:+) || 0
  end

private

  def offer_payout(offer)
    offer.reservations.map do |reservation|
      break if reservation.nights.zero?
      reservation_payout(offer, reservation)
    end.reduce(:+) || 0
  end

  def reservation_payout(offer, reservation)
    base_amount = offer.nightly_rate * reservation.nights
    base_amount * discount_multiplier(offer)
  end

  def discount_multiplier(offer)
    DISCOUNT_MULTIPLIER.fetch(offer.type) { 1 }
  end

  DISCOUNT_MULTIPLIER = {
      room:         1,
      apartment:    0.9,
      entire_house: 0.8,
  }.freeze
end
