module MessengerPlatform
  module Entities
    class Message
      attr_accessor :recipient_id

      def initialize(recipient_id)
        @recipient_id = recipient_id
      end

      def call(*args)
        Typhoeus.post(Config.message_end_point, body: body_params(*args))
      end

      def auth_params
        {
          access_token: Config.token,
          recipient: { id: recipient_id }
        }
      end

      def message_params(message)
        { message: message }
      end
    end
  end
end
