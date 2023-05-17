# ruby-sdk

A Ruby client for interacting with the GetTestMail API, which provides a simple way to create temporary email addresses and receive messages sent to them.

## Installation

Add this line to your application's Gemfile:

gem 'gettestmail'


And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install gettestmail
```

## Usage

### Creating a New Client
To create a new GetTestMail API client, you need to instantiate the GetTestMailClient class with your API key. To get an API key, sign up for a free [account](https://gettestmail.com).

```ruby
require 'gettestmailclient'

api_key = 'your-api-key'
client = GetTestMailClient.new(api_key)
```

### Creating a New GetTestMail Instance
To create a new GetTestMail instance, call the create_new method on the client:

```ruby
get_test_mail = client.create_new
puts "Email address: #{get_test_mail.email_address}"
puts "Expires at: #{get_test_mail.expires_at}"
```

### Waiting for a Message
To wait for a message, call the wait_for_message method with the email address:

```ruby
message = client.wait_for_message(get_test_mail.id)
puts "Message from: #{message.from}"
puts "Message subject: #{message.subject}"
puts "Message: #{message}"
```

## Models

### GetTestMail

The GetTestMail model represents a disposable email address. It has the following attributes:

* id - The id of the email address
* emailAddress - The email address
* expiresAt - The time at which the email address will expire
* message - The message received by the email address

### Message

The Message received by the email address. It has the following attributes:

* id - The id of the message
* from - The sender of the message
* to - The recipient of the message
* subject - The subject of the message
* text - Text representation of the message
* html - HTML representation of the message
* attachments - List of attachments

### Attachment

The Attachment received by the email address. It has the following attributes:

* filename - The filename of the attachment
* mimeType - The mime type of the attachment
* content - The content of the attachment


## Error Handling


If the API returns an error, the client will raise an ApiError exception with a ProblemDTO object containing error details.


License

This gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).