require './person'

class Teacher < Person
  def initialize(sepcialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @sepcialization = sepcialization
  end

  def can_use_services?
    true
  end
end
