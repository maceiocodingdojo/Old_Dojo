class KataRomanNumerals

  ROMANS_BASICS = {1    => 'I',
                   5    => 'V',
                   10   => 'X',
                   50   => 'L',
                   100  => 'C',
                   500  => 'D',
                   1000 => 'M'
  }



  def convert_numer_to_roman (value)
    result = ROMANS_BASICS[value]
    return result unless result.nil?
    result = String.new
    puts "value: #{value}"


    ROMANS_BASICS.keys.reverse_each do |key|
      count = value / key
      rest = value % key

      next if count == 0
      puts "--------"
      puts "key   #{key}"
      puts "Count #{count}"
      puts "Rest  #{rest}"

      s = value + key

      #if s == 5
      #  result << "#{ROMANS_BASICS[key]}#{ROMANS_BASICS[5]}"
      #elsif s == 10
      #  result << "#{ROMANS_BASICS[key]}#{ROMANS_BASICS[10]}"
      #else
        count.times do
          result << ROMANS_BASICS[key]
          value -= key
        end
      #
      #
      #end

    end

    #resto = value % 5
    #puts "resto: #{resto}"
    #case resto
    #  when  2..3
    #
    #    value.times do
    #      result << ROMANS_BASICS[1]
    #    end
    #  when 1
    #    result << "#{ROMANS_BASICS[resto]}#{ROMANS_BASICS[5]}"
    #end

    return result
  end

  def have_other_key?(key, value)
    return key % value
  end

end

