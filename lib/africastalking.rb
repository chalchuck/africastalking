# frozen_string_literal: true

require 'africastalking/configuration'
require 'africastalking/connection'
require 'africastalking/message'
require 'africastalking/response'
require 'africastalking/airtime'
require 'africastalking/version'
require 'africastalking/user_data'
require 'africastalking/subscription'
require 'africastalking/talk'

module Africastalking
  class << self
    attr_writer :configuration

    def setup
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
    alias config configuration
  end
end
