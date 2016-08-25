module MessengerPlatform
  module Parser
    extend self

    def execute(args)
      args['entry']
        .map { |entry| entry['messaging'] }.flatten
        .map do |msg|
          {
            from: msg['sender']['id'],
            to: msg['recipient']['id']
          }.merge(filter_type(msg) || {})
        end
        .select { |msg| msg[:type].present? }
    end

    private

    def filter_type(msg)
      if msg.dig 'message', 'is_echo'
        { type: 'echo', text: msg['message']['text'] }
      elsif msg.key? 'message'
        { type: 'message', text: msg['message']['text'] }
      elsif msg.key? 'postback'
        { type: 'payload', text: msg['postback']['payload'] }
      end
    end
  end
end
