require_relative 'decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(person)
    @nameable = person
  end

  def correct_name
    @nameable.correct_name.slice(0..9)
  end
end
