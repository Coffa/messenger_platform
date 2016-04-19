module MessengerPlatform
  module Entities
    class PayloadGeneric < Message

      def body_params(generic_template)
        auth_params.merge(message: {
          attachment: {
            type: :template,
            payload: {
              template_type: :generic,
              elements: generic_template
            }
          }
        })
      end
    end
  end
end
