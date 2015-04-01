# adds methods to store and retrieve elements
module Storeable
  def self.included(base)
    base.extend(ClassMethods)
  end

  #
  #   class O
  #     include Sorteable
  #     has_many :reservations  # => defines the methods :
  #                             #     #add_reservation(r)
  #                             #     #reservations()
  #   end
  #
  module ClassMethods
    def has_many(collection_name)
      define_method collection_name do                          # #reservations
        store = Stores.public_send "#{collection_name}_store"
        store.get(self)
      end

      singular = collection_name.to_s.gsub(/s\z/, '')           # :reservations -> 'reservation'
      define_method "add_#{singular}" do |value|                # add_reservation()
        store = Stores.public_send "#{collection_name}_store"
        store.add(self, value)
      end
    end
  end
end
