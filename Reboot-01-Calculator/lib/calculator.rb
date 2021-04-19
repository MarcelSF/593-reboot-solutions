def calculate(first, second, operator)
  case operator
  when "+"
    result = first + second
  when '-'
    result = first - second
  when '*'
    result = first * second
  when '/'
    result = first / second.to_f
  end
  result
end
