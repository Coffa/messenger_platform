module MessengerPlatform
  module Config

    mattr_accessor :page_id
    mattr_accessor :token

    mattr_accessor :end_point
    @@end_point = 'https://graph.facebook.com/v2.6'

    mattr_accessor :message_end_point
    @@message_end_point = 'https://graph.facebook.com/v2.6/me/messages'

  end
end
