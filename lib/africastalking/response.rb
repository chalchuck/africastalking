require 'json'

module Africastalking
  class Response
    attr_reader :code, :headers, :body

    def initialize(params)
      @headers = params.dig(:headers)
      @code    = params.dig(:code)
      @body    = JSON.parse(params.dig(:body))
    end
  end
end
