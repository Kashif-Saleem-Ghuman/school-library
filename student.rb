require './person'

class Student < Person
  attr_accessor :name, :classrooms
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom = (classroom)
    @classroom = classroom
    classroom.students << self
  end
end
