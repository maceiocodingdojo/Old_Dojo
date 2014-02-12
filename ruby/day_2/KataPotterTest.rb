require "test/unit"
require_relative 'KataPotter'
class KataPotterTest < Test::Unit::TestCase

  def test_contains_book
    kata = KataPotter.new
    kata.addBook KataPotter::BOOKS[:book_1]

    assert_equal true, kata.contains?(KataPotter::BOOKS[:book_1]), 'contem o livro'
  end

  def test_empty?
    kata = KataPotter.new

    assert_equal true, kata.empty?, 'Deve estar vazio'
    kata.addBook KataPotter::BOOKS[:book_1]
    assert_equal false, kata.empty?, 'Nao deve estar vazio'

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
    kata.addBook KataPotter::BOOKS[:book_2]
    kata.addBook KataPotter::BOOKS[:book_1]

    baskets = kata.split_books

    assert_equal 2, baskets.count, 'A quantidade de cestas deve ser 2'
    assert_equal 16, baskets[0].price, 'O valor da cesta 1a cesta deve ser 16'
    assert_equal  8, baskets[1].price, 'O valor da cesta 2a cesta deve ser 8'
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
  def test_4_books
    kata = KataPotter.new
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])
    kata.addBook(KataPotter::BOOKS[:book_1])

    assert_equal 32.0, kata.price, 'Com 4 book o valor deve ser igual a 32.00 euros.'
    assert_equal 0.0, kata.discount, 'Com 4 book iguais o desconto deve ser igual a 0.0 euros.'

    kata2 = KataPotter.new
    kata2.addBook(KataPotter::BOOKS[:book_1])
    kata2.addBook(KataPotter::BOOKS[:book_2])
    kata2.addBook(KataPotter::BOOKS[:book_3])
    kata2.addBook(KataPotter::BOOKS[:book_4])

    assert_equal 6.4, kata2.discount, 'Com 4 book iguais o desconto deve ser igual a 0.0 euros.'

    kata3 = KataPotter.new
    kata3.addBook(KataPotter::BOOKS[:book_1])
    kata3.addBook(KataPotter::BOOKS[:book_1])
    kata3.addBook(KataPotter::BOOKS[:book_3])
    kata3.addBook(KataPotter::BOOKS[:book_4])

    assert_equal 2.4, kata3.discount, 'Com 4 book iguais o desconto deve ser igual a 0.0 euros.'
  end
end