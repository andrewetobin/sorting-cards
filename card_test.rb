require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_test_it_exists
    card = Card.new("Ace", "Spades")
    assert_instance_of Card, card

  end

  def test_is_the_ace_of_spades
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
    assert_equal "Spades", card.suit
  end
end
