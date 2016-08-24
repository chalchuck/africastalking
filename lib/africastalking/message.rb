module Africastalking
  class Message < Connection
    class << self

      def fetch(last_received_id=0)
        get("/version1/messaging?username=#{Africastalking.config.username}&lastReceivedId=#{last_received_id}")
      end

      def send(recipients, message)
        post('/version1/messaging', build_message(recipients, message))
      end

      def send_premium(data)
        post('/version1/messaging', build_premium_messages(data))
      end

      def enqueue_message(data)
        post('/version1/messaging', build_enqueued_messages(data))
      end

    private

      def build_message(recipients, message)
        {username: Africastalking.config.username, message: message, to: prepare_recipients(recipients)}
      end

      def premium_params(data)
        {
          retryDurationInHours: data.fetch(:retryDurationInHours, 1),
          enqueue: data.fetch(:enqueue, 0), linkId: data.fetch(:linkId, nil), keyword: data.fetch(:keyword, nil)
        }
      end

      def enqueue_params(data)
        {
          bulkSMSMode: data.fetch(:bulkSMSMode, 1), sender: data.fetch(:sender, nil), enqueue: data.fetch(:enqueue, 1)
        }
      end

      def prepare_recipients(recipients)
        msg_recipients = Array.new
        recipients.split(',').each {|r| msg_recipients << r.strip}
        msg_recipients.join(', ')
      end

      def build_enqueued_messages(data)
        build_message(
          prepare_recipients(data.fetch(:recipients, [])), data.fetch(:message, '')
        ).merge(enqueue_params(data))
      end

      def build_premium_messages(data)
        build_message(
          prepare_recipients(data.fetch(:recipients, [])), data.fetch(:message, '')
        ).merge(premium_params(data))
      end
    end
  end
end
