require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, id = rand(1..100), name = 'Unknown', age = nil, parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
