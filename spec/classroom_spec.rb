require './classroom'
require './student'

describe Classroom do
  let(:classroom) { Classroom.new('Math 101') }
  let(:student) { Student.new(classroom: classroom, name: 'Alice', age: 16) }

  describe '#add_student' do
    it 'adds the student to the classroom' do
      expect {
        classroom.add_student(student)
      }.to change { classroom.students.length }.by(2)
      
      expect(classroom.students).to include(student)
    end
  end
end
