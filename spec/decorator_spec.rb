require_relative '../classes/decorator/decorator'
require_relative '../classes/person'

describe 'Tests For Decorator class:' do
  # we need to provide data for the parameters
  person = Person.new('john American', 20, parent_permission: true)

  # created instance of decorator class
  decorator = Decorator.new(person)

  # test the correct_name method
  context 'correct_name method' do
    it 'should return the name: john American' do
      expect(decorator.correct_name).to eq('john American')
    end
  end
end
