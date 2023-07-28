class Rental
  attr_accessor :book, :person
  attr_reader :date

  def initialize(book, person, date)
    @book = book
    @book.rentals.push(self) unless @book.rentals.include?(self)
    @person = person
    @person.rentals.push(self) unless @person.rentals.include?(self)
    @date = date
  end
end
