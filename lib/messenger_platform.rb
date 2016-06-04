require 'typhoeus'

require 'messenger_platform/config'
require 'messenger_platform/api'
require 'messenger_platform/parser'

module MessengerPlatform
  extend self

  def configure
    yield(Config) if block_given?
  end

  def text(receiver_id, text)
    Api.call(:text, receiver_id, text)
  end

  def image(receiver_id, image_url)
    Api.call(:image, receiver_id, image_url)
  end

  def welcome(template_type, *args)
    Api.call("welcome_#{template_type}", *args)
  end

  def payload(template_type, *args)
    Api.call("payload_#{template_type}", *args)
  end
end
