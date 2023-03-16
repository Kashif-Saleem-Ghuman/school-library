require_relative '../student'


# Test for initialize method
describe Student do
  it 'should create instance of the student class with 4 parameters' do
    student = Student.new(age: 16, classroom: 5, name: 'Ali', parent_permission: 'Yes')
    expect(student).to be_an_instance_of Student
  end

  it 'should return play hooky from the play_hooky method of the Student class' do
    student = Student.new(classroom: 5, age: 16, name: 'Name', parent_permission: 'Yes')
    play = student.play_hooky
    expect(play).to eq('¯(ツ)/¯')
  end
end
