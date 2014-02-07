class KataPotter
  @books

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

  def price
    if @books.empty?
      return 0
    end
    return 8 * @books.size
  end

  def split_books
    #books_temp = @books
    #
    #count_max_repeated = 0
    #
    #KataPotter::BOOKS.each do |book|
    #  count = 0
    #  @books.each do |b|
    #    if b == book
    #      count+=1
    #    end
    #  end
    #
    #  count_max_repeated = count if count_max_repeated < count
    #end
    #
    #baskets = Array.new
    #count_max_repeated.times do
    #  baskets << KataPotter.new
    #end
    #
    #while not books_temp.empty? do
    #  book = books_temp[0]
    #
    #  basket << book if basket.empty?
    #     puts "Size: #{book}"
    #  if basket.contains?(book)
    #    basket << book
    #  else
    #
    #  end
    #
    #  books_temp.delete book
    #end
    #return basket.size
  end

  def discount
    return 0.0 if @books.size <= 1

    if @books.size == 2
      if @books[1] == @books[0]
        return 0.0
      else
        return 0.8
      end
    else
    #elsif @books.size == 3

      #count_book = 0
      #
      #if @books[0] != @books[1]
      #     count_book = 2
      #  if @books[0] != @books[2]
      #     count_book = 3
      #  end
      #end
      #
      # if count_book == 3
      #   return 2.4
      # end

      disc = 0.0
      baskets = Array.new
      basket = Array.new

      books_count = Array.new

      KataPotter::BOOKS.values.each do |book|

        search_book_count = 0

        @books.each do |b|
          search_book_count += 1 if b == book
        end

        books_count << search_book_count
      end

      while not books_count.empty? do
        books_count.each_with_index do |bc, i|
          if bc > 1
            basket << bc
            books_count[i] -= 1
          else
            basket << bc
            books_count.delete_at(i)
          end
        end
        baskets << basket
      end

      baskets.each do |bc|
        if bc.size == 1
          disc += 0.0
        elsif bc.size == 2
          disc += 0.8
        elsif bc.size == 3
          disc += 2.4
        elsif bc.size == 4
          disc += 6.4
        elsif bc.size == 5
          disc += 10.0
        end
      end
      return disc
    end
    return 0.0
  end
end

require "test/unit"
class KataPotterTest < Test::Unit::TestCase

  def test_contains_book
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]

    assert_equal true, kata.contains?(KataPotter::BOOKS[:book_1]), 'contem o livro'
  end

  def test_split_books
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_1]

    baskets = kata.split_books

    assert_equal 2, baskets.count, 'contem o livro'
    assert_equal 16, baskets[0].price, 'contem o livro'
    assert_equal  8, baskets[1].price, 'contem o livro'
  end

  def test_not_contains_book
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]

    assert_equal false, kata.contains?(KataPotter::BOOKS[:book_2]), 'nao contem o livro'
  end

  def test_0_books
    kata = KataPotter.new
    assert_equal 0, kata.price, 'Com 0 book o valor deve ser igual a 0 euros.'
    assert_equal 0, kata.discount, 'Com 0 book o desconto deve ser igual a 0 euros.'
  end

  def test_1_books
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 8.0, kata.price, 'Com 1 book o valor deve ser igual a 8.00 euros.'
    assert_equal 0, kata.discount, 'Com 1 book o desconto deve ser igual a 0.00 euros.'
  end

  def test_2_books_equals
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 16.0, kata.price, 'Com 2 book iguais o valor deve ser igual a 16.00 euros.'
    assert_equal 0.0, kata.discount, 'Com 2 book iguais o desconto deve ser igual a 0.00 euros.'
  end

  def test_2_books_differents
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_2])

    assert_equal 16.0, kata.price, 'Com 2 book diferentes o valor deve ser igual a 16.00 euros.'
    assert_equal 0.8, kata.discount, 'Com 2 book diferentes o desconto deve ser igual a 0.8 euros.'
  end

  def test_3_books_differents
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_2])
    kata.addBook(KataPotter::BOOKS[:book_3])

    assert_equal 24.0, kata.price, 'Com 3 book diferentes o valor deve ser igual a 24.00 euros.'
    assert_equal 2.4, kata.discount, 'Com 3 book diferentes o desconto deve ser igual a 2.4 euros.'
  end
  def test_3_books_2_equals
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_3])

    assert_equal 24.0, kata.price, 'Com 3 book sendo 2 iguais o valor deve ser igual a 24.00 euros.'
    assert_equal 0.8, kata.discount, 'Com 3 book sendo 2 iguais o desconto deve ser igual a 0.8 euros.'
  end

  def test_3_books_equals
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 24.0, kata.price, 'Com 3 book iguais o valor deve ser igual a 24.00 euros.'
    assert_equal 0.0, kata.discount, 'Com 3 book iguais o desconto deve ser igual a 0.0 euros.'
  end
end



# http://codingdojo.org/cgi-bin/wiki.pl?KataPotter