require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'Please add a book to the library' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Please add a person to the library' if @people.empty?
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      nil
    end
  end

  def create_student
    puts 'create a new student'
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      student = Student.new(classroom: @classroom, age: age, name: name, parent_permission: true)
      @people << student
      puts 'Student created successfully'
    when 'n'
      student = Student.new(classroom: @classroom, age: age, name: name, parent_permission: false)
      @people << student
      puts 'Student created successfully'
    else
      puts 'Invalid option'
      nil
    end
  end

  def create_teacher
    puts 'create a new teacher'
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'create a new book'
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'select the book you want to rent by entering it\'s number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i
    return puts 'sorry wrong input' unless (0...@books.length).include?(book_id)

    puts 'select person from the list by its number'
    tem_person = @people.select(&:can_use_services?)
    tem_person.each_with_index do |person, index|
      puts "#{index} [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    unless (0...tem_person.length).include?(person_id)
      puts 'sorry wrong input'
      return
    end
    print 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, tem_person[person_id], @books[book_id])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.person.name}"
      else
        puts 'No rentals found for that ID'
      end
    end
  end
end
