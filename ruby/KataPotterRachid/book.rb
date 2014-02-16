class Book

  private

  @name
  @price

  public

  BOOKS = {:book_1 => 'Book 1',
           :book_2 => 'Book 2',
           :book_3 => 'Book 3',
           :book_4 => 'Book 4',
           :book_5 => 'Book 5'
  }

  def initialize(attributes={})
    @name  = attributes[:name]
    @price = 8.0
  end

  def name
    return @name
  end

  def price
    return @price
  end


end