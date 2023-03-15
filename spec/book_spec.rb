require 'spec_helper'

# Test for initialize method
describe Book do
  it 'should create instance of the book with parameters' do
    book = Book.new('Title', 'Author')
    expect(book).to be_an_instance_of Book
  end
end

# Test for title
describe '#title' do
  it 'should return the book title' do
    book = Book.new('My Title', 'My Author')
    expect(book.title).to eq('My Title')
  end
end

# Test for author
describe '#author' do
  it 'should return the author name' do
    book = Book.new('My Title', 'My Author')
    expect(book.author).to eq('My Author')
  end
end