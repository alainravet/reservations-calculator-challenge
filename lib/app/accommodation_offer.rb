require 'persistence/storeable'

# Represents offers created by host.
class AccommodationOffer
  attr_accessor :type, :title, :nightly_rate

  include Persistence::Storeable
  has_many :reservations

  def initialize(type, title, nightly_rate)
    @type, @title, @nightly_rate = type, title, nightly_rate
  end
end
