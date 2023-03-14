require 'json'

def load_data(library)
  load_books(library)
end

def load_books(library)
    File.write('books.json', JSON.generate([])) unless File.exist?('books.json')
    books = JSON.parse(File.read('books.json'))
    books.each do |book|
      book = Book.new(book['title'], book['author'])
      library.books.push(book)
    end
  end