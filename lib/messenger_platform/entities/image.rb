module MessengerPlatform
  module Entities
    class Image < Message

      def body_params(image_url)
        auth_params.merge(message_params(attachment: {
          type: :image, payload: { url: image_url }
        }))
      end
    end
  end
end
