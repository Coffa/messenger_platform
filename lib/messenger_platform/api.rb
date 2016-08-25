require 'messenger_platform/entities/me'
require 'messenger_platform/entities/welcome'
require 'messenger_platform/entities/message'
require 'messenger_platform/entities/text'
require 'messenger_platform/entities/image'
require 'messenger_platform/entities/payload_button'
require 'messenger_platform/entities/payload_generic'
require 'messenger_platform/entities/payload_receipt'

module MessengerPlatform
  module Api
    extend self

    def call(name, recipient_id, *args)
      klass = Entities.const_get(name.to_s.split('_').map(&:capitalize).join(''))
      klass.new(recipient_id).call(*args)
    end
  end
end
