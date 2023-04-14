$LOAD_PATH.unshift(File.expand_path('./lib', __dir__))

require 'get_test_mail'

api_key = 'your_api_key'
client = GetTestMail::Client.new('your_api_key')

response = client.create_new_get_test_mail()

puts response