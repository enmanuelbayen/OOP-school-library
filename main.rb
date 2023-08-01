require_relative 'classes/app'

class Main
  def initialize
    @app = App.new
  end

  def print_options
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def operator(option)
    if option == 7
      puts 'Thank you for using this app!'
      nil
    elsif option.between?(1, 6)
      case option
      when 1
        @app.list_books
      when 2
        @app.list_people
      when 3
        @app.create_person
      when 4
        @app.create_book
      when 5
        @app.create_rental
      when 6
        @app.list_rentals
      end
    else
      puts 'Error: Invalid number, try again'
    end
  end

  def main
    loop do
      print_options
      option = gets.chomp.to_i
      operator(option)
      break if option == 7
    end
  end
end

Main.new.main
