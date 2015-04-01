require_relative 'hash_store'

# centralize the way to access/reset the misc. persistence.
module Persistence
  class Stores
    class << self
      def stores
        @stores || reset_stores
      end

      def reset_stores
        @stores = {}
      end

      def for_collection(key)
        stores.fetch(key) { @stores[key] = Persistence::HashStore.new }
      end
    end
  end
end
