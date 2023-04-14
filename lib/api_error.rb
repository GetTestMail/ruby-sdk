class ApiError < StandardError
  attr_reader :problem_dto

  def initialize(problem_dto)
    @problem_dto = problem_dto
    super(problem_dto.detail)
  end
end