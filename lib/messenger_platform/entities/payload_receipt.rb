module MessengerPlatform
  module Entities
    class PayloadReceipt < Message

      def body_params(receipt_template)
        auth_params.merge(message: {
          attachment: {
            type: :template,
            payload: {
              template_type: :receipt,
            }.merge(receipt_template)
          }
        })
      end
    end
  end
end
