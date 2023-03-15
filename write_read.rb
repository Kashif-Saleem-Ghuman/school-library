require 'json'

def store_books
  book_store = @books.map do |book|
    { title: book.title, author: book.author }
  end
  File.new('books.json', 'w') unless File.exist?('books.json')
  File.write('books.json', JSON.generate(book_store))
end

def load_books
  return unless File.exist?('books.json')

  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    @books.push(book)
  end
end

def store_people
  people_store = @people.map do |people|
    if people.instance_of?(Student)
      { occupation: 'Student', name: people.name, age: people.age, parent_permission: people.parent_permission }
    else
      { occupation: 'Teacher', specialization: people.sepcialization, age: people.age, name: people.name }
    end
  end
  open_file('people.json', people_store)
end

def open_file(file_name, data)
  File.new(file_name, 'w') unless File.exist?(file_name)
  File.write(file_name, JSON.generate(data))
end

def read_people
  if File.exist?('people.json')
    File.open('people.json', 'r') do |file|
      people_store = JSON.parse(file.read)
      people_store.each do |people|
        @people << if people['occupation'] == 'Student'
                     Student.new(age: people['age'], name: people['name'],
                                 parent_permission: people['parent_permission'])
                   else
                     Teacher.new(people['sepcialization'], people['age'], people['name'])
                   end
      end
    end
  else
    []
  end
end

def store_rentals
  rental_store = @rentals.map do |rental|
    { date: rental.date,
      person_index: @people.index(rental.person),
      book_index: @books.index(rental.book) }
  end

  File.new('rentals.json', 'w') unless File.exist?('rentals.json')
  File.open('rentals.json', 'w') do |file|
    file.puts(JSON.generate(rental_store))
  end
end

def read_rentals
  if File.exist?('rentals.json')
    File.open('rentals.json', 'r') do |file|
      rental_store = JSON.parse(file.read)
      rental_store.each do |rental|
        @rentals << Rental.new(rental['date'], @people[rental['person_index']], @books[rental['book_index']])
      end
    end
  else
    []
  end
end
