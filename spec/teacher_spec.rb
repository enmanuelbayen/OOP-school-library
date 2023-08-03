require_relative '../classes/teacher'

describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher with the provided specialization' do
      specialization = 'Mathematics'
      teacher = Teacher.new(specialization)
      expect(teacher.specialization).to eq(specialization)
      expect(teacher.name).to eq('Unknown')
      expect(teacher.age).to be_nil
      expect(teacher.parent_permission).to eq(true)
    end

    it 'assigns provided values to attributes' do
      specialization = 'Science'
      name = 'Alice'
      age = 35
      parent_permission = false
      teacher = Teacher.new(specialization, name, age, parent_permission: parent_permission)
      expect(teacher.specialization).to eq(specialization)
      expect(teacher.name).to eq(name)
      expect(teacher.age).to eq(age)
      expect(teacher.parent_permission).to eq(parent_permission)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher regardless of age and parent permission' do
      teacher = Teacher.new('History', 'Bob', 40, parent_permission: false)
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
