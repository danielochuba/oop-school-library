class Person
    def initialize(age, parent_permission = true, name="Unknown")
        @id = Random.rand(1..100)
        @name = name
        @age = age
    end

    attr_reader: id
    attr_accessor: name
    attr_accessor: age

    private def of_age? 
        if @age >= 18
            true
        else
            false
        end
    end

    def can_use_services?
        if @age >= 18 || parent_permission
            true
        end
end