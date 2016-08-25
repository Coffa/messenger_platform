module MessengerPlatform
  module Entities
    class Me
      attr_reader :uid

      def initialize(uid)
        @uid = uid
      end

      def call
        JSON.parse Typhoeus.get("#{Config.end_point}/#{uid}?fields=first_name,last_name,profile_pic,locale,timezone,gender&access_token=#{Config.token}").body
      end
    end
  end
end
