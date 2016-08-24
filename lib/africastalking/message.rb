module Africastalking
  class Message < Connection
    include MessageBuilder

    def fetch(last_received_id=0)
      get("#{SMS_URL}?username=#{@username}&lastReceivedId=#{last_received_id}")
    end

    def send(recipients, message)
      post(SMS_URL, build_message(recipients, message))
    end

    def send_premium(data)
      post(SMS_URL, build_premium_messages(data))
    end

    def enqueue_message(data)
      post(SMS_URL, build_enqueued_messages(opts))
    end

  end
end
