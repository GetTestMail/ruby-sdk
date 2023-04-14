$LOAD_PATH.unshift(File.expand_path('./lib', __dir__))

require 'client'

api_key = 'YOUR_API_KEY'
client = GetTestMailClient.new(api_key)

# Create a new GetTestMail
get_test_mail = client.create_new
puts "Email address: #{get_test_mail.emailAddress}"
puts "Expires at: #{get_test_mail.expiresAt}"

# Wait for a message
message = client.wait_for_message(get_test_mail.emailAddress)
puts message.message