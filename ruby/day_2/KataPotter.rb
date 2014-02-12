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

  def split_books
    books_temp = @books

    max_repeated = max_repeated_books_count

    baskets = Array.new
    max_repeated.times do
      baskets << KataPotter.new
    end

    basket_index = 0
    while not books_temp.empty? do
        book = books_temp[0]

        basket = baskets[basket_index]

        if basket.contains?(book)
          if basket_index < baskets.size
            basket_index += 1
          else
            basket_index = 0;
          end
          next
        end
        basket.addBook(book) if  basket.nil? || basket.empty?
        puts "Size: #{book}"
        unless basket.contains?(book)
          basket.addBook book
        else

        end

        books_temp.delete book
    end
    return baskets
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
        if search_book_count > 0
          books_count << search_book_count
        end
      end

      while not books_count.empty? do
        index = Array.new
        puts "books_count#{books_count.size}"
        books_count.each_with_index do |bc, i|
          basket = Array.new
          puts "Index#{bc}"
          if bc > 1
            #puts "bc#{bc}"
            basket << bc
            books_count[i] -= 1
          else
            #puts "bc#{bc}"
            basket << bc
            index << i
          end
        end
        index.each do |i|
          books_count.delete_at(i)
        end
        baskets << basket
      end
      #puts baskets.size
      baskets.each do |bc|
        puts "bc size#{bc.size}"
        if bc.size == 1
          disc += 0.0
        elsif bc.size == 2
          disc += 0.8
        elsif bc.size == 3
          puts "bc size == 3"
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

# http://codingdojo.org/cgi-bin/wiki.pl?KataPotter