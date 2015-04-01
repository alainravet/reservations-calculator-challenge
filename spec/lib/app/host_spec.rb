require "spec_helper"

describe Host do
  before do
    Stores.reset_stores
  end

  let(:host) { described_class.new("John Doe") }

  describe "#total_payout" do
    it "works correctly" do
      # Create few offers
      cheerful_room   = AccommodationOffer.new(:room,      "Cheerful Room in Berlin", 100)
      sunny_apartment = AccommodationOffer.new(:apartment, "Sunny Apartment", 200)
      small_room      = AccommodationOffer.new(:room,      "My small Room", 50)

      # Assign offers to the host
      host.add_offer(cheerful_room)
      host.add_offer(sunny_apartment)
      host.add_offer(small_room)

      # Make some reservations
      cheerful_room.add_reservation(Reservation.new(3))
      sunny_apartment.add_reservation(Reservation.new(2))
      cheerful_room.add_reservation(Reservation.new(10))

      # calculate how much we should pay to the host
      expect(host.total_payout).to eql(1660.0)
    end
  end
end
