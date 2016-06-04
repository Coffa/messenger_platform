module MessengerPlatform
  module Entities
    class WelcomeText < Welcome

      def message_params(text)
        { text: text }
      end
    end
  end
end
