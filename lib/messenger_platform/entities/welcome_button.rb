module MessengerPlatform
  module Entities
    class WelcomeButton < Welcome

      def message_params(text, button_template)
        {
          attachment: {
            type: :template,
            payload: {
              template_type: :button,
              text: text,
              buttons: button_template
            }
          }
        }
      end
    end
  end
end
