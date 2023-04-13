require 'faraday'
require 'json'
require_relative 'models'

module GetTestMail
  class Client
    def initialize(api_key)
      @api_key = api_key
      @base_url = 'https://gettestmail.com/api'
      @headers = {
        'Content-Type' => 'application/json',
        'X-API-Key' => @api_key
      }

      @connection = Faraday.new(url: @base_url, headers: @headers) do |conn|
        conn.adapter Faraday.default_adapter
      end
    end

    def create_new_get_test_mail(expires_at = nil)
      payload = { expiresAt: expires_at }.compact
      response = @connection.post('/gettestmail', payload.to_json)

      handle_response(response)
    end

    private

    def handle_response(response)
      case response.status
      when 200, 201
        JSON.parse(response.body, symbolize_names: true)
      when 401, 406
        problem = JSON.parse(response.body, symbolize_names: true)
        raise GetTestMail::ProblemError.new(problem)
      else
        raise GetTestMail::ApiError, "Unexpected error: #{response.status}"
      end
    end
  end
end