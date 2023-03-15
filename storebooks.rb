require 'json'

def store_books
   books = []
    books.each do |book|
    book = { title: book.title, author: book.author }
    books.push(book)
  end
  File.write('books.json', "#{JSON.generate(books)}\n")
end
