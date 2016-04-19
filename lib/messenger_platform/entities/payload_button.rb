module MessengerPlatform
  module Entities
    class PayloadButton < Message

      def body_params(text, button_template)
        auth_params.merge(message_params(attachment: {
          type: :template,
          payload: {
            template_type: :button,
            text: text,
            buttons: button_template
          }
        }))
      end
    end
  end
end
