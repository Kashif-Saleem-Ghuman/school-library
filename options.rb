# we will use this file to store our options
require_relative 'app'
class Options
  def option(input)
    meth = App.new
    case input
    when '1'
      meth.list_all_books
    when '2'
      meth.list_all_persons
    when '3'
      meth.create_person
    when '4'
      meth.create_book
    when '5'
      meth.create_rental
    when '6'
      meth.list_rentals
    else
      puts 'Invalid option'
    end
  end
end
