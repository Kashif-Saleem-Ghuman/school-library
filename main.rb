require_relative 'Person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalized_trimmedPerson.correct_name
