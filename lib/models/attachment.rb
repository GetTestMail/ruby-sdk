class Attachment
  attr_accessor :filename, :mimeType, :content

  def initialize(json)
    json.each { |key, value| instance_variable_set("@#{key}", value) }
  end

  def to_s
    "Name: #{filename}, Mime-Type: #{mimeType}"
  end
end