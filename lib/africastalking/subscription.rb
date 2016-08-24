module Africastalking
  class Subscription < Connection
    class << self

      def create(data)
        validate_attributes(%w(phone_number short_code keyword), data)
				post("/version1/subscription/create", build_subscription(data))
      end

      def delete(data)
				validate_attributes(%w(phone_number short_code keyword), data)
				post("/version1/subscription/delete", build_subscription(data))
      end

      def fetch(data)
				validate_attributes(%w(short_code keyword), data)

        fetch_url = %{
          /version1/subscription?
          username=#{Africastalking.config.username}&
          shortCode=#{data.fetch(:short_code)}&keyword=#{data.fetch(:keyword)}&
          lastReceivedId=#{data.fetch(:last_received_id, 0)}
        }

				get(fetch_url)
      end

    private

      # TODO: SYMBOLS VS STRINGS
      def validate_attributes(attrbs, data)
        attrbs.each do |value|
          fail "#{value} can not be blank!" if value_present?(data, value)
        end
      end

      # TODO: deal with whitespace
      def value_present?(data, value)
        data[value.to_sym].empty?
      end

      def build_subscription(data)
        {
          username: Africastalking.config.username, keyword: data.fetch(:keyword),
          phoneNumber: data.fetch(:phone_number), shortCode: data.fetch(:short_code)
        }
      end
    end
  end
end
