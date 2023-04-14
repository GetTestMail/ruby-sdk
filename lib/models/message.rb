require_relative 'attachment'

class Message
  attr_accessor :id, :from, :to, :subject, :text, :html, :attachments

  def initialize(json)
    json.each { |key, value| instance_variable_set("@#{key}", value) }
    @attachments = @attachments&.map { |attachment| Attachment.new(attachment) }
  end

  def to_s
    <<~MESSAGE
      ID: #{@id}
      From: #{@from}
      To: #{@to}
      Subject: #{@subject}
      Text: #{@text}
      HTML: #{@html}
      Attachments: #{@attachments.map(&:to_s).join("\n")}
    MESSAGE
  end
end