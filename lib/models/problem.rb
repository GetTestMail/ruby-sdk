class Problem
  attr_accessor :type, :title, :detail, :status

  def initialize(type:, title:, detail:, status:)
    @type = type
    @title = title
    @detail = detail
    @status = status
  end
end