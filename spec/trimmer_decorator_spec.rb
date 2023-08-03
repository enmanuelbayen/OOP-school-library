require_relative '../classes/decorator/trimmer_decorator'
require_relative '../classes/person'

describe 'Tests For Decorator class:' do
  # we need to provide data for the parameters
  person = Person.new('john American', 20, parent_permission: true)
  
  # created instance of TrimmerDecorator class
  trimmer = TrimmerDecorator.new(person)
  
  # test the correct_name method  
  context 'correct_name method' do
    it 'should return the name and size should be 10' do
      expect(trimmer.correct_name.size).to eq(10)
    end
  end
end