# frozen_string_literal: true

module Africastalking
  class Configuration
    attr_accessor :username, :apikey

    def initialize(params = {})
      @user = params.dig(:username)
      @pass = params.dig(:apikey)
    end

    def header
      {
        'apikey' => apikey,
        'Accept' => 'application/json',
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    end
  end
end
