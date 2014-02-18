class KataPotter
  attr_reader :books

  BOOKS = {:book_1 => 'Book 1',
           :book_2 => 'Book 2',
           :book_3 => 'Book 3',
           :book_4 => 'Book 4',
           :book_5 => 'Book 5'
  }
  def initialize
    @books = Array.new
  end

  def contains?(book)
    return @books.include? book
  end

  def addBook(book)
    @books << book
  end

  def empty?
    return @books.empty?
  end

  def max_repeated_books_count
    count_max_repeated = 0

    KataPotter::BOOKS.values.each do |book|
      count = 0
      @books.each do |b|
        count += 1 if b == book
      end
      count_max_repeated = count if count_max_repeated < count
    end
    return count_max_repeated
  end

  def size
    return @books.size
  end

  def split_books
    books_temp = @books.clone

    basket_count = max_repeated_books_count

    baskets = Array.new

    return baskets if basket_count == 0

    basket_count.times do
      baskets << KataPotter.new
    end

    max_books_per_basket = @books.size / basket_count
    max_books_per_basket += @books.size % basket_count
    #puts "basket_count #{basket_count}, max_books_per_basket #{max_books_per_basket}"

    basket_index = 0
    until books_temp.empty? do
      book = books_temp[0]

      #puts "Basket_index #{basket_index}, book #{book_index}, books_temp.size #{books_temp.size}"
      basket = baskets[basket_index]

      if basket.contains?(book) or basket.size >= max_books_per_basket
        #puts "Basket #{basket_index} countais book #{book}"
        basket_index += 1
        if basket_index >= baskets.size
          basket_index = 0;
        end
        next
      end
      #puts "basket #{basket_index} << book #{book}"
      basket.addBook(book)
      books_temp.delete_at(0)
    end
    return baskets
  end

  def final_price
    return price - discount
  end

  def discount
    baskets = split_books
    result = 0.0
    #puts "discount"
    baskets.each do |basket|
      #puts "basket.size #{basket.size}, books #{basket.books}"
      result += (basket.price * (KataPotter.discount_percentage(basket.size) / 100.0))
    end
    return result.round(2)
  end

  def price
    return 8 * @books.size
  end

  def self.discount_percentage(books_count)
    case books_count
      when 0..1
        return 0
      when 2
        return 5
      when 3
        return 10
      when 4
        return 20
      when 5
        return 25
    end
  end
end

# http://codingdojo.org/cgi-bin/wiki.pl?KataPotter