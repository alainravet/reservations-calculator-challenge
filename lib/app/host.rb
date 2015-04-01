require 'persistence/storeable'
require_relative 'checkout_processor'

# Represents hosts
class Host
  def initialize(name)
    @name = name
  end

  include Persistence::Storeable
  has_many :offers

  def total_payout
    CheckoutProcessor.new(self).payout_for_all_offers
  end
end
