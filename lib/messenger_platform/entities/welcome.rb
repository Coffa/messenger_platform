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
          setting_type: 'call_to_actions',
          thread_state: 'new_thread',
          call_to_actions: [{ message: { text: text } }]
        }

        Typhoeus.post("#{Config.end_point}/#{page_id || Config.page_id}/thread_settings", body: params)
      end
    end
  end
end
