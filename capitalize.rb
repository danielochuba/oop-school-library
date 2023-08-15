require_relative 'decorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name[0].upcase + @nameable.correct_name[1..]
  end
end
