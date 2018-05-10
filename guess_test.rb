require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_card_is_ten_of_heart
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
    assert_instance_of Card, guess.card
    assert_equal "10 of Hearts", guess.response
  end

  def test_it_is_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert (guess.correct?)
  end

  def test_it_is_not_correct
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    refute_equal "2 of Diamonds", guess.correct?
    refute (guess.correct?)
  end
end
