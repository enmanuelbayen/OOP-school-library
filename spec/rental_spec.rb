require_relative '../classes/rental'
require_relative '../classes/student'
require_relative '../classes/book'

describe 'Tests For Rental class:' do
  # we need to provide data for the parameters
  person = Person.new('Ahmad', 20, parent_permission: true)
  book = Book.new('English', 'John')
  date = '2023-01-02'

  # created instance of Rental class
  rental = Rental.new(book, person, date)

  # test the date method 
  context 'date method' do
    it 'date method should return the date:' do
      expect(rental.date).to eq(date)
    end
  end

  # test the book method 
  context 'book method' do
    it 'should be instance of Book class:' do
      expect(rental.book).to be_instance_of(Book)
    end
  end

  # test the person method 
  context 'person method' do
    it 'should be instance of person class:' do
      expect(rental.person).to be_instance_of(Person)
    end
  end
end

