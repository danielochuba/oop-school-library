class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, _parent_permission : fix true, name = 'Unknown')
    @id = Random.rand(1..100)
    @name = name
    @age = age
  end

  def can_use_services?
    return false unless @age >= 18 || parent_permission

    true
  end

  private

  def of_age?
    @age >= 18
  end
end
