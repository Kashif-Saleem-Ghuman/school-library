require 'json'

def load_books
  File.write('books.json', JSON.generate([])) unless File.exist?('books.json')
  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    books.push(book)
  end
end
