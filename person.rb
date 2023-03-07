class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  # getter for id
  attr_reader :id

  # getter for name
  attr_accessor :name

  # getter for age
  attr_accessor :age

  # setter for name

  # setter for age

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
