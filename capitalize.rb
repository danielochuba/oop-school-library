require_relative 'decorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(person)
    @nameable = person
  end

  def correct_name
    @nameable.correct_name.upcase
  end
end
