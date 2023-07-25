require_relative 'person'

class Teacher < Person
    attr_accessor :specialization

    def initialize(specialization, id = rand(1..100), name = 'Unknown', age = nil, parent_permission: parent_permission)
        super(id, name, age, parent_permission)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end    