require 'json'

def store_books
    book_store = @books.map do |book|
    { title: book.title, author: book.author }
  end
  File.new('books.json', 'w') unless File.exist?('books.json')
  File.open('books.json', 'w') do |file|
    file.write(JSON.generate(book_store))
  end
end

def load_books
  if File.exist?('books.json')
    books = JSON.parse(File.read('books.json'))
    books.each do |book|
      book = Book.new(book['title'], book['author'])
      @books.push(book)
    end
  end
end


def store_people
  people_store = @people.map do |people|
    if people.instance_of?(Student)
      { occupation:'Student' ,name: people.name, age: people.age, parent_permission: people.parent_permission }
    else
      { occupation:'Teacher',specialization: people.sepcialization, age: people.age, name: people.name }
    end
  end
  open_file('people.json', people_store)
end

def open_file(file_name, data)
  File.new(file_name, 'w') unless File.exist?(file_name)
  File.open(file_name, 'w') do |file|
    file.write(JSON.generate(data))
  end
end

def read_people
  if File.exist?('people.json')
    File.open('people.json', 'r') do |file|
      people_store=JSON.parse(file.read)
      people_store.each do |people|
        @people << if people['occupation'] == 'Student'
                     Student.new(age: people['age'], name: people['name'], parent_permission: people['parent_permission'])
                   else
                     Teacher.new(people['sepcialization'], people['age'], people['name'])
                   end
      end
    end
  else
    []
  end
end