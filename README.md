# MessengerPlatform

A Ruby interface to the Facebook Messenger Platform API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'messenger_platform'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install messenger_platform

## Usage

#### Configuration

```ruby
MessengerPlatform.configure do |config|
  config.token = 'xxxx' # => messenger token
  config.page_id = 'xxxx' # => Page ID
end
```

#### Welcome
```ruby
MessengerPlatform.welcome(nil, 'Hello world') # => nil can be changed by page id
```

#### Send Message

```ruby
MessengerPlatform.text(user_id, 'Hello world')
MessengerPlatform.image(user_id, 'https://xxx.com/xx.png')
```

#### Payload

There are three types of payload: `button`, `generic`, `receipt`

```ruby
MessengerPlatform.payload(:button, user_id, 'Hello world', [
  {
    "type":"web_url",
    "url":"https://petersapparel.parseapp.com",
    "title":"Show Website"
  },
  {
    "type":"postback",
    "title":"Start Chatting",
    "payload":"USER_DEFINED_PAYLOAD"
  }
])

MessengerPlatform.payload(:generic, user_id, [
  {
    "title":"Classic White T-Shirt",
    "image_url":"http://petersapparel.parseapp.com/img/item100-thumb.png",
    "subtitle":"Soft white cotton t-shirt is back in style",
    "buttons":[
      {
        "type":"web_url",
        "url":"https://petersapparel.parseapp.com/view_item?item_id=100",
        "title":"View Item"
      },
      {
        "type":"web_url",
        "url":"https://petersapparel.parseapp.com/buy_item?item_id=100",
        "title":"Buy Item"
      },
      {
        "type":"postback",
        "title":"Bookmark Item",
        "payload":"USER_DEFINED_PAYLOAD_FOR_ITEM100"
      }
    ]
  },
  {
    "title":"Classic Grey T-Shirt",
    "image_url":"http://petersapparel.parseapp.com/img/item101-thumb.png",
    "subtitle":"Soft gray cotton t-shirt is back in style",
    "buttons":[
      {
        "type":"web_url",
        "url":"https://petersapparel.parseapp.com/view_item?item_id=101",
        "title":"View Item"
      },
      {
        "type":"web_url",
        "url":"https://petersapparel.parseapp.com/buy_item?item_id=101",
        "title":"Buy Item"
      },
      {
        "type":"postback",
        "title":"Bookmark Item",
        "payload":"USER_DEFINED_PAYLOAD_FOR_ITEM101"
      }
    ]
  }
])

MessengerPlatform.payload(:receipt, user_id, {
  "recipient_name":"Stephane Crozatier",
  "order_number":"12345678902",
  "currency":"USD",
  "payment_method":"Visa 2345",
  "order_url":"http://petersapparel.parseapp.com/order?order_id=123456",
  "timestamp":"1428444852",
  "elements":[
    {
      "title":"Classic White T-Shirt",
      "subtitle":"100% Soft and Luxurious Cotton",
      "quantity":2,
      "price":50,
      "currency":"USD",
      "image_url":"http://petersapparel.parseapp.com/img/whiteshirt.png"
    },
    {
      "title":"Classic Gray T-Shirt",
      "subtitle":"100% Soft and Luxurious Cotton",
      "quantity":1,
      "price":25,
      "currency":"USD",
      "image_url":"http://petersapparel.parseapp.com/img/grayshirt.png"
    }
  ],
  "address":{
    "street_1":"1 Hacker Way",
    "street_2":"",
    "city":"Menlo Park",
    "postal_code":"94025",
    "state":"CA",
    "country":"US"
  },
  "summary":{
    "subtotal":75.00,
    "shipping_cost":4.95,
    "total_tax":6.19,
    "total_cost":56.14
  },
  "adjustments":[
    {
      "name":"New Customer Discount",
      "amount":20
    },
    {
      "name":"$10 Off Coupon",
      "amount":10
    }
  ]
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Coffa/messenger_platform. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

