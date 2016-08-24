require "africastalking/configuration"
require "africastalking/connection"
require "africastalking/message"
require "africastalking/response"
require "africastalking/version"

module Africastalking

  class << self
    attr_writer :configuration

    def setup
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
    alias_method :config, :configuration
  end
end
