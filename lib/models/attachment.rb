class Attachment
  attr_accessor :filename, :mime_type, :content

  def initialize(filename:, mime_type:, content:)
    @filename = filename
    @mime_type = mime_type
    @content = content
  end
end