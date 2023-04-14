Gem::Specification.new do |s|
  s.name        = 'gettestmail'
  s.version     = '1.0.0'
  s.summary     = 'A Ruby client SDK for the GetTestMail API'
  s.description = 'A Ruby cleint SDK so you can easily integrate GetTestMail into your Ruby application. GetTestMail is a service that allows you to easily create email addresses that you can use to test your application.'
  s.authors     = ['Bobby Donchev']
  s.email       = ['support@gettestmail.com']
  s.homepage    = 'https://github.com/gettestmail/ruby-sdk'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*.rb'] + ['README.md', 'LICENSE']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'httparty', '~> 0.20'
end