require_relative 'student'
require_relative 'classroom'
require_relative 'capitalize'
require_relative 'nameable'
require_relative 'decorator'
require_relative 'trim'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return false unless of_age? || parent_permission

    true
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
