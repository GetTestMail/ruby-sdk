require 'httparty'
require_relative 'api_error'
require_relative 'models/get_test_mail'
require_relative 'models/problem_dto'

class GetTestMailClient
  include HTTParty

  base_uri 'https://gettestmail.com/api'

  def initialize(api_key)
    @api_key = api_key
  end

  def create_new(expires_at = nil)
    payload = {}
    payload[:expiresAt] = expires_at if expires_at

    response = self.class.post(
      '/gettestmail',
      headers: headers,
      body: payload.to_json
    )

    handle_response(response)
  end

  def wait_for_message(id)
    response = self.class.get(
      "/gettestmail/#{id}",
      headers: headers,
      follow_redirects: true
    )

    handle_response(response, id)
  end

  private

  def headers
    {
      'X-API-Key' => @api_key,
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  def handle_response(response, id = nil)
    case response.code
    when 200, 201
      GetTestMail.new(response.parsed_response)
    else
      raise ApiError.new(ProblemDTO.from_json(response.body))
    end
  end
end