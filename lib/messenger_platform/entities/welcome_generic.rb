module MessengerPlatform
  module Entities
    class WelcomeGeneric < Welcome

      def message_params(generic_template)
        {
          attachment: {
            type: :template,
            payload: {
              template_type: :generic,
              elements: generic_template
            }
          }
        }
      end
    end
  end
end
