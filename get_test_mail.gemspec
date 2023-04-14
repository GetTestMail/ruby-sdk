require_relative 'lib/get_test_mail'

Gem::Specification.new do |spec|
  spec.name          = "get_test_mail"
  spec.version       = GetTestMail::VERSION
  spec.authors       = ["Bobby Donchev"]
  spec.email         = ["support@gettestmail.com"]
  spec.summary       = %q{GetTestMail client SDK}
  spec.description   = %q{A Ruby client SDK for the GetTestMail API}
  spec.homepage      = "https://github.com/gettestmail/ruby-sdk"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*", "LICENSE", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 1.0"
  spec.add_runtime_dependency "json", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end