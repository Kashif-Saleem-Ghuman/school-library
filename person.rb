require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def correct_name
    @name
  end
  # getter for id
  attr_reader :id

  # getter and setter for name and age
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
