require_relative 'person'

class Student < Person
  def initialize(classroom, age, name: 'Unknown', parent_permission: false)
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
