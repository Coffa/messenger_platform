module MessengerPlatform
  module Entities
    class Text < Message

      def body_params(text)
        auth_params.merge(message_params(text: text))
      end
    end
  end
end
