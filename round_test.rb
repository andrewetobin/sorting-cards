require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card'
require './lib/guess'
require './lib/deck'

class RoundTest < Minitest::Test

  def test_that_a_deck_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck

  end

  def test_it_has_no_guesses_at_the_beginning
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses

  end

  def test_test_it_can_have_a_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card

  end

  def test_it_can_record_a_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Card, round.record_guess("3 of Hearts")

  end

  def test_it_can_store_guesses
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("3 of Hearts")
    assert_equal 1, round.guesses.count

  end

  def test_it_can_give_feedback
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("3 of Hearts")
    assert_equal "correct", round.guesses.first.feedback

  end

  def test_it_can_track_guesses
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("3 of Hearts")
    assert_equal 1, round.number_correct
  end

  def test_it_can_have_a_different_card
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("7 of Spades")
    assert_equal card_2, round.current_card
    assert_equal card_1, round.deck.cards[-1]
  end

  def test_it_can_record_an_incorrect_guess
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("3 of Hearts")
    round.record_guess("5 of Diamonds")
    assert_equal 2, round.guesses.counter

  end

  def test_it_can_give_different_feedback
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("5 of Diamonds")
    assert_equal "Incorrect", round.guesses.first.feedback
  end


  def test_it_can_test_guesses
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("3","Hearts")
    assert_equal 1, record.number_correct

  end

  def test_it_can_count_correct_guesses
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("5 of Diamonds")
    round.record_guess("4 of Clubs")
    assert_equal 1, round.number_correct

  end

  def test_it_can_give_percent_correct
    skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("5 of Diamonds")
    round.record_guess("4 of Clubs")
    assert_equal 50, round.percent_correct
  end
end
