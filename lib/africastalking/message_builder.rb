module Africastalking
  module MessageBuilder

    def build_message(recipients, message)
      {username: username, message: message, to: prepare_recipients(recipients)}
    end

    def premium_params(data)
      {
				retryDurationInHours: data.fetch(:retryDurationInHours, 1),
				enqueue: data.fetch(:enqueue, 0), linkId: data.fetch(:linkId, nil), keyword: data.fetch(:keyword, nil)
			}
    end

    def enqueue_params(data)
      {
        bulkSMSMode: opts.fetch(:bulkSMSMode, 1), sender: opts.fetch(:sender, nil), enqueue: opts.fetch(:enqueue, 1)
      }
    end

    def prepare_recipients(recipients)
      msg_recipients = Array.new
      recipients.split(',').each {|r| msg_recipients << r.strip}
      msg_recipients.join(', ')
    end

    def build_enqueued_messages(opts)
      build_message(
        prepare_recipients(opts.fetch(:recipients, [])), opts.fetch(:message, '')
      ).merge(enqueue_params(data))
    end

    def build_premium_messages(data)
			build_message(
        prepare_recipients(data.fetch(:recipients, [])), data.fetch(:message, '')
      ).merge(premium_params(data))
    end

  end
end
