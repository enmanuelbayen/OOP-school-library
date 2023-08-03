require_relative '../classes/classroom'

describe Classroom do
  describe '#initialize' do
    it 'creates a new classroom with the given label' do
      label = 'Math'
      classroom = Classroom.new(label)
      expect(classroom.label).to eq(label)
    end

    it 'initializes an empty array of students' do
      classroom = Classroom.new('Physics')
      expect(classroom.instance_variable_get(:@students)).to be_empty
    end
  end
end
