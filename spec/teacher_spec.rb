require_relative '../teacher'

describe 'Teacher instance' do
    @specialization = 'Math'
    teacher = Teacher.new(29, 'Shaheen', true)
  
    context 'This should create an instance of the Teacher class' do
      it 'Teacher instance' do
        expect(teacher.class) == Teacher
      end
    end
    context 'This should create an instance of the Teacher specialization' do
      it 'Teacher' do
        expect(@specialization) == 'Math'
      end
    end
    context 'If teacher can use service?!' do
      it 'Can he/she?!' do
        expect(teacher.can_use_services?) == true
      end
    end
  end
  