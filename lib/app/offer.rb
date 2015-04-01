require_relative 'storeable'

# Represents offers created by host.
class Offer
  attr_accessor :type, :title, :nightly_rate

  include Storeable
  has_many :reservations

  def initialize(type, title, nightly_rate)
    @type, @title, @nightly_rate = type, title, nightly_rate
  end
end
