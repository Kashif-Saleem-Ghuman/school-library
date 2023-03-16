require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(name: 'John', age: 25) }
  let(:date) { '2023-03-15' }
  subject { Rental.new(date, person, book) }

  describe '#initialize' do
    it 'sets the date, book, and person attributes' do
      expect(subject.date).to eq(date)
      expect(subject.book).to eq(book)
      expect(subject.person).to eq(person)
    end

    it 'adds the rental to the person\'s rentals array' do
      expect(person.rentals).to include(subject)
    end

    it 'adds the rental to the book\'s rentals array' do
      expect(book.rentals).to include(subject)
    end
  end
end
