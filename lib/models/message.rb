class Message
  attr_accessor :id, :from, :to, :subject, :text, :html, :attachments

  def initialize(id:, from:, to:, subject:, text:, html:, attachments: [])
    @id = id
    @from = from
    @to = to
    @subject = subject
    @text = text
    @html = html
    @attachments = attachments
  end
end