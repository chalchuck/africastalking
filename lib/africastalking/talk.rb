module Africastalking
  class Talk < Connection
    base_uri 'https://voice.africastalking.com'

    class << self

      def make_call(from, to)
        post('/call', {"username" => Africastalking.config.username, 'from' => from, 'to' => to})
      end

      def fetch_queued_calls(phone_number, queue_name=nil)
        post('/queueStatus', {"username" => Africastalking.config.username, "phoneNumbers" => phone_number, "queueName" => queue_name})
      end

      def upload_file(url)
        post('/mediaUpload', {"username" => Africastalking.config.username, 'url' => url})
      end
    end
  end
end
