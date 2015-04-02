module Persistence
  class HashStore
    def initialize()
      @data = {}
    end

    def add(host, offer)
      @data[host] ||= []
      @data[host] << offer
    end

    def get(host)
      @data[host] || []
    end
  end
end
