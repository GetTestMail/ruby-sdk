require 'faraday'
require 'json'

require_relative 'models/email'
require_relative 'models/message'
require_relative 'models/attachment'
require_relative 'models/problem'

module GetTestMail
  VERSION = "1.0.0"
  class ApiError < StandardError
    attr_reader :problem
  
    def initialize(problem)
      @problem = problem
      super(Problem.detail)
    end
  end
  class Client
    def initialize(api_key)
      @api_key = api_key
      @base_url = 'https://gettestmail.com'
      @headers = {
        'Content-Type' => 'application/json',
        'X-API-Key' => @api_key
      }

      @connection = Faraday.new(url: @base_url, headers: @headers) do |conn|
        conn.request :url_encoded
        conn.adapter Faraday.default_adapter
      end
    end

    def create_new_get_test_mail(expires_at = nil)
      payload = {}
      payload[:expiresAt] = expires_at if expires_at
    
      response = @connection.post('/api/gettestmail')

      handle_response(response)
    end

    private

    def handle_response(response)
      puts response.body
      case response.status
      when 200, 201
        JSON.parse(response.body, symbolize_names: true)
      when 401, 406
        problem = JSON.parse(response.body, symbolize_names: true)
        raise GetTestMail::ApiError.new(problem)
      else
        raise GetTestMail::ApiError, "Unexpected error: #{response.detail}"
      end
    end
  end
end