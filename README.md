# ruby-sdk

A Ruby client for interacting with the GetTestMail API, which allows you to create disposable email addresses for testing purposes.

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

Creating a New Client
To create a new GetTestMail API client, you need to instantiate the GetTestMailClient class with your API key:

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
message = client.wait_for_message(get_test_mail.email_address)
puts "Message from: #{message.from}"
puts "Message subject: #{message.subject}"
puts "Message: #{message}"
```

## Models

### GetTestMail

The GetTestMail model represents a disposable email address. It has the following attributes:

```
email_address: The disposable email address.
expires_at: The expiration time of the email address.
```

### Message

The Message model represents an email message. It has the following attributes:

```
id: The unique identifier of the message.
from: The sender's email address.
to: The recipient's email address.
subject: The subject of the email.
text: The plain text version of the email.
html: The HTML version of the email.
attachments: An array of Attachment objects.
```

### Attachment

The Attachment model represents an email attachment. It has the following attributes:

```
filename: The name of the attached file.
mime_type: The MIME type of the attached file.
content: The content of the attached file.
```

## Error Handling


If the API returns an error, the client will raise an ApiError exception with a ProblemDTO object containing error details.


License

This gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).