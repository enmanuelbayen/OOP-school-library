require_relative '../classes/student'

describe Student do
  describe '#initialize' do
    it 'creates a new student with default values if no arguments are provided' do
      student = Student.new
      expect(student.name).to eq('Unknown')
      expect(student.age).to be_nil
      expect(student.parent_permission).to eq(true)
    end

    it 'assigns provided values to attributes' do
      name = 'Alice'
      age = 16
      parent_permission = false
      student = Student.new(name: name, age: age, parent_permission: parent_permission)
      expect(student.name).to eq(name)
      expect(student.age).to eq(age)
      expect(student.parent_permission).to eq(parent_permission)
    end
  end

  describe '#play_hooky' do
    it 'returns a string with the shrug emoticon' do
      student = Student.new(name: 'Bob', age: 17)
      expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
    end
  end

  describe '#classroom=' do
    it 'assigns a classroom to the student' do
      student = Student.new(name: 'Charlie', age: 15)
      classroom = double('Classroom', students: [])

      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    it 'does not duplicate the student in the classroom' do
      student = Student.new(name: 'Dave', age: 18)
      classroom = double('Classroom', students: [student])

      student.classroom = classroom

      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
