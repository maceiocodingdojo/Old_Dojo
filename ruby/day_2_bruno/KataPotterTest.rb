require "test/unit"
require_relative 'KataPotter'
class KataPotterTest < Test::Unit::TestCase

  def test_contains_book
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]

    assert_equal true, kata.contains?(KataPotter::BOOKS[:book_1]), 'Deve conter o Livro'
    assert_equal false, kata.contains?(KataPotter::BOOKS[:book_2]), 'O livro nao foi adicionado'
  end

  def test_empty
    kata = KataPotter.new

    assert_equal true, kata.empty?, 'Deve estar vazio'
    kata.addBook KataPotter::BOOKS[:book_1]
    assert_equal false, kata.empty?, 'Nao deve estar vazio'
  end

  def test_size
    kata = KataPotter.new
    assert_equal 0, kata.size, 'Nao deve conter nenhum livro'
    kata.addBook KataPotter::BOOKS[:book_1]
    assert_equal 1, kata.size, 'Deve um livros'
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_1]

    assert_equal 3, kata.size, 'Deve conter tres livros'
  end

  def test_max_repeated_books_count
    kata = KataPotter.new
    assert_equal 0, kata.max_repeated_books_count, 'Nao deve conter nenhum livro'
    kata.addBook KataPotter::BOOKS[:book_1]
    assert_equal 1, kata.max_repeated_books_count, 'Deve conter um livros repetidos'
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_1]

    assert_equal 2, kata.max_repeated_books_count, 'Deve conter dois livros repetidos'
  end

  def test_split_books
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]
    kata.addBook KataPotter::BOOKS[:book_1]
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_3]
    kata.addBook KataPotter::BOOKS[:book_3]
    kata.addBook KataPotter::BOOKS[:book_4]
    kata.addBook KataPotter::BOOKS[:book_5]

    baskets = kata.split_books

    assert_equal 2, baskets.count, 'A quantidade de cestas deve ser 2'
    assert_equal 32, baskets[0].price, 'O valor da 1a cesta deve ser 32'
    assert_equal 32, baskets[1].price, 'O valor da 2a cesta deve ser 32'
  end

  def test_discount_percentage
    assert_equal  0, KataPotter.discount_percentage(0), '0 livro(s) 0% de desconto'
    assert_equal  0, KataPotter.discount_percentage(1), '0 livro(s) 0% de desconto'
    assert_equal  5, KataPotter.discount_percentage(2), '0 livro(s) 5% de desconto'
    assert_equal 10, KataPotter.discount_percentage(3), '0 livro(s) 10% de desconto'
    assert_equal 20, KataPotter.discount_percentage(4), '0 livro(s) 20% de desconto'
    assert_equal 25, KataPotter.discount_percentage(5), '0 livro(s) 25% de desconto'
  end

  def test_not_contains_book
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]

    assert_equal false, kata.contains?(KataPotter::BOOKS[:book_2]), 'nao contem o livro'
  end

  def test_0_books
    kata = KataPotter.new
    assert_equal 0, kata.final_price, 'Com 0 book o valor deve ser igual a 0 euros.'
  end

  def test_1_books
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 8.0, kata.final_price, 'Com 1 book o valor deve ser igual a 8.00 euros.'
  end

  def test_2_books_equals
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 16.0, kata.final_price, 'Com 2 book iguais o valor deve ser igual a 16.00 euros.'
  end

  def test_2_books_differents
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_2])

    assert_equal 15.20, kata.final_price, 'Com 2 book diferentes o valor deve ser igual a 15.20 euros.'
  end

  def test_3_books_differents
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_2])
    kata.addBook(KataPotter::BOOKS[:book_3])

    assert_equal 21.6, kata.final_price, 'Com 3 book diferentes o valor deve ser igual a 21.60 euros.'
  end
  def test_3_books_2_equals
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_3])

    assert_equal 23.2, kata.final_price, 'Com 3 book sendo 2 iguais o valor deve ser igual a 23.20 euros.'
  end

  def test_3_books_equals
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 24.0, kata.final_price, 'Com 3 book iguais o valor deve ser igual a 24.00 euros.'
  end

  def test_4_books
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 32.0, kata.final_price, 'Com 4 book o valor deve ser igual a 32.00 euros.'
    assert_equal 0.0, kata.discount, 'Com 4 book o desconto deve ser igual a 0.00 euros.'

    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_2])
    kata.addBook(KataPotter::BOOKS[:book_3])
    kata.addBook(KataPotter::BOOKS[:book_4])

    assert_equal 25.6, kata.final_price, 'Com 4 book o valor deve ser igual a 25.60 euros.'
    assert_equal 6.40, kata.discount, 'Com 4 book o desconto deve ser igual a 6.40 euros.'

    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_3])
    kata.addBook(KataPotter::BOOKS[:book_4])

    assert_equal 30.4, kata.final_price, 'Com 4 book sendo 2 iguais o valor deve ser igual a 30.40 euros.'
  end

  def test_master
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]
    kata.addBook KataPotter::BOOKS[:book_1]
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_3]
    kata.addBook KataPotter::BOOKS[:book_3]
    kata.addBook KataPotter::BOOKS[:book_4]
    kata.addBook KataPotter::BOOKS[:book_5]

    assert_equal 51.2, kata.final_price, 'O programa deve dividir os 8 livros em duas partes de 4 livros. o valor deve ser de 51.20 euros'
  end
end