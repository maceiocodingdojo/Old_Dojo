class Basket

  private
  @books

  public

  def initialize()
    @books        = Array.new
  end

  def add_book(book)
    @books << book
  end

  def discount (books)
    case books.size
      when 2
        return 0.05
      when 3
        return 0.10
      when 4
        return 0.20
      when 5
        return 0.25
    end

    return 0.0
  end

  def total_amount(baskets)
    total_ammount = 0.0

    total_ammount = calculate_baskets_prices(baskets, total_ammount)


    return total_ammount
  end

  def build_baskets
    baskets = Array.new
    books_repeateds_hash = separate_books_repeateds
    #puts books_repeateds_hash

    books_temp = @books.dup

    #puts "books_temp.size: #{books_temp.size}"

    books_repeateds_hash.each do |book_repeated|
      books_temp.delete book_repeated[:book]

      baskets = fills_baskets_with_books_repeateds(baskets, book_repeated)
    end

    baskets = join_other_books_in_baskets(baskets, books_temp)

    return baskets
  end

  #Divide os books que forem iguais em Hash.
  #Ex.: Contem 2 book_1 e 3 book_2
  # hash_1[:book]     = book_1
  # hash_1[:quantity] = 2
  #
  # hash_2[:book]     = book_2
  # hash_2[:quantity] = 3
  #
  # Return array = [hash_1, hash_2]
  def separate_books_repeateds
    repeated_books_array = Array.new

    #dup faz uma copia
    books_temp = @books.dup

    @books.each do |book|
      #puts "book: #{book.name}"
      #puts "---------"
      repeated_count = 0
      books_temp.size

      books_temp.each do |book_temp|
        #puts "book_temp: #{book_temp.name}"
        if book == book_temp
          repeated_count += 1
        end
      end

      #puts "repeated_count: #{repeated_count}"

      # > 1 porque sempre vai ter ele mesmo
      if repeated_count > 1
        repeated_books_hash = Hash.new

        repeated_books_hash[:book]     = book
        repeated_books_hash[:quantity] = repeated_count
        repeated_books_array << repeated_books_hash
        #Remove todos os books que eh igaul ao atual da lista :books_temp
        books_temp.delete book
        #puts books_temp.size
        #puts @books.size
      end
    end

    return repeated_books_array
  end

  private

  def fills_baskets_with_books_repeateds(baskets, book_repeated)
    book_repeated[:quantity].times do |index|
      #puts "baskets.size: #{baskets.size}"
      array_books = baskets.at index
      if array_books
        #puts "existe"
        array_books << book_repeated[:book]
      else
        array_books = Array.new
        array_books << book_repeated[:book]
        #puts "Nao existe"
        baskets << array_books
      end
    end

    return baskets
  end

  def join_other_books_in_baskets(baskets, books_temp)
    books_temp.each_with_index do |book, index|
      #puts "BOOK: #{book.name}"
      #puts "INDEX: #{index}"
      basket = baskets[index]
      basket << book unless basket.nil?
    end

    return baskets
  end

  def calculate_baskets_prices(baskets, total_ammount)
    baskets.each do |books|
      price_books    = books.size * books.first.price
      discount       = self.discount(books) * price_books
      total_ammount += price_books - discount
    end
    return total_ammount
  end

end

#16:31