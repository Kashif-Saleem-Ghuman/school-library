class Rental
  attr_accessor :date
  attr_reader :book, :person

  @@all = []

  def initialize(date,book,person)
    @date = date
    @book = book
    @person = person
    @@all << self
  end

  def self.all
    @@all
  end

  def book = (book)
   # create a rental for this book and person if it dosen't exist
   Rental.new(date, book, person) unless book.rentals.include?(self)
   @book = book
  end

  def person = (person)
    # create a rental for this book and person if it dosen't exist
    Rental.new(date, book, person) unless person.rentals.include?(self)
    @person = person
  end
end