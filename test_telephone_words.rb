require_relative "telephone_words"
require "test/unit"

class TestTelephonWords < Test::Unit::TestCase
  def setup
    @phone_words = TelephoneWords.new
  end

  def test_list_words
    assert_equal( 'A, B, C', @phone_words.list_words( [2] ))
    assert_equal( 'AJ, AK, AL, BJ, BK, BL, CJ, CK, CL', @phone_words.list_words( [2, 5] ))
  end

  def test_wrong_input
    assert_raise do
      @phone_words.list_words()
    end
    assert_raise do
      @phone_words.list_words('a')
    end
    assert_raise do
      @phone_words.list_words([])
    end
    assert_raise do
      @phone_words.list_words(['ethue'])
    end
    assert_raise do
      @phone_words.list_words(['ethue', 'junk'])
    end
  end

  def test_ignore_junk_array_input
    assert_equal( [2], @phone_words.remove_junk_numbers( [2, 1] ))
    assert_equal( [2], @phone_words.remove_junk_numbers( [2, 0] ))
    assert_equal( [2], @phone_words.remove_junk_numbers( [2, 10] ))
    assert_equal( [2], @phone_words.remove_junk_numbers( [2, 1938] ))
  end

  def test_build_list
    assert_equal( ['A', 'B', 'C'], @phone_words.build_list( [2] ))
    assert_equal( ['AJ', 'AK', 'AL', 'BJ', 'BK', 'BL', 'CJ', 'CK', 'CL'], @phone_words.build_list( [2, 5] ))
  end

  def test_print_list
    assert_equal( 'A, B, C', @phone_words.print_list( ['A', 'B', 'C'] ))
    assert_equal( 'AJ, AK, AL, BJ, BK, BL, CJ, CK, CL', @phone_words.print_list(['AJ', 'AK', 'AL', 'BJ', 'BK', 'BL', 'CJ', 'CK', 'CL']))
  end
end
