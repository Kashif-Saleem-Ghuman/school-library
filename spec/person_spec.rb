require_relative '../person'

describe Person do
  it 'should create instance of the person class with 3 parameters' do
    person = Person.new(age: 18, name: 'Ali')
    expect(person).to be_an_instance_of Person
  end
end
