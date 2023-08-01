require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'user_input'

class App
  def initialize
    puts 'Welcome to School Library App!'
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |object|
      puts "Title: '#{object.title}', Author: #{object.author}"
    end
  end

  def list_people
    @people.each do |object|
      puts "[#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option_person = gets.chomp.to_i
    case option_person
    when 1
      person_age, person_name = UserInputHandler.person_input
      print 'Has parent permission? [Y/N]: '
      person_permission = gets.chomp.downcase
      if person_permission.capitalize == 'N'
        @people.push(Student.new(age: person_age, name: person_name, parent_permission: false))
      else
        @people.push(Student.new(age: person_age, name: person_name))
      end
      puts 'Student created successfully'
    when 2
      person_age, person_name, person_specialization = UserInputHandler.teacher_input
      @people.push(Teacher.new(person_specialization, person_name, person_age))
      puts 'Teacher created successfully'
    else
      puts 'Error: Invalid number, try again'
      create_person
    end
  end

  def create_book
    book_title, book_author = UserInputHandler.book_input
    @books.push(Book.new(book_title, book_author))
    puts 'Book created successfully'
  end

  def create_rental
    if @people.empty? || @books.empty?
      puts 'Error: Please create a person and a book'
    else
      book_number, person_number, date = UserInputHandler.rental_input(@books, @people)
      @rentals.push(Rental.new(@books[book_number], @people[person_number], date))
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |object|
      puts "Date: #{object.date}, Book '#{object.book.title}' by #{object.book.author}" if object.person.id == person_id
    end
  end
end
