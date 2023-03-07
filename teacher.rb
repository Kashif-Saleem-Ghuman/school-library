require './person'

class Teacher < Person
  def initialize(sepcialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @sepcialization = sepcialization
  end

  # Override can_use_services? so it always returns true.
  def can_use_services?
    true
  end
end
