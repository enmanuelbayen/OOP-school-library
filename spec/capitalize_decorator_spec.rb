require_relative '../classes/decorator/capitalize_decorator'
require_relative '../classes/person'

describe 'Tests For Decorator class:' do
  # we need to provide data for the parameters
  person = Person.new('john American', 20, parent_permission: true)

  # created instance of decorator class
  capitalized = CapitalizeDecorator.new(person)

  # test the correct_name method
  context 'correct_name method' do
    it 'should return the name: John american' do
      expect(capitalized.correct_name).to eq('John american')
    end
  end
end
