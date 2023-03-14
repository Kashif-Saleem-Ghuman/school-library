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



# def store_data(library)
#   store_books(library)
# end

# def store_books(library)
#   books = []
#   books.each do |book|
#     book = { title: book.title, author: book.author }
#     books.push(book)
#   end
#   File.write('books.json', "#{JSON.generate(books)}\n")
# end
