require "test/unit"
require_relative 'book'
require_relative 'basket'
class KataPotterTest < Test::Unit::TestCase

  def test_price_book
    book_1 = new_book :book_1
    assert_equal 8.0, book_1.price, 'Book custa 8.0'
  end

  def separate_books_repeateds_with_book_and_quantity
    book_1 = new_book :book_1
    book_2 = new_book :book_2

    basket_1 = create_and_add_books_on_basket [book_1, book_2]

    hash_1 = basket_1.separate_books_repeateds

    assert_equal true, hash_1.empty?, 'Nao existe livros repetidos'

    basket_2 = create_and_add_books_on_basket [book_1, book_1, book_2]

    repeated_books_array = basket_2.separate_books_repeateds
    repeated_book_hash   = repeated_books_array.first

    assert_equal 1, repeated_books_array.size, 'Existe 1 book repetido'
    assert_equal Book::BOOKS[:book_1], repeated_book_hash[:book].name, 'Existe o :book_1 repetido'
    assert_equal 2, repeated_book_hash[:quantity], 'Quantidade de :book_1 repetido eh igual a 2'

    basket_3 = create_and_add_books_on_basket [book_1, book_1, book_2, book_2]

    repeated_books_array_2 = basket_3.separate_books_repeateds
    repeated_book_hash_2   = repeated_books_array_2.first
    repeated_book_hash_3   = repeated_books_array_2[1]

    assert_equal 2, repeated_books_array_2.size, 'Existem 2 books repetidos'
    assert_equal Book::BOOKS[:book_1], repeated_book_hash_2[:book].name, 'Existe o :book_1 repetido'
    assert_equal Book::BOOKS[:book_2], repeated_book_hash_3[:book].name, 'Existe o :book_2 repetido'
    assert_equal 2, repeated_book_hash_2[:quantity], 'Quantidade de :book_1 repetido eh igual a 2'
    assert_equal 2, repeated_book_hash_3[:quantity], 'Quantidade de :book_2 repetido eh igual a 2'
  end


  def test_build_baskets_correct_with_2_books_equals
    book_1 = new_book :book_1

    basket  = create_and_add_books_on_basket [book_1, book_1]
    baskets = basket.build_baskets

    assert_equal 2, baskets.size, 'Devera ter 2 carrinhos'
    assert_equal 1, baskets[0].size, 'No carrinho 1 devera ter 1 books'
    assert_equal 1, baskets[1].size, 'No carrinho 2 devera ter 1 books'
  end

  def test_build_baskets_correct_with_2_types_of_books_equals
    book_1 = new_book :book_1
    book_2 = new_book :book_2

    basket  = create_and_add_books_on_basket [book_1, book_1, book_2, book_2]
    baskets = basket.build_baskets

    assert_equal 2, baskets.size, 'Devera ter 2 carrinhos'
    assert_equal 2, baskets[0].size, 'No carrinho 1 devera ter 2 books'
    assert_equal 2, baskets[1].size, 'No carrinho 2 devera ter 2 books'
  end

  def test_build_baskets_correct_with_3_books_and_2_equals
    book_1 = new_book :book_1
    book_2 = new_book :book_2

    basket  = create_and_add_books_on_basket [book_1, book_1, book_2]
    baskets = basket.build_baskets

    assert_equal 2, baskets.size, 'Devera ter 2 carrinhos'
    assert_equal 2, baskets[0].size, 'No carrinho 1 devera ter 2 books'
    assert_equal 1, baskets[1].size, 'No carrinho 2 devera ter 1 books'
  end

  def test_discounts
    book_1 = new_book :book_1
    book_2 = new_book :book_2
    book_3 = new_book :book_3
    book_4 = new_book :book_4
    book_5 = new_book :book_5

    basket = create_and_add_books_on_basket
    two_books   = [book_1, book_2]
    three_books = [book_1, book_2, book_3]
    four_books  = [book_1, book_2, book_3, book_4]
    five_books  = [book_1, book_2, book_3, book_4, book_5]

    assert_equal 0.05, basket.discount(two_books)  , 'Desconto para 2 livros diferentes eh de 5%'
    assert_equal 0.1 , basket.discount(three_books), 'Desconto para 3 livros diferentes eh de 10%'
    assert_equal 0.2 , basket.discount(four_books) , 'Desconto para 4 livros diferentes eh de 20%'
    assert_equal 0.25, basket.discount(five_books) , 'Desconto para 5 livros diferentes eh de 25%'
  end

  def test_total_amount_basket
    book_1 = new_book :book_1
    book_2 = new_book :book_2
    book_3 = new_book :book_3
    book_4 = new_book :book_4
    book_5 = new_book :book_5

    basket  = create_and_add_books_on_basket [book_1, book_1, book_2, book_2, book_3, book_3, book_4, book_5]
    baskets = basket.build_baskets

    assert_equal 51.20, basket.total_amount(baskets), 'Basket total 16.0'
  end

  def test_total_amount_basket_without_books
    basket  = create_and_add_books_on_basket
    baskets = basket.build_baskets

    assert_equal 0.0, basket.total_amount(baskets), 'Basket total 0.0'
  end

  def test_total_amount_basket_with_4_books_equals
    book_1 = new_book :book_1

    basket  = create_and_add_books_on_basket [book_1, book_1, book_1, book_1]
    baskets = basket.build_baskets

    assert_equal 32, basket.total_amount(baskets), 'Basket total 32.0'
  end

  private

  def new_book(sym_name)
    return Book.new(name: Book::BOOKS[sym_name])
  end

  def create_and_add_books_on_basket(books = [])
    basket = Basket.new
    books.each do |book|
      basket.add_book book
    end unless books.empty?
    return basket
  end

end