require 'json'

def load_data(library)
  loading_books(library)
end

def loading_books(library)
    File.write('books.json', JSON.generate([])) unless File.exist?('books.json')
    books = JSON.parse(File.read('books.json'))
    books.each do |book|
      book = Book.new(book['title'], book['author'])
      library.books.push(book)
    end
  end