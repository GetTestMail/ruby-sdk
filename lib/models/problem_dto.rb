require_relative 'base_dto'

class ProblemDTO < BaseDTO
  attr_accessor :type, :title, :detail, :status
end