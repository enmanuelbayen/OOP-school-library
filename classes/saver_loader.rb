require 'json'
require 'fileutils'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

module SaverLoader
  def check_file(filename)
    FileUtils.mkdir_p('./classes/saved_data')
    if !File.exist?('./classes/saved_data/people.json') && filename == 'people'
      FileUtils.touch('./classes/saved_data/people.json')
    end
    if !File.exist?('./classes/saved_data/rentals.json') && filename == 'rentals'
      FileUtils.touch('./classes/saved_data/rentals.json')
    end
    return unless !File.exist?('./classes/saved_data/books.json') && filename == 'books'

    FileUtils.touch('./classes/saved_data/books.json')
  end

  def load_books
    books_arr = []
    if File.exist?('./classes/saved_data/books.json')
      book_data = File.read('./classes/saved_data/books.json')
      if book_data != ''
        JSON.parse(book_data).map do |book|
          books_arr << (Book.new(book['title'], book['author']))
        end
      end
    end
    books_arr
  end

  def load_people
    people_arr = []
    if File.exist?('./classes/saved_data/people.json')
      people_data = File.read('./classes/saved_data/people.json')
      if people_data != ''
        JSON.parse(people_data).map do |person|
          if person['classname'] == 'Student'
            student = Student.new(name: person['name'], age: person['age'],
                                  parent_permission: person['parent_permission'])
            student.id = person['id']
            people_arr << student
          elsif person['classname'] == 'Teacher'
            teacher = Teacher.new(person['specialization'], person['age'], person['name'])
            teacher.id = person['id']
            people_arr << teacher
          end
        end
      end
    end
    people_arr
  end

  def load_rentals
    rentals_arr = []
    if File.exist?('./classes/saved_data/rentals.json')
      rentals_data = File.read('./classes/saved_data/rentals.json')
      if rentals_data != ''
        JSON.parse(rentals_data).map do |rental|
          if rental['classname'] == 'Student'
            student = Student.new(name: rental['name'], age: rental['age'],
                                  parent_permission: rental['parent_permission'])
            student.id = rental['id']
            book = Book.new(rental['title'], rental['author'])
            rentals_arr << Rental.new(book, student, rental['date'])
          else
            teacher = Teacher.new(specialization: rental['specialization'], name: rental['name'],
                                  age: rental['age'])
            teacher.id = rental['id']
            book = Book.new(rental['title'], rental['author'])
            rentals_arr << Rental.new(book, teacher, rental['date'])
          end
        end
      end
    end
    rentals_arr
  end

  #   save methods

  def save_books
    json_book = []
    books.each do |book|
      json_book << { title: book.title, author: book.author }
    end
    check_file(books)
    File.write('./classes/saved_data/books.json', JSON.pretty_generate(json_book))
  end

  def save_people
    json_people = []
    people.each do |person|
      json_people << if person.instance_of?(::Student)
                       { id: person.id, age: person.age, classname: person.class.name, name: person.name,
                         classroom: person.classroom }
                     else
                       { id: person.id, age: person.age, classname: person.class.name, name: person.name,
                         specialization: person.specialization }
                     end
    end
    check_file(people)
    File.write('./classes/saved_data/people.json', JSON.pretty_generate(json_people))
  end

  def save_rental
    json_rental = []
    rentals.each do |rental|
      rental_list = {
        date: rental.date,
        title: rental.book.title,
        author: rental.book.author,
        id: rental.person.id,
        name: rental.person.name,
        age: rental.person.age,
        classname: rental.person.class.name
      }
      if rental.person.instance_of?(::Student)
        rental_list[:classroom] = rental.person.classroom
      else
        rental_list[:specialization] = rental.person.specialization
      end
      json_rental << rental_list
    end
    check_file(rentals)
    File.write('./classes/saved_data/rentals.json', JSON.pretty_generate(json_rental))
  end
end
