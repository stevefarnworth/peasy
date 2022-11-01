# frozen_string_literal: true

require_relative "peasy/version"
require_relative "peasy/configuration"
require_relative 'peasy/subscription'

module Peasy
  class Error < StandardError; end
    def self.configuration
      @configuration ||= Configuration.new
    end
    def self.configure(&block)
      yield(configuration)
    end
end
