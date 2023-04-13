class GetTestMail
  attr_accessor :email_address, :expires_at, :message

  def initialize(email_address:, expires_at:, message: nil)
    @email_address = email_address
    @expires_at = expires_at
    @message = message
  end
end