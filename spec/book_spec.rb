require_relative '../classes/book'
require_relative '../classes/rental'

describe Book do
  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      title = 'The Great Gatsby'
      author = 'F. Scott Fitzgerald'
      book = Book.new(title, author)
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'initializes an empty array of rentals' do
      book = Book.new('To Kill a Mockingbird', 'Harper Lee')
      expect(book.instance_variable_get(:@rentals)).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental and sets the book for the rental' do
      book = Book.new('1984', 'George Orwell')
      rental = double('Rental')
      allow(rental).to receive(:book=)

      book.add_rental(rental)

      expect(book.instance_variable_get(:@rentals)).to include(rental)
      expect(rental).to have_received(:book=).with(book)
    end
  end
end
