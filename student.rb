require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(id = rand(1..100), name = 'Unknown', age = nil, parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
