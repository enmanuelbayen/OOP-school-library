require_relative '../classes/person'
require_relative '../classes/rental'

describe Person do
  describe '#initialize' do
    it 'creates a new person with default values if no arguments are provided' do
      person = Person.new
      expect(person.name).to eq('Unknown')
      expect(person.age).to be_nil
      expect(person.parent_permission).to eq(true)
    end

    it 'assigns provided values to attributes' do
      name = 'John Doe'
      age = 25
      parent_permission = false
      person = Person.new(name, age, parent_permission: parent_permission)
      expect(person.name).to eq(name)
      expect(person.age).to eq(age)
      expect(person.parent_permission).to eq(parent_permission)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new('Alice', 20)
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person has parent permission' do
      person = Person.new('Bob', 15)
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is underage and has no parent permission' do
      person = Person.new('Eve', 12, parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      person = Person.new('Charlie')
      expect(person.correct_name).to eq('Charlie')
    end
  end

  describe '#add_rental' do
    it 'adds a rental and sets the person for the rental' do
      person = Person.new('Dave', 22)
      rental = double('Rental')
      allow(rental).to receive(:person=)

      person.add_rental(rental)

      expect(person.rentals).to include(rental)
      expect(rental).to have_received(:person=).with(person)
    end
  end
end
