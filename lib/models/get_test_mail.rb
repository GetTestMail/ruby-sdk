require_relative 'base_dto'
require_relative 'message'

class GetTestMail < BaseDTO
  attr_accessor :emailAddress, :expiresAt, :message

  def initialize(json)
    super(json)

    if @message
      @message = Message.new(@message)
    end
  end
end