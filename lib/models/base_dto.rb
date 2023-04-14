class BaseDTO
  def self.from_json(json)
    new(json)
  end

  def initialize(json)
    from_json(json)
  end

  def from_json(json)
    data = json.is_a?(String) ? JSON.parse(json) : json
    data.each { |key, value| instance_variable_set("@#{key}", value) }
  end
end