# frozen_string_literal: true

module Africastalking
  class Airtime < Connection
    class << self
      def buy_airtime(recipients)
        post('/version1/airtime/send', build_airtime(recipients))
      end
      alias buy buy_airtime

      private

      def build_airtime(recipients)
        {
          'username' => Africastalking.config.username,
          'recipients' => build_recipients(recipients).to_json
        }
      end

      def build_recipient(recipient)
        {
          'phoneNumber' => recipient.fetch(:mobile_number).to_s,
          'amount' => "KES #{recipient.fetch(:airtime, 0.0)}"
        }
      end

      def build_recipients(recipients)
        airtime_recipients = []
        recipients.each { |recipient| airtime_recipients << build_recipient(recipient) }
        airtime_recipients
      end
    end
  end
end
