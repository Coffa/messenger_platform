module MessengerPlatform
  module Entities
    class Welcome
      attr_accessor :page_id

      def initialize(page_id)
        @page_id = page_id
      end

      def call(text)
        params = {
          access_token: Config.token,
          setting_type: 'greeting',
          greeting: { text: text }
        }

        Typhoeus.post("#{Config.end_point}/me/thread_settings", body: params)
      end
    end
  end
end
