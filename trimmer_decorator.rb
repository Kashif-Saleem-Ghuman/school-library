require_relative 'decorator'
class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    if name.length > 10
      name.slice(0, 10)
    else
      name
    end
  end
end
