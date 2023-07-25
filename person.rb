class Person    
    attr_reader :id
    attr_accessor :name, age

    def initialize(id = rand(1...100), name = "Unknow", parent_permission: true, age = nil)
        @id = id
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def can_use_services?
        of_age || @parent_permission
    end

    private 

    def of_age?
        @age >= 18 = true
    end
    
end