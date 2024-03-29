require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom: 'unknown', name: 'unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
