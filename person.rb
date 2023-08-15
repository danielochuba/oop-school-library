require_relative 'capitalize'
require_relative 'nameable'
require_relative 'decorator'
require_relative 'trim'


class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
  end

  def can_use_services?
    return false unless of_age? || parent_permission

    true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, name: 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
