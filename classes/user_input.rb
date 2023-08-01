class UserInputHandler
  def self.person_input
    print 'Age: '
    person_age = gets.chomp.to_i
    print 'Name: '
    person_name = gets.chomp.to_s
    [person_age, person_name]
  end

  def self.teacher_input
    person_age, person_name = person_input
    print 'Specialization: '
    person_specialization = gets.chomp.to_s
    [person_age, person_name, person_specialization]
  end

  def self.book_input
    print 'Title: '
    book_title = gets.chomp.to_s
    print 'Author: '
    book_author = gets.chomp.to_s
    [book_title, book_author]
  end

  def self.rental_input(books, people)
    puts 'Select a book from the following list by number'
    books.each_with_index do |object, index|
      puts "#{index}) Title: '#{object.title}', Author: #{object.author}"
    end
    book_number = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |object, index|
      puts "#{index}) [#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
    end
    person_number = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s
    [book_number, person_number, date]
  end
end
