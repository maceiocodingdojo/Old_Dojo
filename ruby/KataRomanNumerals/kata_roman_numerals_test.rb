require "test/unit"
require_relative "kata_roman_numerals"
class KataRomanNumeralsTest < Test::Unit::TestCase

  def test_convert_numbers_basics
    kata = KataRomanNumerals.new
    assert_equal 'I', kata.convert_numer_to_roman(1), 'Retorno do 1 = I'
    assert_equal 'V', kata.convert_numer_to_roman(5), 'Retorno do 5 = V'
    assert_equal 'X', kata.convert_numer_to_roman(10), 'Retorno do 10 = X'
    assert_equal 'L', kata.convert_numer_to_roman(50), 'Retorno do 50 = L'
    assert_equal 'C', kata.convert_numer_to_roman(100), 'Retorno do 100 = C'
    assert_equal 'D', kata.convert_numer_to_roman(500), 'Retorno do 500 = D'
    assert_equal 'M', kata.convert_numer_to_roman(1000), 'Retorno do 1000 = M'
  end

  def test_sum
    kata = KataRomanNumerals.new
    assert_equal 'II', kata.convert_numer_to_roman(2), 'Retorno do 2 = II'
    assert_equal 'III', kata.convert_numer_to_roman(3), 'Retorno do 3 = III'
    assert_equal 'VI', kata.convert_numer_to_roman(6), 'Retorno do 6 = VI'
    assert_equal 'VII', kata.convert_numer_to_roman(7), 'Retorno do 7 = VII'
    assert_equal 'VIII', kata.convert_numer_to_roman(8), 'Retorno do 8 = VIII'


  end

  def test_subtract
    kata = KataRomanNumerals.new
    assert_equal 'IV', kata.convert_numer_to_roman(4), 'Retorno do 4 = IV'
    assert_equal 'IX', kata.convert_numer_to_roman(9), 'Retorno do 9 = IX'
  end

  def test_subtract_and_sum
    kata = KataRomanNumerals.new
    assert_equal 'XLVI', kata.convert_numer_to_roman(46), 'Retorno do 46 = XLVI'
  end

  def test_others
    kata = KataRomanNumerals.new

    assert_equal 'MMCCCXXV', kata.convert_numer_to_roman(2325), 'Retorno do 2325 = MMCCCXXV'
    assert_equal    'MCMXC', kata.convert_numer_to_roman(1990), 'Retorno do 1990 = MCMXC'
    assert_equal   'MMVIII', kata.convert_numer_to_roman(2008), 'Retorno do 2008 = MMVIII'
  end


  def test_have_other_key
    kata = KataRomanNumerals.new

    assert_equal 1, kata.have_other_key?(5,4), 'Retorna 1'
    assert_equal 1, kata.have_other_key?(10,9), 'Retorna 1'
    assert_equal 5, kata.have_other_key?(50,45), 'Retorna 5'
    assert_equal 1, kata.have_other_key?(50,49), 'Retorna 1'
  end



end