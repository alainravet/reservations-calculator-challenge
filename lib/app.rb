$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/tools'))
require 'persistence/stores'

require_relative "app/host"
require_relative "app/accommodation_offer"
require_relative "app/reservation"
