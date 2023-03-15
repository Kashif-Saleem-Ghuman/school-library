require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, :books, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def correct_name
    @name.correct_name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
