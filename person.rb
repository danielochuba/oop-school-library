class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return false unless of_age? || parent_permission

    true
  end

  private

  def of_age?
    @age >= 18
  end
end
