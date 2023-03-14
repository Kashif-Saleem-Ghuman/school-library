require 'json'

def store_data(library)
  store_books(library)
end

def store_books(library)
  books = []
  @library.books.each do |book|
    book = { title: book.title, author: book.author }
    books.push(book)
  end
  File.write('books.json', "#{JSON.generate(books)}\n")
end
