class Raffle

  def self.raffle_name (names)
    result = String.new
    puts "size: #{names}\n"
    new_names = shuffle_names names
    new_names.each_with_index do |name, index|
      result << "#{index + 1}- #{name} \n"
    end
    return result

  end

  def self.shuffle_names(names)
    new_names = Array.new

    while not names.empty? do
    #names.size.times do
      id = Random.rand(names.size)
      new_names << names[id]
      names.delete_at(id)
    end

    return new_names

  end

end

require "test/unit"

class RaffleTest < Test::Unit::TestCase

  def test_verify_type_of_class
    out = Raffle.raffle_name(get_array)
    puts "out: #{out}\n"
    assert_kind_of String, out, 'Tem que ser do tipo String'
  end

  def test_shuffle_names
    input = get_array
    output = Raffle.shuffle_names input

    assert_kind_of Array, output, 'Tem que ser array'

    input.each do |name|
      assert_includes output, name, "Tem que ter o nome #{name}"
    end
  end

  private
  def get_array
    #['lima', 'rachid', 'rocha', 'danilo', 'henaldo']
    ['php', 'java', 'gRails', 'rails', 'android', 'ios',
     'c#', 'windows phone', 'objective-c', 'java script',
    'vRaptor','jsf 2.0', 'smart', 'cake']
  end

end

# Desafio: Raffle
# Escreva um programa que sorteia uma quantidade de nomes com suas posicoes.
# Se colocar quatro nomes, devera sortear aleatoriamente cada nove que esteja em uma lista de nomes, sem repetir o nome.

