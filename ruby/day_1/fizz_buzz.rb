class FizzBuzz

  def fizzBuzz number
    mod3 = (number % 3) == 0
    mod5 = (number % 5) == 0
    return 'fizzBuzz' if mod3 and mod5
    return 'fizz' if mod3
    return 'buzz' if mod5
    return number
  end

  def loop(number)
    number.times do |i|
      begin
        puts fizzBuzz(i+1)
      rescue
        return false
      end

    end

    return true
  end
end

require "test/unit"
class FizzBuzzTest < Test::Unit::TestCase
  def test_number

    fizzBuzz = FizzBuzz.new
    assert_equal  1, fizzBuzz.fizzBuzz(1), 'O valor deve ser igual 1'
    assert_equal 'fizz',fizzBuzz.fizzBuzz(3), 'O retorno deve ser fizz'
    assert_equal 'buzz', fizzBuzz.fizzBuzz(5), 'O retorno deve ser buzz'
    assert_equal 'fizzBuzz', fizzBuzz.fizzBuzz(15), 'O retorno deve ser fizzBuzz'
  end

  def test_execute_loop
    fizzBuzz = FizzBuzz.new
    assert_equal true, fizzBuzz.loop(100), "Deve retornar true"
  end
end

# link: http://codingdojo.org/cgi-bin/wiki.pl?KataFizzBuzz
# Desafio: KataFizzBuzz
# Write a program that prints the numbers from 1 to 100.
# But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz".
# For numbers which are multiples of both three and five print "FizzBuzz?".
