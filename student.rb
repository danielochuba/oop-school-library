require_relative 'person'

class Student < Person
  def initialize(classroom)
    super
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
